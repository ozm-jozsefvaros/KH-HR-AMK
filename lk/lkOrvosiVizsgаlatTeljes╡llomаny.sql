SELECT lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve] AS N�v, lkSzem�lyek.[Dolgoz� sz�let�si neve] AS [Sz�let�si n�v], lkSzem�lyek.[Sz�let�si id�], lkSzem�lyek.[Sz�let�si hely], lkSzem�lyek.[TAJ sz�m], lkSzem�lyek.[Orvosi vizsg�lat k�vetkez� id�pontja], lkSzem�lyek.[Hivatali email], IIf([tart�s t�voll�t t�pusa] Is Not Null,"TT","") AS TT, lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)] AS [Kil�p�s d�tuma]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY lkSzem�lyek.BFKH;
