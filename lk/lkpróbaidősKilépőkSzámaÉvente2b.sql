SELECT lkpróbaidõsKilépõkSzámaÉventeHavonta.Év, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta.[Kilépõk száma]) AS Kilépõk
FROM lkpróbaidõsKilépõkSzámaÉventeHavonta
GROUP BY lkpróbaidõsKilépõkSzámaÉventeHavonta.Év;
