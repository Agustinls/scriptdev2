-- Yells de Krystallus (C�maras de piedra)

DELETE FROM `script_texts` WHERE `entry` = -1599065;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1599065, 'Break.... you....', NULL, NULL, NULL, NULL, NULL, 'Aplastar...', 'Aplastar...', NULL, 14176, 1, 0, 0, 'krystallus SAY_AGGRO');

DELETE FROM `script_texts` WHERE `entry` = -1599066;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1599066, 'Ha.... ha... hah....', NULL, NULL, NULL, NULL, NULL, 'JA... JA... JA...', 'JA... JA... JA...', NULL, 14177, 1, 0, 0, 'krystallus SAY_SLAY');

DELETE FROM `script_texts` WHERE `entry` = -1599067;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1599067, 'Crush....', NULL, NULL, NULL, NULL, NULL, 'Romperos...', 'Romperos...', NULL, 14178, 1, 0, 0, 'krystallus SAY_SHATTER');

DELETE FROM `script_texts` WHERE `entry` = -1599068;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1599068, 'Uuuuhhhhhhhhhh......', NULL, NULL, NULL, NULL, NULL, 'Uuuuhhhhhhhhhh......', 'Uuuuhhhhhhhhhh......', NULL, 14179, 1, 0, 0, 'krystallus SAY_DIES');
	
-- Yells de Brann (Sjonnir)

DELETE FROM `script_texts` WHERE `entry` = -1599069;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1599069, 'Don\'t worry! Ol\' Brann\'s got yer back! Keep that metal monstrosity busy, and I\'ll see if I can\'t sweet talk this machine into helping ye!', NULL, NULL, NULL, NULL, NULL, '¡Tranquilos! ¡El viejo Brann os cubre las espaldas! Distraed a ese monstruo de metal y yo veré si puedo convencer a esta máquina de que os ayude.', '¡Tranquilos! ¡El viejo Brann os cubre las espaldas! Distraed a ese monstruo de metal y yo veré si puedo convencer a esta máquina de que os ayude.', NULL, 14274, 1, 0, 0, 'brann IRON_SPAWN');

DELETE FROM `script_texts` WHERE `entry` = -1599070;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1599070, 'This is a wee bit trickier than before... Oh, bloody--incomin\'!', NULL, NULL, NULL, NULL, NULL, 'Esto es un poquito más difícil que antes... Oh, maldita... ¡vienen!', 'Esto es un poquito más difícil que antes... Oh, maldita... ¡vienen!', NULL, 14275, 1, 0, 0, 'brann TROGG_SPAWN');
	
DELETE FROM `script_texts` WHERE `entry` = -1599071;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1599071, 'What in the name o\' Madoran did THAT do? Oh! Wait: I just about got it...', NULL, NULL, NULL, NULL, NULL, 'En el nombre de Madoran, ¿qué ha hecho eso? ¡Oh! Esperad, creo que lo tengo...', 'En el nombre de Madoran, ¿qué ha hecho eso? ¡Oh! Esperad, creo que lo tengo...', NULL, 14276, 1, 0, 0, 'brann OOZE_SPAWN');
	
-- Sonidos de Salramm (Matanza de Stratholme)

UPDATE `script_texts` SET `sound` = '13471' WHERE `entry` = -1594129;	
UPDATE `script_texts` SET `sound` = '13483' WHERE `entry` = -1594130;	
UPDATE `script_texts` SET `sound` = '13472' WHERE `entry` = -1594131;	
UPDATE `script_texts` SET `sound` = '13473' WHERE `entry` = -1594132;	
UPDATE `script_texts` SET `sound` = '13474' WHERE `entry` = -1594133;	
UPDATE `script_texts` SET `sound` = '13475' WHERE `entry` = -1594134;	
UPDATE `script_texts` SET `sound` = '13480' WHERE `entry` = -1594135;	
UPDATE `script_texts` SET `sound` = '13481' WHERE `entry` = -1594136;	
UPDATE `script_texts` SET `sound` = '13482' WHERE `entry` = -1594137;	
UPDATE `script_texts` SET `sound` = '13476' WHERE `entry` = -1594138;	
UPDATE `script_texts` SET `sound` = '13477' WHERE `entry` = -1594139;	
UPDATE `script_texts` SET `sound` = '13478' WHERE `entry` = -1594140;	
UPDATE `script_texts` SET `sound` = '13479' WHERE `entry` = -1594141;	

