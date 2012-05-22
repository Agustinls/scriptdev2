-- Correct Urom (Oculus)

DELETE FROM `creature` WHERE `id` = 27655;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`)
VALUES (null, 27655, 578, 3, 1, 0, 1779, 1177.47, 937.722, 527.405, 2.21657, 86400, 0, 0, 431392, 83380, 0, 0);

-- Evento Tribunal of Ages (Cámaras de piedra) para que las caras hablen en heroico

UPDATE `creature` SET `spawnMask` = '3' WHERE `id` = 30897;
UPDATE `creature` SET `spawnMask` = '3' WHERE `id` = 30898;
UPDATE `creature` SET `spawnMask` = '3' WHERE `id` = 30899;

-- La oscuridad se revuelve (Quest 13242)

UPDATE `gameobject` SET `phaseMask` = '65535'  WHERE `id` = 193197;

-- Brann outro en Sjonnir (Cámaras de piedra)

UPDATE `creature_template` SET `rank` = '1', `modelid_1` = '26353', `name` = 'Brann Bronzebeard', `minlevel` = '80', `maxlevel` = '80', `minhealth` = '32052', `maxhealth` = '32052', `faction_A` = '35', `faction_H` = '35', `ScriptName` = '' WHERE `entry` = 24575;
UPDATE `locales_creature` SET `name_loc6` = 'Brann Barbabronce' WHERE `entry` = 24575;

UPDATE `creature_template` SET `rank` = '1', `modelid_1` = '26353', `name` = 'Brann Bronzebeard', `minlevel` = '80', `maxlevel` = '80', `minhealth` = '32052', `maxhealth` = '32052', `faction_A` = '35', `faction_H` = '35', `ScriptName` = 'brann_outro' WHERE `entry` = 24577;
UPDATE `locales_creature` SET `name_loc6` = 'Brann Barbabronce' WHERE `entry` = 24577;

UPDATE `gameobject_template` SET `flags` = '6553636'  WHERE `entry` = 193906;

DELETE FROM `creature` WHERE `id` = 24575;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`)
VALUES (null, 24575, 599, 2, 1, 0, 0, 1262.72, 667.006, 189.608, 0.00653052, 86400, 5, 0, 32052, 0, 0, 0);

-- Matanza de Stratholme

UPDATE `gameobject_template` SET `flags` = '0' WHERE `entry` = 190663;
UPDATE `gameobject_template` SET `flags` = '0' WHERE `entry` = 193597;

DELETE FROM `creature` WHERE `id` = 30994;
DELETE FROM `creature` WHERE `id` IN (27731,27734,28249,27736,27915,30571,26499,26497,26528,27891,27892,27884,32273,28439);

DELETE FROM `creature_movement` WHERE (`id`='138237' AND `point`='1') OR (`id`='138237' AND `point`='2') OR (`id`='138238' AND `point`='1') OR (`id`='138238' AND `point`='2') OR (`id`='138239' AND `point`='1') OR (`id`='138239' AND `point`='2') OR (`id`='138239' AND `point`='3') OR (`id`='138239' AND `point`='4');
DELETE FROM `creature_movement` WHERE (`id`='138288' AND `point`='1') OR (`id`='138288' AND `point`='2') OR (`id`='138289' AND `point`='1') OR (`id`='138289' AND `point`='2');

DELETE FROM `creature` WHERE `id` in (27915, 26499, 26497, 26528, 27891, 27892, 32273, 28439, 30571);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(null, 27915, 595, 3, 1, 0, 0, 1812.49, 1284.81, 142.248, 4.03364, 300, 0, 0, 17010, 0, 0, 0),
(null, 26499, 595, 3, 1, 0, 1613, 1920.87, 1287.12, 142.935, 6.25562, 43200, 0, 0, 44100, 7988, 0, 0),
(null, 26497, 595, 3, 1, 0, 1221, 1896.39, 1292.91, 143.711, 0.016332, 300, 0, 0, 100800, 88140, 0, 0),
(null, 26528, 595, 3, 1, 0, 1819, 1761.42, 1285.75, 139.945, 4.93874, 300, 0, 0, 126000, 59910, 0, 0),
(null, 27891, 595, 3, 1, 0, 0, 1603.38, 805.988, 123.272, 1.90688, 300, 0, 0, 8982, 0, 0, 0),
(null, 27892, 595, 3, 1, 0, 0, 1602.3, 809.385, 123.454, 5.02884, 300, 0, 0, 8982, 0, 0, 0),
(null, 32273, 595, 3, 1, 0, 1839, 2330.93, 1275.59, 132.848, 3.60489, 300, 0, 0, 417911, 0, 0, 0),
(null, 28439, 595, 3, 1, 0, 0, 2336.56, 1277.9, 132.885, 3.47923, 300, 0, 0, 1, 0, 0, 0),
(null, 30571, 595, 3, 1, 0, 0, 1553.37, 578.078, 99.7624, 5.83105, 300, 0, 0, 8982, 0, 0, 0);
