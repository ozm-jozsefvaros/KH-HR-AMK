SELECT tSzervezet.*, [Szervezetmenedzsment k�d]*1 AS Ad�jel
FROM tSzervezet
WHERE (((tSzervezet.OSZLOPOK)="St�tusz bet�lt�s"));
