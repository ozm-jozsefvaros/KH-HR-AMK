SELECT lkSzem�lyek.BFKH, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.Munkav�gz�sC�me, Count(lkSzem�lyek.Ad�jel) AS L�tsz�m
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.Munkav�gz�sC�me) Is Not Null) AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
GROUP BY lkSzem�lyek.BFKH, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.Munkav�gz�sC�me
ORDER BY lkSzem�lyek.BFKH, Count(lkSzem�lyek.Ad�jel) DESC;
