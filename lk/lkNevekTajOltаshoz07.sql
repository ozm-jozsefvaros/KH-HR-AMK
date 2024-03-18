SELECT tNevekOltáshoz.Azonosító, tNevekOltáshoz.Fõosztály, tNevekOltáshoz.Osztály, tNevekOltáshoz.Oltandók
FROM tNevekOltáshoz LEFT JOIN lkNevekTajOltáshoz06 ON tNevekOltáshoz.Oltandók = lkNevekTajOltáshoz06.Oltandók
WHERE (((lkNevekTajOltáshoz06.Oltandók) Is Null));
