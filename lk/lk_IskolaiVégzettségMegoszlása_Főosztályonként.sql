TRANSFORM Count(lkSzem�lyek_Jelen.ad�jel) AS CountOfad�jel
SELECT arab(kerkiemel(Nz([lkSzem�lyek_Jelen].[Szint 4 szervezeti egys�g n�v],""))) AS Kif2, Trim([Szint 4 szervezeti egys�g n�v] & [Szint 3 szervezeti egys�g n�v]) AS [F�oszt�ly ill hivatal]
FROM lkSzem�lyek_Jelen
WHERE (((lkSzem�lyek_Jelen.[Szervezeti egys�g k�dja]) Is Not Null) And ((lkSzem�lyek_Jelen.[St�tusz t�pusa]) Is Not Null))
GROUP BY arab(kerkiemel(Nz([lkSzem�lyek_Jelen].[Szint 4 szervezeti egys�g n�v],""))), Trim([Szint 4 szervezeti egys�g n�v] & [Szint 3 szervezeti egys�g n�v])
ORDER BY arab(kerkiemel(Nz([lkSzem�lyek_Jelen].[Szint 4 szervezeti egys�g n�v],""))), Trim([Szint 4 szervezeti egys�g n�v] & [Szint 3 szervezeti egys�g n�v])
PIVOT lkSzem�lyek_Jelen.[Iskolai v�gzetts�g foka];
