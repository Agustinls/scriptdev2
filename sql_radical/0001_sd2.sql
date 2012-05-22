-- ZONA INICIO DK
-- Textos que faltaban en el c�digo

DELETE FROM `script_texts` WHERE `entry` = -1609089;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1609089, 'It is not yet your time, champion. Rise! Rise and fight once more!', NULL, NULL, NULL, NULL, NULL, 'Aún no ha llegado tu momento, campeón. ¡Revive! ¡Revive y lucha una vez más!', 'Aún no ha llegado tu momento, campeón. ¡Revive! ¡Revive y lucha una vez más!', NULL, 0, 1, 0, 0, 'valkyr_battle SAY');

DELETE FROM `script_texts` WHERE `entry` = -1609090;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1609090, 'Where\'d this come from? I better get this down to the ships before the foreman sees it!', NULL, NULL, NULL, NULL, NULL, '¿De dónde habrá salido esto? ¡Mejor será que me lo lleve al barco antes de que me pille el patrón!', '¿De dónde habrá salido esto? ¡Mejor será que me lo lleve al barco antes de que me pille el patrón!', NULL, 0, 1, 0, 0, 'scarlet_miner_1');

DELETE FROM `script_texts` WHERE `entry` = -1609091;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1609091, 'Now I can have a rest!', NULL, NULL, NULL, NULL, NULL, '¡Ahora ya puedo descansar!', '¡Ahora ya puedo descansar!', NULL, 0, 1, 0, 0, 'scarlet_miner_2');

-- CIUDADELA DE CORONA DE HIELO
-- Precioso (Perro de Carap�trea)

DELETE FROM `script_texts` WHERE `entry` = -1631193;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1631193, '%s summon zombies!', NULL, NULL, NULL, NULL, NULL, '¡%s comienza a invocar zombies!', '¡%s comienza a invocar zombies!', NULL, 0, 3, 0, 0, 'precious_zombies');

-- Alerta de banda del Profanar del Rey Lich

DELETE FROM `script_texts` WHERE `entry` = -1631596;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1631596, 'The Lich King cast Defile!', NULL, NULL, NULL, NULL, NULL, '¡El Rey Exánime lanza Profanar!', '¡El Rey Exánime lanza Profanar!', NULL, 0, 3, 0, 0, 'the_lich_king_DEFILE');

-- PRUEBA DEL CRUZADO
-- Jaraxxus Slay Script Texts

DELETE FROM `script_texts` WHERE `entry` = -1713567;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713567, 'Stupid worm!', NULL, NULL, NULL, NULL, NULL, '¡Gusano despreciable!', '¡Gusano despreciable!', NULL, 16145, 6, 0, 0, 'jaraxxus_slay1');

DELETE FROM `script_texts` WHERE `entry` = -1713568;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713568, 'Desterrated to void!', NULL, NULL, NULL, NULL, NULL, '¡Desterrado al vacío!', '¡Desterrado al vacío!', NULL, 16146, 6, 0, 0, 'jaraxxus_slay2');

-- Intro Horda / Alianza

DELETE FROM `script_texts` WHERE `entry` = -1713569;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713569, 'Welcome, Warchief Thrall. Overlord Hellscream.', NULL, NULL, NULL, NULL, NULL, '¡Bienvenidos, Jefe de Guerra Thrall! ¡Senor Supremo Grito Infernal!', '¡Bienvenidos, Jefe de Guerra Thrall! ¡Señor Supremo Grito Infernal!', NULL, 16056, 6, 0, 0, 'tirion_Harrival1');
	
DELETE FROM `script_texts` WHERE `entry` = -1713570;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713570, 'Garrosh, I expect you to control yourself here. I do not want a repeat of the Violet Citadel.', NULL, NULL, NULL, NULL, NULL, 'Garrosh, espero que te controles aquí. No quiero que se repita lo de la Ciudadela Violeta.', 'Garrosh, espero que te controles aquí. No quiero que se repita lo de la Ciudadela Violeta.', NULL, 16181, 6, 0, 0, 'thrall_arrival1');
	
DELETE FROM `script_texts` WHERE `entry` = -1713571;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713571, 'Pah! That was a show of strength, worthy of a leader. I only regret I did not kill that human before the mage interfered.', NULL, NULL, NULL, NULL, NULL, '¡Bah! Eso fue una demostración de fuerza digna de un líder. Sólo lamento no haber matado a ese humano, antes de que el mago interfiriera.', '¡Bah! Eso fue una demostración de fuerza digna de un líder. Sólo lamento no haber matado a ese humano, antes de que el mago interfiriera.', NULL, 16027, 6, 0, 0, 'garrosh_arrival1');
	
