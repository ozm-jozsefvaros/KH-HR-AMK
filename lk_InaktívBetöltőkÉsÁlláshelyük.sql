SELECT [Szervezetmenedzsment kód]*1 AS Adójel, tSzervezeti.[Státuszának kódja]
FROM tSzervezeti
WHERE (((tSzervezeti.OSZLOPOK)="Státusz betöltés") AND ((tSzervezeti.[Státuszbetöltés típusa])="Inaktív"));
