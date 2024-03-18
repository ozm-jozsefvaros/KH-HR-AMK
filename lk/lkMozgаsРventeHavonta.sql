SELECT Mozgás.Év, Sum(Mozgás.[01]) AS [01 hó], Sum(Mozgás.[02]) AS [02 hó], Sum(Mozgás.[03]) AS [03 hó], Sum(Mozgás.[04]) AS [04 hó], Sum(Mozgás.[05]) AS [05 hó], Sum(Mozgás.[06]) AS [06 hó], Sum(Mozgás.[07]) AS [07 hó], Sum(Mozgás.[08]) AS [08 hó], Sum(Mozgás.[09]) AS [09 hó], Sum(Mozgás.[10]) AS [10 hó], Sum(Mozgás.[11]) AS [11 hó], Sum(Mozgás.[12]) AS [12 hó], Sum(Mozgás.Belépõk) AS Mozgás
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
