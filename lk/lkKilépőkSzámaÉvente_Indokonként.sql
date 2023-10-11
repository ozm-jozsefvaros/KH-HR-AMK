TRANSFORM Count(tSzemélyek.Azonosító) AS [Kilépõk száma]
SELECT tSzemélyek.[HR kapcsolat megszûnés módja (Kilépés módja)]
FROM tSzemélyek
WHERE (((tSzemélyek.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (tSzemélyek.[KIRA jogviszony jelleg])="Munkaviszony") AND ((tSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Not Null Or (tSzemélyek.[Jogviszony vége (kilépés dátuma)])<>"") AND ((Year([Jogviszony vége (kilépés dátuma)]))>=2019 And (Year([Jogviszony vége (kilépés dátuma)]))<=Year(Now())))
GROUP BY tSzemélyek.[HR kapcsolat megszûnés módja (Kilépés módja)]
ORDER BY Year([Jogviszony vége (kilépés dátuma)])
PIVOT Year([Jogviszony vége (kilépés dátuma)]);
