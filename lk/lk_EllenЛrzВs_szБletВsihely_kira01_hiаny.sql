SELECT bfkh(Nz([Szervezeti egys�g k�dja],0)) AS bfkh, IIf(Nz([F�oszt�ly],"")="","_Kil�pett",[F�oszt�ly]) AS F�oszt, lkSzem�lyek.Oszt�ly, lkSzem�lyek.Ad�jel, lkSzem�lyek.[Dolgoz� teljes neve], "A sz�let�si hely nincs kit�ltve" AS Hiba, "" AS [Sz�let�si helye], "" AS Javasolt, kt_azNexon_Ad�jel02.NLink
FROM lkSzem�lyek LEFT JOIN kt_azNexon_Ad�jel02 ON lkSzem�lyek.Ad�jel = kt_azNexon_Ad�jel02.Ad�jel
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely") AND ((Len(Nz([Sz�let�si hely],"")))<2))
ORDER BY bfkh(Nz([Szervezeti egys�g k�dja],0)), IIf(Nz([F�oszt�ly],"")="","_Kil�pett",[F�oszt�ly]), lkSzem�lyek.[Dolgoz� teljes neve];
