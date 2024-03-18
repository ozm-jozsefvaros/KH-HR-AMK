TRANSFORM Count(lkSzemélyekMind.Azonosító) AS [Kilépõk száma]
SELECT lkSzemélyekMind.[HR kapcsolat megszûnés módja (Kilépés módja)]
FROM tSzemélyek INNER JOIN lkSzemélyekMind ON tSzemélyek.Azonosító = lkSzemélyekMind.Azonosító
WHERE (((lkSzemélyekMind.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (lkSzemélyekMind.[KIRA jogviszony jelleg])="Munkaviszony") AND ((lkSzemélyekMind.JogviszonyVége) Is Not Null Or (lkSzemélyekMind.JogviszonyVége)<>"") AND ((Year([JogviszonyVége]))>=2019 And (Year([JogviszonyVége]))<=Year(Now())))
GROUP BY lkSzemélyekMind.[HR kapcsolat megszûnés módja (Kilépés módja)]
ORDER BY Year([JogviszonyVége])
PIVOT Year([JogviszonyVége]);
