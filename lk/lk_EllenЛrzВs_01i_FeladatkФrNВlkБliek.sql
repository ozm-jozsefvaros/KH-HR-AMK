SELECT DISTINCT "Szem�lyt�rzs" AS T�bla, "KIRA feladatk�r" AS Hi�nyz�_�rt�k, lkSzem�lyek.[Ad�azonos�t� jel] AS Ad�azonos�t�, lkSzem�lyek.[St�tusz k�dja] AS [�ll�shely azonos�t�], lkSzem�lyek.[Szervezeti egys�g k�dja] AS [�NYR SZERVEZETI EGYS�G AZONOS�T�], lkSzem�lyek.Ad�jel
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[KIRA feladat megnevez�s]) Is Null Or (lkSzem�lyek.[KIRA feladat megnevez�s])="") AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY "KIRA feladatk�r";
