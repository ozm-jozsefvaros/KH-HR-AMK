SELECT bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS BFKH, tBelépõkUnió.Adóazonosító, IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, tBelépõkUnió.Mezõ6 AS Osztály, 1 AS Fõ, tBelépõkUnió.[Jogviszony kezdõ dátuma]
FROM tBelépõkUnió;
