/* Copyright (C) 2006 - 2011 ScriptDev2 <http://www.scriptdev2.com/>
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

/* ScriptData
SDName: boss_sindragosa
SD%Complete: 
SDComment: 
SDCategory: Icecrown Citadel
EndScriptData */

#include "precompiled.h"
#include "icecrown_citadel.h"

enum BossSpells
{
    // Sindragosa
    SPELL_BERSERK               = 26662,

    // Phase 1
    SPELL_TAIL_SMASH            = 71077,
    SPELL_CLEAVE                = 19983,
    SPELL_FROST_AURA            = 70084,
    SPELL_FROST_BREATH          = 69649,
    SPELL_ICY_GRIP              = 70117,
    SPELL_BLISTERING_COLD       = 70123,
    SPELL_PERMEATING_CHILL      = 70109,
    SPELL_UNCHAINED_MAGIC       = 69762,
    SPELL_INSTABILITY           = 69766,

    SPELL_FROST_INFUSION        = 72292,

    // Phase 2

    // Ice Tomb related
    SPELL_FROST_BEACON          = 70126,
    SPELL_ICE_TOMB              = 69712, // used by Sindragosa, targets marked units and triggers on them 69675?    
    SPELL_ICE_TOMB_DUMMY        = 69675, // orb flows to the target, dummy effect (triggering the summoning of GO?)
    SPELL_ICE_TOMB_TRIGGERED    = 70157, // this is the effect of stun etc.
    SPELL_ICE_TOMB_TRIGGERED2   = 69700, // additional effects of immunity to frost and being unattackable/unhealable
    SPELL_ASPHYXATION           = 71665,

    // Frost Bomb related
    SPELL_FROST_BOMB            = 69846,
    SPELL_FROST_BOMB_DMG        = 69845,
    SPELL_FROST_BOMB_VISUAL     = 70022, // circle mark
    //SPELL_FROST_BOMB_OTHER      = 70521, // no idea where it is used, wowhead says it is used by Sindragosa

    // Phase 3
    SPELL_MYSTIC_BUFFET         = 70128,

    // NPCs
    NPC_ICE_TOMB                = 36980,
    NPC_FROST_BOMB              = 37186,

    GO_ICE_BLOCK                = 201722,

    // Rimefang
    SPELL_FROST_AURA_RIME       = 71387,
    SPELL_ICY_BLAST             = 71376,
    SPELL_FROST_BREATH_RIME     = 71386,

    // Spinestalker
    SPELL_BELLOWING_ROAR        = 36922,
    SPELL_CLEAVE_SPINESTALKER   = 40505,
    SPELL_TAIL_SWEEP            = 71369
};

// talks
enum
{
    SAY_AGGRO                   = -1631148,
    SAY_UNCHAINED_MAGIC         = -1631149,
    SAY_BLISTERING_COLD         = -1631150,
    SAY_RESPIRE                 = -1631151,
    SAY_TAKEOFF                 = -1631152,
    SAY_PHASE_3                 = -1631153,
    SAY_SLAY_1                  = -1631154,
    SAY_SLAY_2                  = -1631155,
    SAY_BERSERK                 = -1631156,
    SAY_DEATH                   = -1631157,
};

static Locations SindragosaLoc[]=
{
    {4408.052734f, 2484.825439f, 203.374207f},  // 0 Sindragosa spawn
    {4474.239746f, 2484.243896f, 231.0f},       // 1 Sindragosa fly o=3.11
    {4474.239746f, 2484.243896f, 203.380402f},  // 2 Sindragosa fly - ground point o=3.11
};

#define PHASE_FLYING 0
#define PHASE_GROUND 1
#define PHASE_AIR 2
#define PHASE_THREE 3

#define POINT_LAND 1
#define POINT_AIR 2

#define FROST_BOMB_MIN_X 4367.0f
#define FROST_BOMB_MAX_X 4424.0f
#define FROST_BOMB_MIN_Y 2437.0f
#define FROST_BOMB_MAX_Y 2527.0f

struct MANGOS_DLL_DECL boss_sindragosaAI : public base_icc_bossAI
{
    boss_sindragosaAI(Creature* pCreature) : base_icc_bossAI(pCreature)
    {
        Reset();
    }

    bool m_bAchievFail;

