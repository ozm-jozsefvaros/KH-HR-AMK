SELECT lkMindenVezetõ.Fõosztály, lkMindenVezetõ.[Dolgozó teljes neve] AS Név, lkMindenVezetõ.Besorolás2
FROM lkMindenVezetõ
WHERE (((lkMindenVezetõ.Besorolás2)<>"osztályvezetõ" And (lkMindenVezetõ.Besorolás2) Not Like "*helyett*" And (lkMindenVezetõ.Besorolás2)<>"fõispán" And (lkMindenVezetõ.Besorolás2) Not Like "*igazgató*"));
