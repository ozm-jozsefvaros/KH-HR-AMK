SELECT lkSzem�lyek.[Dolgoz� teljes neve], DateSerial(Year(Nz([Sz�let�si id�],#1/1/1900#))+65,Month(Nz([Sz�let�si id�],#1/1/1900#)),Day(Nz([Sz�let�si id�],#1/1/1900#))) AS [Nyugd�jkorhat�rt bet�lti], Year([Sz�let�si id�])+65 AS �v, Format([Sz�let�si id�],"mmmm") AS H�, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.Besorol�s2
FROM lkSzem�lyek
WHERE (((DateSerial(Year(Nz([Sz�let�si id�],#1/1/1900#))+65,Month(Nz([Sz�let�si id�],#1/1/1900#)),Day(Nz([Sz�let�si id�],#1/1/1900#)))) Between Date() And DateAdd("m",18,Date())) AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY Year([Sz�let�si id�])+65, Month([Sz�let�si id�]);
