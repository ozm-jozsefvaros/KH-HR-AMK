SELECT tNevekOltáshoz.Azonosító, Nz(tNevekOltáshoz.Fõosztály,"") AS Fõosztály_, Nz(tNevekOltáshoz.Osztály,"") AS Osztály_, Trim(Replace(tNevekOltáshoz.[Oltandók],"dr.","")) AS Név, tNevekOltáshoz.Oltandók
FROM tNevekOltáshoz LEFT JOIN lkNevekTajOltáshoz03 ON tNevekOltáshoz.Oltandók=lkNevekTajOltáshoz03.Oltandók
WHERE (((lkNevekTajOltáshoz03.Oltandók) Is Null));
