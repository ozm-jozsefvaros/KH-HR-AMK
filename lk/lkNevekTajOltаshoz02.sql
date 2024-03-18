SELECT lkNevekOltáshoz.Fõosztály, lkNevekOltáshoz.Osztály, lkNevekOltáshoz.DolgTeljNeve, lkSzemélyek.[TAJ szám], [Születési hely] & ", " & [Születési idõ] AS [szül hely \ idõ], lkSzemélyek.[Anyja neve], lkSzemélyek.[Állandó lakcím], lkNevekOltáshoz.Oltandók, lkSzemélyek.[Hivatali email]
FROM lkNevekOltáshoz LEFT JOIN lkSzemélyek ON lkNevekOltáshoz.DolgTeljNeve=lkSzemélyek.[Dolgozó teljes neve]
WHERE (((lkSzemélyek.[TAJ szám]) Is Not Null));
