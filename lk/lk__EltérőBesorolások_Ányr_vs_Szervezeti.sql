SELECT lk__Elt�r�Besorol�sok.SzervezetK�d, lk__Elt�r�Besorol�sok.F�oszt�ly, lk__Elt�r�Besorol�sok.�ll�shely, lk__Elt�r�Besorol�sok.[Szem�lyi karton], lk__Elt�r�Besorol�sok.[Szervezeti strukt�ra], lk__Elt�r�Besorol�sok.[Dolgoz� teljes neve], lk__Elt�r�Besorol�sok.[Tart�s t�voll�t t�pusa], lk__Elt�r�Besorol�sok.[Helyettes�tett dolgoz� neve], lk__Elt�r�Besorol�sok.Link, lk__Elt�r�Besorol�sok.�nyr_vs_Szervezeti, lk__Elt�r�Besorol�sok.Szervezeti_vs_Szem�lyi, lk__Elt�r�Besorol�sok.�ny_vs_Szem�lyi, *
FROM lk__Elt�r�Besorol�sok
WHERE (((lk__Elt�r�Besorol�sok.�nyr_vs_Szervezeti)=False) AND ((lk__Elt�r�Besorol�sok.�ny_vs_Szem�lyi)=True))
ORDER BY lk__Elt�r�Besorol�sok.SzervezetK�d, lk__Elt�r�Besorol�sok.[Dolgoz� teljes neve];
