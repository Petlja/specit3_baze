Нормализација - задаци
======================

**Препознати које правило нормализације је нарушено за дате ентитете и атрибуте, а затим разрешити проблем. Дозвољено је увођење нових атрибута приликом увођења нових ентитета, где је то неопходно.**

.. questionnote::

 1.
 
 UMETNIK: #id, ime, prezime, biografija, naziv_slike 
 
.. reveal::  Задатак 221.1
   :showtitle: Прикажи решење 
   :hidetitle: Сакриј
	
   **Решење:** 1NF – један уметник је насликао више слика


   |
   | UMETNIK: #id, ime, prezime, biografija
   | SLIKA: #id, naziv_slike.
   
  
.. questionnote::

 2.
 
 UMETNIK: #id, ime, prezime, naziv_održane_izložbe, datum_otvaranja_izložbe, naziv_izložbenog_prostora
 
.. reveal::  Задатак 221.2
   :showtitle: Прикажи решење 
   :hidetitle: Сакриј
	
   **Решење:** 3NF – група атрибута *naziv_održane_izložbe*, *datum_otvaranja_izložbe*, *naziv_izložbenog_prostora* чини засебну целину која описује одржану изложбу.

   |
   | UMETNIK: #id, ime, prezime
   | IZLOŽBA: #id, naziv, datum_otvaranja_izložbe, naziv_izložbenog_prostora

.. questionnote::

 3.
 
 UMETNIK: #id, ime, prezime, naziv_održane_izložbe
 
.. reveal::  Задатак 221.3
   :showtitle: Прикажи решење 
   :hidetitle: Сакриј
   
   **Решење:** 1NF – један уметник је одржао више изложби.

   |
   | UMETNIK: #id, ime, prezime
   | IZLOŽBA: #id, naziv

.. questionnote::

 4.
 
 ODRŽANA IZLOŽBA: #id_umetnika, #id_izložbenog_prostora, #datum, dužina_trajanja, komentar, datum_rođenja_umetnika, 
 adresa_izložbenog_prostora.
 
.. reveal::  Задатак 221.4
   :showtitle: Прикажи решење 
   :hidetitle: Сакриј
   
   **Решење:** 
   
   2NF – атрибут *datum_rođenja_umetnika* није у директној функционалној зависности од целог примарног јединственог идентификатора, већ само од *id_umetnika*.
 
   2NF – атрибут *adresa_izložbenog_prostora* није у директној функционалној зависности од целог примарног јединственог идентификатора, већ само од *id_izložbenog_prostora*.

   |
   | ODRŽANA IZLOŽBA: #id_umetnika, #id_izložbenog_prostora, #datum, dužina_trajanja, komentar
   | UMETNIK: #id_umetnika, ime, prezime, datum_rođenja
   | IZLOŽBENI_PROSTOR: #id_izložbenog_prostora, naziv, adresa_izložbenog_prostora
   
   .. image:: ../../_images/slika_221c.png
      :width: 400
      :align: center 

.. questionnote::
 
 5.
 
 PROIZVOD: #id, naziv, cena, kategorija, opis_kategorije
 
.. reveal::  Задатак 221.5
   :showtitle: Прикажи решење 
   :hidetitle: Сакриј
   
   **Решење:** 3NF – група атрибута *kategorija*, *opis_kategorije* чини засебну целину која описује категорију (атрибут *kategorija* је заправо назив категорије, на пример: прехрамбени производи, кућна хемија, бела техника...).

   |
   | PROIZVOD: #id, naziv, cena
   | KATEGORIJA: #id_kategorije, naziv, opis

.. questionnote::
 
 6.
 
 PROIZVOĐAČ: #id, naziv, adresa, PIB, naziv_proizvoda
 
.. reveal::  Задатак 221.6
   :showtitle: Прикажи решење 
   :hidetitle: Сакриј
   
   **Решење:** 1NF – један произвођач производи више производа.

   |
   | PROIZVOĐAČ: #id, naziv, adresa, PIB
   | PROIZVOD: #id_proizvoda, naziv

