SELECT DISTINCT Unió.Fõosztály, Unió.Osztály, Unió.DolgTeljNeve, Unió.[TAJ szám], Unió.[szül hely \ idõ], Unió.[Anyja neve], Unió.[Állandó lakcím], Unió.Oltandók, *
FROM (SELECT  lkNevekTajOltáshoz02.*
FROM lkNevekTajOltáshoz02
UNION SELECT lkNevekTajOltáshoz01.*
FROM  lkNevekTajOltáshoz01
)  AS Unió;
