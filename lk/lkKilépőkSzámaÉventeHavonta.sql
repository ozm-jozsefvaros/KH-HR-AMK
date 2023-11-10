SELECT Year([Jogviszony vége (kilépés dátuma)]) AS Év, Month([Jogviszony vége (kilépés dátuma)]) AS Hó, Count(tSzemélyek.Azonosító) AS [Kilépõk száma]
FROM tSzemélyek
WHERE (((tSzemélyek.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (tSzemélyek.[KIRA jogviszony jelleg])="Munkaviszony") AND ((tSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Not Null Or (tSzemélyek.[Jogviszony vége (kilépés dátuma)])<>""))
GROUP BY Year([Jogviszony vége (kilépés dátuma)]), Month([Jogviszony vége (kilépés dátuma)])
HAVING (((Year([Jogviszony vége (kilépés dátuma)]))>=2019 And (Year([Jogviszony vége (kilépés dátuma)]))<=Year(Now())+1))
ORDER BY Year([Jogviszony vége (kilépés dátuma)]), Month([Jogviszony vége (kilépés dátuma)]);
