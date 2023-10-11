SELECT DISTINCT "Személytörzs" AS Tábla, "KIRA feladatkör" AS Hiányzó_érték, lkSzemélyek.[Adóazonosító jel] AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[KIRA feladat megnevezés]) Is Null Or (lkSzemélyek.[KIRA feladat megnevezés])="") AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY "KIRA feladatkör";
