SELECT Mid(Replace([FõosztályKód],"BFKH.1.",""),1,InStr(1,Replace([FõosztályKód],"BFKH.1.",""),".")-1) AS Sor, lkSzemélyek.Fõosztály, lkSzemélyek.[Munkavégzés helye - cím], Irsz([Munkavégzés helye - cím])*1 AS irsz, kerület([irsz]) AS Kerület, IIf(Kerület([irsz]) Between 1 And 3 Or kerület([irsz]) Between 11 And 12 Or kerület([irsz])=22,"Buda","Pest") AS Oldal, 1 AS fõ
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.Fõosztály;
