SELECT *
FROM (SELECT 1 as sor, lkV�rosKer�letenk�ntiF�oszt�lyonk�ntiL�tsz�m02.*
FROM lkV�rosKer�letenk�ntiF�oszt�lyonk�ntiL�tsz�m02
UNION
SELECT 2 as sor, lkV�rosKer�letenk�ntiF�oszt�lyonk�ntiL�tsz�m03.*
FROM  lkV�rosKer�letenk�ntiF�oszt�lyonk�ntiL�tsz�m03)  AS 02�S03;