DELETE FROM `script_texts` WHERE `entry` = -1713572;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES
(-1713572, 'We are guests here, Garrosh, and you will conduct yourself honorably.', NULL, NULL, NULL, NULL, NULL, 'Aquí somos invitados Garrosh, y te comportarás de modo honorable.', 'Aquí somos invitados Garrosh, y te comportarás de modo honorable.', NULL, 16182, 6, 0, 0, 'thrall_arrival2');
	
DELETE FROM `script_texts` WHERE `entry` = -1713573;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713573, 'What honor is there in thrashing about with blunted sticks? This is a waste of time.', NULL, NULL, NULL, NULL, NULL, '¿Qué honor hay en dar golpes con palo sin filo? ¡Esto es una pérdida de tiempo!', '¿Qué honor hay en dar golpes con palo sin filo? ¡Esto es una pérdida de tiempo!', NULL, 16028, 6, 0, 0, 'garrosh_arrival2');
	
DELETE FROM `script_texts` WHERE `entry` = -1713574;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713574, 'Thank you for the invitation, Lord Fordring. We look forward to observing these games.', NULL, NULL, NULL, NULL, NULL, 'Gracias por la invitación, Lord Vadín. Tenemos ganas de ver esos juegos.', 'Gracias por la invitación, Lord Vadín. Tenemos ganas de ver esos juegos.', NULL, 16183, 6, 0, 0, 'thrall_arrival3');
	
DELETE FROM `script_texts` WHERE `entry` = -1713575;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713575, 'Speak for yourself, Thrall.', NULL, NULL, NULL, NULL, NULL, 'Habla por ti, Thrall.', 'Habla por ti, Thrall.', NULL, 16029, 6, 0, 0, 'garrosh_arrival3');
	
DELETE FROM `script_texts` WHERE `entry` = -1713576;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713576, 'I hope you\'ll see the merits of these events in time, Garrosh. We cannot win against the Scourge if we continue to war against one another.', NULL, NULL, NULL, NULL, NULL, 'Espero que con el tiempo reconozcas el mérito de estos eventos, Garrosh. No podremos vencer a la Plaga si continuamos luchando entre nosotros.', 'Espero que con el tiempo reconozcas el mérito de estos eventos, Garrosh. No podremos vencer a la Plaga si continuamos luchando entre nosotros.', NULL, 16057, 6, 0, 0, 'tirion_Harrival2');
	
DELETE FROM `script_texts` WHERE `entry` = -1713577;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713577, 'Wise words.', NULL, NULL, NULL, NULL, NULL, 'Sabias palabras...', 'Sabias palabras...', NULL, 16184, 6, 0, 0, 'thrall_arrival4');
	
DELETE FROM `script_texts` WHERE `entry` = -1713578;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713578, 'Words of a fool, you mean. The Horde will destroy the undead without your aid, human, or that of the pompous king.', NULL, NULL, NULL, NULL, NULL, '¡Tonterías! ¡La Horda destruirá a los no-muertos sin tu ayuda, humano! Ni la de ese rey pretencioso...', '¡Tonterías! ¡La Horda destruirá a los no-muertos sin tu ayuda, humano! Ni la de ese rey pretencioso...', NULL, 16030, 6, 0, 0, 'garrosh_arrival4');

DELETE FROM `script_texts` WHERE `entry` = -1713579;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713579, 'Garrosh, enough!', NULL, NULL, NULL, NULL, NULL, '¡Garrosh, BASTA!', '¡Garrosh, BASTA!', NULL, 16185, 6, 0, 0, 'thrall_arrival5');

DELETE FROM `script_texts` WHERE `entry` = -1713580;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713580, 'Under my roof, gentlemen, I trust you will behave.', NULL, NULL, NULL, NULL, NULL, 'Caballeros, confío en que os comportaréis bajo mi techo.', 'Caballeros, confío en que os comportaréis bajo mi techo.', NULL, 16058, 6, 0, 0, 'tirion_Harrival3');

DELETE FROM `script_texts` WHERE `entry` = -1713581;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713581, 'Of course, Tirion. I apologize for his outburst. It will not be repeated.', NULL, NULL, NULL, NULL, NULL, 'Por supuesto, Tirion. Disculpa este arrebato. No volverá... a repetirse.', 'Por supuesto, Tirion. Disculpa este arrebato. No volverá... a repetirse.', NULL, 16186, 6, 0, 0, 'thrall_arrival6');

