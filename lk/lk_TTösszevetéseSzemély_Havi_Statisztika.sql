SELECT bfkh([Szervezeti egység kódja]) AS BFKH, lk_TTösszevetéseSzemély_Havi.[Szervezeti egység], Count(lk_TTösszevetéseSzemély_Havi.Adójel) AS CountOfAdójel
FROM lkFõosztályok INNER JOIN lk_TTösszevetéseSzemély_Havi ON lkFõosztályok.Fõosztály=lk_TTösszevetéseSzemély_Havi.[Szervezeti egység]
GROUP BY bfkh([Szervezeti egység kódja]), lk_TTösszevetéseSzemély_Havi.[Szervezeti egység];
