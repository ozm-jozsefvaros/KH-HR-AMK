SELECT lkMeghagy�s01.Azonos�t�, lkMeghagy�s01.F�oszt�lyK�d, lkMeghagy�s01.F�oszt�ly, Count(lkMeghagy�s01.L�tsz�m) AS CountOfL�tsz�m, lkMeghagy�s01.[Meghagyand�%], Sum([L�tsz�m]*[Meghagyand�%]/100) AS [Meghagyand� l�tsz�m]
FROM lkMeghagy�s01
GROUP BY lkMeghagy�s01.Azonos�t�, lkMeghagy�s01.F�oszt�lyK�d, lkMeghagy�s01.F�oszt�ly, lkMeghagy�s01.[Meghagyand�%];
