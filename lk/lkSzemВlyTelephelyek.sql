SELECT lkSzem�lyek.Ad�jel, lkSzem�lyek.[Dolgoz� teljes neve] AS N�v, lkSzem�lyek.[Munkav�gz�s helye - c�m], lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Tart�s t�voll�t t�pusa] AS [Tart�s t�voll�t jogc�me], lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)] AS [Kil�p�s d�tuma], lkSzem�lyek.BFKH, lkSzem�lyek.[Munkav�gz�s helye - c�m] AS TelephelyC�me
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.BFKH) Is Not Null) AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY lkSzem�lyek.BFKH, lkSzem�lyek.[Dolgoz� teljes neve];