    uint32 m_uiPhase;
    uint32 m_uiPhaseTimer;
    uint32 m_uiBerserkTimer;
    uint32 m_uiCleaveTimer;
    uint32 m_uiFrostBreathTimer;
    uint32 m_uiTailSmashTimer;
    uint32 m_uiIcyGripTimer;
    uint32 m_uiUnchainedMagicTimer;
    uint32 m_uiFlyingTimer;
    uint32 m_uiFrostBeaconTimer;
    uint32 m_uiIceTombTimer;
    uint32 m_uiFrostBombTimer;
    uint32 m_uiCheckTimer;

    void Reset()
    {
        m_bAchievFail               = false;
        m_uiPhase                   = PHASE_GROUND;
        m_uiPhaseTimer              = 45000;
        m_uiBerserkTimer            = 10 * MINUTE * IN_MILLISECONDS;
        m_uiCleaveTimer             = urand(5000, 15000);
        m_uiTailSmashTimer          = 20000;
        m_uiFrostBreathTimer        = 5000;
        m_uiIcyGripTimer            = 35000;
        m_uiUnchainedMagicTimer     = urand(15000, 30000);
        m_uiCheckTimer              = 1000;

        m_uiFlyingTimer             = 60000; // debug code

        m_creature->SetSpeedRate(MOVE_RUN, 1.2f);
        m_creature->SetSpeedRate(MOVE_WALK, 1.2f);
    }

