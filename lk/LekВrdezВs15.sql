SELECT bfkh([�NYR SZERVEZETI EGYS�G AZONOS�T�]) AS BFKH, tBel�p�kUni�.Ad�azonos�t�, IIf([Megyei szint VAGY J�r�si Hivatal]="megyei szint",[Mez�5],[Megyei szint VAGY J�r�si Hivatal]) AS F�oszt�ly, tBel�p�kUni�.Mez�6 AS Oszt�ly, 1 AS F�, tBel�p�kUni�.[Jogviszony kezd� d�tuma]
FROM tBel�p�kUni�;
