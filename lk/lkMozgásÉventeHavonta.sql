SELECT Mozgás.Év, Sum(Mozgás.[01]) AS 01_, Sum(Mozgás.[02]) AS 02_, Sum(Mozgás.[03]) AS 03_, Sum(Mozgás.[04]) AS 04_, Sum(Mozgás.[05]) AS 05_, Sum(Mozgás.[06]) AS 06_, Sum(Mozgás.[07]) AS 07_, Sum(Mozgás.[08]) AS 08_, Sum(Mozgás.[09]) AS 09_, Sum(Mozgás.[10]) AS 10_, Sum(Mozgás.[11]) AS 11_, Sum(Mozgás.[12]) AS 12_, Sum(Mozgás.Belépõk) AS Mozgás
FROM (SELECT *
FROM lkBelépõkSzámaÉventeHavonta3
UNION
SELECT lkKilépõkSzámaÉventeHavonta3.Év
, lkKilépõkSzámaÉventeHavonta3.[01] * -1
, lkKilépõkSzámaÉventeHavonta3.[02] * -1
, lkKilépõkSzámaÉventeHavonta3.[03] * -1
, lkKilépõkSzámaÉventeHavonta3.[04] * -1
, lkKilépõkSzámaÉventeHavonta3.[05] * -1
, lkKilépõkSzámaÉventeHavonta3.[06] * -1
, lkKilépõkSzámaÉventeHavonta3.[07] * -1
, lkKilépõkSzámaÉventeHavonta3.[08] * -1
, lkKilépõkSzámaÉventeHavonta3.[09] * -1
, lkKilépõkSzámaÉventeHavonta3.[10] * -1
, lkKilépõkSzámaÉventeHavonta3.[11] * -1
, lkKilépõkSzámaÉventeHavonta3.[12] * -1
, lkKilépõkSzámaÉventeHavonta3.Kilépõk * -1
FROM lkKilépõkSzámaÉventeHavonta3
)  AS Mozgás
GROUP BY Mozgás.Év;
