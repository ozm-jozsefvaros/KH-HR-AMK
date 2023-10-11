SELECT lkVárosOldalankéntiLétszám01.Oldal, Sum(lkVárosOldalankéntiLétszám01.fõ) AS Létszám
FROM lkVárosOldalankéntiLétszám01
GROUP BY lkVárosOldalankéntiLétszám01.Oldal;
