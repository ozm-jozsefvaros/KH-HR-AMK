SELECT lkSzem�lyTelephelyek.[Munkav�gz�s helye - c�m] AS Telephely, lkSzem�lyTelephelyek.F�oszt�ly, Count(lkSzem�lyTelephelyek.ad�jel) AS L�tsz�m
FROM lkSzem�lyTelephelyek
GROUP BY lkSzem�lyTelephelyek.[Munkav�gz�s helye - c�m], lkSzem�lyTelephelyek.F�oszt�ly;
