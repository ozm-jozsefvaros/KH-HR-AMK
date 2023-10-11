SELECT Álláshelyek.[Álláshely azonosító], IIf(Nz([Dolgozó teljes neve],"")="","Betöltetlen","Betöltött") AS Állapot, lkSzemélyek.[Dolgozó teljes neve] AS [Betöltõ neve], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés
FROM lkSzemélyek RIGHT JOIN Álláshelyek ON lkSzemélyek.[Státusz kódja]=Álláshelyek.[Álláshely azonosító]
ORDER BY Álláshelyek.[Álláshely azonosító];
