SELECT DISTINCT lkSzem�lyek.F�oszt�ly AS F�oszt�ly, lkSzem�lyek.Oszt�ly AS Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve] AS N�v, lkSzem�lyek.[St�tusz k�lts�ghely�nek neve] AS K�lts�ghely, lkSzem�lyek.[St�tusz k�lts�ghely�nek k�dja] AS [K�lts�ghely k�d], kt_azNexon_Ad�jel02.NLink AS NLink, lkSzem�lyek.[St�tusz neve]
FROM kt_azNexon_Ad�jel02 RIGHT JOIN lkSzem�lyek ON kt_azNexon_Ad�jel02.Ad�jel = lkSzem�lyek.Ad�jel
WHERE (((lkSzem�lyek.[St�tusz t�pusa])="Szervezeti alapl�tsz�m") AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"));
