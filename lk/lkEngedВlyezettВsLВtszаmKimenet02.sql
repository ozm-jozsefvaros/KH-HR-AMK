SELECT [Fõoszt] AS Fõosztály, IIf([Oszt1]="",[Fõoszt],[Oszt1]) AS Oszt, Sum(lkEngedélyezettésLétszámKimenet.L2021) AS L2021, Sum(lkEngedélyezettésLétszámKimenet.L2022) AS L2022, Sum(lkEngedélyezettésLétszámKimenet.L2023) AS L2023, Sum(lkEngedélyezettésLétszámKimenet.TT2021) AS TT2021, Sum(lkEngedélyezettésLétszámKimenet.TT2022) AS TT2022, Sum(lkEngedélyezettésLétszámKimenet.TT2023) AS TT2023
FROM lkEngedélyezettésLétszámKimenet
GROUP BY [Fõoszt], IIf([Oszt1]="",[Fõoszt],[Oszt1]);
