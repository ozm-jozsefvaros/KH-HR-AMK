SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.FEOR, lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker], lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)]
FROM lkSzemélyek
WHERE (((lkSzemélyek.FEOR)="8416 - Személygépkocsi-vezetõ") AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null)) OR (((lkSzemélyek.[Dolgozó teljes neve])="Kovács Tibor")) OR (((lkSzemélyek.[Dolgozó teljes neve])="Döbrei Lajos"));
