SELECT Korcsoport, sum([F�rfi]) AS F�rfiak, sum([N�]) AS N�k
FROM lkKorfa01
GROUP BY Korcsoport;
