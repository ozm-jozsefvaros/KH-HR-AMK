SELECT lkBelépõkSzámaÉventeHavonta.Év, Sum(lkBelépõkSzámaÉventeHavonta.[Belépõk száma]) AS Belépõk
FROM lkBelépõkSzámaÉventeHavonta
GROUP BY lkBelépõkSzámaÉventeHavonta.Év
HAVING (((lkBelépõkSzámaÉventeHavonta.Év)>=2019));
