SELECT bfkh([Szervezeti egység kódja]) AS bfkh, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40) AS Illetmény
FROM lkSzemélyek
GROUP BY bfkh([Szervezeti egység kódja]), lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY bfkh([Szervezeti egység kódja]);
