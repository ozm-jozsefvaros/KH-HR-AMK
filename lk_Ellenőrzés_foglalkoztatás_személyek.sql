SELECT lkSzemélyek.Adójel, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS [Heti óraszám], IIf([Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]=40,"T","R") AS Foglalkoztatás, lkSzemélyek.[Státusz típusa], lkSzemélyek.[Szervezeti egység kódja]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz típusa]) Is Not Null) AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null))
ORDER BY lkSzemélyek.[Dolgozó teljes neve];
