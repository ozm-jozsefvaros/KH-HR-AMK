SELECT lkSzem�lyTelephelyek.[Szervezeti egys�g k�dja], lkSzem�lyTelephelyek.F�oszt�ly, lkSzem�lyTelephelyek.Oszt�ly, lkTelephelyek.Sorsz�m, lkSzem�lyTelephelyek.[Dolgoz� teljes neve], lkTelephelyek.Irsz, lkTelephelyek.V�ros, lkTelephelyek.C�m, lkTelephelyek.Tulajdonos, lkTelephelyek.�zemeltet�, 1 AS L�tsz�m
FROM lkTelephelyek RIGHT JOIN lkSzem�lyTelephelyek ON lkTelephelyek.C�m_Szem�lyek=lkSzem�lyTelephelyek.TelephelyC�me
ORDER BY bfkh([Szervezeti egys�g k�dja]);
