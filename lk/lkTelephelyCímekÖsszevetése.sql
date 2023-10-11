SELECT DISTINCT lkTelephelyek.Sorsz�m, lkTelephelyek.Irsz, lkTelephelyek.V�ros, lkTelephelyek.C�m, lkTelephelyek.Tulajdonos, lkTelephelyek.�zemeltet�, Count(lkSzem�lyTelephelyek.Ad�jel) AS L�tsz�m
FROM lkTelephelyek RIGHT JOIN lkSzem�lyTelephelyek ON lkTelephelyek.C�m_Szem�lyek = lkSzem�lyTelephelyek.TelephelyC�me
GROUP BY lkTelephelyek.Sorsz�m, lkTelephelyek.Irsz, lkTelephelyek.V�ros, lkTelephelyek.C�m, lkTelephelyek.Tulajdonos, lkTelephelyek.�zemeltet�;
