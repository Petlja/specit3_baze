Упит SELECT - спајање табела - задаци
=====================================

Сви наредни SELECT упити обрађују податке из базе података библиотеке.
Следи списак свих табела са колонама. Примарни кључеви су истакнути болдом,
а страни италиком.

.. image:: ../../_images/slika_401.png
   :width: 780
   :align: center

.. questionnote::

 1. Написати упит којим се, уз инвентарски број, приказује и назив књиге тог примерка. Уредити
 резултат по називу књиге.

.. dbpetlja:: db_4131
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT inventarski_broj, naziv
					FROM primerci JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
					ORDER BY naziv

.. questionnote::

 2. Написати упит којим се, уз инвентарски број, приказује и назив књиге тог примерка и назив
 издавача. Уредити резултат по називу издавача, а у случају да књиге имају истог издавача,
 по називу књиге.

.. dbpetlja:: db_4132
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT inventarski_broj, knjige.naziv, izdavaci.naziv
					FROM primerci JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
					JOIN izdavaci ON (knjige.id_izdavaca=izdavaci.id)
					ORDER BY izdavaci.naziv, knjige.naziv

.. questionnote::

 3. Написати упит којим се приказују називи књига издавача чији је назив CET.

.. dbpetlja:: db_4133
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT knjige.naziv
                   FROM knjige JOIN izdavaci ON (knjige.id_izdavaca=izdavaci.id)
                   WHERE izdavaci.naziv='CET'

.. questionnote::

 4. Написати упит којим се приказују инвентарски бројеви примерака књига издавача чији је назив CET.

.. dbpetlja:: db_4134
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT inventarski_broj, knjige.naziv
                   FROM primerci JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
                   JOIN izdavaci ON (knjige.id_izdavaca=izdavaci.id)
                   WHERE izdavaci.naziv='CET'

.. questionnote::

 5. Написати упит којим се приказују имена и презимена аутора који су писали књиге за издавача
 чији је назив CET, без понављања.

.. dbpetlja:: db_4135
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT DISTINCT ime, prezime
                   FROM knjige JOIN izdavaci ON (knjige.id_izdavaca=izdavaci.id)
                   JOIN autori_knjige ON (autori_knjige.id_knjige=knjige.id_knjige)
                   JOIN autori ON (autori_knjige.id_autora=autori.id_autora)
                   WHERE izdavaci.naziv='CET'

.. questionnote::

 6. Написати упит којим се приказују имејл запосленог у библиотеци и имејл његовог менаџера.

.. dbpetlja:: db_4136
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT z.mejl "Mejl zaposlenog", m.mejl "Mejl menadzera"
                   FROM zaposleni z JOIN zaposleni m ON (z.id_menadzera=m.id)

.. questionnote::

 7. Написати упит којим се приказују подаци о свим позајмицама: име, презиме и телефон члана,
 датум позајмице, датум враћања и инвентарски број узетог примерка. Резултат уредити тако
 да се прво приказују најновије позајмице по датуму узимања.

.. dbpetlja:: db_4137
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT ime, prezime, telefon, datum_uzimanja, datum_vracanja, pozajmice.inventarski_broj
                   FROM primerci JOIN pozajmice 
                   ON (pozajmice.inventarski_broj=primerci.inventarski_broj)
                   JOIN clanovi ON (pozajmice.broj_clanske_karte=clanovi.broj_clanske_karte)
                   ORDER BY datum_uzimanja DESC

.. questionnote::

 8. Написати упит којим се приказују подаци о свим тренутним позајмицама: име, презиме и имејл
 адреса члана, датум позајмице и назив књиге.

.. dbpetlja:: db_4138
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT ime, prezime, mejl_adresa, datum_uzimanja, naziv
                   FROM primerci JOIN pozajmice 
                   ON (pozajmice.inventarski_broj=primerci.inventarski_broj)
                   JOIN clanovi ON (pozajmice.broj_clanske_karte=clanovi.broj_clanske_karte)
                   JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
                   WHERE datum_vracanja IS NULL

