SELECT "�sszesen:" AS Korcsoport, Sum(lkKorfa02.F�rfiak) AS F�rfiak, Sum(lkKorfa02.N�k) AS N�k
FROM lkKorfa02
GROUP BY "�sszesen:";
