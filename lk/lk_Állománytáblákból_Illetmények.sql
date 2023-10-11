SELECT Unió.Adóazonosító, Unió.Illetmény, Unió.[Heti munkaórák száma], Unió.[Álláshely azonosító], Unió.Név, Unió.Fõosztály, Unió.Osztály, [Adóazonosító]*1 AS Adójel, Unió.TávollétJogcíme, Unió.Szervezetkód, Unió.BesorolásHavi
FROM (SELECT Járási_állomány.Adóazonosító, 
        Járási_állomány.Mezõ18 AS Illetmény, 
        [Heti munkaórák száma], 
        [Álláshely azonosító], 
        Név, 
        Replace([Járási hivatal],"Budapest Fõváros Kormányhivatala ","BFKH ") as Fõosztály,
        Mezõ7 as Osztály,
        [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] as TávollétJogcíme, 
        [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] as Szervezetkód,
        [Besorolási fokozat kód:] as BesorolásHavi
    FROM Járási_állomány
    WHERE Adóazonosító  not like ""

    UNION SELECT Kormányhivatali_állomány.Adóazonosító, 
        Kormányhivatali_állomány.Mezõ18, 
        [Heti munkaórák száma], 
        [Álláshely azonosító], 
        Név, 
        Mezõ6, 
        Mezõ7, 
        [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], 
        [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ],
        [Besorolási fokozat kód:]
    FROM  Kormányhivatali_állomány
    WHERE Adóazonosító  not  like ""
    
    UNION SELECT Központosítottak.Adóazonosító, 
        Központosítottak.Mezõ17, 
        40 AS [Heti munkaórák száma], 
        [Álláshely azonosító], 
        Név, 
        Mezõ7,
        [Projekt megnevezése], 
        [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp],
        [Nexon szótárelemnek megfelelõ szervezeti egység azonosító],
        [Besorolási fokozat kód:]
    FROM  Központosítottak
    WHERE Adóazonosító  not  like ""
)  AS Unió;
