SELECT lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Státusz kódja], lkSzemélyek.Besorolás, lkSzemélyek.[Státusz típusa], lkSzemélyek.[Foglalkozási viszony statisztikai besorolása], lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker], lkSzemélyek.[Szerzõdés/Kinevezés típusa], lkSzemélyek.[KIRA jogviszony jelleg], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], lkSzemélyek.[Jogviszony vége (kilépés dátuma)], lkSzemélyek.[Tartós távollét típusa], lkSzemélyek.[Tartós távollét kezdete], lkSzemélyek.[Tartós távollét vége], lkSzemélyek.[Helyettesített dolgozó neve], lkSzemélyek.[Illetmény összesen kerekítés nélkül (eltérített)], "" AS [Javasolt emelés], "" AS [Új illetmény], "" AS [alsó határ], "" AS [felsõ határ], "" AS [alsó ellenõrzés], "" AS [felsõ ellenõrzés], "" AS kontroll, "" AS Megjegyzés
FROM lkSzemélyek
WHERE Adójel = 8405893067 or
Adójel = 8458040263 or
Adójel = 8428250308 or
Adójel = 8440722397 or
Adójel = 8334381263 or
Adójel = 8315014293 or
Adójel = 8343783514 or
Adójel = 8427450648;
