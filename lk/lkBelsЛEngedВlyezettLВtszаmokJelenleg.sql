SELECT tBels�Enged�lyezettL�tsz�mok.F�oszt�lyK�d, tBels�Enged�lyezettL�tsz�mok.F�oszt�ly, tBels�Enged�lyezettL�tsz�mok.Oszt�ly, Sum(tBels�Enged�lyezettL�tsz�mok.Enged�lyV�ltoz�s) AS L�tsz�m
FROM tBels�Enged�lyezettL�tsz�mok
GROUP BY tBels�Enged�lyezettL�tsz�mok.F�oszt�lyK�d, tBels�Enged�lyezettL�tsz�mok.F�oszt�ly, tBels�Enged�lyezettL�tsz�mok.Oszt�ly;
