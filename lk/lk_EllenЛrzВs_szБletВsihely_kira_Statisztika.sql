SELECT �sszes�tett.F�oszt, �sszes�tett.[Hib�k sz�ma], �sszes�tett.�sszl�tsz�m, [Hib�k sz�ma]/[�sszl�tsz�m] AS Ar�ny
FROM (SELECT Uni�.F�oszt, Sum(Uni�.Hib�s) AS [Hib�k sz�ma], Sum(Uni�.L�tsz�m) AS �sszl�tsz�m
FROM (SELECT lk_Ellen�rz�s_sz�let�sihely_kira02.F�oszt, Count(lk_Ellen�rz�s_sz�let�sihely_kira02.Ad�jel) AS Hib�s, 0 AS L�tsz�m
FROM lk_Ellen�rz�s_sz�let�sihely_kira02
GROUP BY lk_Ellen�rz�s_sz�let�sihely_kira02.F�oszt, 0
UNION
SELECT lkSzem�lyek.F�oszt�ly, 0 AS Hib�s, Count(lkSzem�lyek.Ad�jel) AS CountOfAd�jel
FROM lkSzem�lyek
GROUP BY lkSzem�lyek.F�oszt�ly, 0, lkSzem�lyek.[St�tusz neve]
HAVING (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
)  AS Uni�
GROUP BY Uni�.F�oszt
)  AS �sszes�tett
GROUP BY �sszes�tett.F�oszt, �sszes�tett.[Hib�k sz�ma], �sszes�tett.�sszl�tsz�m, [Hib�k sz�ma]/[�sszl�tsz�m];
