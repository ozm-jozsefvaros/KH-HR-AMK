SELECT lkKilépõkSzámaÉventeHavonta.Év, Sum(lkKilépõkSzámaÉventeHavonta.[Kilépõk száma]) AS Kilépõk
FROM lkKilépõkSzámaÉventeHavonta
GROUP BY lkKilépõkSzámaÉventeHavonta.Év;
