SELECT Eredm.[Kif1] AS Kif2, #1/1/1867# AS Kif3, DateDiff("yyyy",[Kif2]+[Kif3],Now()) AS Átlagéletkor
FROM (SELECT Avg(Mid([Adójel],2,5)) AS Kif1, lkSzemélyek.[Státusz neve]
FROM lkSzemélyek
GROUP BY lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely")))  AS Eredm;
