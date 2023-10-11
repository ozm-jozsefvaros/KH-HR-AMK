TRANSFORM Count(tSzem�lyek.Azonos�t�) AS [Kil�p�k sz�ma]
SELECT tSzem�lyek.[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)]
FROM tSzem�lyek
WHERE (((tSzem�lyek.[KIRA jogviszony jelleg]) Like "Korm�nyzati*" Or (tSzem�lyek.[KIRA jogviszony jelleg])="Munkaviszony") AND ((tSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)]) Is Not Null Or (tSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)])<>"") AND ((Year([Jogviszony v�ge (kil�p�s d�tuma)]))>=2019 And (Year([Jogviszony v�ge (kil�p�s d�tuma)]))<=Year(Now())))
GROUP BY tSzem�lyek.[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)]
ORDER BY Year([Jogviszony v�ge (kil�p�s d�tuma)])
PIVOT Year([Jogviszony v�ge (kil�p�s d�tuma)]);
