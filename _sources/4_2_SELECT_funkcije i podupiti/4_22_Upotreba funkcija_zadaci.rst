Упит SELECT - употреба функција - задаци
========================================

Сви наредни SELECT упити обрађују податке из базе података библиотеке. Следи списак свих
табела са колонама. Примарни кључеви су истакнути болдом, а страни италиком.

.. image:: ../../_images/slika_401.png
   :width: 780
   :align: center

.. questionnote::

 1. Написати упит којим се приказујe извештај о запосленима у једној колони са новим заглављем
 „Izvestaj“ у виду реченице која садржи, име, презиме и датум запослења, као у примеру
 који следи:

 ``Aleksandar Jovic je poceo da radi 2014-05-25``

.. dbpetlja:: db_4221
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT ime+' '+prezime+' je poceo da radi '+CONVERT(varchar,datum_zaposlenja) "Izvestaj"
					FROM zaposleni

.. questionnote::

 2. Написати упит којим се приказују нове имејл адресе свих запослених. Имејл адреса се формира
 од прва два слова имена, прва три слова презимена и наставка @biblioteka22.rs за све чланове.
 Цела имејл адреса је исписана малим словима. 

.. dbpetlja:: db_4222
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT LOWER(SUBSTRING(ime, 1, 2)+SUBSTRING(prezime, 1, 3))+'@biblioteka22.rs' "Mejl adrese"
					FROM zaposleni

.. questionnote::

 3. Написати упит којим се приказују подаци о члановима: број чланске карте, презиме и имејл адреса.
 Уколико члан нема унету имејл адресу, приказати „Nema mejl adresu“.  

.. dbpetlja:: db_4223
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT broj_clanske_karte, prezime, ISNULL(mejl_adresa, 'Nema mejl adresu')
					FROM clanovi


.. questionnote::

 4. Написати упит којим се приказују најмања и највећа плаћена казна. 

.. dbpetlja:: db_4224
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT MIN(iznos), MAX(iznos)
					FROM kazne

.. questionnote::

 5. Написати упит којим се приказује просечна висина чланарине. 

.. dbpetlja:: db_4225
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT AVG(iznos) FROM clanarine

.. questionnote::

 6. Написати упит којим се приказује просечна висина чланарине за сваку годину. 

.. dbpetlja:: db_4226
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT god, AVG(iznos)
					FROM clanarine
					GROUP BY god

.. questionnote::

 7. Написати упит којим се приказује број година чланства члана са бројем чланске карте 33. 

.. dbpetlja:: db_4227
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT COUNT(*)
					FROM clanarine
					WHERE broj_clanske_karte = 33

.. questionnote::

 8. Написати упит којим се приказује датум када је плаћена прва казна. 

.. dbpetlja:: db_4228
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT MIN(datum)
					FROM kazne

.. questionnote::

 9. Написати упит којим се приказује датум последње позајмице. 

.. dbpetlja:: db_4229
   :dbfile: it3_biblioteka.sql
   :showresult:
   :solutionquery: SELECT MAX(datum_uzimanja)
                   FROM pozajmice

.. questionnote::

 10. Написати упит којим се приказује просечни износ чланарине за све чланарине које
 су бар 2500 динара.  

.. dbpetlja:: db_42210
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT AVG(iznos)
					FROM clanarine
					WHERE iznos >= 2500

.. questionnote::

 11. Написати упит којим се за сваку књигу приказује број примерака у библиотеци. Довољно
 је приказати идентификациони број књиге. 

.. dbpetlja:: db_42211
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT id_knjige, COUNT(inventarski_broj)
					FROM primerci
					GROUP BY id_knjige

.. questionnote::

 12. Написати упит којим се за сваку књигу приказује број примерака у библиотеци.
 Приказати назив књиге.  

.. dbpetlja:: db_42212
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT knjige.id_knjige, naziv, COUNT(inventarski_broj)
					FROM primerci JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
					GROUP BY knjige.id_knjige, naziv

.. questionnote::

 13. Написати упит којим се за сваку књигу приказује број примерака у библиотеци. Приказати
 назив књиге. Приказати само оне књиге са више од једног примерка.  

.. dbpetlja:: db_42213
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT knjige.id_knjige, naziv, COUNT(inventarski_broj)
					FROM primerci JOIN knjige ON (primerci.id_knjige=knjige.id_knjige)
					GROUP BY knjige.id_knjige, naziv
					HAVING COUNT(inventarski_broj) > 1

.. questionnote::

 14. Написати упит којим се за сваку књигу приказује број аутора. Довољно је приказати
 идентификациони број књиге.  

.. dbpetlja:: db_42214
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT id_knjige, COUNT(id_autora)
					FROM autori_knjige
					GROUP BY id_knjige

.. questionnote::

 15. Написати упит којим се за сваку књигу приказује број аутора. Приказати назив књиге. 

.. dbpetlja:: db_42215
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT knjige.id_knjige, naziv, COUNT(id_autora)
					FROM autori_knjige JOIN knjige ON (autori_knjige.id_knjige=knjige.id_knjige)
					GROUP BY knjige.id_knjige, naziv

.. questionnote::

 16. Написати упит којим се за сваку књигу приказује број аутора. Приказати назив књиге.
 Приказати само оне књиге које имају тачно једног аутора.  

.. dbpetlja:: db_42216
	:dbfile: it3_biblioteka.sql
	:showresult:
	:solutionquery: SELECT knjige.id_knjige, naziv, COUNT(id_autora)
					FROM autori_knjige JOIN knjige ON (autori_knjige.id_knjige=knjige.id_knjige)
					GROUP BY knjige.id_knjige, naziv
					HAVING COUNT(id_autora) = 1
