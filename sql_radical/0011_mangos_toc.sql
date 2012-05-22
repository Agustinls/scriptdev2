UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `ScriptName` = 'mob_fire_bomb' WHERE `entry` = 34854;
UPDATE `creature_template` SET `dmg_multiplier` = '3' WHERE `entry` = 34800;

UPDATE `gameobject_template` SET `flags` = '4' WHERE `entry` = 195485;
UPDATE `gameobject` SET `spawnMask` = '15' WHERE `guid` = 2358;

DELETE FROM `creature_template` WHERE `entry` = 34863;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `PowerType`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `vehicle_id`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`)
VALUES (34863, 0, 0, 0, 0, 0, 19725, 28549, 0, 0, 'Nerubian Burrow Two', '', '', 0, 1, 1, 1, 1, 0, 0, 0, 17, 35, 35, 0, 1, 1.14286, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, '');

DELETE FROM `creature_template` WHERE `entry` = 34864;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `PowerType`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `vehicle_id`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`)
VALUES (34864, 0, 0, 0, 0, 0, 19725, 28549, 0, 0, 'Nerubian Burrow Three', '', '', 0, 1, 1, 1, 1, 0, 0, 0, 17, 35, 35, 0, 1, 1.14286, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, '');

DELETE FROM `creature_template` WHERE `entry` = 34865;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `PowerType`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `vehicle_id`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`)
VALUES (34865, 0, 0, 0, 0, 0, 19725, 28549, 0, 0, 'Nerubian Burrow Four', '', '', 0, 1, 1, 1, 1, 0, 0, 0, 17, 35, 35, 0, 1, 1.14286, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, '');

DELETE FROM `creature_template_addon` WHERE `entry` = 34863;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`)
VALUES (34863, 0, 0, 1, 0, 0, 0, '66324');

DELETE FROM `creature_template_addon` WHERE `entry` = 34864;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`)
VALUES (34864, 0, 0, 1, 0, 0, 0, '66324');
	
DELETE FROM `creature_template_addon` WHERE `entry` = 34865;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`)
VALUES (34865, 0, 0, 1, 0, 0, 0, '66324');

