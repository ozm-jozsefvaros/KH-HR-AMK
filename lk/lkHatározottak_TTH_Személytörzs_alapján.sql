SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Adójel, lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.[Státusz kódja], lkSzemélyek.[Helyettesített dolgozó neve], lkSzemélyek.[Helyettesített dolgozó szerzõdés/kinevezéses munkaköre] AS Kif1
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Helyettesített dolgozó neve]) Is Not Null));
