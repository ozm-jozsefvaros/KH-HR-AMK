SELECT lkV�rosOldalank�ntiL�tsz�m01.F�oszt�ly, IIf(Left([irsz],1)=1,Right([irsz],2)*1,"Egy�b") AS Ker�let, Sum(lkV�rosOldalank�ntiL�tsz�m01.f�) AS L�tsz�m
FROM lkV�rosOldalank�ntiL�tsz�m01
GROUP BY lkV�rosOldalank�ntiL�tsz�m01.F�oszt�ly, IIf(Left([irsz],1)=1,Right([irsz],2)*1,"Egy�b");
