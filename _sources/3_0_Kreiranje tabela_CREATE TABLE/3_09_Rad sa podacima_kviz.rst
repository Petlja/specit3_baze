Рад са подацима - квиз
======================

.. dragndrop:: 3091
    :match_1: INSERT ||| унос података
    :match_2: UPDATE ||| ажурирање података
    :match_3: DELETE ||| брисање података
    
    Повезати команду и њен опис.

.. mchoice:: 3092
    :answer_a: INSERT INTO knjige VALUES (1,'Deca zla')
    :answer_b: INSERT INTO knjige VALUES (1,'Kuća svile',5,5)
    :answer_c: INSERT INTO knjige VALUES (1,'Tri ratna druga',3)
    :answer_d: INSERT INTO knjige VALUES (1,3,'Tri ratna druga') 
    :correct: c

    Табела KNJIGE има колоне (*id*, *naziv*, *id_izdavaca*). Која команда уноса је исправна?

.. mchoice:: 3093
    :answer_a: INSERT INTO autori VALUES(1)
    :answer_b: INSERT INTO autori VALUES(1,2)
    :answer_c: INSERT INTO autori VALUES(1,'Mijodrag') 
    :answer_d: INSERT INTO autori VALUES(1,'Mijodrag','Đurišić') 
    :correct: d

    Табела AUTORI има колоне (*id*, *ime*, *prezime*). Која команда уноса је исправна? 

.. mchoice:: 3094
    :answer_a: INSERT INTO autori_knjige VALUES (111,234) 
    :answer_b: INSERT INTO autori_knjige VALUES ('Stanka',234)
    :answer_c: INSERT INTO autori_knjige VALUES (111,'Programiranje') 
    :answer_d: INSERT INTO autori_knjige VALUES ('Stanka','Programiranje')
    :correct: a

    Табела AUTORI_KNJIGE представља везу више-према-више и има колоне (*id_autora*,*id_knjige*). Која команда уноса је исправна?  

.. mchoice:: 3095
    :answer_a: UPDATE clanovi SET telefon='011222333' WHERE broj_clanske_karte=11
    :answer_b: UPDATE clanovi SET broj_clanske_karte=33  WHERE telefon='011222333'
    :answer_c: UPDATE clanovi SET telefon='011222333'
    :answer_d: UPDATE clanovi SET telefon='011222333' WHERE broj_clanske_karte=33 
    :correct: d

    Која команда мења број телефона члана са бројем чланске карте 33? 

.. mchoice:: 3096
    :answer_a: UPDATE clanovi SET plata = plata * 1.2 
    :answer_b: UPDATE zaposleni SET plata = plata * 0.8
    :answer_c: UPDATE zaposleni SET plata = plata * 1.2
    :answer_d: UPDATE zaposleni SET plata = plata * 0.2
    :correct: c

    Која команда увећава плате запослених за 20%?

.. mchoice:: 3097
    :answer_a: DELETE FROM zaposleni WHERE id=1
    :answer_b: DELETE FROM zaposleni WHERE id_menadzera=2
    :answer_c: DELETE FROM zaposleni
    :answer_d: DELETE FROM zaposleni WHERE id=2
    :correct: d

    Која команда брише запосленог са идентификационим бројем 2?

.. mchoice:: 3098
    :answer_a: DELETE FROM zaposleni WHERE id=2
    :answer_b: DELETE FROM zaposleni WHERE id_menadzera=2
    :answer_c: DELETE FROM zaposleni WHERE id_menadzera=1111
    :answer_d: DELETE FROM clanovi WHERE id_menadzera=2
    :correct: b

    Која команда брише све запослене чији менаџер има идентификациони број 2?

.. mchoice:: 3099
    :answer_a: Да
    :answer_b: Не
    :correct: a

    Уколико нема WHERE део, команда DELETE брише све редове из табеле?

.. mchoice:: 30910
    :answer_a: Да
    :answer_b: Не
    :correct: b

    Следећа команда ће обрисати више редова:
    ::

        DELETE FROM zaposleni WHERE id=1 (*id* је примарни кључ).
