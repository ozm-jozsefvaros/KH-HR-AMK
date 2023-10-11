SELECT BeKil�p�k.Kil�p�s�ve AS �v, BeKil�p�k.Kil�p�sHava AS H�, Sum(BeKil�p�k.Bel�p�k) AS SumOfBel�p�k, Sum(BeKil�p�k.Kil�p�k) AS SumOfKil�p�k
FROM (SELECT Ad�azonos�t�, lkKil�p�k_Szem�lyek01.Kil�p�s�ve, lkKil�p�k_Szem�lyek01.Kil�p�sHava, 0 As Bel�p�k, lkKil�p�k_Szem�lyek01.L�tsz�m AS Kil�p�k 
FROM lkKil�p�k_Szem�lyek01

UNION
SELECT Ad�azonos�t�, lkBel�p�k_Szem�lyek01.Bel�p�s�ve, lkBel�p�k_Szem�lyek01.Bel�p�sHava, lkBel�p�k_Szem�lyek01.L�tsz�m AS Bel�p�k, 0 as Kil�p�k
FROM lkBel�p�k_Szem�lyek01

)  AS BeKil�p�k
GROUP BY BeKil�p�k.Kil�p�s�ve, BeKil�p�k.Kil�p�sHava
HAVING ((([BeKil�p�k].[Kil�p�s�ve])>2018));
