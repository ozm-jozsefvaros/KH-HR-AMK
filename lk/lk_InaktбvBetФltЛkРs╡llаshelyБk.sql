SELECT [Szervezetmenedzsment k�d]*1 AS Ad�jel, tSzervezeti.[St�tusz�nak k�dja], tSzervezeti.[�rv�nyess�g kezdete], tSzervezeti.[�rv�nyess�g v�ge]
FROM tSzervezeti
WHERE (((tSzervezeti.[�rv�nyess�g kezdete])<(SELECT TOP 1 tHaviJelent�sHat�lya.hat�lya
FROM tHaviJelent�sHat�lya
GROUP BY tHaviJelent�sHat�lya.hat�lya
ORDER BY First(tHaviJelent�sHat�lya.[r�gz�t�s]) DESC)) AND ((tSzervezeti.[�rv�nyess�g v�ge])>(SELECT TOP 1 tHaviJelent�sHat�lya.hat�lya
FROM tHaviJelent�sHat�lya
GROUP BY tHaviJelent�sHat�lya.hat�lya
ORDER BY First(tHaviJelent�sHat�lya.[r�gz�t�s]) DESC)) AND ((tSzervezeti.OSZLOPOK)="St�tusz bet�lt�s") AND ((tSzervezeti.[St�tuszbet�lt�s t�pusa])="Inakt�v"))
AND "######Azok sz�m�tanak inakt�vnak, akik a Szervezeti alapriportban olyan sorral rendelkeznek, amelyikben a st�tuszbet�lt�s inakt�v, �s az �rv�nyess�g a havi l�tsz�mjelent�s d�tuma el�tt kezd�d�tt �s azt k�vet�en �r v�get.#####"<>"";
