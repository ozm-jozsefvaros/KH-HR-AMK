SELECT lkSzem�lyek.Ad�jel, lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[KIRA feladat megnevez�s], lkSzem�lyek.Feladatk�r, lkSzem�lyek.[Els�dleges feladatk�r], lkSzem�lyek.FEOR, lkSzem�lyek.[KIRA jogviszony jelleg], lkSzem�lyek.[Besorol�si  fokozat (KT)]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY lkSzem�lyek.BFKH, lkSzem�lyek.[Dolgoz� teljes neve];
