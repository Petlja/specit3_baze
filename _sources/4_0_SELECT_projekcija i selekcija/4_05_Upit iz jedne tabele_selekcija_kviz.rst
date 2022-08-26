Упит SELECT - упит из једне табеле - селекција - квиз
=====================================================

.. mchoice:: 4051
    :answer_a: WHEN plata<30000
    :answer_b: WHEN plata>30000
    :answer_c: WHERE plata<30000
    :answer_d: WHERE plata>30000 
    :correct: d

     Уколико треба да издвојимо запослене који зарађују више од 30.000 динара, потребно је да упиту додамо:

.. mchoice:: 4052
    :answer_a: WHERE ime LIKE 'P%'
    :answer_b: WHERE ime LIKE "P%"
    :answer_c: WHERE ime = 'P%'
    :answer_d: WHERE ime LIKE "P"
    :correct: a

     Уколико треба да издвојимо запослене чије име почиње словом П, потребно је да упиту додамо:

.. mchoice:: 4053
    :answer_a: Да
    :answer_b: Не
    :correct: b

     Да ли следећи упит враћа више редова (*id* је примарни кључ)? 
    ::

        FROM clanovi SELECT ime, prezime ORDER BY ime

.. mchoice:: 4054
    :answer_a: WHERE plata<80000
    :answer_b: WHERE plata>80000
    :answer_c: WHERE plata BETWEEN 80000 AND 90000
    :answer_d: WHERE plata BETWEEN 30000 AND 70000
    :correct: c

     Уколико запослени има плату 80.000 динара, приликом којег од следећих упита ће бити приказан у резултату?

.. mchoice:: 4055
    :answer_a: WHERE opis = NULL
    :answer_b: WHERE opis <> NULL
    :answer_c: WHERE opis IS NULL
    :answer_d: WHERE opis IS NOT NULL
    :correct: d

     Колона opis може да има null вредности, тј. опис не мора да се унесе. Уколико хоћемо да издвојимо само оне описе који су унети у базу, потребно је да упиту додамо:

.. mchoice:: 4056
    :answer_a: WHERE plata>50000 AND plata<40000
    :answer_b: WHERE plata>=40000 OR plata<=50000
    :answer_c: WHERE plata<40000 OR plata>50000
    :answer_d: WHERE plata<=40000 OR plata>=50000
    :correct: c

     Који је супротан услов следећем услову?
    ::

        WHERE plata>=40000 AND plata<=50000
    
.. mchoice:: 4057
    :answer_a: WHERE plata<50000
    :answer_b: WHERE plata*10<50000
    :answer_c: WHERE plata*0.1<50000
    :answer_d: WHERE plata*0.9<50000
    :correct: d

     Уколико треба да издвојимо запослене којима би плата после смањења од 10% била мања од 50.000 динара, потребно је да упиту додамо:

.. mchoice:: 4058
    :answer_a: WHERE plata<60000 OR datum_zaposlenja<'2018-06-01'
    :answer_b: WHERE plata<60000 AND datum_zaposlenja<'2018-06-01'
    :answer_c: WHERE plata>60000 OR datum_zaposlenja>'2018-06-01'
    :answer_d: WHERE plata>60000 AND datum_zaposlenja>'2018-06-01'
    :correct: b

     Уколико треба да издвојимо запослене којима је плата мања од 60.000 динара, а почели су да раде пре јуна 2018. године, потребно је да упиту додамо:

.. mchoice:: 4059
    :answer_a: Да
    :answer_b: Не
    :correct: a

     Следећи упит може да врати више редова (*id_izdavaca* је страни кључ)? 
    ::

        SELECT * FROM knjige WHERE id_izdavaca=3

.. mchoice:: 40510
    :answer_a: Да
    :answer_b: Не
    :correct: a

     Следећа два упита враћају исти резултат уколико колона *naziv* има ограничење NOT NULL. 
    ::

        SELECT * FROM izdavaci 
        SELECT * FROM izdavaci WHERE naziv IS NOT NULL
