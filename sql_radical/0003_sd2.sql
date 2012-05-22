UPDATE `script_texts` SET `sound` = '17150' WHERE `entry` = -1610059;
UPDATE `script_texts` SET `sound` = '17151' WHERE `entry` = -1610094;

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1610102 AND -1610101;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1610101, 'Brave champions, we owe you our lives, our freedom... Though it be a tiny gesture in the face of this enormous debt, I pledge that from this day forth, all will know of your deeds, and the blazing path of light you cut through the shadow of this dark citadel.', NULL, NULL, NULL, NULL, NULL, 'Valientes campeones. Os debemos la vida, nuestra libertad... aunque sea un pequeño gesto, ante nuestra gran deuda. Prometo que, de hoy en adelante, todos conocerán vuestras hazañas, y el llameante camino de luz que lográsteis que atravesara esta oscura ciudadela.', NULL, NULL, 17149, 1, 0, 0, 'outro1'),
(-1610102, 'The forgemaster is dead! Get geared up men, we have a Scourgelord to kill.', NULL, NULL, NULL, NULL, NULL, '¡Héroes! ¡Retendremos a los no-muertos cuanto podamos, hasta nuestro aliento final! ¡Ocupaos del Señor de la Plaga!', NULL, NULL, 17148, 1, 0, 0, 'outro2');

