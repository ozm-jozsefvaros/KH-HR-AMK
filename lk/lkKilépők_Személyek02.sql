TRANSFORM Sum(lkKil�p�k_Szem�lyek01.L�tsz�m) AS SumOfL�tsz�m
SELECT lkKil�p�k_Szem�lyek01.Kil�p�sHava
FROM lkKil�p�k_Szem�lyek01
WHERE (((lkKil�p�k_Szem�lyek01.Kil�p�s�ve)>2018))
GROUP BY lkKil�p�k_Szem�lyek01.Kil�p�sHava
PIVOT lkKil�p�k_Szem�lyek01.Kil�p�s�ve;
