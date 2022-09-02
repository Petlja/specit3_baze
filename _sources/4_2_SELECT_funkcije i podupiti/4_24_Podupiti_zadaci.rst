Упит SELECT - подупити - задаци
===============================

Сви наредни SELECT упити обрађују податке из базе података библиотеке. Следи списак свих табела
са колонама. Примарни кључеви су истакнути болдом, а страни италиком.

.. image:: ../../_images/slika_401.png
   :width: 780
   :align: center

.. questionnote::

    1. Написати упит којим се приказују запослени који зарађују мање од запосленог са
    презименом Јовић.

.. dbpetlja:: db_4241
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT prezime
                   FROM zaposleni
                   WHERE plata < (SELECT plata FROM zaposleni WHERE prezime='Jovic')

.. questionnote::

    2. Написати упит којим се приказују запослени који зарађују више од запосленог са
    презименом Петровић.
    
Имајте на уму да у бази података постоје два запослена са презименом „Петровић“, па
ће подупит вратити две вредности и цео упит мора да се прилагоди томе додавањем речи ALL.

.. reveal:: upit_424a
    :showtitle: Прикажи решење
    :hidetitle: Сакриј решење
    
    ..  code::

        SELECT prezime
        FROM zaposleni
        WHERE plata > ALL(SELECT plata FROM zaposleni WHERE prezime='Petrovic')

    Резултат упита треба да буде као на следећој слици:
    
    .. image:: ../../_images/slika_424a.png
        :scale: 80%
        :align: center

.. comment

    SELECT prezime
    FROM zaposleni
    WHERE plata > ALL(SELECT plata FROM zaposleni WHERE prezime='Petrovic')

    SELECT prezime
    FROM zaposleni
    WHERE plata > (SELECT MAX(z.plata) FROM zaposleni z WHERE prezime='Petrovic')

|

.. questionnote::

    3. Написати упит којим се приказују сви чланови који су платили мањи износ казне од члана са
    бројем чланске карте 22.

.. reveal:: upit_424b
    :showtitle: Прикажи решење
    :hidetitle: Сакриј решење
    
    ..  code::

        SELECT clanovi.broj_clanske_karte, prezime
        FROM clanovi JOIN kazne ON (kazne.broj_clanske_karte=clanovi.broj_clanske_karte)
        WHERE iznos < ALL(SELECT iznos FROM kazne WHERE broj_clanske_karte=22)

    Резултат упита треба да буде као на следећој слици:
    
    .. image:: ../../_images/slika_424b.png
        :scale: 70%
        :align: center

.. comment

    SELECT clanovi.broj_clanske_karte, prezime
    FROM clanovi JOIN kazne ON (kazne.broj_clanske_karte=clanovi.broj_clanske_karte)
    WHERE iznos < ALL(SELECT iznos FROM kazne WHERE broj_clanske_karte=22)

    SELECT clanovi.broj_clanske_karte, prezime
    FROM clanovi JOIN kazne ON 
        (kazne.broj_clanske_karte=clanovi.broj_clanske_karte)
    WHERE kazne.iznos < (SELECT MAX(k.iznos) FROM kazne k WHERE k.broj_clanske_karte=22)

|

.. questionnote::

    4. Написати упит којим се приказују инвентарски бројеви примерака књиге чији је један примерак са
    инвентарским бројем 13003.

.. dbpetlja:: db_4244
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT inventarski_broj
                   FROM primerci
                   WHERE id_knjige = (SELECT id_knjige FROM primerci WHERE inventarski_broj=13003)
                   AND inventarski_broj <> 13003

.. questionnote::

    5. Написати упит којим се приказују инвентарски бројеви примерака и називи књига које је објавио исти
    издавач као и примерак са инвентарским бројем 14001.

.. dbpetlja:: db_4245
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT inventarski_broj, knjige.naziv
                   FROM primerci JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
                   WHERE id_izdavaca = (SELECT id_izdavaca FROM primerci JOIN knjige 
                                        ON (primerci.id_knjige=knjige.id_knjige)
                                        WHERE inventarski_broj=14001)

.. questionnote::

    6. Написати упит којим се приказују имена и презимена аутора који су радили на истим
    књигама као аутор са именом Станка Матковић.

.. reveal:: upit_424c
    :showtitle: Прикажи решење
    :hidetitle: Сакриј решење
    
    ..  code::

        SELECT DISTINCT prezime+' '+ime "Autor"
        FROM autori JOIN autori_knjige ON (autori_knjige.id_autora=autori.id_autora)
        WHERE id_knjige IN (SELECT id_knjige FROM autori JOIN autori_knjige 
            ON (autori_knjige.id_autora=autori.id_autora)
            WHERE ime='Stanka' AND prezime='Matkovic')
        AND NOT(ime='Stanka' AND prezime='Matkovic')

    Резултат упита треба да буде као на следећој слици:
    
    .. image:: ../../_images/slika_424c.png
        :scale: 70%
        :align: center

.. comment

    SELECT DISTINCT prezime+' '+ime "Autor"
    FROM autori JOIN autori_knjige ON (autori_knjige.id_autora=autori.id_autora)
    WHERE id_knjige IN (SELECT id_knjige FROM autori JOIN autori_knjige 
        ON (autori_knjige.id_autora=autori.id_autora)
        WHERE ime='Stanka' AND prezime='Matkovic')
    AND NOT(ime='Stanka' AND prezime='Matkovic')

    SELECT DISTINCT prezime || ' ' || ime "Autor"
    FROM autori JOIN autori_knjige ON (autori_knjige.id_autora=autori.id_autora)
    WHERE id_knjige IN (SELECT id_knjige FROM autori JOIN autori_knjige 
        ON (autori_knjige.id_autora=autori.id_autora)
        WHERE ime='Stanka' AND prezime='Matkovic')
    AND NOT(ime='Stanka' AND prezime='Matkovic')

|

.. questionnote::

    7. Написати упит којим се приказују подаци о запосленом који највише зарађује.

.. dbpetlja:: db_4247
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT * FROM zaposleni
                   WHERE plata = (SELECT MAX(plata) FROM zaposleni)

.. questionnote::

    8. Написати упит којим се приказују подаци о запосленима који зарађују мање од просека.

.. dbpetlja:: db_4248
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT * FROM zaposleni
                   WHERE plata < (SELECT AVG(plata) FROM zaposleni)

.. questionnote::

    9. Написати упит којим се приказује назив књиге која је издата током последње позајмице.

.. dbpetlja:: db_4249
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT naziv 
                   FROM pozajmice JOIN primerci ON (pozajmice.inventarski_broj=primerci.inventarski_broj)
                   JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
                   WHERE datum_uzimanja = (SELECT MAX(datum_uzimanja) FROM pozajmice)
