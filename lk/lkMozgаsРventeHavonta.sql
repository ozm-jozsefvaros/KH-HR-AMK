SELECT Mozg�s.�v, Sum(Mozg�s.[01]) AS [01 h�], Sum(Mozg�s.[02]) AS [02 h�], Sum(Mozg�s.[03]) AS [03 h�], Sum(Mozg�s.[04]) AS [04 h�], Sum(Mozg�s.[05]) AS [05 h�], Sum(Mozg�s.[06]) AS [06 h�], Sum(Mozg�s.[07]) AS [07 h�], Sum(Mozg�s.[08]) AS [08 h�], Sum(Mozg�s.[09]) AS [09 h�], Sum(Mozg�s.[10]) AS [10 h�], Sum(Mozg�s.[11]) AS [11 h�], Sum(Mozg�s.[12]) AS [12 h�], Sum(Mozg�s.Bel�p�k) AS Mozg�s
FROM (SELECT *
FROM lkBel�p�kSz�ma�venteHavonta3
UNION
SELECT lkKil�p�kSz�ma�venteHavonta3.�v
, lkKil�p�kSz�ma�venteHavonta3.[01] * -1
, lkKil�p�kSz�ma�venteHavonta3.[02] * -1
, lkKil�p�kSz�ma�venteHavonta3.[03] * -1
, lkKil�p�kSz�ma�venteHavonta3.[04] * -1
, lkKil�p�kSz�ma�venteHavonta3.[05] * -1
, lkKil�p�kSz�ma�venteHavonta3.[06] * -1
, lkKil�p�kSz�ma�venteHavonta3.[07] * -1
, lkKil�p�kSz�ma�venteHavonta3.[08] * -1
, lkKil�p�kSz�ma�venteHavonta3.[09] * -1
, lkKil�p�kSz�ma�venteHavonta3.[10] * -1
, lkKil�p�kSz�ma�venteHavonta3.[11] * -1
, lkKil�p�kSz�ma�venteHavonta3.[12] * -1
, lkKil�p�kSz�ma�venteHavonta3.Kil�p�k * -1
FROM lkKil�p�kSz�ma�venteHavonta3
)  AS Mozg�s
GROUP BY Mozg�s.�v;