    void JustReachedHome()
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SINDRAGOSA, FAIL);

        SetCombatMovement(true);
        m_creature->SetLevitate(false);
        m_creature->RemoveByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_UNK_2);
    }

    void Aggro(Unit *pWho)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SINDRAGOSA, IN_PROGRESS);

        DoCastSpellIfCan(m_creature, SPELL_FROST_AURA, CAST_TRIGGERED);
        DoCastSpellIfCan(m_creature, SPELL_PERMEATING_CHILL, CAST_TRIGGERED);

        DoScriptText(SAY_AGGRO, m_creature);
    }

    void KilledUnit(Unit *pVictim)
    {
        if (pVictim->GetTypeId() == TYPEID_PLAYER)
            DoScriptText(SAY_SLAY_1 - urand(0, 1), m_creature);
    }

    void JustDied(Unit *pKiller)
    {
        if (m_pInstance)
            m_pInstance->SetData(TYPE_SINDRAGOSA, DONE);

        DoScriptText(SAY_DEATH, m_creature);
    }

    void CheckAchievement()
    {
        if (!m_pInstance)
            return;

        Map* pMap = m_creature->GetMap();
        Map::PlayerList const& pPlayers = pMap->GetPlayers();
        if (!pPlayers.isEmpty())
        {
            for (Map::PlayerList::const_iterator itr = pPlayers.begin(); itr != pPlayers.end(); ++itr)
            {
                Unit *pTarget = itr->getSource();
                if (pTarget)
                {
                    SpellAuraHolderPtr holder = pTarget->GetSpellAuraHolder(70127);
                    if (m_bIs25Man && !m_bIsHeroic)
                        holder = pTarget->GetSpellAuraHolder(72528);
                    if (!m_bIs25Man && m_bIsHeroic)
                        holder = pTarget->GetSpellAuraHolder(72529);
                    if (m_bIs25Man && m_bIsHeroic)
                        holder = pTarget->GetSpellAuraHolder(72530);
                    if (holder)
                    {
                        if (holder->GetStackAmount() > 5)
                        {
                            m_pInstance->SetSpecialAchievementCriteria(TYPE_ALL_YOU_CAN_EAT, false);
                            m_bAchievFail = true;
                        }
                    }
                }
            }
        }
    }

    void SpellHitTarget(Unit* pTarget, const SpellEntry* pSpell)
    {
        if (pTarget && pTarget->HasAura(SPELL_SHADOWS_EDGE))
        {
            if (pSpell->Id == 69649 ||     // Frost Breath (Sindragosa)
                pSpell->Id == 71056 ||
                pSpell->Id == 71057 ||
                pSpell->Id == 71058)
            {
                if (m_bIs25Man)
                {
                    pTarget->CastSpell(pTarget, SPELL_FROST_INFUSION, true);
                }
            }
        }
    }

    void MovementInform(uint32 uiMovementType, uint32 uiData)
    {
        if (uiMovementType != POINT_MOTION_TYPE)
            return;

        if (uiData == POINT_AIR)
        {
            m_creature->SetSpeedRate(MOVE_RUN, 0);
            m_creature->SetSpeedRate(MOVE_WALK, 0);
            m_uiPhase = PHASE_AIR;

            uint max = m_bIs25Man ? 5 : 2;
            if (m_bIs25Man && m_bIsHeroic)
                max = 6;

            DoMark(max);

            m_uiFrostBombTimer  = 15000;
            m_uiPhaseTimer      = 36000;
        }
        else if (uiData == POINT_LAND)
        {
            m_uiFrostBreathTimer    = urand(15000, 20000);
            m_uiCleaveTimer         = urand(5000, 15000);
            m_uiTailSmashTimer      = 20000;

            m_creature->SetSpeedRate(MOVE_RUN, 1.2f);
            m_creature->SetSpeedRate(MOVE_WALK, 1.2f);
            m_uiPhase = PHASE_GROUND;
            SetCombatMovement(true);
            m_creature->SetLevitate(false);
            m_creature->RemoveByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_UNK_2);

            if (m_creature->getVictim())
                m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim());
        }
    }

    void DoFrostBomb()
    {
        float x, y, z;
        x = frand(FROST_BOMB_MIN_X, FROST_BOMB_MAX_X);
        y = frand(FROST_BOMB_MIN_Y, FROST_BOMB_MAX_Y);
        z = SindragosaLoc[0].z;

        m_creature->CastSpell(x, y, z, SPELL_FROST_BOMB, false);
        m_creature->SummonCreature(NPC_FROST_BOMB, x, y, z, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 20000);
    }

    void DoMark(uint32 count)
    {
        // get threat list
        std::list<Unit*> targetUnitList;
        const ThreatList &threatList = m_creature->getThreatManager().getThreatList();
        for (ThreatList::const_iterator itr = threatList.begin(); itr != threatList.end(); ++itr)
        {
            if (!(*itr)->getUnitGuid().IsPlayer())
                continue;

            if (m_creature->getVictim() &&
                (*itr)->getUnitGuid() == m_creature->getVictim()->GetObjectGuid())
            {
                continue;
            }

            if (Unit *pUnit = m_creature->GetMap()->GetUnit((*itr)->getUnitGuid()))
                targetUnitList.push_back(pUnit);
        }

        // random targets
        while (targetUnitList.size() > count)
        {
            uint32 poz = urand(0, targetUnitList.size()-1);
            for (std::list<Unit*>::iterator itr = targetUnitList.begin(); itr != targetUnitList.end(); ++itr, --poz)
            {
                if (!*itr) continue;

                if (!poz)
                {
                    targetUnitList.erase(itr);
                    break;
                }
            }
        }

        // cast
        for (std::list<Unit*>::iterator itr = targetUnitList.begin(); itr != targetUnitList.end(); ++itr)
        {
            if (Unit *pTarget = (*itr))
                m_creature->CastSpell(pTarget, SPELL_FROST_BEACON, true);
        }
        m_uiIceTombTimer = 5500;
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        // Berserk
        if (m_uiBerserkTimer <= uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_BERSERK) == CAST_OK)
            {
                DoScriptText(SAY_BERSERK, m_creature);
                m_uiBerserkTimer = 10 * MINUTE * IN_MILLISECONDS;
            }
        }
        else
            m_uiBerserkTimer -= uiDiff;

        if (!m_bAchievFail)
        {
            if (m_uiCheckTimer < uiDiff)
            {
                CheckAchievement();
                m_uiCheckTimer = 1000;
            }
            else m_uiCheckTimer -= uiDiff;
        }

        switch(m_uiPhase)
        {
            case PHASE_GROUND:
            {
                // Health Check
                if (m_creature->GetHealthPercent() <= 30.0f)
                {
                    m_creature->CastSpell(m_creature, SPELL_MYSTIC_BUFFET, true);

                    m_uiPhase = PHASE_THREE;
                    DoScriptText(SAY_PHASE_3, m_creature);
                    m_uiFrostBeaconTimer = 10000;
                    m_uiIceTombTimer = 50000;
                    return;
                }

                // Cleave
                if (m_uiCleaveTimer <= uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE) == CAST_OK)
                        m_uiCleaveTimer = urand(5000, 15000);
                }
                else
                    m_uiCleaveTimer -= uiDiff;

                // Tail Smash
                if (m_uiTailSmashTimer <= uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_TAIL_SMASH) == CAST_OK)
                        m_uiTailSmashTimer = urand(10000, 20000);
                }
                else
                    m_uiTailSmashTimer -= uiDiff;

                // Frost Breath
                if (m_uiFrostBreathTimer <= uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROST_BREATH) == CAST_OK)
                        m_uiFrostBreathTimer = urand(15000, 20000);
                    if (m_uiPhaseTimer < 5000)
                        m_uiPhaseTimer = 5000;
                }
                else
                    m_uiFrostBreathTimer -= uiDiff;

                // Unchained Magic
                if (m_uiUnchainedMagicTimer <= uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_UNCHAINED_MAGIC) == CAST_OK)
                    {
                        m_uiUnchainedMagicTimer = urand(40000, 60000);
                        DoScriptText(SAY_UNCHAINED_MAGIC, m_creature);
                    }
                }
                else
                    m_uiUnchainedMagicTimer -= uiDiff;

                // Icy Grip
                if (m_uiIcyGripTimer <= uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_ICY_GRIP) == CAST_OK)
                    {
                        m_uiIcyGripTimer = 75000;
                        DoScriptText(SAY_BLISTERING_COLD, m_creature);
                    }
                }
                else
                    m_uiIcyGripTimer -= uiDiff;

                // Phase 2 (air)
                if (m_uiPhaseTimer <= uiDiff)
                {
                    if (m_creature->IsNonMeleeSpellCasted(true))
                        return;

                    if (m_creature->GetHealthPercent() <= 85.0f)
                    {
                        m_uiPhaseTimer = 35000;
                        m_uiFlyingTimer= 60000; // debug code
                        m_uiPhase = PHASE_FLYING;
                        DoScriptText(SAY_TAKEOFF, m_creature);

                        m_creature->SetSpeedRate(MOVE_RUN, 1.2f);
                        m_creature->SetSpeedRate(MOVE_WALK, 1.2f);

                        // fly to the air point
                        SetCombatMovement(false);
                        m_creature->SetLevitate(true);
                        m_creature->SetByteValue(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_ALWAYS_STAND | UNIT_BYTE1_FLAG_UNK_2);
                        m_creature->GetMotionMaster()->MovePoint(POINT_AIR, SindragosaLoc[1].x, SindragosaLoc[1].y, SindragosaLoc[1].z);
                    }
                }
                else
                    m_uiPhaseTimer -= uiDiff;

                break;
            }
            case PHASE_FLYING:
                // wait for arrival or evade after 60seconds
                if (m_uiFlyingTimer <= uiDiff)
                {
                    m_uiFlyingTimer = 60000;
                    m_creature->AI()->EnterEvadeMode();
                    return;
                }
                else
                    m_uiFlyingTimer -= uiDiff;

                return;
            case PHASE_AIR:
            {
                // Ice Tombs
                if (m_uiIceTombTimer <= uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_ICE_TOMB) == CAST_OK)
                        m_uiIceTombTimer = 40000;
                }
                else
                    m_uiIceTombTimer -= uiDiff;

                // Frost Bomb
                if (m_uiFrostBombTimer <= uiDiff)
                {
                    DoFrostBomb();
                    m_uiFrostBombTimer = 6000;
                }
                else
                    m_uiFrostBombTimer -= uiDiff;

                // Phase One (ground)
                if (m_uiPhaseTimer <= uiDiff)
                {
                    m_uiPhase               = PHASE_FLYING;
                    m_uiPhaseTimer          = 110000;
                    m_creature->SetSpeedRate(MOVE_RUN, 1.2f);
                    m_creature->SetSpeedRate(MOVE_WALK, 1.2f);

                    // fly to the ground point
                    m_creature->GetMotionMaster()->MovePoint(POINT_LAND, SindragosaLoc[0].x, SindragosaLoc[0].y, SindragosaLoc[0].z);
                }
                else
                    m_uiPhaseTimer -= uiDiff;

                return;
            }
            case PHASE_THREE:
            {
                // Frost Beacon
                if (m_uiFrostBeaconTimer <= uiDiff)
                {
                    if (Unit *pVictim = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1, SPELL_FROST_BEACON, SELECT_FLAG_PLAYER))
                    {
                        if (DoCastSpellIfCan(pVictim, SPELL_FROST_BEACON) == CAST_OK)
                        {
                            m_uiIceTombTimer = 5500;
                        }
                    }
                    m_uiFrostBeaconTimer = 20000;
                    if (m_uiIcyGripTimer <= 10000)
                        m_uiIcyGripTimer = 10000;
                    if (m_uiTailSmashTimer <= 6000)
                        m_uiTailSmashTimer = 6000;
                    if (m_uiFrostBreathTimer <= 6000)
                        m_uiFrostBreathTimer = 6000;
                }
                else
                    m_uiFrostBeaconTimer -= uiDiff;

                // Ice Tomb
                if (m_uiIceTombTimer <= uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_ICE_TOMB) == CAST_OK)
                        m_uiIceTombTimer = 50000; // for no repeat spell, true timer set above, in frost beacon timer;
                }
                else
                    m_uiIceTombTimer -= uiDiff;

                // Cleave
                if (m_uiCleaveTimer <= uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE) == CAST_OK)
                        m_uiCleaveTimer = urand(5000, 15000);
                }
                else
                    m_uiCleaveTimer -= uiDiff;

                // Tail Smash
                if (m_uiTailSmashTimer <= uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_TAIL_SMASH) == CAST_OK)
                        m_uiTailSmashTimer = urand(10000, 20000);
                }
                else
                    m_uiTailSmashTimer -= uiDiff;

                // Frost Breath
                if (m_uiFrostBreathTimer <= uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROST_BREATH) == CAST_OK)
                        m_uiFrostBreathTimer = urand(15000, 20000);
                }
                else
                    m_uiFrostBreathTimer -= uiDiff;

                // Unchained Magic
                if (m_uiUnchainedMagicTimer <= uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_UNCHAINED_MAGIC) == CAST_OK)
                        m_uiUnchainedMagicTimer = urand(40000, 60000);
                }
                else
                    m_uiUnchainedMagicTimer -= uiDiff;

                // Icy Grip
                if (m_uiIcyGripTimer <= uiDiff)
                {
                    if (DoCastSpellIfCan(m_creature, SPELL_ICY_GRIP) == CAST_OK)
                    {
                        m_uiIcyGripTimer = 75000;
                        DoScriptText(SAY_BLISTERING_COLD, m_creature);
                    }
                }
                else
                    m_uiIcyGripTimer -= uiDiff;

                break;
            }
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_sindragosa(Creature* pCreature)
{
    return new boss_sindragosaAI(pCreature);
}

