SELECT UNI�.Sor, UNI�.BFKH AS [Szervezeti egys�g k�d], UNI�.F�oszt�ly, UNI�.Oszt�ly, UNI�.L�tsz�m
FROM (SELECT 0 AS sor, bfkh(Nz(lkSzem�lyek.F�oszt�lyK�d,0)) AS BFKH, lkSzem�lyek.F�oszt�ly, "�sszesen:" AS Oszt�ly, Count(*) AS L�tsz�m
    FROM lkSzem�lyek
    WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
    GROUP BY 0, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.F�oszt�lyK�d, ""

    UNION
    SELECT 1 as sor, lkSzem�lyek.BFKH, F�oszt�ly,Oszt�ly, Count(*) as L�tsz�m
    FROM lkSzem�lyek
    WHERE lkSzem�lyek.[St�tusz neve]="�ll�shely"
    GROUP BY 1,BFKH, lkSzem�lyek.F�oszt�ly,lkSzem�lyek.F�oszt�lyK�d,Oszt�ly
    )  AS UNI�
WHERE "/// Le�r�s: A megadott lek�rdez�s k�t SELECT utas�t�st kombin�l az UNION haszn�lat�val, hogy egyetlen eredm�nyk�szletet hozzon l�tre. 
        Az els� SELECT kimutat�s a f�oszt�lyonk�nti (oszt�lyvezet�i), m�g a m�sodik SELECT utas�t�s a BFKH-nk�nt (oszt�lyonk�nti) �s a 
        f�oszt�lyonk�nti dolgoz�k sz�m�t sz�molja ki. 
        Az eredm�ny�l kapott adatk�szlet tartalmazza a Sor (sorsz�m), Szervezeti egys�g k�d (szervezeti egys�g k�dja), F�oszt�ly, 
        Oszt�ly �s L�tsz�m (alkalmazottak sz�ma) oszlopokat. 
        A v�geredm�nyt ezut�n a BFKH �s a sor szerint cs�kken� sorrendbe rendezi. ///"
ORDER BY UNI�.BFKH DESC , UNI�.sor DESC;
