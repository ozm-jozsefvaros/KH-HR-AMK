SELECT Year([Jogviszony kezdete (belépés dátuma)]) AS Év, Month([Jogviszony kezdete (belépés dátuma)]) AS Hó, Count(tSzemélyek.Azonosító) AS [Belépõk száma]
FROM tSzemélyek
WHERE (((tSzemélyek.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (tSzemélyek.[KIRA jogviszony jelleg])="Munkaviszony") AND ((tSzemélyek.[Jogviszony kezdete (belépés dátuma)]) Is Not Null Or (tSzemélyek.[Jogviszony kezdete (belépés dátuma)])<>""))
GROUP BY Year([Jogviszony kezdete (belépés dátuma)]), Month([Jogviszony kezdete (belépés dátuma)])
HAVING (((Year([Jogviszony kezdete (belépés dátuma)]))>=2019 And (Year([Jogviszony kezdete (belépés dátuma)]))<=Year(Now())))
ORDER BY Year([Jogviszony kezdete (belépés dátuma)]), Month([Jogviszony kezdete (belépés dátuma)]);
