SELECT lkKözigazgatásiVizsga.Adójel, lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkKözigazgatásiVizsga.[Vizsga típusa], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés, lkKözigazgatásiVizsga.[Vizsga letétel terv határideje], lkKözigazgatásiVizsga.[Vizsga letétel tény határideje]
FROM lkKözigazgatásiVizsga INNER JOIN lkSzemélyek ON lkKözigazgatásiVizsga.Adójel = lkSzemélyek.Adójel
WHERE (((lkKözigazgatásiVizsga.[Vizsga típusa])="KAB Kormányablak ügyintézõi vizsg."))
ORDER BY lkSzemélyek.BFKH;
