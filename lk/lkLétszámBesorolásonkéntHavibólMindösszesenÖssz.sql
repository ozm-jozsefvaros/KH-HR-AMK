SELECT lkLétszámBesorolásonkéntHavibólMindösszesen.Zóna, "Mindösszesen összesen:" AS Besorolás_bemenet, Sum(lkLétszámBesorolásonkéntHavibólMindösszesen.SumOfNexonban) AS SumOfSumOfNexonban
FROM lkLétszámBesorolásonkéntHavibólMindösszesen
GROUP BY lkLétszámBesorolásonkéntHavibólMindösszesen.Zóna, "Mindösszesen összesen:";
