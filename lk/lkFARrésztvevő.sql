SELECT tFARr�sztvev�.Ad�azonos�t�, tFARr�sztvev�.[Legmagasabb iskolai v�gzetts�ge], lkFARford�t�t�blaV�gzetts�ghez.FAR, lkSzem�lyek.[Iskolai v�gzetts�g foka], lkSzem�lyek.[Dolgoz� teljes neve] AS [Viselt neve], lkSzem�lyek.[Dolgoz� sz�let�si neve] AS [Sz�let�si neve], lkSzem�lyek.[Anyja neve], tFARr�sztvev�.[Sz�let�si orsz�g], lkSzem�lyek.[Sz�let�si hely] AS [Sz�let�si helye], lkSzem�lyek.[Sz�let�si id�] AS [Sz�let�si ideje], tFARr�sztvev�.[E-mail c�me], tFARr�sztvev�.[Magyarorsz�gi lakc�mmel nem rendelkez� nem magyar �llampolg�r], tFARr�sztvev�.[DHK K�pz�si hitel?], tFARr�sztvev�.[R�sztvev� �ltal fizetend� d�j], tFARr�sztvev�.T�bla
FROM (lkSzem�lyek RIGHT JOIN tFARr�sztvev� ON lkSzem�lyek.[Ad�azonos�t� jel]=tFARr�sztvev�.Ad�azonos�t�) LEFT JOIN lkFARford�t�t�blaV�gzetts�ghez ON lkSzem�lyek.[Iskolai v�gzetts�g foka]=lkFARford�t�t�blaV�gzetts�ghez.Nexon;
