SELECT "Összesen:" AS Korcsoport, Sum(lkKorfa03.Férfi) AS SumOfFérfi, Sum(lkKorfa03.Nõ) AS SumOfNõ
FROM lkKorfa03
GROUP BY "Összesen:";
