SELECT 1 AS sor, lkSzem�lyek.BFKH, lkSzem�lyek.F�oszt�ly, Nz(Oszt�ly,"-") AS Oszt�ly_, Count(*) AS L�tsz�m
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
GROUP BY 1, lkSzem�lyek.BFKH, lkSzem�lyek.F�oszt�ly, Nz(Oszt�ly,"-"), lkSzem�lyek.F�oszt�lyK�d, lkSzem�lyek.Oszt�ly;
