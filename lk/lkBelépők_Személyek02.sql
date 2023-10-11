TRANSFORM Sum(lkBelépõk_Személyek01.Létszám) AS SumOfLétszám
SELECT lkBelépõk_Személyek01.BelépésHava
FROM lkBelépõk_Személyek01
WHERE (((lkBelépõk_Személyek01.BelépésÉve)>2018))
GROUP BY lkBelépõk_Személyek01.BelépésHava
PIVOT lkBelépõk_Személyek01.BelépésÉve;
