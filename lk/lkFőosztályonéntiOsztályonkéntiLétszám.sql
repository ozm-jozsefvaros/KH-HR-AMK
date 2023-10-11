SELECT 1 AS sor, lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, Nz(Osztály,"-") AS Osztály_, Count(*) AS Létszám
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
GROUP BY 1, lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, Nz(Osztály,"-"), lkSzemélyek.FõosztályKód, lkSzemélyek.Osztály;
