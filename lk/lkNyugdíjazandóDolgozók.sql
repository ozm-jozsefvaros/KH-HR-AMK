SELECT lkSzemélyek.[Dolgozó teljes neve], DateSerial(Year(Nz([Születési idõ],#1/1/1900#))+65,Month(Nz([Születési idõ],#1/1/1900#)),Day(Nz([Születési idõ],#1/1/1900#))) AS [Nyugdíjkorhatárt betölti], Year([Születési idõ])+65 AS Év, Format([Születési idõ],"mmmm") AS Hó, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.Besorolás2
FROM lkSzemélyek
WHERE (((DateSerial(Year(Nz([Születési idõ],#1/1/1900#))+65,Month(Nz([Születési idõ],#1/1/1900#)),Day(Nz([Születési idõ],#1/1/1900#)))) Between Date() And DateAdd("m",18,Date())) AND ((lkSzemélyek.[Státusz neve])="álláshely"))
ORDER BY Year([Születési idõ])+65, Month([Születési idõ]);
