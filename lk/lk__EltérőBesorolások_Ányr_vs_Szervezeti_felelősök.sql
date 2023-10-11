SELECT lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti.F�oszt�ly, tReferensek.[Dolgoz� teljes neve] AS Felel�s, Count(lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti.�ll�shely) AS [Jav�tand� adatok sz�ma], lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti.[Dolgoz� teljes neve]
FROM (ktReferens_SzervezetiEgys�g RIGHT JOIN lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti ON ktReferens_SzervezetiEgys�g.azSzervezet=lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti.azSzervezet) LEFT JOIN tReferensek ON ktReferens_SzervezetiEgys�g.azRef=tReferensek.azRef
GROUP BY lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti.F�oszt�ly, tReferensek.[Dolgoz� teljes neve], lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti.[Dolgoz� teljes neve]
HAVING (((tReferensek.[Dolgoz� teljes neve]) Like "Sz*"))
ORDER BY lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti.F�oszt�ly, Count(lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti.�ll�shely) DESC;