.. questionnote::

 7.
 
 PROIZVOĐAČ: #id, naziv, adresa, PIB, oblast_rada, opis_oblasti_rada.
 
 (област рада је, на пример: прехрамбена индустрија, производња беле технике...).

 
.. reveal::  Задатак 221.7
   :showtitle: Прикажи решење 
   :hidetitle: Сакриј
   
   **Решење:** 3NF – група атрибута *oblast_rada*, *opis_oblasti_rada* чини засебну целину која описује област рада (атрибут *oblast_rada* је заправо назив, на пример: прехрамбена индустрија, производња беле технике...).

   |
   | PROIZVOĐAČ: #id, naziv, adresa, PIB
   | OBLAST_RADA: #id, naziv, opis
   
   .. image:: ../../_images/slika_221d.png
      :width: 400
      :align: center    

.. questionnote::

 8.
 
 MAGACIN: #id_proizvoda, #id_prodavnice, količina, poslednji_datum_nabavke, naziv_proizvoda
 
.. reveal::  Задатак 221.8
   :showtitle: Прикажи решење 
   :hidetitle: Сакриј
   
   **Решење:** 2NF – атрибут *naziv_proizvoda* није у директној функционалној зависности од целог примарног јединственог идентификатора, већ само од *id_proizvoda*.

   |
   | MAGACIN: #id_proizvoda, #id_prodavnice, količina, poslednji_datum_nabavke
   | PROIZVOD: #id, naziv

.. questionnote::
 
 9. 
 
 AUTOMOBIL: #registarski_broj, datum_registracije, proizvođač, model, ime_vlasnika, adresa_vlasnika, broj_lične_karte_vlasnika
 
.. reveal::  Задатак 221.9
   :showtitle: Прикажи решење 
   :hidetitle: Сакриј
   
   **Решење:** 3NF – група атрибута *ime_vlasnika*, *adresa_vlasnika*, *broj_lične_karte_vlasnika* чини засебну целину која описује власника.

   |
   | AUTOMOBIL: #registarski_broj, datum_registracije, proizvođač, model
   | VLASNIK: #id, ime, adresa, broj_lične_karte

.. questionnote::
 
 10. 
 
 PROIZVOĐAČ_AUTOMOBILA: #PIB, naziv, adresa_sedista, veb_sajt, naziv_modela
 
.. reveal::  Задатак 221.10
   :showtitle: Прикажи решење 
   :hidetitle: Сакриј
   
   **Решење:** 1NF – један произвођач аутомобила производи више модела

   |
   | PROZIVOĐAČ_AUTOMOBILA: #PIB, naziv, adresa_sedista, veb_sajt
   | MODEL: #id, naziv
   
.. questionnote::
 
 11. 
 
 REGISTRACIJA: #broj_sasije, #registarski_broj, datum, ime_vlasnika, adresa_vlasnika, broj_vozačke_dozvole_vlasnika
 
.. reveal::  Задатак 221.11
   :showtitle: Прикажи решење 
   :hidetitle: Сакриј
   
   **Решење:** 3NF – група атрибута *ime_vlasnika*, *adresa_vlasnika*, *broj_vozačke_dozvole_vlasnika* чини засебну целину која описује власника.

   |
   | REGISTRACIJA: #broj_sasije, #registarski_broj, datum.
   | VLASNIK: #id, ime, adresa, broj_vozačke_dozvole
   
.. questionnote::
 
 12. 
 
 ODELJENJE: #razred, #indeks_odeljenja, ime_učenika
 
.. reveal::  Задатак 221.12
   :showtitle: Прикажи решење 
   :hidetitle: Сакриј
   
   **Решење:** 1NF – једно  одељење има више ученика.

   |
   | ODELJENJE: #razred, #indeks_odeljenja
   | UČENIK: #id, ime
