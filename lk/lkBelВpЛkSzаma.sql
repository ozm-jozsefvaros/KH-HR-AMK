SELECT lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Dátum, Count(lkSzemélyek.Adójel) AS [Belépõk száma], 0 AS [Kilépõk száma]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Like "munka*" Or (lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Like "korm*"))
GROUP BY lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], 0
HAVING (((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)]) Between Now() And DateSerial(Year(Now()),Month(Now())+1,Day(Now()))));
