SELECT tTelephelyek.Mez�1 AS F�oszt�ly, tTelephelyek.[Szervezeti egys�g], lkSzem�lyek.[Szint 5 szervezeti egys�g n�v], lkSzem�lyek.[Dolgoz� teljes neve], tTelephelyek.C�m, lkSzem�lyek.[Munkav�gz�s helye - c�m], Left([C�m],4) AS Kif1, Left([Munkav�gz�s helye - c�m],4) AS Kif1
FROM lkSzem�lyek LEFT JOIN tTelephelyek ON lkSzem�lyek.[Szervezeti egys�g k�dja] = tTelephelyek.SzervezetK�d
WHERE (((lkSzem�lyek.[Szervezeti egys�g k�dja]) Is Not Null))
ORDER BY tTelephelyek.[Szervezeti egys�g];
