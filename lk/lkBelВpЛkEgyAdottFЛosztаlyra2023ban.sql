SELECT lkBel�p�kUni�.N�v, lkBel�p�kUni�.F�oszt�ly, lkBel�p�kUni�.Oszt�ly, ffsplit([Feladatk�r],"-",2) AS [Ell�tand� feladat], lkBel�p�kUni�.[Jogviszony kezd� d�tuma]
FROM lkBel�p�kUni� RIGHT JOIN tSzem�lyek ON (lkBel�p�kUni�.[Jogviszony kezd� d�tuma] = tSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)]) AND (lkBel�p�kUni�.Ad�azonos�t� = tSzem�lyek.[Ad�azonos�t� jel])
WHERE (((lkBel�p�kUni�.F�oszt�ly) Like [Szervezeti egys�g] & "*") AND ((lkBel�p�kUni�.[Jogviszony kezd� d�tuma]) Between #1/1/2023# And #12/31/2023#));
