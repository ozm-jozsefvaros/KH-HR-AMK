SELECT Korcsoport, Count(lkKorfa01.Ad�) AS CountOfAd�jel, Neme
FROM lkKorfa01
GROUP BY Korcsoport, Neme;
