SELECT bfkh([F�oszt�lyK�d]) AS FK, lkSzem�lyek.F�oszt�ly, Avg([Kerek�tett 100 %-os illetm�ny (elt�r�tett)]/[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker]*40) AS Illetm�ny
FROM lkSzem�lyek
GROUP BY bfkh([F�oszt�lyK�d]), lkSzem�lyek.F�oszt�ly, lkSzem�lyek.[St�tusz neve]
HAVING (((lkSzem�lyek.[St�tusz neve])="�ll�shely"));
