SELECT tVédõnõk.Adójel, tVédõnõk.Dátum, tVédõnõk.Védõnõ, tVédõnõk.[Vezetõ védõnõ], tVédõnõk.CsVSz, [tVédõnõk].[Adójel] & "" AS Adóazonosító, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Jogviszony vége (kilépés dátuma)]
FROM tVédõnõk INNER JOIN lkSzemélyek ON tVédõnõk.Adójel = lkSzemélyek.Adójel;
