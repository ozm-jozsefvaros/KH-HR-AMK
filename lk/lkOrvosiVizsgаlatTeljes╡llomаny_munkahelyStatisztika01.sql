SELECT IIf([Munkav�gz�s helye - c�m] Is Null Or [Munkav�gz�s helye - c�m]="",[Munkav�gz�s helye - megnevez�s],[Munkav�gz�s helye - c�m]) AS C�m, lkOrvosiVizsg�latTeljes�llom�ny_Eg�szs�g�gyiSzolg�ltat�Adataival.[TAJ sz�m], Irsz([C�m])*1 AS irsz, ker�let([irsz]) AS Ker�let, IIf(Ker�let([irsz]) Between 1 And 3 Or ker�let([irsz]) Between 11 And 12 Or ker�let([irsz])=22,"Buda","Pest") AS Oldal
FROM lkOrvosiVizsg�latTeljes�llom�ny_Eg�szs�g�gyiSzolg�ltat�Adataival INNER JOIN lkSzem�lyek ON lkOrvosiVizsg�latTeljes�llom�ny_Eg�szs�g�gyiSzolg�ltat�Adataival.[TAJ sz�m] = lkSzem�lyek.[TAJ sz�m]
WHERE (((lkOrvosiVizsg�latTeljes�llom�ny_Eg�szs�g�gyiSzolg�ltat�Adataival.Lej�rt_e)="Lej�rt"))
ORDER BY lkOrvosiVizsg�latTeljes�llom�ny_Eg�szs�g�gyiSzolg�ltat�Adataival.[TAJ sz�m] DESC;