DELETE FROM `creature` WHERE `id` = 34862;
DELETE FROM `creature` WHERE `id` = 34863;
DELETE FROM `creature` WHERE `id` = 34864;
DELETE FROM `creature` WHERE `id` = 34865;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`)
VALUES (null, 34862, 649, 15, 1, 0, 0, 735.403, 75.3576, 142.202, 2.09439, 180, 0, 0, 1, 0, 0, 0),
(null, 34863, 649, 15, 1, 0, 0, 692.92, 184.809, 142.203, 5.35816, 180, 0, 0, 1, 0, 0, 0),
(null, 34864, 649, 15, 1, 0, 0, 688.207, 102.847, 142.202, 0.645772, 180, 0, 0, 1, 0, 0, 0),
(null, 34865, 649, 15, 1, 0, 0, 740.545, 189.113, 142.197, 3.75246, 180, 0, 0, 1, 0, 0, 0);

UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 34862;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 34863;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 34864;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 34865;

UPDATE `creature_template` SET `modelid_1` = '17612', `modelid_2` = '0' WHERE `entry` = 5672;

UPDATE `creature_template` SET `minhealth` = '12000', `maxhealth` = '12000' WHERE `entry` = 35458;

UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 33184;
UPDATE `creature_template` SET `name` = 'Permafrost', `unit_flags` = '0', `faction_A` = '14', `faction_H` = '14', `modelid_1` = '17612' WHERE `entry` = 33184;

UPDATE `creature_template` SET `flags_extra` = '256' WHERE `entry` = 34800;

UPDATE `creature_template` SET `mechanic_immune_mask` = '769605631' WHERE `entry` = 34780;
UPDATE `creature_template` SET `mechanic_immune_mask` = '769605631' WHERE `entry` = 35216;
UPDATE `creature_template` SET `mechanic_immune_mask` = '769605631' WHERE `entry` = 35268;
UPDATE `creature_template` SET `mechanic_immune_mask` = '769605631' WHERE `entry` = 35269;

UPDATE `creature_template` SET `mechanic_immune_mask` = '635387903' WHERE `entry` = 34496;
UPDATE `creature_template` SET `mechanic_immune_mask` = '635387903' WHERE `entry` = 35347;
UPDATE `creature_template` SET `mechanic_immune_mask` = '635387903' WHERE `entry` = 35348;
UPDATE `creature_template` SET `mechanic_immune_mask` = '635387903' WHERE `entry` = 35349;

UPDATE `creature_template` SET `mechanic_immune_mask` = '635387903' WHERE `entry` = 34497;
UPDATE `creature_template` SET `mechanic_immune_mask` = '635387903' WHERE `entry` = 35350;
UPDATE `creature_template` SET `mechanic_immune_mask` = '635387903' WHERE `entry` = 35351;
UPDATE `creature_template` SET `mechanic_immune_mask` = '635387903' WHERE `entry` = 35352;

UPDATE `creature_template` SET `unit_flags` = '0' WHERE `entry` = 34566;
UPDATE `creature_template` SET `unit_flags` = '0' WHERE `entry` = 35615;
UPDATE `creature_template` SET `unit_flags` = '0' WHERE `entry` = 35616;

UPDATE `creature_template` SET `modelid_2` = '0', `minlevel` = '83', `maxlevel` = '83', `faction_A` = '14', `faction_H` = '14', `dmg_multiplier` = '4' WHERE `entry` = 34660;
UPDATE `creature_template` SET `modelid_2` = '0', `minlevel` = '83', `maxlevel` = '83', `faction_A` = '14', `faction_H` = '14', `dmg_multiplier` = '6'  WHERE `entry` = 35652;
UPDATE `creature_template` SET `modelid_2` = '0', `minlevel` = '83', `maxlevel` = '83', `faction_A` = '14', `faction_H` = '14', `dmg_multiplier` = '6'  WHERE `entry` = 35653;
UPDATE `creature_template` SET `modelid_2` = '0', `minlevel` = '83', `maxlevel` = '83', `faction_A` = '14', `faction_H` = '14', `dmg_multiplier` = '8' WHERE `entry` = 35654;

UPDATE `gameobject` SET `position_x` = '805.67', `position_y` = '129.72', `orientation` = '2.97' WHERE `id` = 195669;
UPDATE `gameobject` SET `position_x` = '804.48', `position_y` = '139.91', `orientation` = '3.49' WHERE `id` = 195670;
UPDATE `gameobject` SET `position_x` = '804.33', `position_y` = '124.45', `orientation` = '2.77' WHERE `id` = 195671;

-- PSZ patch for Fel Fireball (thx)
DELETE FROM `spell_dbc` WHERE `Id` IN (66532, 66963, 66964, 66965);
INSERT INTO `spell_dbc` 
( `Id`, `Category`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `Stances`, `StancesNot`, `Targets`, `RequiresSpellFocus`, `CasterAuraSpell`, `TargetAuraSpell`, `ExcludeCasterAuraSpell`, `ExcludeTargetAuraSpell`, `CastingTimeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `InterruptFlags`, `AuraInterruptFlags`, `ProcFlags`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `RangeIndex`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect1`, `Effect2`, `Effect3`, `EffectDieSides1`, `EffectDieSides2`, `EffectDieSides3`, `EffectRealPointsPerLevel1`, `EffectRealPointsPerLevel2`, `EffectRealPointsPerLevel3`, `EffectBasePoints1`, `EffectBasePoints2`, `EffectBasePoints3`, `EffectMechanic1`, `EffectMechanic2`, `EffectMechanic3`, `EffectImplicitTargetA1`, `EffectImplicitTargetA2`, `EffectImplicitTargetA3`, `EffectImplicitTargetB1`, `EffectImplicitTargetB2`, `EffectImplicitTargetB3`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectRadiusIndex3`, `EffectApplyAuraName1`, `EffectApplyAuraName2`, `EffectApplyAuraName3`, `EffectAmplitude1`, `EffectAmplitude2`, `EffectAmplitude3`, `EffectMultipleValue1`, `EffectMultipleValue2`, `EffectMultipleValue3`, `EffectItemType1`, `EffectItemType2`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectMiscValue3`, `EffectMiscValueB1`, `EffectMiscValueB2`, `EffectMiscValueB3`, `EffectTriggerSpell1`, `EffectTriggerSpell2`, `EffectTriggerSpell3`, `EffectSpellClassMaskA1`, `EffectSpellClassMaskA2`, `EffectSpellClassMaskA3`, `EffectSpellClassMaskB1`, `EffectSpellClassMaskB2`, `EffectSpellClassMaskB3`, `EffectSpellClassMaskC1`, `EffectSpellClassMaskC2`, `EffectSpellClassMaskC3`, `SpellIconID`, `Comment`, `MaxTargetLevel`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `MaxAffectedTargets`, `DmgClass`, `PreventionType`, `DmgMultiplier1`, `DmgMultiplier2`, `DmgMultiplier3`, `AreaGroupId`, `SchoolMask` )
VALUES
(66532, 0, 1, 0, 0, 136, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 9, 0, 0, 101, 0, 0, 0, 0, 28, 13, 0, -1, 0, 0, 2, 6, 0, 775, 301, 0, 0, 0, 0, 15112, 5849, 0, 0, 0, 0, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2352, "Fel Fireball", 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 4 ),
(66963, 0, 1, 0, 0, 136, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 9, 0, 0, 101, 0, 0, 0, 0, 28, 13, 0, -1, 0, 0, 2, 6, 0, 1251, 475, 0, 0, 0, 0, 24374, 9262, 0, 0, 0, 0, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2352, "Fel Fireball", 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 4 ),
(66964, 0, 1, 0, 0, 136, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 9, 0, 0, 101, 0, 0, 0, 0, 28, 13, 0, -1, 0, 0, 2, 6, 0, 925, 401, 0, 0, 0, 0, 18037, 7799, 0, 0, 0, 0, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2352, "Fel Fireball", 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 4 ),
(66965, 0, 1, 0, 0, 136, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 9, 0, 0, 101, 0, 0, 0, 0, 28, 13, 0, -1, 0, 0, 2, 6, 0, 1751, 551, 0, 0, 0, 0, 34124, 10724, 0, 0, 0, 0, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2352, "Fel Fireball", 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 4 );

UPDATE `spell_dbc` SET
`InterruptFlags` = 0x04,
`Comment` = 'Replacement for spell "Fel Fireball" - set SPELL_INTERRUPT_FLAG_INTERRUPT' 
WHERE `Id` IN (66532, 66963, 66964, 66965);