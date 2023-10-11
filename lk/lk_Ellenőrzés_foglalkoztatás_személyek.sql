SELECT lkSzem�lyek.Ad�jel, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker] AS [Heti �rasz�m], IIf([Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker]=40,"T","R") AS Foglalkoztat�s, lkSzem�lyek.[St�tusz t�pusa], lkSzem�lyek.[Szervezeti egys�g k�dja]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[St�tusz t�pusa]) Is Not Null) AND ((lkSzem�lyek.[Szervezeti egys�g k�dja]) Is Not Null))
ORDER BY lkSzem�lyek.[Dolgoz� teljes neve];
