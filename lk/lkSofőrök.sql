SELECT lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.FEOR, lkSzem�lyek.[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker], lkSzem�lyek.[Kerek�tett 100 %-os illetm�ny (elt�r�tett)]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.FEOR)="8416 - Szem�lyg�pkocsi-vezet�") AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely") AND ((lkSzem�lyek.[Tart�s t�voll�t t�pusa]) Is Null)) OR (((lkSzem�lyek.[Dolgoz� teljes neve])="Kov�cs Tibor")) OR (((lkSzem�lyek.[Dolgoz� teljes neve])="D�brei Lajos"));
