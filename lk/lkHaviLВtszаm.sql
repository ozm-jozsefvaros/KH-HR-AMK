SELECT lkHaviL�tsz�mUni�.BFKHK�d, lkHaviL�tsz�mUni�.F�oszt�ly, lkHaviL�tsz�mUni�.Oszt�ly, Sum(lkHaviL�tsz�mUni�.Bet�lt�tt) AS [Bet�lt�tt l�tsz�m], Sum(lkHaviL�tsz�mUni�.�res) AS [�res �ll�shely], lkHaviL�tsz�mUni�.TT
FROM lkHaviL�tsz�mUni�
GROUP BY lkHaviL�tsz�mUni�.BFKHK�d, lkHaviL�tsz�mUni�.F�oszt�ly, lkHaviL�tsz�mUni�.Oszt�ly, lkHaviL�tsz�mUni�.TT
ORDER BY bfkh([BFKHk�d]);
