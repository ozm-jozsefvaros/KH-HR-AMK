SELECT *
FROM lkEllenõrzõLekérdezések2
WHERE [Osztály] = [qWhere] AND [Kimenet]=true
ORDER BY [LapNév], [TáblaCím];
