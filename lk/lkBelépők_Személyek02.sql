TRANSFORM Sum(lkBel�p�k_Szem�lyek01.L�tsz�m) AS SumOfL�tsz�m
SELECT lkBel�p�k_Szem�lyek01.Bel�p�sHava
FROM lkBel�p�k_Szem�lyek01
WHERE (((lkBel�p�k_Szem�lyek01.Bel�p�s�ve)>2018))
GROUP BY lkBel�p�k_Szem�lyek01.Bel�p�sHava
PIVOT lkBel�p�k_Szem�lyek01.Bel�p�s�ve;
