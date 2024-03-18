SELECT lkHaviLétszámUnió.BFKHKód, lkHaviLétszámUnió.Fõosztály, lkHaviLétszámUnió.Osztály, Sum(lkHaviLétszámUnió.Betöltött) AS [Betöltött létszám], Sum(lkHaviLétszámUnió.Üres) AS [Üres álláshely], lkHaviLétszámUnió.TT
FROM lkHaviLétszámUnió
GROUP BY lkHaviLétszámUnió.BFKHKód, lkHaviLétszámUnió.Fõosztály, lkHaviLétszámUnió.Osztály, lkHaviLétszámUnió.TT
ORDER BY bfkh([BFKHkód]);
