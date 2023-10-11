TRANSFORM Sum([SumOfBelépõk]+[SumOfKilépõk]) AS Összeg
SELECT lkBeKilépõk01.Hó
FROM lkBeKilépõk01
GROUP BY lkBeKilépõk01.Hó
PIVOT lkBeKilépõk01.Év;
