SELECT DISTINCT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Státusz költséghelyének neve] AS Költséghely, lkSzemélyek.[Státusz költséghelyének kódja] AS [Költséghely kód], kt_azNexon_Adójel02.NLink AS NLink, lkSzemélyek.[Státusz neve]
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Státusz típusa])="Szervezeti alaplétszám") AND ((lkSzemélyek.[Státusz neve])="Álláshely"));
