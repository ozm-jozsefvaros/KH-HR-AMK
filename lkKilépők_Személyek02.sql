TRANSFORM Sum(lkKilépõk_Személyek01.Létszám) AS SumOfLétszám
SELECT lkKilépõk_Személyek01.KilépésHava
FROM lkKilépõk_Személyek01
WHERE (((lkKilépõk_Személyek01.KilépésÉve)>2018))
GROUP BY lkKilépõk_Személyek01.KilépésHava
PIVOT lkKilépõk_Személyek01.KilépésÉve;
