SELECT bfkh(Nz([Szervezeti egys�g k�dja],0)) AS bfkh, lkF�oszt�lyok.[Szervezeti egys�g k�dja], lkR�szmunkaid�s�kAr�nya02.F�oszt�ly, lkR�szmunkaid�s�kAr�nya02.[Teljes munkaid�s l�tsz�m], lkR�szmunkaid�s�kAr�nya02.[R�szmunkaid�s l�tsz�m], [R�szmunkaid�s l�tsz�m]/[Teljes munkaid�s l�tsz�m] AS Ar�nya
FROM lkF�oszt�lyok INNER JOIN lkR�szmunkaid�s�kAr�nya02 ON lkF�oszt�lyok.F�oszt�ly = lkR�szmunkaid�s�kAr�nya02.F�oszt�ly
ORDER BY [R�szmunkaid�s l�tsz�m]/[Teljes munkaid�s l�tsz�m] DESC;
