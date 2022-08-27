Задаци - пројекција и селекција
===============================

Сви задаци који следе могу да се провежбају и у систему *SQL Server Management Studio*.

Упити се пишу и покрећу када се кликне *New Query* након што се покрене систем *SQL Server* и кликне на креирану базу 
*Pesme* у прозору *Object Explorer*. Фајл са упитима *SQLQuery1.sql* може, али и не мора да се сачува.

Након што се унесе једна команда, кликне се на дугме *Execute*. Уколико се у простору за писање команди налази више 
њих, потребно је обележити ону коју желимо да покренемо. Ако има више база података, обавезно проверити да ли је 
поред овог дугмета назив базе у којој желите да вршите упите. 

.. image:: ../../_images/slika_433a.png
   :width: 400
   :align: center

Сви SELECT упити који следе обрађују податке из базе података фиктивне компаније за продају музичких композиција 
(углавном песама). Следи списак свих табела са колонама. Примарни кључеви су истакнути болд, а страни италик. 

.. image:: ../../_images/slika_433b.png
   :width: 780
   :align: center
   
.. questionnote::

 1. Прикажи све називе извођача.
 
.. reveal:: db_4331
	:showtitle: Прикажи решење
	:hidetitle: Сакриј
		
	.. code-block:: sql

		SELECT naziv
		FROM izvodjac;
	
	.. image:: ../../_images/slika_433p1.png
		:width: 450
		:align: center
	
.. questionnote::

 2. Прикажи све називе песама са албума чији је идентификатор 1.
 
.. reveal:: db_4332
	:showtitle: Прикажи решење
	:hidetitle: Сакриј
		
	.. code-block:: sql

		SELECT naziv
		FROM kompozicija
		WHERE id_album = 1;
	
	.. image:: ../../_images/slika_433p2.png
		:width: 450
		:align: center
	
.. questionnote::

 3. Прикажи сва имена и презимена запослених који су из Канаде.
 
.. reveal:: db_4333
	:showtitle: Прикажи решење
	:hidetitle: Сакриј
	
	
	.. code-block:: sql

		SELECT ime, prezime
		FROM zaposleni
		WHERE drzava = 'Canada'; 
	
	.. image:: ../../_images/slika_433p3.png
		:width: 450
		:align: center 

.. questionnote::

 4. Прикажи називе свих албума извођача чији је идентификатор 1. 
 
.. dbpetlja:: db_4334
   :dbfile: music.sql
   :showresult:
   :solutionquery: SELECT naziv
                   FROM album
                   WHERE id_izvodjac = 1
				    
 
.. questionnote:: 

 5. Прикажи идентификаторе, имена и презимена купаца који се зову „Jack“.

.. dbpetlja:: db_4335
   :dbfile: music.sql
   :showresult:
   :solutionquery:  SELECT id_kupac, ime, prezime
                    FROM kupac
                    WHERE ime = 'Jack'

.. questionnote::

 6. Приказати податке о песмама које заузимају више од 10 милиона бајтова.
  
.. reveal:: db_4336
	:showtitle: Прикажи решење
	:hidetitle: Сакриј
		
	.. code-block:: sql

		SELECT *
		FROM kompozicija
		WHERE velicina >= 10000000;
	
	.. image:: ../../_images/slika_433p6.png
		:width: 450
		:align: center


.. questionnote::

 7. Приказати називе песама које су краће од три минута, тј. 180.000 милисекунди.
 
.. reveal:: db_4337
	:showtitle: Прикажи решење
	:hidetitle: Сакриј
		
	.. code-block:: sql

		SELECT naziv
		FROM kompozicija
		WHERE trajanje < 180000;
	
	.. image:: ../../_images/slika_433p7.png
		:width: 450
		:align: center

.. questionnote::

 8. Приказати називе песама које трају између три и четири минута (тј. између 180.000 и 240.000 милисекунди, укључујући и те границе).
 
.. reveal:: db_4338
	:showtitle: Прикажи решење
	:hidetitle: Сакриј
		
	.. code-block:: sql

		SELECT naziv
		FROM kompozicija
		WHERE trajanje BETWEEN 180000 AND 240000;
	
	.. image:: ../../_images/slika_433p8.png
		:width: 450
		:align: center

