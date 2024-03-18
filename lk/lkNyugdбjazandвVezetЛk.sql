SELECT Year([Születési idõ])+65 AS Év, Format([Születési idõ],"mmmm") AS Hó, lkMindenVezetõ.[Dolgozó teljes neve] AS Név, lkMindenVezetõ.Fõosztály, lkMindenVezetõ.Osztály, lkMindenVezetõ.Besorolás2 AS Besorolás
FROM lkMindenVezetõ
WHERE (((Year([Születési idõ])+65)<Year(Date())+4))
ORDER BY Year([Születési idõ])+65, Month([Születési idõ]), lkMindenVezetõ.BFKH;
