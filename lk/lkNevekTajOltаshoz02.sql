SELECT lkNevekOlt�shoz.F�oszt�ly, lkNevekOlt�shoz.Oszt�ly, lkNevekOlt�shoz.DolgTeljNeve, lkSzem�lyek.[TAJ sz�m], [Sz�let�si hely] & ", " & [Sz�let�si id�] AS [sz�l hely \ id�], lkSzem�lyek.[Anyja neve], lkSzem�lyek.[�lland� lakc�m], lkNevekOlt�shoz.Oltand�k, lkSzem�lyek.[Hivatali email]
FROM lkNevekOlt�shoz LEFT JOIN lkSzem�lyek ON lkNevekOlt�shoz.DolgTeljNeve=lkSzem�lyek.[Dolgoz� teljes neve]
WHERE (((lkSzem�lyek.[TAJ sz�m]) Is Not Null));
