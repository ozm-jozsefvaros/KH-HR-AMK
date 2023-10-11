SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], lkSzemélyek.[Jogviszony vége (kilépés dátuma)], lkSzemélyek.[KIRA jogviszony jelleg], lkSzemélyek.[Státusz kódja], lkSzemélyek.Adójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Dolgozó teljes neve]) Like "Kahn*"));
