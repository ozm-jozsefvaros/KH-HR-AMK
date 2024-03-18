SELECT lkBel�p�kUni�.Ad�azonos�t� AS Ad�jel, lkSzem�lyekMind.[Dolgoz� teljes neve], Nz([lkBel�p�kUni�].[F�oszt�ly],[lkSzem�lyekMind].[F�oszt�ly]) AS F�oszt, Nz([lkBel�p�kUni�].[Oszt�ly],[lkSzem�lyekMind].[Oszt�ly]) AS Oszt, ffsplit([Feladatk�r],"-",2) AS [Ell�tand� feladat], lkSzem�lyekMind.[Jogviszony kezdete (bel�p�s d�tuma)] AS Bel�p�s, lkSzem�lyekMind.[Jogviszony v�ge (kil�p�s d�tuma)] AS Kil�p�s
FROM lkSzem�lyekMind INNER JOIN lkBel�p�kUni� ON (lkSzem�lyekMind.Ad�jel = lkBel�p�kUni�.Ad�jel) AND (lkSzem�lyekMind.[Jogviszony kezdete (bel�p�s d�tuma)] = lkBel�p�kUni�.[Jogviszony kezd� d�tuma])
WHERE (((Nz([lkBel�p�kUni�].[F�oszt�ly],[lkSzem�lyekMind].[F�oszt�ly])) Like "Hum�n*") AND ((ffsplit([Feladatk�r],"-",2))<>"") AND ((lkSzem�lyekMind.[Jogviszony kezdete (bel�p�s d�tuma)])<=[Az id�szak v�ge]) AND ((lkSzem�lyekMind.[Jogviszony v�ge (kil�p�s d�tuma)])>=[Az id�szak kezdete]));
