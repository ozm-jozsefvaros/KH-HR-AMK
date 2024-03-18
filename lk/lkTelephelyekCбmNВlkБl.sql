SELECT DISTINCT lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Munkav�gz�s helye - megnevez�s], lkSzem�lyek.[Munkav�gz�s helye - c�m], Count(lkSzem�lyek.Ad�jel) AS CountOfAd�jel
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely") AND ((lkSzem�lyek.[Munkav�gz�s helye - c�m]) Is Null)) OR (((lkSzem�lyek.[St�tusz neve])="�ll�shely") AND ((Len([Munkav�gz�s helye - c�m]))<3))
GROUP BY lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Munkav�gz�s helye - megnevez�s], lkSzem�lyek.[Munkav�gz�s helye - c�m];
