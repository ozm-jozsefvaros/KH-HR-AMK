SELECT lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.Ad�jel, lkSzem�lyek.[Szervezeti egys�g k�dja], lkSzem�lyek.[Besorol�si  fokozat (KT)], lkSzem�lyek.[Besorol�si  fokozat (KT)], lkSzem�lyek.[St�tusz k�dja], lkSzem�lyek.[Helyettes�tett dolgoz� neve], lkSzem�lyek.[Helyettes�tett dolgoz� szerz�d�s/kinevez�ses munkak�re] AS Kif1
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[Helyettes�tett dolgoz� neve]) Is Not Null));
