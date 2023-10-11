SELECT DISTINCT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, Álláshelyek.[Álláshely azonosító], Álláshelyek.[Álláshely státusza], lkSzemélyek.[Helyettesített dolgozó neve], tSzervezet.[Státuszbetöltés típusa]
FROM (Álláshelyek LEFT JOIN lkSzemélyek ON Álláshelyek.[Álláshely azonosító] = lkSzemélyek.[Státusz kódja]) LEFT JOIN tSzervezet ON lkSzemélyek.[Adóazonosító jel] = tSzervezet.[Szervezetmenedzsment kód]
WHERE (((Álláshelyek.[Álláshely státusza]) Like "betöltött *"));
