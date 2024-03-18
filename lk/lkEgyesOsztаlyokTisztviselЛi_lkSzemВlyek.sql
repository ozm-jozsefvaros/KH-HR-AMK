SELECT lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve] AS N�v, lkSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)] AS Bel�p�s, IIf(Nz([Tart�s t�voll�t t�pusa],"")="","","tart�san t�voll�v�") AS [Tart�san t�voll�v�]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.F�oszt�ly) Like "* I. *") AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely") AND ((lkSzem�lyek.[Jogviszony t�pusa / jogviszony t�pus]) Like "korm�ny*")) OR (((lkSzem�lyek.F�oszt�ly) Like "* XII. *")) OR (((lkSzem�lyek.F�oszt�ly) Like "* XXI. *")) OR (((lkSzem�lyek.F�oszt�ly) Like "* XXIII. *")) OR (((lkSzem�lyek.F�oszt�ly) Like "* VI. *"))
ORDER BY bfkh([Szervezeti egys�g k�dja]), lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)], lkSzem�lyek.[Dolgoz� teljes neve];
