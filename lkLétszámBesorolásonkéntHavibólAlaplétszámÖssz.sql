SELECT lkLétszámBesorolásonkéntHavibólAlaplétszám.Zóna, "Alaplétszám összesen:" AS Besorolás_bemenet, Sum(lkLétszámBesorolásonkéntHavibólAlaplétszám.Nexonban) AS SumOfNexonban
FROM lkLétszámBesorolásonkéntHavibólAlaplétszám
GROUP BY lkLétszámBesorolásonkéntHavibólAlaplétszám.Zóna, "Alaplétszám összesen:";
