SELECT tNevekOlt�shoz.Azonos�t�, tNevekOlt�shoz.F�oszt�ly, tNevekOlt�shoz.Oszt�ly, tNevekOlt�shoz.Oltand�k
FROM tNevekOlt�shoz LEFT JOIN lkNevekTajOlt�shoz06 ON tNevekOlt�shoz.Oltand�k = lkNevekTajOlt�shoz06.Oltand�k
WHERE (((lkNevekTajOlt�shoz06.Oltand�k) Is Null));
