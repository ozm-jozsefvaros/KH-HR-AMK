SELECT "Mindösszesen" AS Zóna, lkLétszámBesorolásonkéntHavibólAlaplétszámÉsKözpontosított.Besorolás_bemenet, Sum(lkLétszámBesorolásonkéntHavibólAlaplétszámÉsKözpontosított.Nexonban) AS SumOfNexonban
FROM (SELECT lkLétszámBesorolásonkéntHavibólKözpontosított.Zóna, lkLétszámBesorolásonkéntHavibólKözpontosított.Besorolás_bemenet, lkLétszámBesorolásonkéntHavibólKözpontosított.Nexonban
FROM lkLétszámBesorolásonkéntHavibólKözpontosított
UNION
SELECT lkLétszámBesorolásonkéntHavibólAlaplétszám.Zóna, lkLétszámBesorolásonkéntHavibólAlaplétszám.Besorolás_bemenet, lkLétszámBesorolásonkéntHavibólAlaplétszám.Nexonban
FROM lkLétszámBesorolásonkéntHavibólAlaplétszám
)  AS lkLétszámBesorolásonkéntHavibólAlaplétszámÉsKözpontosított
GROUP BY "Mindösszesen", lkLétszámBesorolásonkéntHavibólAlaplétszámÉsKözpontosított.Besorolás_bemenet;
