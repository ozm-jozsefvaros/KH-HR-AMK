SELECT lk_Ellen�rz�s_sz�let�sihely_kira01.F�oszt AS F�oszt�ly, lk_Ellen�rz�s_sz�let�sihely_kira01.Oszt�ly AS Oszt�ly, lk_Ellen�rz�s_sz�let�sihely_kira01.[Dolgoz� teljes neve] AS N�v, lk_Ellen�rz�s_sz�let�sihely_kira01.Hiba, lk_Ellen�rz�s_sz�let�sihely_kira01.[Sz�let�s helye] AS [Sz�let�si hely], IIf([Javasolt] Like "*00*","-- nincs javaslat --",[Javasolt]) AS Javaslat, lk_Ellen�rz�s_sz�let�sihely_kira01.NLink AS NLink
FROM lk_Ellen�rz�s_sz�let�sihely_kira01
ORDER BY lk_Ellen�rz�s_sz�let�sihely_kira01.bfkh;
