SELECT lkSzemélyek.Azonosító, lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Anyja neve], lkSzemélyek.[Státusz kódja], lkSzemélyek.[Státusz neve], lkSzemélyek.[KIRA jogviszony jelleg], lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Iskolai végzettség foka], lkSzemélyek.[Iskolai végzettség neve]
FROM lkSzemélyek
ORDER BY lkSzemélyek.[Dolgozó teljes neve];
