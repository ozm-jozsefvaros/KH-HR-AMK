SELECT tHónapok.hónap AS [Tartós távollét vége], Sum(lkTTvége02.[2024_év]) AS [2024 év], Sum(lkTTvége02.[2025_év]) AS [2025 év], Sum([2026_év]) AS [2026 év]
FROM tHónapok INNER JOIN lkTTvége02 ON tHónapok.Azonosító = lkTTvége02.VégeHó
GROUP BY tHónapok.hónap, lkTTvége02.VégeHó
ORDER BY lkTTvége02.VégeHó;
