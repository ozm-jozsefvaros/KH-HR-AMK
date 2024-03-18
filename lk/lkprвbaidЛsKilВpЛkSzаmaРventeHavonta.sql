SELECT Year([JogviszonyV�ge]) AS �v, Month([JogviszonyV�ge]) AS H�, Count(lkSzem�lyekMind.Azonos�t�) AS [Kil�p�k sz�ma]
FROM lkSzem�lyekMind
WHERE (((lkSzem�lyekMind.[KIRA jogviszony jelleg]) Like "Korm�nyzati*" Or (lkSzem�lyekMind.[KIRA jogviszony jelleg])="Munkaviszony") AND ((lkSzem�lyekMind.JogviszonyV�ge) Is Not Null Or (lkSzem�lyekMind.JogviszonyV�ge)<>"") AND ((lkSzem�lyekMind.[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)]) Like "*pr�baid�*") AND ((Year([JogviszonyV�ge]))>=2019 And (Year([JogviszonyV�ge]))<=Year(Now())))
GROUP BY Year([JogviszonyV�ge]), Month([JogviszonyV�ge])
ORDER BY Year([JogviszonyV�ge]), Month([JogviszonyV�ge]);
