SELECT lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.[Szervezeti egys�g neve], lkSzem�lyek.Besorol�s, lkSzem�lyek.[KIRA feladat megnevez�s], lkSzem�lyek.[Vezet�i megb�z�s t�pusa]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[Szervezeti egys�g neve]) Like "Hum�n*"))
ORDER BY IIf(InStr(1,[Besorol�s],"oszt�ly"),1,IIf(InStr(1,[KIRA feladat megnevez�s],"titk�r"),2,3)), lkSzem�lyek.[Szervezeti egys�g k�dja], lkSzem�lyek.[Dolgoz� teljes neve];
