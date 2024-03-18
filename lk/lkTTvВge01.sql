SELECT Year(IIf(dtÁtal([Tartós távollét vége])=1,dtÁtal([Tartós távollét tervezett vége]),dtÁtal([Tartós távollét vége]))) AS VégeÉv, Month(IIf(dtÁtal([Tartós távollét vége])=1,dtÁtal([Tartós távollét tervezett vége]),dtÁtal([Tartós távollét vége]))) AS VégeHó, 1 AS Létszám, lkSzemélyek.Azonosító, IIf(dtÁtal([Tartós távollét vége])=1,dtÁtal([Tartós távollét tervezett vége]),dtÁtal([Tartós távollét vége])) AS Dátum
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Tartós távollét típusa]) Is Not Null));
