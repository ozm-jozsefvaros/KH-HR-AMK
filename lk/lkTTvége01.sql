SELECT Year(IIf(dt�tal([Tart�s t�voll�t v�ge])=1,dt�tal([Tart�s t�voll�t tervezett v�ge]),dt�tal([Tart�s t�voll�t v�ge]))) AS V�ge�v, Month(IIf(dt�tal([Tart�s t�voll�t v�ge])=1,dt�tal([Tart�s t�voll�t tervezett v�ge]),dt�tal([Tart�s t�voll�t v�ge]))) AS V�geH�, 1 AS L�tsz�m, lkSzem�lyek.Azonos�t�, IIf(dt�tal([Tart�s t�voll�t v�ge])=1,dt�tal([Tart�s t�voll�t tervezett v�ge]),dt�tal([Tart�s t�voll�t v�ge])) AS D�tum
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[Szervezeti egys�g k�dja]) Is Not Null) AND ((lkSzem�lyek.[Tart�s t�voll�t t�pusa]) Is Not Null));