struct MANGOS_DLL_DECL mob_ice_tombAI : public ScriptedAI
{
    mob_ice_tombAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        SetCombatMovement(false);
        m_uiCheckTimer = 1000;
        m_creature->SetRespawnDelay(7 * DAY * IN_MILLISECONDS);
    }

    ScriptedInstance *m_pInstance;
    uint32 m_uiCheckTimer;

    void Reset(){}
    void AttackStart(Unit *pWho){}

    void JustDied(Unit* Killer)
    {
        if (Unit *pCreator = m_creature->GetCreator())
        {
            pCreator->RemoveAurasDueToSpell(SPELL_ICE_TOMB_TRIGGERED);
            pCreator->RemoveAurasDueToSpell(SPELL_ASPHYXATION);
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (m_uiCheckTimer <= uiDiff)
        {
            if (Unit *pCreator = m_creature->GetCreator())
            {
                if (!pCreator->isAlive())
                {
                    pCreator->RemoveAurasDueToSpell(SPELL_ICE_TOMB_TRIGGERED);
                    pCreator->RemoveAurasDueToSpell(SPELL_ASPHYXATION);
                }
            }
            m_uiCheckTimer = 1000;
        }
        else
            m_uiCheckTimer -= uiDiff;
    }
};

CreatureAI* GetAI_mob_ice_tomb(Creature* pCreature)
{
    return new mob_ice_tombAI(pCreature);
}

