SELECT lkKeresendõk.Sorszám, Tmp.Fõosztály, Tmp.Osztály_, Tmp.Létszám
FROM lkKeresendõk, lkFõosztályonéntiOsztályonkéntiLétszám AS Tmp
WHERE (((Tmp.Fõosztály)=[lkKeresendõk].[Fõosztály]) AND ((Tmp.Osztály_)=[lkKeresendõk].[Osztály])) OR (((Tmp.Fõosztály)=[lkKeresendõk].[Fõosztály]) AND ((Tmp.Osztály_) Like [lkKeresendõk].[Osztály]))
ORDER BY lkKeresendõk.Sorszám, Tmp.BFKH DESC , Tmp.Sor;
