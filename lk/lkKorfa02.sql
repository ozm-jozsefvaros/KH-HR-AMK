SELECT Korcsoport, Count(lkKorfa01.Adó) AS CountOfAdójel, Neme
FROM lkKorfa01
GROUP BY Korcsoport, Neme;
