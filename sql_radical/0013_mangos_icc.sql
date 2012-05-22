UPDATE `creature_template` SET `mechanic_immune_mask` = '1' WHERE `entry`  IN ('37890','38393','38628','38629','37949','38394','38625','38626','38009','38398','38630','38631','38010','38397','39000','39001','38135','38395','38634','38635');

-- Vengeful Blast aura for shades
DELETE FROM `creature_template_addon` WHERE `entry` = 38222;
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES (38222, "71494");

-- fix flags of Puddle Stalkers
UPDATE `creature_template` SET `unit_flags` = 524288 WHERE `entry` = 37013;
 
-- make triggers not visible
UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 33554432 | 2 WHERE entry IN (37013, 37986, 38107, 38548, 37006, 38107, 38548, 38556, 36659);

-- -------------------
-- Professor putricide
-- -------------------

UPDATE `creature_template` SET `PowerType` = 0, `vehicle_id` = 587 WHERE `entry` IN (36678, 38431, 38585, 38586);
 
DELETE FROM `spell_script_target` WHERE `entry` IN (71412, 71415, 71617);
INSERT INTO `spell_script_target` VALUES
(71412, 1, 37824), -- Green Ooze
(71415, 1, 37824), -- Orange Ooze
(71617, 1, 38317); -- Tear Gas

-- delete Grow Stacker - handle in script
DELETE FROM `creature_template_addon` WHERE `entry` = 37690;

-- remove proc from Mutated Strength - currently cooldown for creatures not handled in core
DELETE FROM `spell_proc_event` WHERE `entry` IN (71604, 72673, 72674, 72675);
INSERT INTO `spell_proc_event` (`entry`, `procFlags`) VALUES
(71604, 256),
(72673, 256),
(72674, 256),
(72675, 256);

-- -----------
-- Abomination
-- -----------
 
DELETE FROM `creature_template_addon` WHERE `entry` IN (37672, 38285);
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
(37672, '70385'),
(38285, '70385');

UPDATE `creature_template` SET `PowerType` = 3, `vehicle_id`=591 WHERE `entry` IN (37672, 38605, 38786, 38787, 38285, 38788, 38789, 38790);
 
-- Presence of the Darkfallen
DELETE FROM spell_script_target WHERE entry IN (70995, 71952);
INSERT INTO spell_script_target VALUES
(71952, 1, 37955),
(70995, 1, 37955);

-- by default Pact of the Darkfallen is getting spell power coeff, so set it to 0
DELETE FROM `spell_bonus_data` WHERE `entry` = 71341;
INSERT INTO `spell_bonus_data` VALUES
(71341, 0, 0, 0, 0, 'Pact of the Darkfallen (Lanathel)');

-- Ice Wing

UPDATE `creature_template` SET `ScriptName`='mob_svalna', `AIName`='' WHERE `entry`= 37126;
UPDATE `creature_template` SET `ScriptName`='mob_crok', `AIName`='' WHERE `entry`= 37129;
UPDATE `creature_template` SET `ScriptName`='mob_arnath', `AIName`='' WHERE `entry`= 37122;
UPDATE `creature_template` SET `ScriptName`='mob_brandon', `AIName`='' WHERE `entry`= 37123;
UPDATE `creature_template` SET `ScriptName`='mob_grondel', `AIName`='' WHERE `entry`= 37124;
UPDATE `creature_template` SET `ScriptName`='mob_rupert', `AIName`='' WHERE `entry`= 37125;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`= 24693;
 
DELETE FROM `creature` WHERE `id` = 37950;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `curhealth`, `MovementType`) VALUES
(37950, 631, 15, 16, 4203.1416, 2484.8616, 386.4849, 6.276, 604800, 0, 1, 0);
 
DELETE FROM `creature_model_info` WHERE (`modelid`=30362);
INSERT INTO `creature_model_info` (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`, `modelid_alternative`) VALUES (30362, 3, 10, 1, 0, 0);
 
-- Unchained Magic - add 1sec cooldown
DELETE FROM `spell_proc_event` WHERE `entry` = 69762;
INSERT INTO `spell_proc_event` VALUES (69762, 0x7E, 0x00, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0, 0, 1);

-- ---------
-- Lich King
-- ---------
 
UPDATE `creature_template` SET `ScriptName`='boss_the_lich_king_icc', `AIName`='' WHERE `entry` = 36597;
UPDATE `creature_template_addon` SET `auras` = '73878 73220 72846' WHERE `entry` IN (36597, 39166, 39167, 39168);
UPDATE `creature_template` SET `speed_walk` = 1.0, `speed_run` = 1.1 WHERE `entry` IN (36597, 39166, 39167, 39168);
UPDATE `creature_template` SET `ScriptName` = 'boss_terenas_menethil_icc' WHERE entry = 38579;
 
