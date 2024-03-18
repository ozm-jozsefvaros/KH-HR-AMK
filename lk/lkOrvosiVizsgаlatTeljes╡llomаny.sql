SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Dolgozó születési neve] AS [Születési név], lkSzemélyek.[Születési idõ], lkSzemélyek.[Születési hely], lkSzemélyek.[TAJ szám], lkSzemélyek.[Orvosi vizsgálat következõ idõpontja], lkSzemélyek.[Hivatali email], IIf([tartós távollét típusa] Is Not Null,"TT","") AS TT, lkSzemélyek.[Jogviszony vége (kilépés dátuma)] AS [Kilépés dátuma]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH;
