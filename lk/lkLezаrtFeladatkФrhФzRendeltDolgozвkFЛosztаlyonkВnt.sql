SELECT DISTINCT lkSzem�lyek.F�oszt�lyK�d, lkSzem�lyek.F�oszt�ly, Count(lkSzem�lyek.Azonos�t�) AS L�tsz�m
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely") AND ((lkSzem�lyek.[Els�dleges feladatk�r]) Like "Lez�rt*"))
GROUP BY lkSzem�lyek.F�oszt�lyK�d, lkSzem�lyek.F�oszt�ly
ORDER BY lkSzem�lyek.F�oszt�lyK�d;
