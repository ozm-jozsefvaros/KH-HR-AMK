SELECT Unió.Korcsoport, Unió.SumOfFérfi AS Férfi, Unió.SumOfNõ AS Nõ, *
FROM (SELECT *
FROM lkKorfa04
UNION
SELECT *
FROM lkKorfa05)  AS Unió;
