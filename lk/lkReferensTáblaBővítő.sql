INSERT INTO tReferensek ( [Dolgoz� teljes neve], [Szint 4 szervezeti egys�g n�v], [Szint 5 szervezeti egys�g n�v], [Hivatali email], [Hivatali telefon] )
SELECT lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.[Szint 4 szervezeti egys�g n�v], lkSzem�lyek.[Szint 5 szervezeti egys�g n�v], lkSzem�lyek.[Hivatali email], lkSzem�lyek.[Hivatali telefon]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[Dolgoz� teljes neve]) Not In (SELECT tReferensek.[Dolgoz� teljes neve]
FROM tReferensek)) AND ((lkSzem�lyek.[Szint 4 szervezeti egys�g n�v]) Like "Hum�n*"));
