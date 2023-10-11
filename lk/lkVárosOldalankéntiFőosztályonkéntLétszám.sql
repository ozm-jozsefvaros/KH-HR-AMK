SELECT lkVárosOldalankéntiLétszám01.Oldal, lkVárosOldalankéntiLétszám01.Fõosztály, Sum(lkVárosOldalankéntiLétszám01.fõ) AS SumOffõ
FROM lkVárosOldalankéntiLétszám01
GROUP BY lkVárosOldalankéntiLétszám01.Oldal, lkVárosOldalankéntiLétszám01.Fõosztály;
