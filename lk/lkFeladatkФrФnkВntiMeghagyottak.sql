SELECT lkMeghagy�sEredm�ny.munkak�r, 0 AS A, Count(lkMeghagy�sEredm�ny.[TAJ sz�m]) AS B, 0-Count([lkMeghagy�sEredm�ny].[TAJ sz�m]) AS C
FROM lkMeghagy�sEredm�ny
GROUP BY lkMeghagy�sEredm�ny.munkak�r, 0, 0;
