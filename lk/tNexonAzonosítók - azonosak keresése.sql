SELECT tNexonAzonos�t�k.[Szem�ly azonos�t�], tNexonAzonos�t�k.[HR kapcsolat azonos�t�], First(tNexonAzonos�t�k.[Azonos�t�]) AS FirstOfAzonos�t�
FROM tNexonAzonos�t�k
GROUP BY tNexonAzonos�t�k.[Szem�ly azonos�t�], tNexonAzonos�t�k.[HR kapcsolat azonos�t�]
HAVING (((tNexonAzonos�t�k.[Szem�ly azonos�t�]) In (SELECT [Szem�ly azonos�t�] FROM [tNexonAzonos�t�k] As Tmp GROUP BY [Szem�ly azonos�t�],[HR kapcsolat azonos�t�] HAVING Count(*)>1  And [HR kapcsolat azonos�t�] = [tNexonAzonos�t�k].[HR kapcsolat azonos�t�])))
ORDER BY tNexonAzonos�t�k.[Szem�ly azonos�t�], tNexonAzonos�t�k.[HR kapcsolat azonos�t�], First(tNexonAzonos�t�k.[Azonos�t�]) DESC;
