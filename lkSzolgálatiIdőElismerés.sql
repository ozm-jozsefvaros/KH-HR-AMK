SELECT lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, tSzolg�latiId�.[Szolg�lati elismer�s id�], tSzolg�latiId�.[Jogviszony kezdete]
FROM tSzolg�latiId� LEFT JOIN lkSzem�lyek ON tSzolg�latiId�.Ad�jel=lkSzem�lyek.Ad�jel
WHERE (((tSzolg�latiId�.[Jogviszony kezdete])>#10/1/2020#) AND ((lkSzem�lyek.[Jogviszony t�pusa / jogviszony t�pus]) Like "korm*") AND ((bfkh(Nz([Szervezeti egys�g k�dja],0))) Is Not Null) AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY bfkh(Nz([Szervezeti egys�g k�dja],0));
