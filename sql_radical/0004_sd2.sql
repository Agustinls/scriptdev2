-- Textos de algunos NPC's de zona de inicio de los DK's

-- Ebon Hold

DELETE FROM `script_texts` WHERE `entry` = -1609089;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1609089, 'It is not yet your time, champion. Rise! Rise and fight once more!', NULL, NULL, NULL, NULL, NULL, 'Aún no ha llegado tu momento, campeón. ¡Revive! ¡Revive y lucha una vez más!', NULL, NULL, 0, 1, 0, 0, 'valkyr_battle SAY');

DELETE FROM `script_texts` WHERE `entry` = -1609090;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1609090, 'Where\'d this come from? I better get this down to the ships before the foreman sees it!', NULL, NULL, NULL, NULL, NULL, '¿De dónde habrá salido esto? ¡Mejor será que me lo lleve al barco antes de que me pille el patrón!', NULL, NULL, 0, 1, 0, 0, 'scarlet_miner_1');

DELETE FROM `script_texts` WHERE `entry` = -1609091;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1609091, 'Now I can have a rest!', NULL, NULL, NULL, NULL, NULL, '¡Ahora ya puedo descansar!', NULL, NULL, 0, 1, 0, 0, 'scarlet_miner_2');
