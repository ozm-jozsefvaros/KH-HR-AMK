SELECT DISTINCT bfkh([FõosztályKód]) AS BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés
FROM lkSzemélyek LEFT JOIN tKSZDR ON lkSzemélyek.[Adóazonosító jel] = tKSZDR.[Adóazonosító jel]
WHERE (((tKSZDR.[Teljes név]) Is Null) AND ((lkSzemélyek.[Státusz neve])="álláshely"))
ORDER BY bfkh([FõosztályKód]), lkSzemélyek.[Jogviszony kezdete (belépés dátuma)];
