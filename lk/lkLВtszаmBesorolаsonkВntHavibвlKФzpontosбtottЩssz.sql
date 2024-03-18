SELECT lkLétszámBesorolásonkéntHavibólKözpontosított.Zóna, "Központosított összesen:" AS Besorolás_bemenet, Sum(lkLétszámBesorolásonkéntHavibólKözpontosított.Nexonban) AS SumOfNexonban
FROM lkLétszámBesorolásonkéntHavibólKözpontosított
GROUP BY lkLétszámBesorolásonkéntHavibólKözpontosított.Zóna, "Központosított összesen:";
