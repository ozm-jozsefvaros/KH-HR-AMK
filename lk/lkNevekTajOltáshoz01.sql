SELECT lkNevekOlt�shoz.F�oszt�ly, lkNevekOlt�shoz.Oszt�ly, lkNevekOlt�shoz.DolgTeljNeve, lkSzem�lyek.[TAJ sz�m], [Sz�let�si hely] & ", " & [Sz�let�si id�] AS [sz�l hely \ id�], lkSzem�lyek.[Anyja neve], lkSzem�lyek.[�lland� lakc�m], lkNevekOlt�shoz.Oltand�k, lkSzem�lyek.[Hivatali email]
FROM lkSzem�lyek RIGHT JOIN lkNevekOlt�shoz ON lkSzem�lyek.[Dolgoz� teljes neve]=lkNevekOlt�shoz.Oltand�k
WHERE (((lkSzem�lyek.[TAJ sz�m]) Is Not Null));
