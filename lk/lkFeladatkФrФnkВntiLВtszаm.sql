SELECT DISTINCT lkSzem�lyek.[KIRA feladat megnevez�s] AS [meghagy�sra kijel�lt munkak�r�k megnevez�se], Count(lkSzem�lyek.Ad�jel) AS A, 0 AS B, Count(lkSzem�lyek.Ad�jel) AS C
FROM lkSzem�lyek RIGHT JOIN tMeghagy�sraKijel�ltMunkak�r�k ON lkSzem�lyek.[KIRA feladat megnevez�s] = tMeghagy�sraKijel�ltMunkak�r�k.Feladatk�r�k
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
GROUP BY lkSzem�lyek.[KIRA feladat megnevez�s], 0
ORDER BY lkSzem�lyek.[KIRA feladat megnevez�s];
