SELECT IIf(Left([irsz],1)=1,Right([irsz],2),"Egyéb") AS Kerület, Sum(lkVárosOldalankéntiLétszám01.fõ) AS SumOffõ
FROM lkVárosOldalankéntiLétszám01
GROUP BY IIf(Left([irsz],1)=1,Right([irsz],2),"Egyéb");
