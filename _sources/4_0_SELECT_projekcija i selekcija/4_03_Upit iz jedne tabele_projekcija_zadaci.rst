Упит SELECT - упит из једне табеле - пројекција - задаци
========================================================

Сви наредни SELECT упити обрађују податке из базе података библиотеке.
Следи списак свих табела са колонама. Примарни кључеви су истакнути болдом,
а страни италиком.

.. image:: ../../_images/slika_401.png
   :width: 780
   :align: center

.. questionnote::

    1. Написати упит којим се приказују сви подаци о запосленим особама у библиотеци.

.. dbpetlja:: db_4031
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT *
                   FROM zaposleni

.. questionnote::

    2. Написати упит којим се приказују називи и адресе веб-сајтова свих издавача. Уреди приказ
    по називу.

.. dbpetlja:: db_4032
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT *
                   FROM izdavaci
                   ORDER BY naziv

.. questionnote::

    3. Написати упит којим се приказују број чланске карте члана коме је издата казна, датум плаћања
    казне, износ казне и како би изгледао износ казне умањен за 15% за оне који плате казну у
    најкраћем року. 

.. dbpetlja:: db_4034
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT broj_clanske_karte, datum, iznos, iznos*0.85
                   FROM kazne

.. questionnote::

    4. Написати упит којим се приказују број чланске карте, инвентарски број и датум узимања свих
    позајмица сортиран према броју чланске карте. Уколико исти члан има више позајмица, сортирати
    их опадајуће по датуму издавања књиге.

.. dbpetlja:: db_4035
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT broj_clanske_karte, inventarski_broj, datum_uzimanja
                   FROM pozajmice
                   ORDER BY broj_clanske_karte, datum_uzimanja DESC

.. questionnote::

    5. Написати упит којим се приказују имена, презимена и телефони чланова библиотеке. Име и
    презиме приказати спојено са једним размаком између у једној колони. Измени заглавља колона
    у приказу резултата тако да буду редом "Clan biblioteke" и "Telefon clana".
    
.. reveal:: upit_403a
    :showtitle: Прикажи решење
    :hidetitle: Сакриј решење
    
    ..  code::

        SELECT ime+' '+prezime "Clan biblioteke", telefon "Telefon clana" 
        FROM clanovi

    Треба да се добије резултат као на следећој слици:

    .. image:: ../../_images/slika_403a.png
        :scale: 80%
        :align: center

.. comment

    SELECT ime+' '+prezime "Clan biblioteke", telefon "Telefon clana" 
    FROM clanovi

    SELECT ime || ' ' || prezime "Clan biblioteke", telefon "Telefon clana" 
    FROM clanovi
