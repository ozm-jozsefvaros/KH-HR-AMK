SELECT Replace(Replace([F�oszt�ly/Vezet�],"Budapest F�v�ros Korm�nyhivatala","BFKH"),"  "," ") AS F�oszt�ly, Uni�2122.Oszt�ly, Sum(Uni�2122.[2021]) AS SumOf2021, Sum(Uni�2122.[2022]) AS SumOf2022, Sum(Uni�2122.[2023]) AS SumOf2023
FROM (SELECT tEnged�lyezettL�tsz�mok.[F�oszt�ly/Vezet�], tEnged�lyezettL�tsz�mok.Oszt�ly, tEnged�lyezettL�tsz�mok.L�tsz�m AS 2021, 0 AS 2022, 0 AS 2023
FROM tEnged�lyezettL�tsz�mok
WHERE (((tEnged�lyezettL�tsz�mok.Hat�ly)=#1/1/2021#))
UNION
SELECT tEnged�lyezettL�tsz�mok.[F�oszt�ly/Vezet�], tEnged�lyezettL�tsz�mok.Oszt�ly, 0 AS 2021, tEnged�lyezettL�tsz�mok.L�tsz�m AS 2022, 0 AS 2023
FROM tEnged�lyezettL�tsz�mok
WHERE (((tEnged�lyezettL�tsz�mok.Hat�ly)=#1/1/2022#))
UNION
SELECT tEnged�lyezettL�tsz�mok.[F�oszt�ly/Vezet�], tEnged�lyezettL�tsz�mok.Oszt�ly, 0 AS 2021, 0 AS 2022, tEnged�lyezettL�tsz�mok.L�tsz�m AS 2023
FROM tEnged�lyezettL�tsz�mok
WHERE (((tEnged�lyezettL�tsz�mok.Hat�ly)=#3/25/2023#))
)  AS Uni�2122
GROUP BY Uni�2122.Oszt�ly, Replace([F�oszt�ly/Vezet�],"Budapest F�v�ros Korm�nyhivatala","BFKH");
