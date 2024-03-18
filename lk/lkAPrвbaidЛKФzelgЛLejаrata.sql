SELECT DISTINCT lkSzem�lyek.F�oszt�ly AS F�oszt�ly, lkSzem�lyek.Oszt�ly AS Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve] AS N�v, lkSzem�lyek.[Hivatali email] AS [Hivatali email], lkSzem�lyek.[Szerz�d�s/Kinevez�s - pr�baid� v�ge] AS [Pr�baid� v�ge]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[Szerz�d�s/Kinevez�s - pr�baid� v�ge]) Between DateSerial(Year(Date()),Month(Date()),1) And DateSerial(Year(Date()),Month(Date())+2,1)-1))
ORDER BY lkSzem�lyek.[Szerz�d�s/Kinevez�s - pr�baid� v�ge];
