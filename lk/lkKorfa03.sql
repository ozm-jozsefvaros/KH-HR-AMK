SELECT "Összesen:" AS Korcsoport, Sum(lkKorfa02.Férfiak) AS Férfiak, Sum(lkKorfa02.Nõk) AS Nõk
FROM lkKorfa02
GROUP BY "Összesen:";
