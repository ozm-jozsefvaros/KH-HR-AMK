SELECT lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)] AS D�tum, 0 AS [Bel�p�k sz�ma], Count(lkSzem�lyek.Ad�jel) AS [Kil�p�k sz�ma]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[Jogviszony t�pusa / jogviszony t�pus]) Like "munka*" Or (lkSzem�lyek.[Jogviszony t�pusa / jogviszony t�pus]) Like "korm*"))
GROUP BY lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)], 0
HAVING (((lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)]) Between Now() And DateSerial(Year(Now()),Month(Now())+1,Day(Now()))));
