SELECT DISTINCT bfkh(Nz([Szervezeti egys�g k�dja],1)) AS bfkh, lkSzem�lyek.[Szervezeti egys�g k�dja], lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[Szervezeti egys�g k�dja]) Is Not Null))
ORDER BY bfkh(Nz([Szervezeti egys�g k�dja],1));
