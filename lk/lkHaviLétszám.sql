SELECT lkHaviL�tsz�mUni�.BFKHK�d, lkHaviL�tsz�mUni�.F�oszt�ly, lkHaviL�tsz�mUni�.Oszt�ly, Sum(lkHaviL�tsz�mUni�.Bet�lt�tt) AS [Bet�lt�tt l�tsz�m], Sum(lkHaviL�tsz�mUni�.�res) AS [�res �ll�shely]
FROM (SELECT *, "A" as Jelleg
FROM lkHaviL�tsz�mJ�r�si
UNION
SELECT *, "A" as Jelleg
FROM  lkHaviL�tsz�mKorm�nyhivatali
UNION
SELECT *, "K" as Jelleg
FROM  lkHaviL�tsz�mK�zpontos�tott
)  AS lkHaviL�tsz�mUni�
GROUP BY lkHaviL�tsz�mUni�.BFKHK�d, lkHaviL�tsz�mUni�.F�oszt�ly, lkHaviL�tsz�mUni�.Oszt�ly
ORDER BY bfkh([BFKHk�d]);
