SELECT lkV�gzetts�gek.Ad�jel, lkSzem�lyek.BFKH, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve] AS N�v, lkV�gzetts�gek.[V�gzetts�g neve], lkSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)] AS Bel�p�s
FROM lkSzem�lyek INNER JOIN lkV�gzetts�gek ON lkSzem�lyek.Ad�jel = lkV�gzetts�gek.Ad�jel
WHERE (((lkV�gzetts�gek.[V�gzetts�g neve])="korm�nyablak �gyint�z�i vizsga (NKE)") AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely")) OR (((lkV�gzetts�gek.[V�gzetts�g neve])="korm�nyablak �gyint�z�"))
ORDER BY lkSzem�lyek.BFKH;
