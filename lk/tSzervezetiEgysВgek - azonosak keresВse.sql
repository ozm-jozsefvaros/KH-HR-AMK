SELECT tSzervezetiEgys�gek.[Szervezeti egys�g k�dja], tSzervezetiEgys�gek.azSzervezet, tSzervezetiEgys�gek.F�oszt�ly, tSzervezetiEgys�gek.Oszt�ly
FROM tSzervezetiEgys�gek
WHERE (((tSzervezetiEgys�gek.[Szervezeti egys�g k�dja]) In (SELECT [Szervezeti egys�g k�dja] FROM [tSzervezetiEgys�gek] As Tmp GROUP BY [Szervezeti egys�g k�dja] HAVING Count(*)>1 )))
ORDER BY tSzervezetiEgys�gek.[Szervezeti egys�g k�dja];
