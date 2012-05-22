-- CIUDADELA DE CORONA DE HIELO
-- Sindragosa, muro de hielo para cerrar la entrada al boss cuando se esté combatiendo contra él

UPDATE `gameobject_template` SET `faction` = '0' WHERE `entry` = 201385;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES (null, 201385, 631, 15, 1, 4320.72, 2487.47, 211.202, 0.1399, 0, 0, 0.0698929, 0.997554, 25, 255, 0);

-- Alto Señor Supremo Colmillosauro (37187) y Muradin Barbabronce (37200) pasivos por si PJ's de las facciones contrarias se los encontrasen en la instance

UPDATE `creature_template` SET `unit_flags` = '33538' WHERE `entry` = 37200;
UPDATE `creature_template` SET `unit_flags` = '770' WHERE `entry` = 37188;
UPDATE `creature_template` SET `unit_flags` = '770' WHERE `entry` = 37879;

-- Alarmas ICC recolocadas y visibles

DELETE FROM `gameobject` WHERE `id` = 201814;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES (null, 201814, 631, 15, 1, -208.529, 2171.25, 37.9852, 6.14272, 0, 0, 0.0701729, -0.997535, 25, 255, 1),
(null, 201814, 631, 15, 1, -275.418, 2199.33, 42.5646, 3.09467, 0, 0, 0.999725, 0.0234607, 25, 255, 1),
(null, 201814, 631, 15, 1, -274.979, 2224.42, 42.5646, 3.07582, 0, 0, 0.999459, 0.0328817, 25, 255, 1),
(null, 201814, 631, 15, 1, -210.735, 2249.15, 37.9853, 0.149351, 0, 0, 0.0746059, 0.997213, 25, 255, 1);

UPDATE `gameobject_template` SET `data9` = '0' WHERE `entry` = 201814;

-- Valithria, corregido nivel de un NPC-Skill

UPDATE `creature_template` SET `minlevel` = '83', `maxlevel` = '83' WHERE `entry` = 38068;

-- Templates para los adds de Lady Susurramuerte

DELETE FROM `creature_template` WHERE `entry` IN ('37890', '37949', '38009','38010', '38135');
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `PowerType`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `vehicle_id`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`)
VALUES ('37890','38393','38628','38629','0','0','30967','0','0','0','Cult Fanatic','Cult of the Damned','','0','82','82','134810','134810','0','0','0','10328','21','21','0','1','1.14286','1','1','452','678','0','169','37.5','2000','2000','1','32768','0','0','0','0','0','0','362','542','135','7','8','0','0','0','0','0','0','0','0','0','71236','72495','70900','70659','0','0','0','0','0','0','0','','0','3','10','1','0','0','0','0','0','0','0','0','1','0','2065','0','0','0','0','mob_cult_fanatic'), 
('37949','38394','38625','38626','0','0','30965','0','0','0','Cult Adherent','Cult of the Damned','','0','82','82','107840','107840','0','183200','183200','8262','21','21','0','1','1.14286','1','1','330','495','0','124','16.5','2000','2000','8','0','0','0','0','0','0','0','264','396','99','7','8','0','0','0','0','0','0','0','0','0','71237','70901','70903','72498','0','0','0','0','0','0','0','','0','3','10','10','0','0','0','0','0','0','0','0','1','0','2067','0','0','0','0','mob_cult_adherent'),
('38009','38398','38630','38631','0','0','30968','0','0','0','Reanimated Fanatic','Cult of the Damned','','0','82','82','134810','134810','0','0','0','10328','21','21','0','1','1.14286','1','1','420','630','0','157','37.5','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','1032','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','10','1','0','0','0','0','0','0','0','0','1','0','2065','0','0','0','0','mob_cult_fanatic'),
('38010','38397','39000','39001','0','0','30966','0','0','0','Reanimated Adherent','Cult of the Damned','','0','82','82','107840','107840','0','183200','183200','8262','21','21','0','1','1.14286','1','1','391','585','0','146','16.5','2000','2000','2','0','0','0','0','0','0','0','313','468','117','6','1032','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','10','10','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','mob_cult_adherent'),
('38135','38395','38634','38635','0','0','22124','0','0','0','Deformed Fanatic','Cult of the Damned','','0','82','82','134810','134810','0','0','0','10328','21','21','0','0.5','1.14286','1','1','420','630','0','157','37.5','2000','2000','1','0','0','0','0','0','0','0','336','504','126','6','8','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','10','1','0','0','0','0','0','0','0','84','1','0','2065','0','0','0','0','mob_cult_fanatic');

UPDATE `creature_template` SET `minhealth` = '202215', `maxhealth` = '202215' WHERE `entry` IN ('38398','38631','38395','38635');
UPDATE `creature_template` SET `minhealth` = '215680', `maxhealth` = '215680', `minmana` = '183200', `maxmana` = '183200' WHERE `entry` IN ('38397','39001');

-- Svalna, eliminada la lanza empaladora bug y colocados scripts

DELETE FROM `creature` WHERE `id` = 38248;

-- UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'mob_svalna' WHERE `entry` = 37126;
UPDATE `creature_template` SET `name` = '[Svalna Event]', `unit_flags` = '33554818', `modelid_1` = '11686', `ScriptName` = 'mob_svalna_event' WHERE `entry` = 24693;

-- NPC's mal situados recolocados

DELETE FROM `creature` WHERE `id` = 37011;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`)
VALUES (null, 37011, 631, 15, 1, 0, 0, -153.203, 2218.09, 35.2334, 0.0104115, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -235.689, 2174.32, 39.9686, 0.868062, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -238.327, 2257.98, 40.3414, 5.38724, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -157.939, 2169.64, 37.9852, 2.47027, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -159.93, 2163.77, 37.9852, 2.07836, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -159.995, 2257.02, 37.9853, 4.05992, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -160.631, 2249.03, 37.9853, 4.05992, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -165.732, 2165.83, 37.9852, 2.07836, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -231.603, 2249.75, 38.3102, 5.31184, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -227.372, 2263.21, 37.9852, 5.17754, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -165.62, 2255.8, 37.9853, 4.17066, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -153.17, 2205.37, 35.2334, 0.00255752, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -235.867, 2163.16, 39.3215, 0.580606, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -239.192, 2168.23, 39.9498, 0.894765, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -230.527, 2167.32, 40.4582, 0.546834, 7200, 0, 0, 478800, 0, 0, 0),
(null, 37011, 631, 15, 1, 0, 0, -242.107, 2248.54, 37.9961, 5.61814, 7200, 0, 0, 478800, 0, 0, 0);
	
