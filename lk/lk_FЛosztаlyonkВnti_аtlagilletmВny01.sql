SELECT bfkh([FõosztályKód]) AS FK, lkSzemélyek.Fõosztály, Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40) AS Illetmény
FROM lkSzemélyek
GROUP BY bfkh([FõosztályKód]), lkSzemélyek.Fõosztály, lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely"));
