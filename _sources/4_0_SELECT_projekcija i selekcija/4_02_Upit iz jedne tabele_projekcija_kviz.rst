Упит SELECT - упит из једне табеле - пројекција - квиз
======================================================

.. mchoice:: 4021
    :answer_a: SELECT ime, plata
    :answer_b: SELECT * ime, prezime, plata
    :answer_c: SELECT ime, prezime, plata*1.1 
    :answer_d: SELECT ime, prezime, plata 
    :correct: d

    Уколико треба да се прикажу име, презиме и плата, потребно је да упит почне са:

.. mchoice:: 4022
    :answer_a: SELECT ime+prezime
    :answer_b: SELECT ime+' '+prezime 
    :answer_c: SELECT ime+" "+prezime
    :answer_d: SELECT ime prezime
    :correct: b

    Уколико треба да се прикажу име, размак и презиме повезано у једној колони, потребно је да упит почне са:

.. mchoice:: 4023
    :answer_a: SELECT ime, prezime
    :answer_b: SELECT Ime clana, Prezime clana
    :answer_c: SELECT ime "Ime clana", prezime "Prezime clana"
    :answer_d: SELECT "Ime clana" ime, "Prezime clana" 
    :correct: c

    Уколико треба да се прикажу име и презиме, али да у заглављима колона редом пише “Ime clana” и “Prezime clana”, потребно је да упит почне са:

.. dragndrop:: 4024
    :match_1: SELECT ime, prezime, plata, plata*1.2 ||| Приказује име, презиме и плату увећану за 20%.
    :match_2: SELECT ime, prezime, plata*0.95 ||| Приказује име, презиме и плату умењену за 5%.
    :match_3: SELECT ime, prezime, mejl, plata*1.2 ||| Приказује име, презиме, имејл адресу и плату увећану за 20%.
    :match_4: SELECT ime, prezime, plata*1.3 ||| Приказује име, презиме и плату увећану за 30%.
    
    Повежи почетак SELECT упита и његов опис.

.. mchoice:: 4025
    :answer_a: Да
    :answer_b: Не
    :correct: b

    5. Да ли ће подаци бити уређени абецедно након покретања следећег упита?
    ::

        SELECT ime FROM autori

.. mchoice:: 4026
    :answer_a: ORDER BY plata DESC, ime
    :answer_b: ORDER BY plata, ime DESC 
    :answer_c: ORDER BY ime, plata
    :answer_d: ORDER BY ime DESC, plata
    :correct: b

    Уколико је потребно уредити податке на основу висине плате, па опадајуће по имену, потребно је на крај упита додати:

.. mchoice:: 4027
    :answer_a: Да
    :answer_b: Не
    :correct: b

    Да ли је следећи упит исправан?
    ::

        FROM clanovi SELECT ime, prezime ORDER BY ime
