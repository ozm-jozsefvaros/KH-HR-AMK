SELECT DISTINCT lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, �ll�shelyek.[�ll�shely azonos�t�], �ll�shelyek.[�ll�shely st�tusza], lkSzem�lyek.[Helyettes�tett dolgoz� neve], tSzervezet.[St�tuszbet�lt�s t�pusa]
FROM (�ll�shelyek LEFT JOIN lkSzem�lyek ON �ll�shelyek.[�ll�shely azonos�t�] = lkSzem�lyek.[St�tusz k�dja]) LEFT JOIN tSzervezet ON lkSzem�lyek.[Ad�azonos�t� jel] = tSzervezet.[Szervezetmenedzsment k�d]
WHERE (((�ll�shelyek.[�ll�shely st�tusza]) Like "bet�lt�tt *"));
