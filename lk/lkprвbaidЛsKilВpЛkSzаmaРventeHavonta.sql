SELECT Year([JogviszonyVége]) AS Év, Month([JogviszonyVége]) AS Hó, Count(lkSzemélyekMind.Azonosító) AS [Kilépõk száma]
FROM lkSzemélyekMind
WHERE (((lkSzemélyekMind.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (lkSzemélyekMind.[KIRA jogviszony jelleg])="Munkaviszony") AND ((lkSzemélyekMind.JogviszonyVége) Is Not Null Or (lkSzemélyekMind.JogviszonyVége)<>"") AND ((lkSzemélyekMind.[HR kapcsolat megszûnés módja (Kilépés módja)]) Like "*próbaidõ*") AND ((Year([JogviszonyVége]))>=2019 And (Year([JogviszonyVége]))<=Year(Now())))
GROUP BY Year([JogviszonyVége]), Month([JogviszonyVége])
ORDER BY Year([JogviszonyVége]), Month([JogviszonyVége]);
