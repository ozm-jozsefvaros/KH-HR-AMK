SELECT DISTINCT lkIlletm�nyek�sszevet�sP�nz�ggyel01.F�oszt�ly, lkIlletm�nyek�sszevet�sP�nz�ggyel01.Oszt�ly, lkIlletm�nyek�sszevet�sP�nz�ggyel01.N�v, lkIlletm�nyek�sszevet�sP�nz�ggyel01.PGF, lkIlletm�nyek�sszevet�sP�nz�ggyel01.NEXON, lkIlletm�nyek�sszevet�sP�nz�ggyel01.[Heti �ra], lkIlletm�nyek�sszevet�sP�nz�ggyel01.[Nexon 40 �ra], lkIlletm�nyek�sszevet�sP�nz�ggyel01.Link AS NLink
FROM lkIlletm�nyek�sszevet�sP�nz�ggyel01
WHERE (((lkIlletm�nyek�sszevet�sP�nz�ggyel01.NEXON)<>[PGF]));