UPDATE `creature_template` SET `ScriptName`='mob_vile_spirit', `AIName`='' WHERE `entry` IN (37799, 39190);
UPDATE `creature_template` SET `speed_walk` = 1.8, `speed_run` = 1.1 WHERE `entry` IN (37799, 39284, 39285, 39286);

UPDATE `creature_template` SET `ScriptName`='mob_drudge_ghoul', `AIName`='' WHERE `entry`= 37695;
UPDATE `creature_template` SET `ScriptName`='mob_shambling_horror', `AIName`='' WHERE `entry`= 37698;
UPDATE `creature_template` SET `ScriptName`='mob_shadow_trap', `AIName`='', `faction_A` = 14, `faction_H` = 14, `unit_flags` = `unit_flags` | 2 | 33554432 WHERE `entry`= 39137;
UPDATE `creature_template` SET `ScriptName`='mob_valkyr_shadowguard', `AIName`='' WHERE `entry`= 36609;
UPDATE `creature_template` SET `ScriptName`='npc_terenas_fm', `AIName`='' WHERE `entry`= 36823; -- normal
UPDATE `creature_template` SET `ScriptName`='npc_terenas_fm', `AIName`='' WHERE `entry`= 39217; -- heroic, different entry
UPDATE `creature_template` SET `ScriptName`='mob_spirit_warden', `AIName`='' WHERE `entry`= 36824;
UPDATE `creature_template` SET `ScriptName`='mob_spirit_bomb', `AIName`='', minlevel = 83, maxlevel = 83, `unit_flags` = `unit_flags` | 33554432, `faction_A` = 14, `faction_H` = 14 WHERE `entry`= 39189;

-- speed of Wicked Spirits
UPDATE `creature_template` SET `speed_walk` = 0.9, `speed_run` = 0.9 WHERE `entry` IN (39190, 39287, 39288, 39289);
 
-- damage of Terenas and Spirit Warden, they should be hitting each other for around 10-11k normal melee damage
UPDATE `creature_template` SET `dmg_multiplier` = 46 WHERE `entry` IN (36823, 36824, 39296);

-- make Ice Spheres untauntable
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 256 WHERE `entry` IN (36633, 39305, 39306, 39307);

DELETE FROM `spell_script_target` WHERE `entry` IN (71614, 74074, 73028, 74321, 74322, 74323, 72679, 74318, 74319, 74320);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(71614, 1, 38995),
(74074, 1, 36597),
(73028, 1, 36597), -- Harvested Soul
(74321, 1, 36597),
(74322, 1, 36597),
(74323, 1, 36597),
(72679, 1, 36597),
(74318, 1, 36597),
(74319, 1, 36597),
(74320, 1, 36597);



-- proc for Dark Hunger
DELETE FROM `spell_proc_event` WHERE `entry` = 69383;
INSERT INTO `spell_proc_event` (`entry`, `procFlags`) VALUES
(69383, 0x04 | 0x10 | 0x10000);

-- fix stats for some creatures
-- Raging Spirit
UPDATE `creature_template` SET `minhealth` = 885400, `maxhealth` = 885400 WHERE `entry` = 36701; -- 10normal
UPDATE `creature_template` SET `minhealth` = 2650000, `maxhealth` = 2650000 WHERE `entry` = 39302; -- 25normal
UPDATE `creature_template` SET `minhealth` = 1230000, `maxhealth` = 1230000 WHERE `entry` = 39303; -- 10hero
UPDATE `creature_template` SET `minhealth` = 4150000, `maxhealth` = 4150000 WHERE `entry` = 39304; -- 25hero

-- Ice Sphere
UPDATE `creature_template` SET `minhealth` = 6000, `maxhealth` = 6000 WHERE `entry` = 36633; -- 10normal
UPDATE `creature_template` SET `minhealth` = 15200, `maxhealth` = 15200 WHERE `entry` = 39305; -- 25normal
UPDATE `creature_template` SET `minhealth` = 15200, `maxhealth` = 15200 WHERE `entry` = 39306; -- 10hero
UPDATE `creature_template` SET `minhealth` = 53200, `maxhealth` = 53200 WHERE `entry` = 39307; -- 25hero

DELETE FROM `spell_target_position` WHERE `id` IN (70856, 70857, 70858, 70859, 70860, 70861, 72546, 73655);
INSERT INTO `spell_target_position` VALUES
(70856, 631, -503.62, 2211.47, 62.8235, 3.14),
(70857, 631, -615.145, 2211.47, 199.972, 0),
(70858, 631, -549.131, 2211.29, 539.291, 0),
(70859, 631, 4198.42, 2769.22, 351.065, 0),
(70860, 631, 529.302, -2124.49, 840.857, 3.1765),
(70861, 631, 4356.580078, 2565.75, 220.401993, 4.90),
(72546, 631, 514.000, -2523.00, 1050.990, 3.1765),
(73655, 631, 495.708, -2523.76, 1250.990, 3.1765);
