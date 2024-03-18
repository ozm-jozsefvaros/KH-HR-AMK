SELECT DISTINCT lkSzemélyek.FõosztályKód, lkSzemélyek.Fõosztály, Count(lkSzemélyek.Azonosító) AS Létszám
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Elsõdleges feladatkör]) Like "Lezárt*"))
GROUP BY lkSzemélyek.FõosztályKód, lkSzemélyek.Fõosztály
ORDER BY lkSzemélyek.FõosztályKód;
