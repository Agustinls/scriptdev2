-- Svalna Trigger para activar evento de texto
DELETE FROM `creature` WHERE `id` = 24693;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`)
VALUES (null, 24693, 631, 1, 65535, 0, 0, 4357.04, 2570.15, 351.102, 1.57708, 25, 5, 0, 1, 0, 0, 0);

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 37126;

-- Cámaras de Reflexión: Muros intargeteables
UPDATE `gameobject_template` SET `flags` = '4' WHERE `entry` = 201385;

-- NPC's Valithria invisibles
UPDATE `creature_template` SET `unit_flags` = '33554818' WHERE `entry` = 38752;
UPDATE `creature_template` SET `unit_flags` = '33554818' WHERE `entry` = 16980;

-- Confesora puesta como enemigo
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14' WHERE `entry` = 34928;

-- Recolocados los NPC's de TOC5 y puesto respawn de 1 dí­a a cada uno
UPDATE `creature` SET `position_x` = '746.52', `position_y` = '621.11', `spawntimesecs` = '86400' WHERE `id` = 35004;
UPDATE `creature` SET `position_x` = '746.52', `position_y` = '621.11', `spawntimesecs` = '86400' WHERE `id` = 35005;

-- Utgarde Pinnacle (thx Prze)

-- Svala Sorrowgrave

UPDATE creature_template SET ScriptName='npc_ritual_channeler' WHERE entry=27281;

-- Gortok Palehoof

UPDATE `gameobject_template` SET ScriptName='go_gortok_generator' WHERE entry=188593;
UPDATE `creature_template` SET ScriptName='npc_gortok_orb' WHERE entry=26086; -- 26688
UPDATE `creature_template` SET ScriptName='npc_worgen' WHERE entry=26683;
UPDATE `creature_template` SET ScriptName='npc_furlborg' WHERE entry=26684;
UPDATE `creature_template` SET ScriptName='npc_jormungar' WHERE entry=26685;
UPDATE `creature_template` SET ScriptName='npc_rhino' WHERE entry=26686;

-- Skadi the Ruthless

UPDATE `gameobject_template` SET ScriptName='go_skadi_harpoon_launcher', flags=flags|4 WHERE entry IN (192175, 192176, 192177);
UPDATE `gameobject_template` SET ScriptName='go_skadi_harpoon' WHERE entry=192539;
UPDATE `creature_template` SET ScriptName='boss_grauf' WHERE entry=26893;

-- King Ymiron

UPDATE `creature_template` SET ScriptName='npc_bjorn_sphere' WHERE entry = 27339;
UPDATE `creature_template` SET ScriptName='npc_avenging_spirit_summoner' WHERE entry = 27392;

REPLACE INTO `spell_script_target` (entry, type, targetEntry) VALUES
(48277, 1, 27327),
(48331, 1, 27327),
(48642, 1, 26893),
(51368, 1, 26893),
(47670, 1, 26687),
(47670, 1, 26684),
(47670, 1, 26683),
(47670, 1, 26685),
(47670, 1, 26686),
(48385, 1, 27339);

-- Vehicle data for Grauf

UPDATE `creature_template` SET vehicle_id=40 WHERE entry IN (26893, 30775);

-- Immune masks (charm, fear, root, silence, sleep, snare, stun, freeze, knockout, polymorph, banish, shackle, horror, sapped)

UPDATE `creature_template` SET mechanic_immune_mask=mechanic_immune_mask|1|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|8388608|536870912
WHERE entry IN (26668,26687,26693,26861,30810,30774,30807,30788);

###### Emblem of Herosim ######
-- Svala Sorrowgrave 30810

DELETE FROM `creature_loot_template` WHERE entry=30810 AND item=40752;
INSERT INTO `creature_loot_template` VALUES (30810, 40752, 100, 5, 1, 1, 0, 0, 0);

-- Gortok Palehoof 30774

DELETE FROM `creature_loot_template` WHERE entry=30774 AND item=40752;
INSERT INTO `creature_loot_template` VALUES (30774, 40752, 100, 5, 1, 1, 0, 0, 0);

-- Skadi the Ruthless 30807

DELETE FROM `creature_loot_template` WHERE entry=30807 AND item=40752;
INSERT INTO `creature_loot_template` VALUES (30807, 40752, 100, 5, 1, 1, 0, 0, 0);

-- King Ymiron 30788

DELETE FROM `creature_loot_template` WHERE entry=30788 AND item=40752;
INSERT INTO `creature_loot_template` VALUES (30788, 40752, 100, 5, 1, 1, 0, 0, 0);

-- Restored Skadi, Grauf and door spawn :)

REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(65440, 192173, 575, 3, 1, 477.496, -477.183, 103.064, -1.58825, 0, 0, -0.71325, 0.700909, 180, 0, 1);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(126103, 26693, 575, 3, 1, 0, 0, 343.02, -507.325, 104.567, 2.96706, 86400, 0, 0, 1260000, 0, 0, 0),
(126052, 26893, 575, 3, 1, 0, 0, 341.741, -516.955, 104.669, 3.12414, 3600, 0, 0, 1260000, 0, 0, 0);


/* PIT OF SARON */ -- (thx Xfurry)
-- Areatrigger:

DELETE FROM `scripted_areatrigger` WHERE entry = 5578;
INSERT INTO `scripted_areatrigger` VALUES (5578, 'at_tyrannus');

-- Boss

DELETE FROM `gameobject` WHERE `id` = 201885;
UPDATE `creature_template` SET `ScriptName`='boss_Ick' WHERE `entry`=36476;
UPDATE `creature_template` SET `ScriptName`='boss_Krick' WHERE `entry`=36477;
UPDATE `creature_template` SET `ScriptName`='mob_explosive_orb' WHERE `entry`=36610;
UPDATE `creature_template` SET `ScriptName`='boss_rimefang' WHERE `entry`=36661;
UPDATE `creature_template` SET `ScriptName`='npc_colapsing_icicle' WHERE `entry`=36847;

UPDATE `creature_template` SET `equipment_id` = '2011', `unit_flags` = '0' WHERE `entry` = 36658;
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14' WHERE `entry` = 36661;

-- Npc

UPDATE `creature_template` SET `ScriptName`='npc_slyvanas_jaina_pos_start' WHERE `entry` in (36993, 36990);
UPDATE `creature_template` SET `ScriptName`='npc_slyvanas_jaina_pos_end' WHERE `entry` in (38188, 38189);
UPDATE `creature_template` SET `ScriptName`='npc_martin_gorkun' WHERE `entry` in (37591, 37592);
UPDATE `creature` SET spawnMask = 0 where id in (37591, 37592, 38188, 38189, 36731);
UPDATE `creature` SET spawnMask = 0 where guid in (123745, 123584, 123548, 123585);
UPDATE `gameobject_template` SET faction = 114, data10 = 1 WHERE entry = 196485;
DELETE FROM `creature` WHERE `id`=36658;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(null, 36658, 658, 3, 1, 0, 0, 1018.38, 167.25, 651.871, 5.2709, 14400, 0, 0, 653828, 0, 0, 0);

-- Spells

REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('69347', '1', '36794');
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('70521', '1', '37581');
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('70521', '1', '37580');

DELETE FROM `spell_target_position` WHERE id IN (70860, 72546, 73655);
INSERT INTO `spell_target_position` VALUES (70860, 631, 529.302, -2124.49, 840.857, 3.1765),
(72546, 631, 514.000, -2523.00, 1050.990, 3.1765),
(73655, 631, 495.708, -2523.76, 1050.990, 3.1765),
(70860, 631, 529.302, -2124.49, 1040.857, 3.1765),
(72546, 631, 514.000, -2523.00, 1250.990, 3.1765),
(73655, 631, 495.708, -2523.76, 1250.990, 3.1765);