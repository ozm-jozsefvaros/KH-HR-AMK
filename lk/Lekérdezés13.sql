TRANSFORM Count(lkBel�p�k2019Jelenig.F�) AS CountOfF�
SELECT lkBel�p�k2019Jelenig.F�oszt�ly, lkBel�p�k2019Jelenig.Oszt�ly
FROM lkBel�p�k2019Jelenig
GROUP BY lkBel�p�k2019Jelenig.BFKH, lkBel�p�k2019Jelenig.F�oszt�ly, lkBel�p�k2019Jelenig.Oszt�ly
ORDER BY lkBel�p�k2019Jelenig.BFKH
PIVOT lkBel�p�k2019Jelenig.[Bel�p�s �ve hava];
