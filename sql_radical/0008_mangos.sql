SET NAMES UTF8;

UPDATE `creature_template` SET `ScriptName` = 'npc_thorim_event' WHERE `entry` = 30399;

UPDATE `creature_template` SET `unit_flags` = '2' WHERE `entry` = 30396;
UPDATE `creature_template` SET `gossip_menu_id` = '10109' WHERE `entry` = 30399;

UPDATE `quest_template` SET `ReqSpellCast1` = '56941' WHERE `entry` = 13047;

UPDATE `locales_quest` SET `EndText_loc6` = 'Sé testigo de la venganza' WHERE `entry` = 13047;

DELETE FROM `creature_template` WHERE `entry` = 30410;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `PowerType`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `vehicle_id`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`)
VALUES (30410, 0, 0, 0, 0, 0, 26965, 0, 0, 0, 'Runeforged Servant', 'Servant of Loken', '', 0, 80, 80, 50400, 50400, 0, 0, 0, 9730, 7, 7, 0, 1, 1.14286, 1, 1, 420, 630, 0, 157, 2, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 336, 504, 126, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `locales_creature` WHERE `entry` = 30410;
INSERT INTO `locales_creature` (`entry`, `name_loc1`, `name_loc2`, `name_loc3`, `name_loc4`, `name_loc5`, `name_loc6`, `name_loc7`, `name_loc8`, `subname_loc1`, `subname_loc2`, `subname_loc3`, `subname_loc4`, `subname_loc5`, `subname_loc6`, `subname_loc7`, `subname_loc8`)
VALUES (30410, '', '', '', '', '', 'Sirviente runaforjado', 'Sirviente runaforjado', '', NULL, NULL, NULL, NULL, 'Sirviente de Loken', 'Sirviente de Loken', NULL, '');
	
UPDATE `locales_quest` SET `EndText_loc7` = `EndText_loc6` WHERE `entry` = 13047;
UPDATE `locales_creature` SET `name_loc7` = `name_loc6`, `subname_loc7` = `subname_loc6` WHERE `entry` = 30410;