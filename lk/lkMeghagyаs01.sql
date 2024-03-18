SELECT tMeghagyandókAránya.Azonosító, tMeghagyandókAránya.Főosztály, lkSzervezetiBetöltések.FőosztályKód, lkSzervezetiBetöltések.[Szülő szervezeti egységének kódja], 1 AS Létszám, tMeghagyandókAránya.Meghagyandó AS [Meghagyandó%], lkSzervezetiBetöltések.[Szervezetmenedzsment kód]
FROM lkSzemélyek INNER JOIN (tMeghagyandókAránya INNER JOIN lkSzervezetiBetöltések ON tMeghagyandókAránya.[Szervezeti egység kódja] = lkSzervezetiBetöltések.FőosztályKód) ON lkSzemélyek.[Adóazonosító jel] = lkSzervezetiBetöltések.[Szervezetmenedzsment kód]
WHERE (((lkSzemélyek.[Besorolási  fokozat (KT)])<>"Főosztályvezető" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Osztályvezető" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Járási / kerületi hivatal vezetője" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Járási / kerületi hivatal vezetőjének helyettese" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Főispán" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Kormányhivatal főigazgatója" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Kormányhivatal igazgatója") AND ((Year(Now())-Year([Születési idő])) Between 18 And 50) AND ((lkSzemélyek.Neme)="férfi"));
