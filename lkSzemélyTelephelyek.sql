SELECT lkSzem�lyek.Azonos�t�, lkSzem�lyek.Ad�jel, lkSzem�lyek.Munkav�gz�sC�me AS TelephelyC�me, lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.[Szervezeti egys�g k�dja], lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Tart�s t�voll�t t�pusa]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[Szervezeti egys�g k�dja]) Is Not Null) AND ((lkSzem�lyek.[Tart�s t�voll�t t�pusa]) Is Null) AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"));
