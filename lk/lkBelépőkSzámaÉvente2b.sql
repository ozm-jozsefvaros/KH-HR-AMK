SELECT lkBel�p�kSz�ma�venteHavonta.�v, Sum(lkBel�p�kSz�ma�venteHavonta.[Bel�p�k sz�ma]) AS Bel�p�k
FROM lkBel�p�kSz�ma�venteHavonta
GROUP BY lkBel�p�kSz�ma�venteHavonta.�v
HAVING (((lkBel�p�kSz�ma�venteHavonta.�v)>=2019));
