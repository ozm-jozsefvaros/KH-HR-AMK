SELECT lkV�rosOldalank�ntiL�tsz�m01.Oldal, lkV�rosOldalank�ntiL�tsz�m01.F�oszt�ly, Sum(lkV�rosOldalank�ntiL�tsz�m01.f�) AS SumOff�
FROM lkV�rosOldalank�ntiL�tsz�m01
GROUP BY lkV�rosOldalank�ntiL�tsz�m01.Oldal, lkV�rosOldalank�ntiL�tsz�m01.F�oszt�ly;
