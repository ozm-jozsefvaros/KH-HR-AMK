SELECT [Szervezetmenedzsment k�d]*1 AS Ad�jel, tSzervezeti.[St�tusz�nak k�dja]
FROM tSzervezeti
WHERE (((tSzervezeti.OSZLOPOK)="St�tusz bet�lt�s") AND ((tSzervezeti.[St�tuszbet�lt�s t�pusa])="Inakt�v"));
