SELECT tNevekOlt�shoz.Azonos�t�, Nz(tNevekOlt�shoz.F�oszt�ly,"") AS F�oszt�ly_, Nz(tNevekOlt�shoz.Oszt�ly,"") AS Oszt�ly_, Trim(Replace(tNevekOlt�shoz.[Oltand�k],"dr.","")) AS N�v, tNevekOlt�shoz.Oltand�k
FROM tNevekOlt�shoz LEFT JOIN lkNevekTajOlt�shoz03 ON tNevekOlt�shoz.Oltand�k=lkNevekTajOlt�shoz03.Oltand�k
WHERE (((lkNevekTajOlt�shoz03.Oltand�k) Is Null));
