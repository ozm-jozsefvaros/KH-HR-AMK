SELECT [F�oszt] AS F�oszt�ly, IIf([Oszt1]="",[F�oszt],[Oszt1]) AS Oszt, Sum(lkEnged�lyezett�sL�tsz�mKimenet.L2021) AS L2021, Sum(lkEnged�lyezett�sL�tsz�mKimenet.L2022) AS L2022, Sum(lkEnged�lyezett�sL�tsz�mKimenet.L2023) AS L2023, Sum(lkEnged�lyezett�sL�tsz�mKimenet.TT2021) AS TT2021, Sum(lkEnged�lyezett�sL�tsz�mKimenet.TT2022) AS TT2022, Sum(lkEnged�lyezett�sL�tsz�mKimenet.TT2023) AS TT2023
FROM lkEnged�lyezett�sL�tsz�mKimenet
GROUP BY [F�oszt], IIf([Oszt1]="",[F�oszt],[Oszt1]);
