SELECT lkSzem�lyek.T�rzssz�m, lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Nyelvtud�s K�nai]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[Szervezeti egys�g k�dja]) Is Not Null) AND ((lkSzem�lyek.[Nyelvtud�s K�nai])="IGEN") AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"));
