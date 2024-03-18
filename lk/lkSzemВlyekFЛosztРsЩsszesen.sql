SELECT UNIÓ.sor, UNIÓ.Fõosztály, Sum(UNIÓ.FõosztályiLétszám) AS FõosztályiLétszám, UNIÓ.FõosztKód, Sum(UNIÓ.KözpontosítottLétszám) AS KözpontosítottLétszám
FROM (SELECT 1 AS sor, lkSzemélyek.Fõosztály, Count(lkSzemélyek.Adójel) AS FõosztályiLétszám, Bfkh([lkSzemélyek].[FõosztályKód]) AS FõosztKód, 0 AS KözpontosítottLétszám
FROM lkSzemélyek
WHERE lkSzemélyek.[Státusz neve]="Álláshely" AND lkSzemélyek.[Státusz típusa] Like "Szervezeti alaplétszám"
GROUP BY lkSzemélyek.Fõosztály, Bfkh([lkSzemélyek].[FõosztályKód]), lkSzemélyek.[Státusz neve], lkSzemélyek.[Státusz típusa]
UNION
SELECT 1 as sor, lkSzemélyek.Fõosztály, 0 AS FõosztályiLétszám, Bfkh([lkSzemélyek].[FõosztályKód]) as FõosztKód, Count(lkSzemélyek.Adójel) as KözpontosítottLétszám
    FROM lkSzemélyek 
       WHERE lkSzemélyek.[Státusz neve]="Álláshely" AND lkSzemélyek.[Státusz típusa] Like "Központosított állomány"
       GROUP BY lkSzemélyek.Fõosztály, lkSzemélyek.[Státusz neve], Bfkh([lkSzemélyek].[FõosztályKód])
  UNION SELECT 2 as sor, "Összesen:" as Fõosztály, Count(lkSzemélyek.Adójel) AS CountOfAdójel , "BFKH.99" as FõosztKód, 0 AS KözpontosítottLétszám
    FROM lkSzemélyek 
       WHERE lkSzemélyek.[Státusz neve]="Álláshely" AND lkSzemélyek.[Státusz típusa] Like "Szervezeti alaplétszám"
       GROUP BY lkSzemélyek.[Státusz neve], "BFKH.99"
  UNION SELECT 2 as sor, "Összesen:" as Fõosztály, 0 AS CountOfAdójel , "BFKH.99" as FõosztKód, Count(lkSzemélyek.Adójel) AS KözpontosítottLétszám
    FROM lkSzemélyek 
       WHERE lkSzemélyek.[Státusz neve]="Álláshely" AND lkSzemélyek.[Státusz típusa] Like "Központosított állomány"
       GROUP BY lkSzemélyek.[Státusz neve], "BFKH.99")  AS UNIÓ
GROUP BY UNIÓ.sor, UNIÓ.Fõosztály, UNIÓ.FõosztKód
ORDER BY UNIÓ.sor;
