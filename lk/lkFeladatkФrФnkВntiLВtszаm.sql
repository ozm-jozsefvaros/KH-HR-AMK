SELECT DISTINCT lkSzemélyek.[KIRA feladat megnevezés] AS [meghagyásra kijelölt munkakörök megnevezése], Count(lkSzemélyek.Adójel) AS A, 0 AS B, Count(lkSzemélyek.Adójel) AS C
FROM lkSzemélyek RIGHT JOIN tMeghagyásraKijelöltMunkakörök ON lkSzemélyek.[KIRA feladat megnevezés] = tMeghagyásraKijelöltMunkakörök.Feladatkörök
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
GROUP BY lkSzemélyek.[KIRA feladat megnevezés], 0
ORDER BY lkSzemélyek.[KIRA feladat megnevezés];
