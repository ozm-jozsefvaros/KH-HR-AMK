SELECT DISTINCT lkSzem�lyek.[KIRA feladat megnevez�s], Count(lkSzem�lyek.Ad�jel) AS L�tsz�m
FROM lkSzem�lyek
GROUP BY lkSzem�lyek.[KIRA feladat megnevez�s], lkSzem�lyek.[St�tusz neve]
HAVING (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY lkSzem�lyek.[KIRA feladat megnevez�s];
