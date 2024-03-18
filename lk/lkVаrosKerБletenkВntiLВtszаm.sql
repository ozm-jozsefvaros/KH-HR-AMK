SELECT lkVárosOldalankéntiLétszám01.Kerület, Sum(lkVárosOldalankéntiLétszám01.fõ) AS SumOffõ
FROM lkVárosOldalankéntiLétszám01
GROUP BY lkVárosOldalankéntiLétszám01.Kerület;
