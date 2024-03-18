SELECT lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Munkavégzés helye - cím], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Tartós távollét típusa] AS [Tartós távollét jogcíme], lkSzemélyek.[Jogviszony vége (kilépés dátuma)] AS [Kilépés dátuma], lkSzemélyek.BFKH, lkSzemélyek.[Munkavégzés helye - cím] AS TelephelyCíme
FROM lkSzemélyek
WHERE (((lkSzemélyek.BFKH) Is Not Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH, lkSzemélyek.[Dolgozó teljes neve];
