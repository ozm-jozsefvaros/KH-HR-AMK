SELECT lkFõosztályok.[Szervezeti egység kódja], lkIlletményNöveléshezAdatok01.Fõosztály, Sum(lkIlletményNöveléshezAdatok01.fõ) AS [Fõosztályi létszám]
FROM lkFõosztályok INNER JOIN lkIlletményNöveléshezAdatok01 ON lkFõosztályok.Fõosztály=lkIlletményNöveléshezAdatok01.Fõosztály
GROUP BY lkFõosztályok.[Szervezeti egység kódja], lkIlletményNöveléshezAdatok01.Fõosztály;
