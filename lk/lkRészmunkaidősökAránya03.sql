SELECT bfkh(Nz([Szervezeti egység kódja],0)) AS bfkh, lkFõosztályok.[Szervezeti egység kódja], lkRészmunkaidõsökAránya02.Fõosztály, lkRészmunkaidõsökAránya02.[Teljes munkaidõs létszám], lkRészmunkaidõsökAránya02.[Részmunkaidõs létszám], [Részmunkaidõs létszám]/[Teljes munkaidõs létszám] AS Aránya
FROM lkFõosztályok INNER JOIN lkRészmunkaidõsökAránya02 ON lkFõosztályok.Fõosztály = lkRészmunkaidõsökAránya02.Fõosztály
ORDER BY [Részmunkaidõs létszám]/[Teljes munkaidõs létszám] DESC;