DELETE FROM `creature` WHERE `guid` = 93499;
DELETE FROM `creature` WHERE `guid` = 93500;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`)
VALUES (null, 36724, 631, 15, 1, 0, 0, -251.654, 2204.34, 42.5646, 0.019031, 7200, 0, 0, 378000, 99850, 0, 0),
(null, 36724, 631, 15, 1, 0, 0, -251.922, 2218.42, 42.5646, 6.28258, 7200, 0, 0, 378000, 99850, 0, 0);

UPDATE `creature` SET `position_x` = '-202.681', `position_y` = '2218.41' WHERE `guid` = 136113 AND `id` = 37012;
UPDATE `creature` SET `position_x` = '-202.681', `position_y` = '2204.34' WHERE `guid` = 136114 AND `id` = 37012;

-- Precioso y Apestoso scripts

UPDATE `creature_template` SET `ScriptName` = 'mob_stinky' WHERE `entry` = 37025;
UPDATE `creature_template` SET `ScriptName` = 'mob_precious' WHERE `entry` = 37217;

UPDATE `locales_creature` SET `name_loc6` = 'Apestoso', `name_loc7` = 'Apestoso' WHERE `entry` = 37025;
UPDATE `locales_creature` SET `name_loc6` = 'Precioso', `name_loc7` = 'Precioso' WHERE `entry` = 37217;

-- Arthas: Scripts para las Valkyrs y arreglado timer de casteo de Recolectar alma (Frostmourne)

UPDATE `creature_template` SET `unit_flags` = '512' WHERE `entry` = 36609;
UPDATE `creature_template` SET `ScriptName` = 'mob_valkyr' WHERE `entry` = 36609;

-- Gameobjects LK bien puestos

UPDATE `gameobject_template` SET `type` = '0' WHERE `entry` = 202141;
UPDATE `gameobject_template` SET `type` = '0' WHERE `entry` = 202142;
UPDATE `gameobject_template` SET `type` = '0' WHERE `entry` = 202143;
UPDATE `gameobject_template` SET `type` = '0' WHERE `entry` = 202144;

-- Gameobject LK sobrantes borrados

DELETE FROM `gameobject` WHERE `guid` = 8790;

DELETE FROM `gameobject` WHERE `id` = 202436;
DELETE FROM `gameobject` WHERE `id` = 202437;
DELETE FROM `gameobject` WHERE `id` = 202438;
DELETE FROM `gameobject` WHERE `id` = 202188;


-- Tuétano Bone Spike script

UPDATE `creature_template` SET `ScriptName` = 'mob_bone_spike' WHERE `entry` = 36619;


-- Recolocados el DK y más NPC's y borrados NPC's de quests bug de diarias de bolsita.

DELETE FROM `creature` WHERE `id` = 38471;
UPDATE `creature` SET `position_z` = '215.60' WHERE `guid` = 81531;
UPDATE `creature` SET `position_z` = '205.60' WHERE `guid` = 78383;
UPDATE `creature` SET `position_z` = '215.60' WHERE `guid` = 81170;

UPDATE `creature_template` SET `unit_flags` = '33600' WHERE `entry` = 37813;

-- EL OJO DE LA ETERNIDAD
-- Malygos. Teletransportadores colocados para poder lotear

UPDATE `creature_template` SET `minhealth` = '150000', `maxhealth` = '150000' WHERE `entry` = 30248;
UPDATE `creature_template` SET `minhealth` = '150000', `maxhealth` = '150000' WHERE `entry` = 30234;

-- TBC
-- El Ojo de la Tempestad
-- Al'ar

UPDATE `creature_template` SET `ScriptName` = 'boss_alar' WHERE `entry` = 19514;
UPDATE `creature_template` SET `ScriptName` = 'mob_ember_of_alar' WHERE `entry` = 19551;
UPDATE `creature_template` SET `ScriptName` = 'mob_flame_patch_alar' WHERE `entry` = 20602;