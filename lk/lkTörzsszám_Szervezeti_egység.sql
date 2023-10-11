SELECT [Törzsszám]*1 AS Törzsszám_, lkFõosztályok.Fõosztály, lkSzemélyek.[Szint 5 szervezeti egység név] AS Osztály, Max(lkSzemélyek.[Jogviszony sorszáma]) AS [MaxOfJogviszony sorszáma]
FROM lkSzemélyek INNER JOIN lkFõosztályok ON lkSzemélyek.[Szervezeti egység kódja] = lkFõosztályok.[Szervezeti egység kódja]
GROUP BY [Törzsszám]*1, lkFõosztályok.Fõosztály, lkSzemélyek.[Szint 5 szervezeti egység név];
