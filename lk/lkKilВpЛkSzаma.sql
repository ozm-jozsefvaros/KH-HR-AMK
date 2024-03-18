SELECT lkSzemélyek.[Jogviszony vége (kilépés dátuma)] AS Dátum, 0 AS [Belépõk száma], Count(lkSzemélyek.Adójel) AS [Kilépõk száma]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Like "munka*" Or (lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Like "korm*"))
GROUP BY lkSzemélyek.[Jogviszony vége (kilépés dátuma)], 0
HAVING (((lkSzemélyek.[Jogviszony vége (kilépés dátuma)]) Between Now() And DateSerial(Year(Now()),Month(Now())+1,Day(Now()))));
