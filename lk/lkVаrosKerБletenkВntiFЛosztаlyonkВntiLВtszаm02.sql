TRANSFORM Sum(lkV�rosKer�letenk�ntiF�oszt�lyonk�ntiL�tsz�m01.L�tsz�m) AS SumOfL�tsz�m
SELECT lkV�rosKer�letenk�ntiF�oszt�lyonk�ntiL�tsz�m01.F�oszt�ly
FROM lkV�rosKer�letenk�ntiF�oszt�lyonk�ntiL�tsz�m01
GROUP BY lkV�rosKer�letenk�ntiF�oszt�lyonk�ntiL�tsz�m01.F�oszt�ly
PIVOT lkV�rosKer�letenk�ntiF�oszt�lyonk�ntiL�tsz�m01.Ker�let in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,"egy�b");
