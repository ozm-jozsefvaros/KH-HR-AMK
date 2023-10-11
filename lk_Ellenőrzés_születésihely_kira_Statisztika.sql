SELECT Összesített.Fõoszt, Összesített.[Hibák száma], Összesített.Összlétszám, [Hibák száma]/[Összlétszám] AS Arány
FROM (SELECT Unió.Fõoszt, Sum(Unió.Hibás) AS [Hibák száma], Sum(Unió.Létszám) AS Összlétszám
FROM (SELECT lk_Ellenõrzés_születésihely_kira02.Fõoszt, Count(lk_Ellenõrzés_születésihely_kira02.Adójel) AS Hibás, 0 AS Létszám
FROM lk_Ellenõrzés_születésihely_kira02
GROUP BY lk_Ellenõrzés_születésihely_kira02.Fõoszt, 0
UNION
SELECT lkSzemélyek.Fõosztály, 0 AS Hibás, Count(lkSzemélyek.Adójel) AS CountOfAdójel
FROM lkSzemélyek
GROUP BY lkSzemélyek.Fõosztály, 0, lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely"))
)  AS Unió
GROUP BY Unió.Fõoszt
)  AS Összesített
GROUP BY Összesített.Fõoszt, Összesített.[Hibák száma], Összesített.Összlétszám, [Hibák száma]/[Összlétszám];
