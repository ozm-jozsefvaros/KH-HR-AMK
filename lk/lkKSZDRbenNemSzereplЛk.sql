SELECT DISTINCT bfkh([F�oszt�lyK�d]) AS BFKH, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)] AS Bel�p�s
FROM lkSzem�lyek LEFT JOIN tKSZDR ON lkSzem�lyek.[Ad�azonos�t� jel] = tKSZDR.[Ad�azonos�t� jel]
WHERE (((tKSZDR.[Teljes n�v]) Is Null) AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY bfkh([F�oszt�lyK�d]), lkSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)];
