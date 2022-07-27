Нека лекција
============

Проба (база dnevnik)

.. dbpetlja:: db_relacijski_02
   :dbfile: it3_dnevnik.sql
   :solutionquery: SELECT ime, prezime
                   FROM ucenik
                   WHERE prezime LIKE 'Ми%'
   :showresult:

|


Проба (база biblioteka)

.. dbpetlja:: db_proba_2
   :dbfile: it3_biblioteka.sql
   :solutionquery: SELECT ime, prezime
                   FROM autori
                   WHERE ime LIKE 'M%'
   :showresult:
