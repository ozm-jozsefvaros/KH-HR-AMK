SELECT lkVégzettségek.Adójel, lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkVégzettségek.[Végzettség neve], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés
FROM lkSzemélyek INNER JOIN lkVégzettségek ON lkSzemélyek.Adójel = lkVégzettségek.Adójel
WHERE (((lkVégzettségek.[Végzettség neve])="kormányablak ügyintézõi vizsga (NKE)") AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkVégzettségek.[Végzettség neve])="kormányablak ügyintézõ"))
ORDER BY lkSzemélyek.BFKH;
