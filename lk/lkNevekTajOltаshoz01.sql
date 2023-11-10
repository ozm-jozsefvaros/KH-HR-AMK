SELECT lkNevekOltáshoz.Főosztály, lkNevekOltáshoz.Osztály, lkNevekOltáshoz.DolgTeljNeve, lkSzemélyek.[TAJ szám], [Születési hely] & ", " & [Születési idő] AS [szül hely \ idő], lkSzemélyek.[Anyja neve], lkSzemélyek.[Állandó lakcím], lkNevekOltáshoz.Oltandók, lkSzemélyek.[Hivatali email]
FROM lkSzemélyek RIGHT JOIN lkNevekOltáshoz ON lkSzemélyek.[Dolgozó teljes neve]=lkNevekOltáshoz.Oltandók
WHERE (((lkSzemélyek.[TAJ szám]) Is Not Null));
