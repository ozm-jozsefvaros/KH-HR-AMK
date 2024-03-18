SELECT TT21_22_23.F�oszt�ly, TT21_22_23.Oszt�ly, Sum(TT21_22_23.TTL�tsz�m2021) AS SumOfTTL�tsz�m2021, Sum(TT21_22_23.TTL�tsz�m2022) AS SumOfTTL�tsz�m2022, Sum(TT21_22_23.TTL�tsz�m2023) AS SumOfTTL�tsz�m2023, Sum(TT21_22_23.L�tsz�m2023) AS SumOfL�tsz�m2023
FROM (SELECT lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2021.F�oszt�ly, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2021.Oszt�ly, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2021.TTL�tsz�m2021, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2021.TTL�tsz�m2022, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2021.TTL�tsz�m2023, 0 as L�tsz�m2023
FROM lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2021
UNION
SELECT
lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2022.F�oszt�ly, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2022.Oszt�ly, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2022.TTL�tsz�m2021, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2022.TTL�tsz�m2022, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2022.TTL�tsz�m2023, 0 as L�tsz�m2023
FROM lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2022
UNION
SELECT lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2023.F�oszt�ly, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2023.Oszt�ly, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2023.TTL�tsz�m2021, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2023.TTL�tsz�m2022, lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2023.TTL�tsz�m2023, 0 as L�tsz�m2023
FROM lkTTL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt2023
UNION
SELECT lkL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt20230101.F�oszt�ly, lkL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt20230101.Oszt�ly, lkL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt20230101.TTL�tsz�m2021, lkL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt20230101.TTL�tsz�m2022, 0 as TTL�tsz�m2023, SumOfL�tsz�m2023
FROM lkL�tsz�mF�oszt�lyonk�ntOszt�lyonk�nt20230101)  AS TT21_22_23
GROUP BY TT21_22_23.F�oszt�ly, TT21_22_23.Oszt�ly;
