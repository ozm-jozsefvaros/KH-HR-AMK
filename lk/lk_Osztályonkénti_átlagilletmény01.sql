SELECT bfkh([Szervezeti egys�g k�dja]) AS bfkh, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, Avg([Kerek�tett 100 %-os illetm�ny (elt�r�tett)]/[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker]*40) AS Illetm�ny
FROM lkSzem�lyek
GROUP BY bfkh([Szervezeti egys�g k�dja]), lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[St�tusz neve]
HAVING (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY bfkh([Szervezeti egys�g k�dja]);
