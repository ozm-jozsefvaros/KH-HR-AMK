SELECT lk__Elt�r�Besorol�sok.SzervezetK�d, lk__Elt�r�Besorol�sok.F�oszt�ly, lk__Elt�r�Besorol�sok.�ll�shely, lk__Elt�r�Besorol�sok.[Szem�lyi karton], lk__Elt�r�Besorol�sok.[Szervezeti strukt�ra], lk__Elt�r�Besorol�sok.[Dolgoz� teljes neve], lk__Elt�r�Besorol�sok.[Tart�s t�voll�t t�pusa], lk__Elt�r�Besorol�sok.[Helyettes�tett dolgoz� neve], lk__Elt�r�Besorol�sok.Link
FROM lk__Elt�r�Besorol�sok
WHERE (((lk__Elt�r�Besorol�sok.[Szem�lyi karton])<>[Szervezeti strukt�ra]) AND ((lk__Elt�r�Besorol�sok.Bet�lt�tt)=True) AND ((lk__Elt�r�Besorol�sok.Szervezeti_vs_Szem�lyi)=False))
ORDER BY lk__Elt�r�Besorol�sok.SzervezetK�d, lk__Elt�r�Besorol�sok.[Dolgoz� teljes neve];
