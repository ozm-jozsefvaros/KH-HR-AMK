SELECT IIf(Left([irsz],1)=1,Right([irsz],2),"Egy�b") AS Ker�let, Sum(lkV�rosOldalank�ntiL�tsz�m01.f�) AS SumOff�
FROM lkV�rosOldalank�ntiL�tsz�m01
GROUP BY IIf(Left([irsz],1)=1,Right([irsz],2),"Egy�b");
