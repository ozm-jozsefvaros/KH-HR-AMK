SELECT DISTINCT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Hivatali email] AS [Hivatali email], lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége] AS [Próbaidõ vége]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége]) Between DateSerial(Year(Date()),Month(Date()),1) And DateSerial(Year(Date()),Month(Date())+2,1)-1))
ORDER BY lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége];
