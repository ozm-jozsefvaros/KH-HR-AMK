SELECT "Szem�lyek vs. Szervezeti" AS T�bla, "A 'tart�s t�voll�t t�pusa': <�res>, ugyanakkor a 'St�tuszbet�lt�s t�pusa': ""Inakt�v""" AS Hi�nyz�_�rt�k, lkSzem�lyek.[Ad�azonos�t� jel] AS Ad�azonos�t�, lkSzem�lyek.[St�tusz k�dja] AS [�ll�shely azonos�t�], lkSzem�lyek.[Szervezeti egys�g k�dja] AS [�NYR SZERVEZETI EGYS�G AZONOS�T�], lkSzem�lyek.Ad�jel
FROM lk_Inakt�vBet�lt�k�s�ll�shely�k RIGHT JOIN lkSzem�lyek ON lk_Inakt�vBet�lt�k�s�ll�shely�k.Ad�jel = lkSzem�lyek.Ad�jel
WHERE (((lkSzem�lyek.[Tart�s t�voll�t t�pusa]) Is Null) AND ((lk_Inakt�vBet�lt�k�s�ll�shely�k.Ad�jel) Is Not Null) AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
AND "####Az inakt�v bet�lt�k k�z�tt keresi meg azokat, akiknek a tart�s t�voll�t t�pusa mez� a szem�lyt�rzsben Null. #####";
