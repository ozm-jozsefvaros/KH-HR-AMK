SELECT lkSzemélyek.Azonosító, lkSzemélyek.Adójel, lkSzemélyek.MunkavégzésCíme AS TelephelyCíme, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Tartós távollét típusa]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"));
