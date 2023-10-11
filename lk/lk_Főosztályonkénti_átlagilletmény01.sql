SELECT lkSzemélyek.Fõosztály, Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40) AS Illetmény
FROM lkSzemélyek
GROUP BY lkSzemélyek.Fõosztály, lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely"));
