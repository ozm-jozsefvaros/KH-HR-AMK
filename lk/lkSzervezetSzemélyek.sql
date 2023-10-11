SELECT tSzervezet.*, [Szervezetmenedzsment kód]*1 AS Adójel
FROM tSzervezet
WHERE (((tSzervezet.OSZLOPOK)="Státusz betöltés"));
