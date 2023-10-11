SELECT tSzemélyek.[Szervezeti egység kódja], tSzemélyek.[Státusz kódja], tSzemélyek.[Tartós távollét típusa], tSzemélyek.[Tartós távollét kezdete], tSzemélyek.[Tartós távollét vége], tSzemélyek.[Tartós távollét tervezett vége]
FROM tSzemélyek
WHERE (((tSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((tSzemélyek.[Tartós távollét típusa]) Is Not Null))
ORDER BY tSzemélyek.[Szervezeti egység kódja], tSzemélyek.[Státusz kódja];
