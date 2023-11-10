SELECT Korcsoport, sum([Férfi]) AS Férfiak, sum([Nõ]) AS Nõk
FROM lkKorfa01
GROUP BY Korcsoport;
