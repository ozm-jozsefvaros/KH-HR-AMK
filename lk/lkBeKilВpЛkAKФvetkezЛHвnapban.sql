SELECT KiBel�p�k.D�tum, Sum(KiBel�p�k.[Bel�p�k sz�ma]) AS [Bel�p�k sz�ma], Sum(KiBel�p�k.[Kil�p�k sz�ma]) AS [Kil�p�k sz�ma], [Bel�p�k sz�ma]-[Kil�p�k sz�ma] AS Mozg�s
FROM (SELECT 
lkBel�p�kSz�ma.D�tum, lkBel�p�kSz�ma.[Bel�p�k sz�ma], lkBel�p�kSz�ma.[Kil�p�k sz�ma]
FROM lkBel�p�kSz�ma
UNION SELECT
lkKil�p�kSz�ma.D�tum, lkKil�p�kSz�ma.[Bel�p�k sz�ma], lkKil�p�kSz�ma.[Kil�p�k sz�ma]
FROM  lkKil�p�kSz�ma
)  AS KiBel�p�k
GROUP BY KiBel�p�k.D�tum, [Bel�p�k sz�ma]-[Kil�p�k sz�ma];
