SELECT DISTINCT lkIlletm�nyek.T�rzssz�m, lkIlletm�nyek.F�oszt�ly, lkIlletm�nyek.Oszt�ly, lkIlletm�nyek.N�v, lkIlletm�nyek.[40 �r�s illetm�ny], lkIlletm�nyek.TT
FROM lkIlletm�nyek LEFT JOIN lkIlletm�nyekBottom30 ON lkIlletm�nyek.[40 �r�s illetm�ny] = lkIlletm�nyekBottom30.[40 �r�s illetm�ny]
WHERE (((lkIlletm�nyekBottom30.[40 �r�s illetm�ny]) Is Not Null));
