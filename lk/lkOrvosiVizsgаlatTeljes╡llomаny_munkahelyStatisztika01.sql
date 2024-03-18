SELECT IIf([Munkavégzés helye - cím] Is Null Or [Munkavégzés helye - cím]="",[Munkavégzés helye - megnevezés],[Munkavégzés helye - cím]) AS Cím, lkOrvosiVizsgálatTeljesÁllomány_EgészségügyiSzolgáltatóAdataival.[TAJ szám], Irsz([Cím])*1 AS irsz, kerület([irsz]) AS Kerület, IIf(Kerület([irsz]) Between 1 And 3 Or kerület([irsz]) Between 11 And 12 Or kerület([irsz])=22,"Buda","Pest") AS Oldal
FROM lkOrvosiVizsgálatTeljesÁllomány_EgészségügyiSzolgáltatóAdataival INNER JOIN lkSzemélyek ON lkOrvosiVizsgálatTeljesÁllomány_EgészségügyiSzolgáltatóAdataival.[TAJ szám] = lkSzemélyek.[TAJ szám]
WHERE (((lkOrvosiVizsgálatTeljesÁllomány_EgészségügyiSzolgáltatóAdataival.Lejárt_e)="Lejárt"))
ORDER BY lkOrvosiVizsgálatTeljesÁllomány_EgészségügyiSzolgáltatóAdataival.[TAJ szám] DESC;
