SELECT tSzem�lyek.[Szervezeti egys�g k�dja], tSzem�lyek.[St�tusz k�dja], tSzem�lyek.[Tart�s t�voll�t t�pusa], tSzem�lyek.[Tart�s t�voll�t kezdete], tSzem�lyek.[Tart�s t�voll�t v�ge], tSzem�lyek.[Tart�s t�voll�t tervezett v�ge]
FROM tSzem�lyek
WHERE (((tSzem�lyek.[Szervezeti egys�g k�dja]) Is Not Null) AND ((tSzem�lyek.[Tart�s t�voll�t t�pusa]) Is Not Null))
ORDER BY tSzem�lyek.[Szervezeti egys�g k�dja], tSzem�lyek.[St�tusz k�dja];
