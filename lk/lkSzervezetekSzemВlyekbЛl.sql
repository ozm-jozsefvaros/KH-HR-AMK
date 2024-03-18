SELECT DISTINCT bfkh(Nz([Szervezeti egység kódja],1)) AS bfkh, lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null))
ORDER BY bfkh(Nz([Szervezeti egység kódja],1));
