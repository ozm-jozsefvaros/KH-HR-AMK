PARAMETERS [Kezd� d�tum] DateTime;
SELECT Uni�Uni�.BFKH, Uni�Uni�.F�oszt�ly, Uni�Uni�.Oszt�ly, Uni�Uni�.[Bel�p�s �ve hava], Sum(Uni�Uni�.F�) AS SumOfF�
FROM (SELECT bfkh([�NYR SZERVEZETI EGYS�G AZONOS�T�]) AS BFKH, IIf([Megyei szint VAGY J�r�si Hivatal]="megyei szint",[Mez�5],[Megyei szint VAGY J�r�si Hivatal]) AS F�oszt�ly, tBel�p�kUni�.Mez�6 AS Oszt�ly, Year([Jogviszony kezd� d�tuma]) & IIf(Len(Month([Jogviszony kezd� d�tuma]))=1,"0","") & Month([Jogviszony kezd� d�tuma]) AS [Bel�p�s �ve hava], 1 AS F�
FROM tBel�p�kUni�
WHERE (((tBel�p�kUni�.[Jogviszony kezd� d�tuma])>[Kezd� d�tum]))
Union SELECT bfkh([�NYR SZERVEZETI EGYS�G AZONOS�T�]) AS BFKH, IIf([Megyei szint VAGY J�r�si Hivatal]="megyei szint",[Mez�5],[Megyei szint VAGY J�r�si Hivatal]) AS F�oszt�ly, lkBel�p�k.Mez�6 AS Oszt�ly, Year([Jogviszony kezd� d�tuma]) & IIf(Len(Month([Jogviszony kezd� d�tuma]))=1,"0","") & Month([Jogviszony kezd� d�tuma]) AS [Bel�p�s �ve hava], 1 AS F�
FROM lkBel�p�k)  AS Uni�Uni�
GROUP BY Uni�Uni�.BFKH, Uni�Uni�.F�oszt�ly, Uni�Uni�.Oszt�ly, Uni�Uni�.[Bel�p�s �ve hava]
ORDER BY Uni�Uni�.[Bel�p�s �ve hava];
