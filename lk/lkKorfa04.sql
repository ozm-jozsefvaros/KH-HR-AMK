SELECT "�sszesen:" AS Korcsoport, Sum(lkKorfa03.F�rfi) AS SumOfF�rfi, Sum(lkKorfa03.N�) AS SumOfN�
FROM lkKorfa03
GROUP BY "�sszesen:";
