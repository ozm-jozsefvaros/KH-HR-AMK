SELECT lkKorfa03.Korcsoport, Sum(lkKorfa03.F�rfi) AS SumOfF�rfi, Sum(lkKorfa03.N�) AS SumOfN�
FROM lkKorfa03
GROUP BY lkKorfa03.Korcsoport;
