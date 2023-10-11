SELECT Year([Jogviszony kezdete (bel�p�s d�tuma)]) AS �v, Month([Jogviszony kezdete (bel�p�s d�tuma)]) AS H�, Count(tSzem�lyek.Azonos�t�) AS [Bel�p�k sz�ma]
FROM tSzem�lyek
WHERE (((tSzem�lyek.[KIRA jogviszony jelleg]) Like "Korm�nyzati*" Or (tSzem�lyek.[KIRA jogviszony jelleg])="Munkaviszony") AND ((tSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)]) Is Not Null Or (tSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)])<>""))
GROUP BY Year([Jogviszony kezdete (bel�p�s d�tuma)]), Month([Jogviszony kezdete (bel�p�s d�tuma)])
HAVING (((Year([Jogviszony kezdete (bel�p�s d�tuma)]))>=2019 And (Year([Jogviszony kezdete (bel�p�s d�tuma)]))<=Year(Now())))
ORDER BY Year([Jogviszony kezdete (bel�p�s d�tuma)]), Month([Jogviszony kezdete (bel�p�s d�tuma)]);
