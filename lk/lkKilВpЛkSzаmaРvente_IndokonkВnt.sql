TRANSFORM Count(lkSzem�lyekMind.Azonos�t�) AS [Kil�p�k sz�ma]
SELECT lkSzem�lyekMind.[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)]
FROM tSzem�lyek INNER JOIN lkSzem�lyekMind ON tSzem�lyek.Azonos�t� = lkSzem�lyekMind.Azonos�t�
WHERE (((lkSzem�lyekMind.[KIRA jogviszony jelleg]) Like "Korm�nyzati*" Or (lkSzem�lyekMind.[KIRA jogviszony jelleg])="Munkaviszony") AND ((lkSzem�lyekMind.JogviszonyV�ge) Is Not Null Or (lkSzem�lyekMind.JogviszonyV�ge)<>"") AND ((Year([JogviszonyV�ge]))>=2019 And (Year([JogviszonyV�ge]))<=Year(Now())))
GROUP BY lkSzem�lyekMind.[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)]
ORDER BY Year([JogviszonyV�ge])
PIVOT Year([JogviszonyV�ge]);
