SELECT lkMindenVezet�.F�oszt�ly, lkMindenVezet�.[Dolgoz� teljes neve] AS N�v, lkMindenVezet�.Besorol�s2
FROM lkMindenVezet�
WHERE (((lkMindenVezet�.Besorol�s2)<>"oszt�lyvezet�" And (lkMindenVezet�.Besorol�s2) Not Like "*helyett*" And (lkMindenVezet�.Besorol�s2)<>"f�isp�n" And (lkMindenVezet�.Besorol�s2) Not Like "*igazgat�*"));
