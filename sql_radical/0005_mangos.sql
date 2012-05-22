-- Sagrario Ruby Hero (carlos93)

UPDATE `creature_template` SET `ScriptName` = 'mob_living_ember' WHERE `entry` IN ('40683');
UPDATE `creature_template` SET `ScriptName` = 'mob_living_inferno' WHERE `entry` IN ('40681');

SET NAMES UTF8;

-- Oculus Drakos Event

UPDATE `creature_template` SET `modelid_1` = '11686', `modelid_2` = '0', `modelid_3` = '0', `unit_flags` = '33554818', `ScriptName` = 'drakos_event' WHERE `entry` = 11364;

UPDATE `gossip_menu_option` SET `action_menu_id` = '15589' WHERE `menu_id` = 27658 AND `id` = 0;
UPDATE `gossip_menu_option` SET `action_menu_id` = '15590' WHERE `menu_id` = 27657 AND `id` = 0;
UPDATE `gossip_menu_option` SET `action_menu_id` = '15591' WHERE `menu_id` = 27659 AND `id` = 0;

UPDATE `gossip_menu` SET `text_id` = '13267' WHERE `entry` = 27658;
UPDATE `gossip_menu` SET `text_id` = '13268' WHERE `entry` = 27657;
UPDATE `gossip_menu` SET `text_id` = '12917' WHERE `entry` = 27659;

DELETE FROM `gossip_menu` WHERE `entry` BETWEEN 15589 AND 15591;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (15589, 13254);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (15590, 13258);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (15591, 13256);

UPDATE `locales_npc_text` SET `Text0_0_loc6` = 'Belgaristrasz dice la verdad; ¡el tiempo se agota!$B$BPuedo otorgarte el poder de invocar un draco del Vuelo Bronce. Habla con Belgaristrasz o Verdisa si prefieres aprovechar el poder del Rojo o el Verde.' WHERE `entry` = 12917;
UPDATE `locales_npc_text` SET `Text0_0_loc6` = 'Belgaristrasz dice la verdad; es cierto que la situación es grave.$B$BPuedo otorgarte el poder de invocar un draco del Vuelo Verde. Habla con Belgaristrasz o Eternos si prefieres aprovechar el poder del Rojo o el Bronce.' WHERE `entry` = 13268;

UPDATE `locales_npc_text` SET `Text0_0_loc6` = 'Los dracos rubí destacan en aguantar daño y proteger a sus aliados.$B$BAl utilizar Cólera abrasadora pueden lanzar fuego líquido que salta de objetivo en objetivo, haciendo cada vez más daño.$B$BCada vez que un draco rubí es alcanzado por un ataque enemigo, gana una Carga evasiva. Estas cargas sirven para realizar una serie de maniobras evasivas, que permiten al draco esquivar los ataques y hechizos durante un tiempo.' WHERE `entry` = 13254;
UPDATE `locales_npc_text` SET `Text0_1_loc6` = 'Los dracos esmeralda destacan en curarse a sí mismos mientras envenenan a sus enemigos.$B$BAl usar el Veneno parasitante, pueden robarle salud a sus enemigos. Varias aplicaciones de este veneno pueden aumentar el efecto.$B$BCon Tocar la pesadilla, los dracos esmeralda pueden alcanzar el sueño, tocando una parte de su energía vital en un ataque muy dañino que deja debilitado al objetivo, reduciendo su daño durante poco tiempo.' WHERE `entry` = 13258;
UPDATE `locales_npc_text` SET `Text0_0_loc6` = 'Los dracos ámbar destacan en causar daño gracias a que pueden manipular el tiempo a su favor.$B$BAl utilizar la Lanza de choque pueden interrumpir el flujo de tiempo alrededor de un enemigo, haciéndole daño instantáneamente. El poder de este efecto aumenta enormemente dependiendo de las Cargas de choque en el objetivo.$B$BCuando se ve amenazado, un draco de ámbar puede detener brevemente el flujo del tiempo de sus enemigos. Esta interrupción del tiempo almacena una gran cantidad de Energía de choque en los objetivos afectados en la forma de Cargas de choque.' WHERE `entry` = 13256;

UPDATE `locales_npc_text` SET `Text0_0_loc7` = `Text0_0_loc6`, `Text0_1_loc7` = `Text0_1_loc6`;

-- Forge of Souls Final Event

UPDATE `creature_template` SET `ScriptName` = 'npc_sylvanas_jaina_fos_end' WHERE `entry` in ( 38160, 38161);

-- Ahn'kahet Jedoga & Nadox

UPDATE `creature_template` SET `AIName`='',`ScriptName`='mob_nadox_guardian' WHERE (`entry`='30176') ;
UPDATE `achievement_criteria_requirement` SET `type`='18' WHERE (`criteria_id`='7317') AND (`type`='11') ;

UPDATE `creature_template` SET `ScriptName`="mob_jedoga_volunteer" WHERE `entry`=30385;
UPDATE `achievement_criteria_requirement` SET `type`='18' WHERE (`criteria_id`='7359') AND (`type`='11') ;

-- El Oculus, arregladas las puertas del evento de Drakos

DELETE FROM `gameobject_template` WHERE `entry` = 193992;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`)
VALUES (193992, 0, 8524, 'Dragon Cage Door', '', '', '', 14, 32, 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `gameobject_template` WHERE `entry` = 193993;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`)
VALUES (193993, 0, 8524, 'Dragon Cage Door', '', '', '', 14, 32, 1.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

UPDATE `gameobject` SET `id` = '193992' WHERE `guid` = 49707;
UPDATE `gameobject` SET `id` = '193993' WHERE `guid` = 49705;