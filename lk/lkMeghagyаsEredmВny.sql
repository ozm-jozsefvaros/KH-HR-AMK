SELECT lkSzem�lyek.[TAJ sz�m], lkSzem�lyek.[Dolgoz� sz�let�si neve] AS [Sz�let�si n�v], lkSzem�lyek.[Dolgoz� teljes neve] AS [H�zass�gi n�v], lkSzem�lyek.[Anyja neve], lkSzem�lyek.[Sz�let�si id�], lkSzem�lyek.[Sz�let�si hely], lkSzem�lyek.[KIRA feladat megnevez�s] AS munkak�r
FROM lkSzem�lyek RIGHT JOIN (tMeghagy�s03 RIGHT JOIN tMeghagy�sB02 ON tMeghagy�s03.F�oszt�lyK�d = tMeghagy�sB02.F�oszt�lyK�d) ON lkSzem�lyek.[St�tusz k�dja] = tMeghagy�sB02.[St�tusz�nak k�dja]
WHERE (((IIf([Sorsz�m3]<=([CountOfL�tsz�m]-[Meghagyand�k]),False,True))=True))
ORDER BY Bfkh(Nz([tMeghagy�s03].[F�oszt�lyK�d],"BFKH.1.")), tMeghagy�sB02.Sorsz�m3 DESC;
