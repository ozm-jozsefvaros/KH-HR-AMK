SELECT lkTTvége01.VégeHó, 0 AS 2023_év, 0 AS 2024_év, lkTTvége01.Létszám AS 2025_év
FROM lkTTvége01
WHERE (((lkTTvége01.Dátum) Between #1/1/2025# And #12/31/2025#));
