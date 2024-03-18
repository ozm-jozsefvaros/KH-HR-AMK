SELECT lkSzem�lyek.T�rzssz�m, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, �ll�shelyek.[�ll�shely besorol�si kateg�ri�ja], lkSzem�lyek.[Dolgoz� teljes neve] AS N�v, lkSzem�lyek.[Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�tett)] AS Illetm�ny, lkSzem�lyek.[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker] AS �rasz�m, [Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�tett)]/[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker]*40 AS [40 �r�s illetm�ny], IIf(ffsplit([Feladatk�r],"-",2)="",[Feladatk�r],ffsplit([Feladatk�r],"-",2)) AS Feladat, IIf(Nz([Tart�s t�voll�t t�pusa],"")="","","Igen") AS TT
FROM �ll�shelyek INNER JOIN lkSzem�lyek ON �ll�shelyek.[�ll�shely azonos�t�] = lkSzem�lyek.[St�tusz k�dja]
WHERE (((IIf(Nz([Tart�s t�voll�t t�pusa],"")="","","Igen"))="" Or (IIf(Nz([Tart�s t�voll�t t�pusa],"")="","","Igen"))=IIf(Nz([A tart�s t�voll�v�ket is belevegy�k (Igen/Nem)],"Nem")="Igen","Igen","")) AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"));
