SELECT lkTTvége01.VégeHó, 0 AS 2023_év, lkTTvége01.Létszám AS 2024_év, 0 AS 2025_év
FROM lkTTvége01
WHERE (((lkTTvége01.Dátum) Between #1/1/2024# And #12/31/2024#));