struct MANGOS_DLL_DECL mob_frost_bombAI : public ScriptedAI
{
    mob_frost_bombAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        Reset();
        m_creature->SetVisibility(VISIBILITY_ON);
        m_creature->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    }

    uint32 m_uiFrostBombTimer;

    void Reset()
    {
        SetCombatMovement(false);
        DoCastSpellIfCan(m_creature, SPELL_FROST_BOMB_VISUAL, CAST_TRIGGERED);
        m_uiFrostBombTimer = 6000;
    }

    void AttackStart(Unit *pWho){}

    void UpdateAI(const uint32 uiDiff)
    {
        // Frost Bomb (dmg)
        if (m_uiFrostBombTimer <= uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_FROST_BOMB_DMG) == CAST_OK)
            {
                m_creature->RemoveAurasDueToSpell(SPELL_FROST_BOMB_VISUAL);
                m_uiFrostBombTimer = 20000;
            }
        }
        else
            m_uiFrostBombTimer -= uiDiff;
    }
};

CreatureAI* GetAI_mob_frost_bomb(Creature* pCreature)
{
    return new mob_frost_bombAI(pCreature);
}

struct MANGOS_DLL_DECL mob_rimefangAI : public ScriptedAI
{
    mob_rimefangAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance *m_pInstance;
    Creature* pBrother;

