SELECT lkJárásiVezetõk.Kód, lkJárásiVezetõk.[Dolgozó teljes neve], lkJárásiVezetõk.Hivatal, lkJárásiVezetõk.[Besorolási  fokozat (KT)], lkJárásiVezetõk.[Kerekített 100 %-os illetmény (eltérített)] AS Illetmény
FROM lkJárásiVezetõk
WHERE (((lkJárásiVezetõk.[Besorolási  fokozat (KT)])="Járási / kerületi hivatal vezetõjének helyettese"));
