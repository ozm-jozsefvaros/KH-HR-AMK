SELECT 1 as sor, lkSzemélyek.Fõosztály, Count(lkSzemélyek.Adójel) AS FõosztályiLétszám
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
GROUP BY lkSzemélyek.Fõosztály, lkSzemélyek.[Státusz neve]

UNION SELECT 2 as sor, "Összesen:" as Fõosztály, Count(lkSzemélyek.Adójel) AS CountOfAdójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
GROUP BY lkSzemélyek.[Státusz neve];
