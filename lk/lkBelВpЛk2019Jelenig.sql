PARAMETERS [Kezdõ dátum] DateTime;
SELECT UnióUnió.BFKH, UnióUnió.Fõosztály, UnióUnió.Osztály, UnióUnió.[Belépés éve hava], Sum(UnióUnió.Fõ) AS SumOfFõ
FROM (SELECT bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS BFKH, IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, tBelépõkUnió.Mezõ6 AS Osztály, Year([Jogviszony kezdõ dátuma]) & IIf(Len(Month([Jogviszony kezdõ dátuma]))=1,"0","") & Month([Jogviszony kezdõ dátuma]) AS [Belépés éve hava], 1 AS Fõ
FROM tBelépõkUnió
WHERE (((tBelépõkUnió.[Jogviszony kezdõ dátuma])>[Kezdõ dátum]))
Union SELECT bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS BFKH, IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, lkBelépõk.Mezõ6 AS Osztály, Year([Jogviszony kezdõ dátuma]) & IIf(Len(Month([Jogviszony kezdõ dátuma]))=1,"0","") & Month([Jogviszony kezdõ dátuma]) AS [Belépés éve hava], 1 AS Fõ
FROM lkBelépõk)  AS UnióUnió
GROUP BY UnióUnió.BFKH, UnióUnió.Fõosztály, UnióUnió.Osztály, UnióUnió.[Belépés éve hava]
ORDER BY UnióUnió.[Belépés éve hava];
