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
SDName: Boss_Keristrasza
SD%Complete: 80%
SDComment: timers tuning
SDCategory: Nexus
EndScriptData */

#include "precompiled.h"
#include "nexus.h"

enum
{
    // Spells
    SPELL_INTENSE_COLD          = 48094,
    SPELL_CRYSTALFIRE_BREATH    = 48096,
    SPELL_CRYSTALFIRE_BREATH_H  = 57091,
    SPELL_CRYSTALLIZE           = 48179,
    SPELL_CRYSTAL_CHAINS        = 50997,
    SPELL_TAIL_SWEEP            = 50155,
    SPELL_ENRAGE                = 8599,

    // Texts
    SAY_AGGRO                   = -1576016,
    SAY_CRYSTAL_NOVA            = -1576017,
    SAY_ENRAGE                  = -1576018,
    SAY_KILL                    = -1576019,
    SAY_DEATH                   = -1576020,

    NPC_DAILY_DUNGEON           = 22852,
};

/*######
## boss_keristrasza
######*/

struct MANGOS_DLL_DECL boss_keristraszaAI : public ScriptedAI
{
    boss_keristraszaAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        m_pInstance = (instance_nexus*)pCreature->GetInstanceData();
        m_bIsRegularMode = pCreature->GetMap()->IsRegularDifficulty();
        Reset();
    }

    instance_nexus* m_pInstance;
    bool m_bIsRegularMode;

    bool m_bIsEnraged;
    bool m_bAchievFailed;
    uint32 m_uiCrystalChainTimer;
    uint32 m_uiTailSweepTimer;
    uint32 m_uiCrystalfireBreathTimer;
    uint32 m_uiCrystallizeTimer;
    uint32 m_uiCheckTimer;

    void Reset()
    {
        m_uiCrystalChainTimer = 30*IN_MILLISECONDS;
        m_uiTailSweepTimer = urand(5*IN_MILLISECONDS, 7.5*IN_MILLISECONDS);
        m_uiCrystalfireBreathTimer = urand(10*IN_MILLISECONDS, 20*IN_MILLISECONDS);
        m_uiCrystallizeTimer = urand(20*IN_MILLISECONDS, 30*IN_MILLISECONDS);
        m_uiCheckTimer = 1000;
        m_bIsEnraged = false;
        m_bAchievFailed = false;

        if (!m_pInstance)
            return;

        if (m_creature->isAlive())
        {
            if (m_pInstance->GetData(TYPE_KERISTRASZA) != SPECIAL)
                DoCastSpellIfCan(m_creature, SPELL_FROZEN_PRISON, CAST_TRIGGERED);
        }
    }

    void JustReachedHome()
    {
        if (m_pInstance)
        {
            m_pInstance->SetData(TYPE_KERISTRASZA, FAIL);
        }
    }

    void Aggro(Unit* pWho)
    {
        DoScriptText(SAY_AGGRO, m_creature);

        m_creature->CastSpell(m_creature, SPELL_INTENSE_COLD, true);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_KERISTRASZA, IN_PROGRESS);

        if (!m_bIsRegularMode)
            m_pInstance->SetSpecialAchievementCriteria(TYPE_INTENSE_COLD, true);
    }

    void JustDied(Unit* pKiller)
    {
        m_creature->SummonCreature(NPC_DAILY_DUNGEON, 301.69f, -5.44f, -15.56f, 3.14f, TEMPSUMMON_MANUAL_DESPAWN, 5000);

        DoScriptText(SAY_DEATH, m_creature);

        if (m_pInstance)
            m_pInstance->SetData(TYPE_KERISTRASZA, DONE);
    }

    void KilledUnit(Unit* pVictim)
    {
        if (urand(0, 1))
            DoScriptText(SAY_KILL, m_creature);
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
                    SpellAuraHolderPtr holder = pTarget->GetSpellAuraHolder(48095);
                    if (holder)
                    {
                        if (holder->GetStackAmount() > 2)
                        {
                            m_pInstance->SetSpecialAchievementCriteria(TYPE_INTENSE_COLD, false);
                            m_bAchievFailed = true;
                        }
                    }
                }
            }
        }
    }

    void UpdateAI(const uint32 uiDiff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (!m_bAchievFailed)
        {
            if (m_uiCheckTimer < uiDiff)
            {
                CheckAchievement();
                m_uiCheckTimer = 1000;
            }
            else m_uiCheckTimer -= uiDiff;
        }

        if (!m_bIsEnraged && m_creature->GetHealthPercent() < 25.0f)
        {
            if (!m_creature->IsNonMeleeSpellCasted(false))
            {
                m_bIsEnraged = true;
                DoScriptText(SAY_ENRAGE, m_creature);
                DoCastSpellIfCan(m_creature, SPELL_ENRAGE);
            }
        }

        if (m_uiCrystalChainTimer < uiDiff)
        {
            if (!m_creature->IsNonMeleeSpellCasted(false))
            {
                if (m_bIsRegularMode)
                {
                    if (Unit* pTarget = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 1))
                    {
                        if (Player* pPlayer = pTarget->GetCharmerOrOwnerPlayerOrPlayerItself())
                            DoCastSpellIfCan(pPlayer, SPELL_CRYSTAL_CHAINS);

                        m_uiCrystalChainTimer = 30*IN_MILLISECONDS;
                    }
                }
                else
                {
                    if (Unit* pSource = m_creature->getVictim())
                    {
                        m_uiCrystalChainTimer = 15*IN_MILLISECONDS;

                        Player* pPlayer = pSource->GetCharmerOrOwnerPlayerOrPlayerItself();

                        if (!pPlayer)
                            return;

                        if (Group* pGroup = pPlayer->GetGroup())
                        {
                            for(GroupReference* pRef = pGroup->GetFirstMember(); pRef != NULL; pRef = pRef->next())
                            {
                                if (Player* pMember = pRef->getSource())
                                {
                                    if (pMember->isAlive() && pMember->IsWithinDistInMap(m_creature, 50.0f))
                                        m_creature->CastSpell(pMember, SPELL_CRYSTAL_CHAINS, true);
                                }
                            }
                        }
                        else
                            m_creature->CastSpell(pPlayer, SPELL_CRYSTAL_CHAINS, false);
                    }
                }
            }
        }
        else
            m_uiCrystalChainTimer -= uiDiff;

        if (m_uiTailSweepTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, SPELL_TAIL_SWEEP) == CAST_OK)
                m_uiTailSweepTimer = urand(2.5*IN_MILLISECONDS, 7.5*IN_MILLISECONDS);
        }
        else
            m_uiCrystalChainTimer -= uiDiff;

        if (m_uiCrystalfireBreathTimer < uiDiff)
        {
            if (DoCastSpellIfCan(m_creature, m_bIsRegularMode ? SPELL_CRYSTALFIRE_BREATH : SPELL_CRYSTALFIRE_BREATH_H) == CAST_OK)
                m_uiCrystalfireBreathTimer = urand(15*IN_MILLISECONDS, 20*IN_MILLISECONDS);
        }
        else
            m_uiCrystalfireBreathTimer -= uiDiff;

        if (!m_bIsRegularMode)
        {
            if (m_uiCrystallizeTimer < uiDiff)
            {
                if (DoCastSpellIfCan(m_creature, SPELL_CRYSTALLIZE) == CAST_OK)
                {
                    m_uiCrystallizeTimer = urand(15*IN_MILLISECONDS, 25*IN_MILLISECONDS);
                    DoScriptText(SAY_CRYSTAL_NOVA, m_creature);
                }
            }
            else
                m_uiCrystallizeTimer -= uiDiff;
        }

        DoMeleeAttackIfReady();
    }
};

CreatureAI* GetAI_boss_keristrasza(Creature* pCreature)
{
    return new boss_keristraszaAI(pCreature);
}

void AddSC_boss_keristrasza()
{
    Script* pNewScript;

    pNewScript = new Script;
    pNewScript->Name = "boss_keristrasza";
    pNewScript->GetAI = &GetAI_boss_keristrasza;
    pNewScript->RegisterSelf();
}
