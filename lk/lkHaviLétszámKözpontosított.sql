SELECT K�zpontos�tottak.[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] AS BFKHK�d, IIf([Megyei szint VAGY J�r�si Hivatal]="megyei szint",[Mez�6],[Megyei szint VAGY J�r�si Hivatal]) AS F�oszt�ly, K�zpontos�tottak.Mez�7 AS Oszt�ly, Sum(IIf([Mez�4]="�res �ll�s",0,1)) AS Bet�lt�tt, Sum(IIf([Mez�4]="�res �ll�s",1,0)) AS �res
FROM K�zpontos�tottak
GROUP BY K�zpontos�tottak.[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�], IIf([Megyei szint VAGY J�r�si Hivatal]="megyei szint",[Mez�6],[Megyei szint VAGY J�r�si Hivatal]), K�zpontos�tottak.Mez�7;
