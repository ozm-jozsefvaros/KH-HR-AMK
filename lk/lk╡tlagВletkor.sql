SELECT Eredm.[Kif1] AS Kif2, #1/1/1867# AS Kif3, DateDiff("yyyy",[Kif2]+[Kif3],Now()) AS �tlag�letkor
FROM (SELECT Avg(Mid([Ad�jel],2,5)) AS Kif1, lkSzem�lyek.[St�tusz neve]
FROM lkSzem�lyek
GROUP BY lkSzem�lyek.[St�tusz neve]
HAVING (((lkSzem�lyek.[St�tusz neve])="�ll�shely")))  AS Eredm;
