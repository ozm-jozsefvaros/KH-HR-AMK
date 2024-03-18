SELECT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Orvosi vizsgálat következõ idõpontja], kt_azNexon_Adójel02.NLink AS NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Orvosi vizsgálat következõ idõpontja])<DateSerial(Year(Date()),Month(Date())-11,1)-1) AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkSzemélyek.[státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH;
