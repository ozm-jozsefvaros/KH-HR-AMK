SELECT lkV�rosKer�letenk�ntiF�oszt�lyonk�ntiL�tsz�m01.F�oszt�ly, lkV�rosKer�letenk�ntiF�oszt�lyonk�ntiL�tsz�m01.Ker�let, [L�tsz�m]/[F�oszt�lyiL�tsz�m] AS Ar�ny
FROM lkV�rosKer�letenk�ntiF�oszt�lyonk�ntiL�tsz�m01 INNER JOIN lkF�oszt�lyonk�ntiBet�lt�ttL�tsz�m ON lkV�rosKer�letenk�ntiF�oszt�lyonk�ntiL�tsz�m01.F�oszt�ly=lkF�oszt�lyonk�ntiBet�lt�ttL�tsz�m.F�oszt�ly;
