SELECT 1 as sor, lkSzem�lyek.F�oszt�ly, Count(lkSzem�lyek.Ad�jel) AS F�oszt�lyiL�tsz�m
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
GROUP BY lkSzem�lyek.F�oszt�ly, lkSzem�lyek.[St�tusz neve]

UNION SELECT 2 as sor, "�sszesen:" as F�oszt�ly, Count(lkSzem�lyek.Ad�jel) AS CountOfAd�jel
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
GROUP BY lkSzem�lyek.[St�tusz neve];
