-- Aqui pongo las cosas que no correspondia a Mangos y daban error al ser introducidas en la BD

UPDATE `boss_spell_table` SET `timerMin_N10` = '70000', `timerMax_N10` = '70000' WHERE `spellID_N10` = 68980;

##TextIDs
INSERT INTO scriptdev2.script_texts (entry, emote, content_default, comment) VALUES
(-1630010, 0, "I said GOOD DAY!", "SAY_SpiritAzu_GoodBye");