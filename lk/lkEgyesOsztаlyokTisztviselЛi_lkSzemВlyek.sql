SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés, IIf(Nz([Tartós távollét típusa],"")="","","tartósan távollévõ") AS [Tartósan távollévõ]
FROM lkSzemélyek
WHERE (((lkSzemélyek.Fõosztály) Like "* I. *") AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Like "kormány*")) OR (((lkSzemélyek.Fõosztály) Like "* XII. *")) OR (((lkSzemélyek.Fõosztály) Like "* XXI. *")) OR (((lkSzemélyek.Fõosztály) Like "* XXIII. *")) OR (((lkSzemélyek.Fõosztály) Like "* VI. *"))
ORDER BY bfkh([Szervezeti egység kódja]), lkSzemélyek.Osztály, lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], lkSzemélyek.[Dolgozó teljes neve];
