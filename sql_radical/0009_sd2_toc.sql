UPDATE `script_texts` SET `type` = '6' WHERE `entry` = -1713555;
UPDATE `script_texts` SET `type` = '6' WHERE `entry` = -1713545;

UPDATE `script_texts` SET `content_loc6` = '�Jaraxxus lanza |cFF00FFFFIncinerar carne|R a $N! �Curadle!' WHERE `entry` = -1713522;
UPDATE `script_texts` SET `content_loc6` = '�%s fija su mirada en $N y emite un aullido colosal!' WHERE `entry` = -1713506;

UPDATE `script_texts` SET `content_loc6`='Campeones, lo consegu�steis. No s�lo hab�is completado todos los retos de la Prueba del Cruzado, sino que adem�s le hab�is plantado cara a Arthas. Vuestra habilidad y esp�ritu ser� vuestro mejor arma para combatir a la Plaga. �Bien hecho! Perm�teme que uno de mis magos os teletransporte de vuelta a Dalaran.' WHERE `entry`=-1713565;
UPDATE `script_texts` SET `content_loc6`='Dejadme que os ofrezca uno de mis cofres como recompensa. Contienen valiosas piezas de armamento que os servir�n para combatir a Arthas y facilitaros el acceso a lo m�s profundo del coraz�n de la Ciudadela de Corona de Hielo.' WHERE `entry`=-1713566;

DELETE FROM `script_texts` WHERE `entry` = -1713750;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713750, 'Muajajajajajajaja!', NULL, NULL, NULL, NULL, NULL, '�Muajajajajajajaja!', '�Muajajajajajajaja!', NULL, 16148, 6, 0, 0, 'jaraxxus SAY_ENRAGE');