.. questionnote::

 9. Приказати све називе песама које почињу речју „Love“.
 
.. reveal:: db_4339
	:showtitle: Прикажи решење
	:hidetitle: Сакриј
		
	.. code-block:: sql

		SELECT *
		FROM kompozicija
		WHERE naziv LIKE 'Love%';
	
	.. image:: ../../_images/slika_433p9.png
		:width: 450
		:align: center 

.. questionnote::

 10. Приказати све жанрове чија имена садрже реч „Rock“.
 
.. reveal:: db_43310
	:showtitle: Прикажи решење
	:hidetitle: Сакриј
		
	.. code-block:: sql

		SELECT *
		FROM zanr
		WHERE naziv LIKE '%Rock%';
	
	.. image:: ../../_images/slika_433p10.png
		:width: 450
		:align: center 

.. questionnote::

 11. Приказати све извођаче чија имена садрже реч „Orchestra“ или „Symphony“.
 
.. reveal:: db_43311
	:showtitle: Прикажи решење
	:hidetitle: Сакриј
		
	.. code-block:: sql

		SELECT *
		FROM izvodjac
		WHERE naziv LIKE '%Orchestra%' OR naziv LIKE '%Symphony%';
	
	.. image:: ../../_images/slika_433p11.png
		:width: 450
		:align: center 

.. questionnote::

 12. Приказати све податке о композицијама које су краће од 10 минута (600.000 милисекунди), а које коштају долар или више.

.. reveal:: db_43312
	:showtitle: Прикажи решење
	:hidetitle: Сакриј
		
	.. code-block:: sql

		SELECT *
		FROM kompozicija
		WHERE cena >= 1.00 AND trajanje < 600000;
	
	.. image:: ../../_images/slika_433p12.png
		:width: 450
		:align: center 

.. questionnote::
 
 13. Приказати називе свих композиција које се завршавају са „you“.
 
.. dbpetlja:: db_43313
   :dbfile: music.sql
   :showresult:
   :solutionquery: SELECT naziv
                   FROM kompozicija
                   WHERE naziv LIKE '% you'

.. questionnote::

 14. Приказати имена и презимена и земљу свих купаца који се зову „Luis“, а нису из Бразила.

.. dbpetlja:: db_43314
   :dbfile: music.sql
   :showresult:
   :solutionquery: SELECT ime, prezime, drzava
                   FROM kupac
                   WHERE ime = 'Luis' AND drzava != 'Brasil'

.. questionnote::

 15. Приказати имена, презимена и датуме рођења свих запослених који су рођени током седамдесетих година 20. века.

.. dbpetlja:: db_43315
   :dbfile: music.sql
   :showresult:
   :solutionquery: SELECT ime, prezime, datum_rodjenja
                   FROM zaposleni
                   WHERE datum_rodjenja BETWEEN '1970-01-01' AND '1979-12-31'

.. questionnote::

 16. Приказати све различите албуме, тј. њихове идентификаторе на којима се јављају композиције дуже од 10 минута.

.. reveal:: db_43316
	:showtitle: Прикажи решење
	:hidetitle: Сакриј
		
	.. code-block:: sql

		SELECT DISTINCT id_album
		FROM kompozicija
		WHERE trajanje >= 10 * 60 * 1000;
	
	.. image:: ../../_images/slika_433p16.png
		:width: 450
		:align: center 

.. questionnote::

 17. Приказати списак назива свих албума сортирано по називима албума у абецедном реду.

.. dbpetlja:: db_43317
   :dbfile: music.sql
   :showresult:
   :solutionquery: SELECT naziv
                   FROM album
                   ORDER BY naziv

.. questionnote::

 18. Приказати податке о свим купцима из САД сортирано по називу града из којег долазе.

.. dbpetlja:: db_43318
   :dbfile: music.sql
   :showresult:
   :solutionquery: SELECT *
                   FROM kupac
                   WHERE drzava = 'USA'
                   ORDER BY grad
				   
.. questionnote::

 19. Исписати називе различитих држава из којих долазе купци.

.. dbpetlja:: 43319
   :dbfile: music.sql
   :showresult:
   :solutionquery: SELECT DISTINCT drzava
                   FROM kupac