    uint32 m_uiFrostBreathTimer;
    uint32 m_uiIcyBlastTimer;

    void Reset()
    {
        if(!m_pInstance)
            return;

        m_creature->SetByteValue(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_ALWAYS_STAND | UNIT_BYTE1_FLAG_UNK_2);
        m_creature->SetRespawnDelay(1 * HOUR);

        m_uiFrostBreathTimer = 10000;
        m_uiIcyBlastTimer = 8000;
    }

    void MoveInLineOfSight(Unit* pWho)
    {
        if (!m_pInstance || !pWho)
            return;

        if (pWho->GetTypeId() != TYPEID_PLAYER)
            return;

        if (!m_creature->isInCombat() && pWho->IsWithinDistInMap(m_creature, 60.0f))
        {
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE);
            m_creature->GetMotionMaster()->MovementExpired();
            AttackStart(pWho);
            SetCombatMovement(true);
        }
        ScriptedAI::MoveInLineOfSight(pWho);
    }

    void Aggro(Unit *pWho)
    {
        if (!m_pInstance)
            return;

        pBrother = m_pInstance->GetSingleCreatureFromStorage(NPC_SPINESTALKER);

        if (pBrother && !pBrother->isAlive())
            pBrother->Respawn();

        if (pBrother)
            pBrother->SetInCombatWithZone();

        DoCastSpellIfCan(m_creature, SPELL_FROST_AURA_RIME, CAST_TRIGGERED);
    }

    void JustDied(Unit *pKiller)
    {
        if(!m_pInstance)
            return;

        if (m_pInstance->GetData(TYPE_SINDRAGOSA) == DONE)
            return;

        if (pBrother && !pBrother->isAlive())
        if (pBrother && !pBrother->isAlive())
        {
            Creature* pSindr = m_creature->SummonCreature(NPC_SINDRAGOSA, SindragosaLoc[0].x, SindragosaLoc[0].y, SindragosaLoc[0].z, 3.17f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, HOUR*IN_MILLISECONDS, true);
            if (pSindr)
                pSindr->SetCreatorGuid(ObjectGuid());
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_pInstance || !m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_creature->CanReachWithMeleeAttack(m_creature->getVictim()))
            m_creature->RemoveByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_UNK_2);

        if (m_pInstance->GetData(TYPE_SINDRAGOSA) == DONE)
        {
            m_creature->SetRespawnDelay(DAY);
            m_creature->ForcedDespawn();
            return;
        }

        if (m_uiFrostBreathTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_FROST_BREATH_RIME) == CAST_OK)
                m_uiFrostBreathTimer = 13000;
        }
        else
            m_uiFrostBreathTimer -= uiDiff;

        if (m_uiIcyBlastTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1), SPELL_ICY_BLAST) == CAST_OK)
                m_uiIcyBlastTimer = 10000;
        }
        else
            m_uiIcyBlastTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};


CreatureAI* GetAI_mob_rimefang(Creature* pCreature)
{
    return new mob_rimefangAI(pCreature);
}

