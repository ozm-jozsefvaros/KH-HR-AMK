SELECT UNIÓ.Sor, UNIÓ.BFKH AS [Szervezeti egység kód], UNIÓ.Fõosztály, UNIÓ.Osztály, UNIÓ.Létszám
FROM (SELECT 0 AS sor, bfkh(Nz(lkSzemélyek.FõosztályKód,0)) AS BFKH, lkSzemélyek.Fõosztály, "Összesen:" AS Osztály, Count(*) AS Létszám
    FROM lkSzemélyek
    WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
    GROUP BY 0, lkSzemélyek.Fõosztály, lkSzemélyek.FõosztályKód, ""

    UNION
    SELECT 1 as sor, lkSzemélyek.BFKH, Fõosztály,Osztály, Count(*) as Létszám
    FROM lkSzemélyek
    WHERE lkSzemélyek.[Státusz neve]="Álláshely"
    GROUP BY 1,BFKH, lkSzemélyek.Fõosztály,lkSzemélyek.FõosztályKód,Osztály
    )  AS UNIÓ
WHERE "/// Leírás: A megadott lekérdezés két SELECT utasítást kombinál az UNION használatával, hogy egyetlen eredménykészletet hozzon létre. 
        Az elsõ SELECT kimutatás a fõosztályonkénti (osztályvezetõi), míg a második SELECT utasítás a BFKH-nként (osztályonkénti) és a 
        fõosztályonkénti dolgozók számát számolja ki. 
        Az eredményül kapott adatkészlet tartalmazza a Sor (sorszám), Szervezeti egység kód (szervezeti egység kódja), Fõosztály, 
        Osztály és Létszám (alkalmazottak száma) oszlopokat. 
        A végeredményt ezután a BFKH és a sor szerint csökkenõ sorrendbe rendezi. ///"
ORDER BY UNIÓ.BFKH DESC , UNIÓ.sor DESC;
