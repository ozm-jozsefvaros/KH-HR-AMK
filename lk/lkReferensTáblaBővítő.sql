INSERT INTO tReferensek ( [Dolgozó teljes neve], [Szint 4 szervezeti egység név], [Szint 5 szervezeti egység név], [Hivatali email], [Hivatali telefon] )
SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Szint 4 szervezeti egység név], lkSzemélyek.[Szint 5 szervezeti egység név], lkSzemélyek.[Hivatali email], lkSzemélyek.[Hivatali telefon]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Dolgozó teljes neve]) Not In (SELECT tReferensek.[Dolgozó teljes neve]
FROM tReferensek)) AND ((lkSzemélyek.[Szint 4 szervezeti egység név]) Like "Humán*"));
