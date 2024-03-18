SELECT DISTINCT lkSzervezetiBetöltések.FőosztályKód, tBesorolás_átalakító.Sorrend, lkSzervezetiBetöltések.[Státuszának kódja], Replace([Státuszának kódja],"S-","")*1 AS Szám, lkSzemélyek.[Dolgozó teljes neve] INTO tMeghagyásB01
FROM ((lkSzervezetiBetöltések INNER JOIN lkSzemélyek ON lkSzervezetiBetöltések.[Szervezetmenedzsment kód] = lkSzemélyek.[Adóazonosító jel]) INNER JOIN tBesorolás_átalakító ON lkSzemélyek.Besorolás2 = tBesorolás_átalakító.Besorolási_fokozat) INNER JOIN tMeghagyásraKijelöltMunkakörök ON lkSzemélyek.[KIRA feladat megnevezés] = tMeghagyásraKijelöltMunkakörök.Feladatkörök
WHERE (((lkSzemélyek.[Besorolási  fokozat (KT)])<>"Főosztályvezető" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Osztályvezető" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Járási / kerületi hivatal vezetője" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Járási / kerületi hivatal vezetőjének helyettese" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Főispán" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Kormányhivatal főigazgatója" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Kormányhivatal igazgatója") AND ((Year(Now())-Year([Születési idő])) Between 18 And 50) AND ((lkSzemélyek.Neme)="férfi"));
