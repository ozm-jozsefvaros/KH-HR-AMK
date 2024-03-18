SELECT Year([JogviszonyVége]) AS Év, Month([JogviszonyVége]) AS Hó, Count(lkSzemélyekMind.Azonosító) AS [Kilépõk száma]
FROM lkSzemélyekMind
WHERE (((lkSzemélyekMind.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (lkSzemélyekMind.[KIRA jogviszony jelleg])="Munkaviszony") AND ((lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)]) Is Not Null Or (lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)])<>"") AND ((Year([JogviszonyVége]))>=2019 And (Year([JogviszonyVége]))<=Year(Now())+1))
GROUP BY Year([JogviszonyVége]), Month([JogviszonyVége])
ORDER BY Year([JogviszonyVége]), Month([JogviszonyVége]);
