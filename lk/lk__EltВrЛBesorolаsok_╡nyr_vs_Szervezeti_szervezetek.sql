SELECT DISTINCT lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti.F�oszt�ly, Count(lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti.�ll�shely) AS [Jav�tand� adatok sz�ma]
FROM lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti
GROUP BY lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti.F�oszt�ly
ORDER BY Count(lk__Elt�r�Besorol�sok_�nyr_vs_Szervezeti.�ll�shely) DESC;
