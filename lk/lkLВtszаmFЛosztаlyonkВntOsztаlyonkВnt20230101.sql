SELECT lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2023.F�oszt�ly, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2023.Oszt�ly, 0 AS TTL�tsz�m2021, 0 AS TTL�tsz�m2022, 0 AS TTL�tsz�m2023, Sum(lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2023.L�tsz�m2023) AS SumOfL�tsz�m2023
FROM lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2023
GROUP BY lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2023.F�oszt�ly, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2023.Oszt�ly, 0, 0, 0;
