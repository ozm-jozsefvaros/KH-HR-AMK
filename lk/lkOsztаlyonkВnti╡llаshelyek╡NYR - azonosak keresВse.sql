SELECT lkOszt�lyonk�nti�ll�shelyek�NYR.[�ll�shely azonos�t�], lkOszt�lyonk�nti�ll�shelyek�NYR.F�oszt
FROM lkOszt�lyonk�nti�ll�shelyek�NYR
WHERE (((lkOszt�lyonk�nti�ll�shelyek�NYR.[�ll�shely azonos�t�]) In (SELECT [�ll�shely azonos�t�] FROM [lkOszt�lyonk�nti�ll�shelyek�NYR] As Tmp GROUP BY [�ll�shely azonos�t�] HAVING Count(*)>1 )))
ORDER BY lkOszt�lyonk�nti�ll�shelyek�NYR.[�ll�shely azonos�t�];
