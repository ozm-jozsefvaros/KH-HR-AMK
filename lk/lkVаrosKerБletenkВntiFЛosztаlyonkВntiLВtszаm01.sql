SELECT lkVárosOldalankéntiLétszám01.Fõosztály, IIf(Left([irsz],1)=1,Right([irsz],2)*1,"Egyéb") AS Kerület, Sum(lkVárosOldalankéntiLétszám01.fõ) AS Létszám
FROM lkVárosOldalankéntiLétszám01
GROUP BY lkVárosOldalankéntiLétszám01.Fõosztály, IIf(Left([irsz],1)=1,Right([irsz],2)*1,"Egyéb");
