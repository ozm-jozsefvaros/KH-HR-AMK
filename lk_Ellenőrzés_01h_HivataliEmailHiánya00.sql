SELECT "Szem�lyt�rzs" AS T�bla, "Hivatali email" AS Hi�nyz�_�rt�k, tSzem�lyek.[Ad�azonos�t� jel] AS Ad�azonos�t�, tSzem�lyek.[St�tusz k�dja] AS [�ll�shely azonos�t�], tSzem�lyek.[Szervezeti egys�g k�dja] AS [�NYR SZERVEZETI EGYS�G AZONOS�T�], tSzem�lyek.Ad�jel, tSzem�lyek.[Jogviszony sorsz�ma]
FROM tSzem�lyek
WHERE (((tSzem�lyek.[St�tusz neve])="�ll�shely") AND ((Len(Nz([Hivatali email]," ")))<4) AND ((tSzem�lyek.[Tart�s t�voll�t t�pusa]) Is Null))
ORDER BY tSzem�lyek.Ad�jel, tSzem�lyek.[Jogviszony sorsz�ma] DESC;
