SELECT Mid(Replace([F�oszt�lyK�d],"BFKH.1.",""),1,InStr(1,Replace([F�oszt�lyK�d],"BFKH.1.",""),".")-1) AS Sor, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.[Munkav�gz�s helye - c�m], Irsz([Munkav�gz�s helye - c�m])*1 AS irsz, ker�let([irsz]) AS Ker�let, IIf(Ker�let([irsz]) Between 1 And 3 Or ker�let([irsz]) Between 11 And 12 Or ker�let([irsz])=22,"Buda","Pest") AS Oldal, 1 AS f�
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY lkSzem�lyek.F�oszt�ly;
