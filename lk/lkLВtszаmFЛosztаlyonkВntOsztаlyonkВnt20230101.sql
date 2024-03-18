SELECT lkTTLétszámFõosztályonkéntOsztályonként2023.Fõosztály, lkTTLétszámFõosztályonkéntOsztályonként2023.Osztály, 0 AS TTLétszám2021, 0 AS TTLétszám2022, 0 AS TTLétszám2023, Sum(lkTTLétszámFõosztályonkéntOsztályonként2023.Létszám2023) AS SumOfLétszám2023
FROM lkTTLétszámFõosztályonkéntOsztályonként2023
GROUP BY lkTTLétszámFõosztályonkéntOsztályonként2023.Fõosztály, lkTTLétszámFõosztályonkéntOsztályonként2023.Osztály, 0, 0, 0;
