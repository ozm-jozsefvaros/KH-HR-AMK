SELECT lkBelépõkUnió.Név, lkBelépõkUnió.Fõosztály, lkBelépõkUnió.Osztály, ffsplit([Feladatkör],"-",2) AS [Ellátandó feladat], lkBelépõkUnió.[Jogviszony kezdõ dátuma]
FROM lkBelépõkUnió RIGHT JOIN tSzemélyek ON (lkBelépõkUnió.[Jogviszony kezdõ dátuma] = tSzemélyek.[Jogviszony kezdete (belépés dátuma)]) AND (lkBelépõkUnió.Adóazonosító = tSzemélyek.[Adóazonosító jel])
WHERE (((lkBelépõkUnió.Fõosztály) Like [Szervezeti egység] & "*") AND ((lkBelépõkUnió.[Jogviszony kezdõ dátuma]) Between #1/1/2023# And #12/31/2023#));
