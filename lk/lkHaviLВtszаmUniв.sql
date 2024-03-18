SELECT *, "A" as Jelleg
FROM lkHaviLétszámJárási
UNION
SELECT *, "A" as Jelleg
FROM  lkHaviLétszámKormányhivatali
UNION SELECT *, "K" as Jelleg
FROM  lkHaviLétszámKözpontosított;
