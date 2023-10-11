SELECT lkTTvége02.VégeHó, Sum(lkTTvége02.[2023_év]) AS [2023 év], Sum(lkTTvége02.[2024_év]) AS [2024 év], Sum(lkTTvége02.[2025_év]) AS [2025 év]
FROM lkTTvége02
GROUP BY lkTTvége02.VégeHó;
