SELECT tTelephelyek.Mezõ1 AS Fõosztály, tTelephelyek.[Szervezeti egység], lkSzemélyek.[Szint 5 szervezeti egység név], lkSzemélyek.[Dolgozó teljes neve], tTelephelyek.Cím, lkSzemélyek.[Munkavégzés helye - cím], Left([Cím],4) AS Kif1, Left([Munkavégzés helye - cím],4) AS Kif1
FROM lkSzemélyek LEFT JOIN tTelephelyek ON lkSzemélyek.[Szervezeti egység kódja] = tTelephelyek.SzervezetKód
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null))
ORDER BY tTelephelyek.[Szervezeti egység];
