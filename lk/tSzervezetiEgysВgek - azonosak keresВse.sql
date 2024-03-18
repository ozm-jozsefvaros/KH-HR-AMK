SELECT tSzervezetiEgységek.[Szervezeti egység kódja], tSzervezetiEgységek.azSzervezet, tSzervezetiEgységek.Fõosztály, tSzervezetiEgységek.Osztály
FROM tSzervezetiEgységek
WHERE (((tSzervezetiEgységek.[Szervezeti egység kódja]) In (SELECT [Szervezeti egység kódja] FROM [tSzervezetiEgységek] As Tmp GROUP BY [Szervezeti egység kódja] HAVING Count(*)>1 )))
ORDER BY tSzervezetiEgységek.[Szervezeti egység kódja];
