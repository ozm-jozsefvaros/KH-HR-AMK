PARAMETERS Üssél_egy_entert Long;
TRANSFORM First(lk_RefEmail_02.[Hivatali email]) AS [FirstOfHivatali email]
SELECT lk_RefEmail_02.azSzervezet, lk_RefEmail_02.[Szervezeti egység kódja], lk_RefEmail_02.Fõosztály, lk_RefEmail_02.Osztály
FROM lk_RefEmail_02
GROUP BY lk_RefEmail_02.azSzervezet, lk_RefEmail_02.[Szervezeti egység kódja], lk_RefEmail_02.Fõosztály, lk_RefEmail_02.Osztály
PIVOT lk_RefEmail_02.Sorszám In (1,2,3,4,5,6);
