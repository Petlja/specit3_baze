Упит SELECT - упит из једне табеле - пројекција - задаци
========================================================

Сви наредни SELECT упити обрађују податке из базе података библиотеке.
Следи списак свих табела са колонама. Примарни кључеви су истакнути болдом,
а страни италиком.

.. image:: ../../_images/slika_401.png
   :width: 780
   :align: center

.. questionnote::

 Написати упит којим се приказују сви подаци о запосленим особама у библиотеци.

.. dbpetlja:: db_4031
   :dbfile: it3_biblioteka.sql
   :solutionquery: SELECT *
                   FROM zaposleni

.. questionnote::

 Написати упит којим се приказују називи и адресе веб-сајтова свих издавача. Уреди приказ
 по називу.

.. dbpetlja:: db_4032
   :dbfile: it3_biblioteka.sql
   :solutionquery: SELECT *
                   FROM izdavaci
                   ORDER BY naziv

.. questionnote::

 Написати упит којим се приказују имена, презимена и телефони чланова библиотеке. Име и
 презиме приказати спојено са једним размаком између у једној колони. Измени заглавља колона
 у приказу резултата тако да буду редом ”Clan biblioteke“ и ”Telefon clana“.

.. dbpetlja:: db_4033
   :dbfile: it3_biblioteka.sql
   :solutionquery: SELECT ime+' '+prezime "Clan biblioteke", telefon "Telefon clana"
                   FROM clanovi

.. questionnote::

 Написати упит којим се приказују број чланске карте члана коме је издата казна, датум плаћања
 казне, износ казне и како би изгледао износ казне умањен за 15% за оне који плате казну у
 најкраћем року. 

.. dbpetlja:: db_4034
   :dbfile: it3_biblioteka.sql
   :solutionquery: SELECT broj_clanske_karte, datum, iznos, iznos*0.85
                   FROM kazne

.. questionnote::

 Написати упит којим се приказују број чланске карте, инвентарски број и датум узимања свих
 позајмица сортиран према броју чланске карте. Уколико исти члан има више позајмица, сортирати
 их опадајуће по датуму издавања књиге.

.. dbpetlja:: db_4035
   :dbfile: it3_biblioteka.sql
   :solutionquery: SELECT broj_clanske_karte, inventarski_broj, datum_uzimanja
                   FROM pozajmice
                   ORDER BY broj_clanske_karte, datum_uzimanja DESC