.. questionnote::

 9. Написати упит којим се приказују подаци о свим тренутним позајмицама: име, презиме и имејл
 адреса члана, датум позајмице, назив књиге и назив издавача.

.. dbpetlja:: db_4139
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT ime, prezime, mejl_adresa, datum_uzimanja, knjige.naziv, izdavaci.naziv
                   FROM primerci JOIN pozajmice 
                   ON (pozajmice.inventarski_broj=primerci.inventarski_broj)
                   JOIN clanovi ON (pozajmice.broj_clanske_karte=clanovi.broj_clanske_karte)
                   JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
                   JOIN izdavaci ON (knjige.id_izdavaca=izdavaci.id)
                   WHERE datum_vracanja IS NULL

.. questionnote::

 10.Написати упит којим се приказују датуми позајмица књига чији је аутор Марко Видојковић.

.. dbpetlja:: db_41310
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT datum_uzimanja 
                   FROM pozajmice JOIN primerci ON (pozajmice.inventarski_broj=primerci.inventarski_broj)
                   JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
                   JOIN autori_knjige ON (autori_knjige.id_knjige=knjige.id_knjige)
                   JOIN autori ON (autori_knjige.id_autora=autori.id_autora)
                   WHERE ime='Marko' AND prezime='Vidojkovic'

.. questionnote::

 11. Написати упит којим се приказују називи књигa које је из библиотеке узимао члан са бројем
 чланске карте 33, али без понављања. Дакле, уколико је члан током година колико је члан
 библиотеке узимао исту књигу неколико пута, назив те књиге приказати само једном.

.. dbpetlja:: db_41311
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT DISTINCT naziv
                   FROM pozajmice JOIN primerci ON (pozajmice.inventarski_broj=primerci.inventarski_broj)
                   JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
                   WHERE broj_clanske_karte=33

.. questionnote::

 12. Написати упит којим се приказују називи књигa које је из библиотеке узимао члан „Милица
 Зорановић“, али без понављања.

.. dbpetlja:: db_41312
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT DISTINCT naziv
                   FROM pozajmice JOIN primerci ON (pozajmice.inventarski_broj=primerci.inventarski_broj)
                   JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
                   JOIN clanovi ON (pozajmice.broj_clanske_karte=clanovi.broj_clanske_karte)
                   WHERE ime='Milica' AND prezime='Zoranovic'

.. questionnote::

 13. Написати упит којим се приказују имена чланова библиотеке и називи издавача чије су књиге
 читали, без понављања (исти члан је могао да чита више књига истог издавача). Резултат уредити
 по називу издавача. 

.. dbpetlja:: db_41313
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT DISTINCT ime, prezime, izdavaci.naziv
                   FROM pozajmice JOIN primerci ON (pozajmice.inventarski_broj=primerci.inventarski_broj)
                   JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
                   JOIN izdavaci ON (knjige.id_izdavaca=izdavaci.id)
                   JOIN clanovi ON (pozajmice.broj_clanske_karte=clanovi.broj_clanske_karte)
                   ORDER BY izdavaci.naziv

.. questionnote::

 14. Написати упит којим се приказују имејл адресе чланова који су узимали из библиотеке књиге у
 издању издавача са називом СЕТ, без понављања. 

.. dbpetlja:: db_41314
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT DISTINCT mejl_adresa
                   FROM pozajmice JOIN primerci ON (pozajmice.inventarski_broj=primerci.inventarski_broj)
                   JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
                   JOIN izdavaci ON (knjige.id_izdavaca=izdavaci.id)
                   JOIN clanovi ON (pozajmice.broj_clanske_karte=clanovi.broj_clanske_karte)
                   WHERE izdavaci.naziv='CET'

.. questionnote::

 15. Написати упит којим се приказују бројеви телефона чланова којима је издата казна за неку позајмицу. 

.. dbpetlja:: db_41315
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT DISTINCT telefon
                   FROM clanovi JOIN kazne ON (kazne.broj_clanske_karte=clanovi.broj_clanske_karte)
