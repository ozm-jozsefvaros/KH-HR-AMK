TRANSFORM Count(lkBelépõk2019Jelenig.Fõ) AS CountOfFõ
SELECT lkBelépõk2019Jelenig.Fõosztály, lkBelépõk2019Jelenig.Osztály
FROM lkBelépõk2019Jelenig
GROUP BY lkBelépõk2019Jelenig.BFKH, lkBelépõk2019Jelenig.Fõosztály, lkBelépõk2019Jelenig.Osztály
ORDER BY lkBelépõk2019Jelenig.BFKH
PIVOT lkBelépõk2019Jelenig.[Belépés éve hava];
