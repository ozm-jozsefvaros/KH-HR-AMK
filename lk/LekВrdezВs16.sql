SELECT DISTINCT lk_Ellenõrzés_03.Fõosztály, Count(*) AS [Sorok száma]
FROM lk_Ellenõrzés_03
GROUP BY lk_Ellenõrzés_03.Fõosztály;
