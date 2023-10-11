SELECT lkSzemélyek.[Státusz kódja], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve]
FROM lkSzemélyek LEFT JOIN (SELECT Kormányhivatali_állomány.[Álláshely azonosító]
FROM Kormányhivatali_állomány
UNION
SELECT Járási_állomány.[Álláshely azonosító]
FROM Járási_állomány
UNION
SELECT Központosítottak.[Álláshely azonosító]
FROM Központosítottak)  AS HaviÁlláshelyAz ON lkSzemélyek.[Státusz kódja] = HaviÁlláshelyAz.[Álláshely azonosító]
WHERE (((lkSzemélyek.[státusz neve])="Álláshely") AND ((HaviÁlláshelyAz.[Álláshely azonosító]) Is Null))
ORDER BY lkSzemélyek.BFKH, lkSzemélyek.[Dolgozó teljes neve];
