SELECT tSzem�lyek.[Dolgoz� teljes neve], tSzervezetiEgys�gek.F�oszt�ly, tSzervezetiEgys�gek.Oszt�ly, tSzem�lyek.azonos�t�
FROM tSzem�lyek LEFT JOIN tSzervezetiEgys�gek ON tSzem�lyek.[Szervezeti egys�g k�dja] = tSzervezetiEgys�gek.[Szervezeti egys�g k�dja]
WHERE (((tSzem�lyek.azonos�t�) In (Select azSzem�ly FROM alkSzem�lyek_csak_az_utols�_el�fordul�sok)) AND ((tSzem�lyek.[Tart�s t�voll�t t�pusa]) Is Null) AND ((tSzem�lyek.[Szervezeti egys�g k�dja]) Is Not Null And (tSzem�lyek.[Szervezeti egys�g k�dja]) Not Like "*MEGB*") AND ((tSzem�lyek.[St�tusz k�dja]) Like "S-*"));
