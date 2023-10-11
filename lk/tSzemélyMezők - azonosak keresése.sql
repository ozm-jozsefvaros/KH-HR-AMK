SELECT tSzemélyMezõk.Mezõnév, tSzemélyMezõk.Típus, tSzemélyMezõk.Az
FROM tSzemélyMezõk
WHERE (((tSzemélyMezõk.Mezõnév) In (SELECT [Mezõnév] FROM [tSzemélyMezõk] As Tmp GROUP BY [Mezõnév],[Típus] HAVING Count(*)>1  And [Típus] = [tSzemélyMezõk].[Típus])))
ORDER BY tSzemélyMezõk.Mezõnév, tSzemélyMezõk.Típus;
