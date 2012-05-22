-- Recolocacion NPC's ICC

DELETE FROM `creature` WHERE `guid` = 47703;

DELETE FROM `creature` WHERE `id` = 37003;
DELETE FROM `creature` WHERE `id` = 37017;
DELETE FROM `creature` WHERE `id` = 37027;
DELETE FROM `creature` WHERE `id` = 37026;
DELETE FROM `creature` WHERE `id` = 38492;

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`)
VALUES (null, 37003, 631, 15, 1, 0, 2026, -566.729, 2216.62, 199.971, 4.7101, 86400, 5, 0, 471835, 41690, 0, 0),
(null, 37017, 631, 15, 1, 0, 2031, -562.301, 2218.78, 199.971, 4.74823, 86400, 5, 0, 404430, 0, 0, 0),
(null, 37027, 631, 15, 1, 0, 2033, -559.771, 2223.03, 199.971, 4.7887, 86400, 5, 0, 269600, 91600, 0, 0),
(null, 37026, 631, 15, 1, 0, 2032, -573.964, 2222.9, 199.971, 4.75728, 86400, 5, 0, 269600, 91600, 0, 0);

DELETE FROM `creature` WHERE `id` = 37032;
DELETE FROM `creature` WHERE `id` = 37029;
DELETE FROM `creature` WHERE `id` = 37028;
DELETE FROM `creature` WHERE `id` = 37030;
DELETE FROM `creature` WHERE `id` = 37146;

INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`)
VALUES (null, 37032, 631, 15, 1, 0, 2037, -566.83, 2206.44, 199.971, 1.58, 86400, 5, 0, 471835, 0, 0, 0),
(null, 37029, 631, 15, 1, 0, 2035, -571.17, 2204.80, 199.971, 1.58, 86400, 5, 0, 404430, 0, 0, 0),
(null, 37028, 631, 15, 1, 0, 2034, -562.50, 2204.56, 199.971, 1.58, 86400, 5, 0, 404430, 0, 0, 0),
(null, 37030, 631, 15, 1, 0, 2033, -559.85, 2199.98, 199.971, 1.58, 86400, 5, 0, 269600, 91600, 0, 0),
(null, 37146, 631, 15, 1, 0, 2049, -574.03, 2200.09, 199.971, 1.58, 86400, 5, 0, 404430, 41690, 0, 0);

UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14' WHERE `entry` = 37003;
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14' WHERE `entry` = 37017;
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14' WHERE `entry` = 37027;
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14' WHERE `entry` = 37026;
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14' WHERE `entry` = 37021;

UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35' WHERE `entry` = 37032;
UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35' WHERE `entry` = 37028;
UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35' WHERE `entry` = 37029;
UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35' WHERE `entry` = 37146;
UPDATE `creature_template` SET `faction_A` = '35', `faction_H` = '35' WHERE `entry` = 37030;