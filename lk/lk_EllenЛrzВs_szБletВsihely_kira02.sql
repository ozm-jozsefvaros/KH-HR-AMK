SELECT BudapestRomaiEsHiany.F�oszt�ly, BudapestRomaiEsHiany.Oszt�ly, BudapestRomaiEsHiany.N�v, BudapestRomaiEsHiany.Hiba, BudapestRomaiEsHiany.[Sz�let�si hely], BudapestRomaiEsHiany.Javaslat, BudapestRomaiEsHiany.NLink
FROM (SELECT
  lk_Ellen�rz�s_sz�let�sihely_kira01.bfkh
, lk_Ellen�rz�s_sz�let�sihely_kira01.F�oszt AS F�oszt�ly
, lk_Ellen�rz�s_sz�let�sihely_kira01.Oszt�ly AS Oszt�ly
, lk_Ellen�rz�s_sz�let�sihely_kira01.[Dolgoz� teljes neve] AS N�v
, lk_Ellen�rz�s_sz�let�sihely_kira01.Hiba
, lk_Ellen�rz�s_sz�let�sihely_kira01.[Sz�let�s helye] AS [Sz�let�si hely]
, IIf([Javasolt] Like "*00*","-- nincs javaslat --",[Javasolt]) AS Javaslat
, lk_Ellen�rz�s_sz�let�sihely_kira01.NLink AS NLink 
FROM lk_Ellen�rz�s_sz�let�sihely_kira01
UNION
SELECT
  lk_Ellen�rz�s_sz�let�sihely_kira01_hi�ny.bfkh
, lk_Ellen�rz�s_sz�let�sihely_kira01_hi�ny.F�oszt
, lk_Ellen�rz�s_sz�let�sihely_kira01_hi�ny.Oszt�ly
, lk_Ellen�rz�s_sz�let�sihely_kira01_hi�ny.[Dolgoz� teljes neve] as N�v
, lk_Ellen�rz�s_sz�let�sihely_kira01_hi�ny.Hiba
, lk_Ellen�rz�s_sz�let�sihely_kira01_hi�ny.[Sz�let�si helye]
, "-- nincs javaslat --" as Javaslat
, lk_Ellen�rz�s_sz�let�sihely_kira01_hi�ny.NLink
FROM lk_Ellen�rz�s_sz�let�sihely_kira01_hi�ny
)  AS BudapestRomaiEsHiany
ORDER BY BudapestRomaiEsHiany.bfkh, BudapestRomaiEsHiany.Oszt�ly, BudapestRomaiEsHiany.N�v;
