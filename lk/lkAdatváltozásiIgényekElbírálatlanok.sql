SELECT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkAdatváltoztatásiIgények.[Dolgozó neve] AS Név, lkAdatváltoztatásiIgények.Állapot AS Állapot, Format([Igény dátuma],"yyyymmdd") AS [Igény kelte], kt_azNexon_Adójel.NLink AS NLink
FROM kt_azNexon_Adójel RIGHT JOIN (lkAdatváltoztatásiIgények LEFT JOIN lkSzemélyek ON lkAdatváltoztatásiIgények.Adójel = lkSzemélyek.Adójel) ON kt_azNexon_Adójel.Adójel = lkAdatváltoztatásiIgények.Adójel
WHERE (((lkAdatváltoztatásiIgények.Állapot)="Elbírálatlan"))
ORDER BY lkSzemélyek.BFKH, lkAdatváltoztatásiIgények.[Dolgozó neve], lkSzemélyek.[Státusz kódja];
