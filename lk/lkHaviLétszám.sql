SELECT lkHaviLétszámUnió.BFKHKód, lkHaviLétszámUnió.Fõosztály, lkHaviLétszámUnió.Osztály, Sum(lkHaviLétszámUnió.Betöltött) AS [Betöltött létszám], Sum(lkHaviLétszámUnió.Üres) AS [Üres álláshely]
FROM (SELECT *, "A" as Jelleg
FROM lkHaviLétszámJárási
UNION
SELECT *, "A" as Jelleg
FROM  lkHaviLétszámKormányhivatali
UNION
SELECT *, "K" as Jelleg
FROM  lkHaviLétszámKözpontosított
)  AS lkHaviLétszámUnió
GROUP BY lkHaviLétszámUnió.BFKHKód, lkHaviLétszámUnió.Fõosztály, lkHaviLétszámUnió.Osztály
ORDER BY bfkh([BFKHkód]);
