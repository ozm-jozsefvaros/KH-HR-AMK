SELECT Uni�.Korcsoport, Uni�.SumOfF�rfi AS F�rfi, Uni�.SumOfN� AS N�, *
FROM (SELECT *
FROM lkKorfa04
UNION
SELECT *
FROM lkKorfa05)  AS Uni�;