DELETE FROM `script_texts` WHERE `entry` = -1713582;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713582, 'King Varian, Lady Jaina. Welcome to the tournament. Your place in the coliseum is waiting.', NULL, NULL, NULL, NULL, NULL, 'Rey Varian, Lady Jaina, ¡Bienvenidos al torneo! Os aguarda vuestro lugar en el coliseo.', 'Rey Varian, Lady Jaina, ¡Bienvenidos al torneo! Os aguarda vuestro lugar en el coliseo.', NULL, 16054, 6, 0, 0, 'tirion_Aarrival1');

DELETE FROM `script_texts` WHERE `entry` = -1713583;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713583, 'Thank you. It\'s the least I can do to support this; we need to stand together.', NULL, NULL, NULL, NULL, NULL, 'Gracias. Es lo mínimo que puedo hacer para apoyar esto. Tenemos que mantenernos unidos.', 'Gracias. Es lo mínimo que puedo hacer para apoyar esto. Tenemos que mantenernos unidos.', NULL, 16120, 6, 0, 0, 'jaina_arrival1');

DELETE FROM `script_texts` WHERE `entry` = -1713584;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713584, 'My people are here to ensure that they honor the rules of engagement. It will do your subjects well to see you in the stands.', NULL, NULL, NULL, NULL, NULL, 'Mi gente está aquí para asegurarse de que sigan las reglas. A tus súbditos les vendrá bien verte en las gradas.', 'Mi gente está aquí para asegurarse de que sigan las reglas. A tus súbditos les vendrá bien verte en las gradas.', NULL, 16055, 6, 0, 0, 'tirion_Aarrival2');

DELETE FROM `script_texts` WHERE `entry` = -1713585;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713585, 'You ask much of me, Tirion, to sit and watch, trusting the savages to keep themselves in check.', NULL, NULL, NULL, NULL, NULL, '¡Me pides demasiado, Tirion! ¡Que me siente a mirar, y que espere que los salvajes se controlen!', '¡Me pides demasiado, Tirion! ¡Que me siente a mirar, y que espere que los salvajes se controlen!', NULL, 16071, 6, 0, 0, 'varian_arrival1');

DELETE FROM `script_texts` WHERE `entry` = -1713586;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713586, 'I\'m sure Thrall will have his people under control...', NULL, NULL, NULL, NULL, NULL, 'Estoy segura de que Thrall mantendrá a su gente controlada.', 'Estoy segura de que Thrall mantendrá a su gente controlada.', NULL, 16121, 6, 0, 0, 'jaina_arrival2');

DELETE FROM `script_texts` WHERE `entry` = -1713587;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713587, 'Perhaps. I doubt the effectiveness of this gambit. We would be better served preparing our armies for the final assault, but if my presence is required in these games to gain your support in the battle, then I will remain. For now.', NULL, NULL, NULL, NULL, NULL, 'Quizá. Dudo que esta táctica sea efectiva. Sería mejor preparar a nuestros ejércitos para el asalto final, pero si mi presencia es necesaria en estos juegos para obtener tu apoyo en la batalla, me quedaré... de momento...', 'Quizá. Dudo que esta táctica sea efectiva. Sería mejor preparar a nuestros ejércitos para el asalto final, pero si mi presencia es necesaria en estos juegos para obtener tu apoyo en la batalla, me quedaré... de momento...', NULL, 16072, 6, 0, 0, 'varian_arrival2');

DELETE FROM `script_texts` WHERE `entry` = -1713588;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713588, 'Debil!', NULL, NULL, NULL, NULL, NULL, '¡Debilucho!', '¡Debilucho!', NULL, 16017, 6, 0, 0, 'garrosh_killA1');

DELETE FROM `script_texts` WHERE `entry` = -1713589;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713589, 'Slayed!', NULL, NULL, NULL, NULL, NULL, '¡Derrotado!', '¡Derrotado!', NULL, 16018, 6, 0, 0, 'garrosh_killA2');

DELETE FROM `script_texts` WHERE `entry` = -1713590;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713590, 'Pathetic!', NULL, NULL, NULL, NULL, NULL, '¡Patético!', '¡Patético!', NULL, 16019, 6, 0, 0, 'garrosh_killA3');

DELETE FROM `script_texts` WHERE `entry` = -1713591;
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES (-1713591, 'LOK\'THAR!', NULL, NULL, NULL, NULL, NULL, '¡LOK\'THAR!', '¡LOK\'THAR!', NULL, 16020, 6, 0, 0, 'garrosh_killA4');