struct MANGOS_DLL_DECL mob_spinestalkerAI : public ScriptedAI
{
    mob_spinestalkerAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (ScriptedInstance*)pCreature->GetInstanceData();
        Reset();
    }

    ScriptedInstance *m_pInstance;
    Creature* pBrother;

    uint32 m_uiBellowingRoarTimer;
    uint32 m_uiCleaveTimer;
    uint32 m_uiTailSweepTimer;

    void Reset()
    {
        if(!m_pInstance)
            return;

        m_creature->SetByteValue(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_ALWAYS_STAND | UNIT_BYTE1_FLAG_UNK_2);
        m_creature->SetRespawnDelay(1 * HOUR);

        m_uiBellowingRoarTimer  = 15000;
        m_uiCleaveTimer         = urand(6000, 10000);
        m_uiTailSweepTimer      = 10000;
    }

    void MoveInLineOfSight(Unit* pWho)
    {
        if (!m_pInstance || !pWho)
            return;

        if (pWho->GetTypeId() != TYPEID_PLAYER)
            return;

        if (!m_creature->isInCombat() && pWho->IsWithinDistInMap(m_creature, 60.0f))
        {
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
            m_creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE);
            m_creature->GetMotionMaster()->MovementExpired();
            AttackStart(pWho);
            SetCombatMovement(true);
        }
        ScriptedAI::MoveInLineOfSight(pWho);
    }

    void Aggro(Unit *pWho)
    {
        if(!m_pInstance)
            return;

        pBrother = m_pInstance->GetSingleCreatureFromStorage(NPC_RIMEFANG);

        if (pBrother && !pBrother->isAlive())
            pBrother->Respawn();

        if (pBrother)
           pBrother->SetInCombatWithZone();
    }

    void JustDied(Unit *pKiller)
    {
        if (!m_pInstance)
            return;
        if (m_pInstance->GetData(TYPE_SINDRAGOSA) == DONE)
            return;
        if (pBrother && !pBrother->isAlive())
        {
            Creature* pSindr = m_creature->SummonCreature(NPC_SINDRAGOSA, SindragosaLoc[0].x, SindragosaLoc[0].y, SindragosaLoc[0].z, 3.17f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, HOUR*IN_MILLISECONDS, true);
            if (pSindr)
                pSindr->SetCreatorGuid(ObjectGuid());
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_pInstance || !m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (m_creature->CanReachWithMeleeAttack(m_creature->getVictim()))
            m_creature->RemoveByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_UNK_2);

        if (m_pInstance->GetData(TYPE_SINDRAGOSA) == DONE)
        {
            m_creature->SetRespawnDelay(DAY);
            m_creature->ForcedDespawn();
            return;
        }

        if (m_uiBellowingRoarTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_BELLOWING_ROAR) == CAST_OK)
                m_uiBellowingRoarTimer = 15000;
        }
        else
            m_uiBellowingRoarTimer -= uiDiff;

        if (m_uiCleaveTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature->getVictim(), SPELL_CLEAVE_SPINESTALKER) == CAST_OK)
                m_uiCleaveTimer = urand(6000, 10000);
        }
        else
            m_uiCleaveTimer -= uiDiff;

        if (m_uiTailSweepTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_TAIL_SWEEP) == CAST_OK)
                m_uiTailSweepTimer = 15000;
        }
        else
            m_uiTailSweepTimer -= uiDiff;

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_mob_spinestalker(Creature* pCreature)
{
    return new mob_spinestalkerAI(pCreature);
}

void AddSC_boss_sindragosa()
{
    Script *pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "boss_sindragosa";
    pNewScript->GetAI = &GetAI_boss_sindragosa;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "mob_rimefang";
    pNewScript->GetAI = &GetAI_mob_rimefang;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "mob_spinestalker";
    pNewScript->GetAI = &GetAI_mob_spinestalker;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "mob_ice_tomb";
    pNewScript->GetAI = &GetAI_mob_ice_tomb;
    pNewScript->RegisterSelf();

    pNewScript = new Script;
    pNewScript->Name = "mob_frost_bomb";
    pNewScript->GetAI = &GetAI_mob_frost_bomb;
    pNewScript->RegisterSelf();

}
