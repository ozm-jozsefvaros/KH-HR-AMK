SELECT bfkh(Nz([Szervezeti egység kódja],"")) AS Kód, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Adóazonosító jel], lkSzemélyek.Fõosztály AS Hivatal, lkSzemélyek.[Születési hely], lkSzemélyek.[Születési idõ], lkSzemélyek.[Állandó lakcím], lkSzemélyek.[Tartózkodási lakcím], lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.[Vezetõi beosztás megnevezése], lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)]
FROM lkSzemélyek
WHERE (((lkSzemélyek.Fõosztály) Like "BFKH*") AND ((lkSzemélyek.[Besorolási  fokozat (KT)]) Like "Járási*"))
ORDER BY bfkh(Nz([Szervezeti egység kódja],""));
