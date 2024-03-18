SELECT lkSzemélyek.Törzsszám, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Nyelvtudás Kínai]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Nyelvtudás Kínai])="IGEN") AND ((lkSzemélyek.[Státusz neve])="Álláshely"));
