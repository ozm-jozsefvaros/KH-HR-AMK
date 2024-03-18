SELECT lkSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)] AS D�tum, Count(lkSzem�lyek.Ad�jel) AS [Bel�p�k sz�ma], 0 AS [Kil�p�k sz�ma]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[Jogviszony t�pusa / jogviszony t�pus]) Like "munka*" Or (lkSzem�lyek.[Jogviszony t�pusa / jogviszony t�pus]) Like "korm*"))
GROUP BY lkSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)], 0
HAVING (((lkSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)]) Between Now() And DateSerial(Year(Now()),Month(Now())+1,Day(Now()))));
