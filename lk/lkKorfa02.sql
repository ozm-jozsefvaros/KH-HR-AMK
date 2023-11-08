SELECT Korcsoport, sum([Fő]) as  CountOfAdójel, Neme
FROM lkKorfa01
GROUP BY Korcsoport, Neme;
