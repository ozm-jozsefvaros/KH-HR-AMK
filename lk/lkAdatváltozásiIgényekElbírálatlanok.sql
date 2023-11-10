SELECT lkSzem�lyek.F�oszt�ly AS F�oszt�ly, lkSzem�lyek.Oszt�ly AS Oszt�ly, lkAdatv�ltoztat�siIg�nyek.[Dolgoz� neve] AS N�v, lkAdatv�ltoztat�siIg�nyek.�llapot AS �llapot, Format([Ig�ny d�tuma],"yyyymmdd") AS [Ig�ny kelte], kt_azNexon_Ad�jel.NLink AS NLink
FROM kt_azNexon_Ad�jel RIGHT JOIN (lkAdatv�ltoztat�siIg�nyek LEFT JOIN lkSzem�lyek ON lkAdatv�ltoztat�siIg�nyek.Ad�jel = lkSzem�lyek.Ad�jel) ON kt_azNexon_Ad�jel.Ad�jel = lkAdatv�ltoztat�siIg�nyek.Ad�jel
WHERE (((lkAdatv�ltoztat�siIg�nyek.�llapot)="Elb�r�latlan"))
ORDER BY lkSzem�lyek.BFKH, lkAdatv�ltoztat�siIg�nyek.[Dolgoz� neve], lkSzem�lyek.[St�tusz k�dja];
