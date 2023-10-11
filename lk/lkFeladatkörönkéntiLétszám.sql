SELECT DISTINCT lkSzemélyek.[KIRA feladat megnevezés], Count(lkSzemélyek.Adójel) AS Létszám
FROM lkSzemélyek
GROUP BY lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.[KIRA feladat megnevezés];
