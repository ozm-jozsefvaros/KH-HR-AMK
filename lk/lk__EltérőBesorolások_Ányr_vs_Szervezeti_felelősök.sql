SELECT lk__EltérõBesorolások_Ányr_vs_Szervezeti.Fõosztály, tReferensek.[Dolgozó teljes neve] AS Felelõs, Count(lk__EltérõBesorolások_Ányr_vs_Szervezeti.Álláshely) AS [Javítandó adatok száma], lk__EltérõBesorolások_Ányr_vs_Szervezeti.[Dolgozó teljes neve]
FROM (ktReferens_SzervezetiEgység RIGHT JOIN lk__EltérõBesorolások_Ányr_vs_Szervezeti ON ktReferens_SzervezetiEgység.azSzervezet=lk__EltérõBesorolások_Ányr_vs_Szervezeti.azSzervezet) LEFT JOIN tReferensek ON ktReferens_SzervezetiEgység.azRef=tReferensek.azRef
GROUP BY lk__EltérõBesorolások_Ányr_vs_Szervezeti.Fõosztály, tReferensek.[Dolgozó teljes neve], lk__EltérõBesorolások_Ányr_vs_Szervezeti.[Dolgozó teljes neve]
HAVING (((tReferensek.[Dolgozó teljes neve]) Like "Sz*"))
ORDER BY lk__EltérõBesorolások_Ányr_vs_Szervezeti.Fõosztály, Count(lk__EltérõBesorolások_Ányr_vs_Szervezeti.Álláshely) DESC;
