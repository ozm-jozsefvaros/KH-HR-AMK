SELECT lkBesorol�sEmel�shez01.BFKH, lkBesorol�sEmel�shez01.F�oszt�ly, lkBesorol�sEmel�shez01.Oszt�ly, lkBesorol�sEmel�shez01.Ad�jel, lkBesorol�sEmel�shez01.N�v, lkBesorol�sEmel�shez01.[Jogviszony t�pusa], lkBesorol�sEmel�shez01.besorol�s AS [Jelenlegi beorol�s], lkBesorol�sEmel�shez01.[als� hat�r] AS [Jelenlegi als� hat�r], lkBesorol�sEmel�shez01.[fels� hat�r] AS [Jelenlegi fels� hat�r], lkBesorol�sEmel�shez01.[40 �r�s illetm�ny], lkBesorol�sEmel�shez01.als�2 AS [Emelt als� hat�r], lkBesorol�sEmel�shez01.fels�2 AS [Emelt fels� hat�r], *
FROM lkBesorol�sEmel�shez01
WHERE (((lkBesorol�sEmel�shez01.besorol�s)="Vezet�-hivatalitan�csos")) OR (((lkBesorol�sEmel�shez01.besorol�s)="Hivatali tan�csos"))
ORDER BY lkBesorol�sEmel�shez01.Ad�jel, lkBesorol�sEmel�shez01.[40 �r�s illetm�ny];
