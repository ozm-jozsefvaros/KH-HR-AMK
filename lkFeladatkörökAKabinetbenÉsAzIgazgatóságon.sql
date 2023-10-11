SELECT DISTINCT lkSzemélyek.Fõosztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[KIRA feladat megnevezés]
FROM lkSzemélyek
WHERE (((lkSzemélyek.Fõosztály) Like "Fõispáni*" Or (lkSzemélyek.Fõosztály) Like "Fõigazgatói*") AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.Fõosztály DESC , lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.[Dolgozó teljes neve];
