SELECT lkSzem�lyekF�oszt�s�sszesen.F�oszt�ly AS F�oszt�ly, lkSzem�lyekF�oszt�s�sszesen.F�oszt�lyiL�tsz�m AS F�oszt�lyiL�tsz�m, [lk_TT-sekF�oszt�lyonk�nt].[Tart�san t�voll�v�k] AS [Tart�san t�voll�v�k], [Tart�san t�voll�v�k]/([F�oszt�lyiL�tsz�m]) AS [TT-sek ar�nya], lkSzem�lyekF�oszt�s�sszesen.K�zpontos�tottL�tsz�m AS [K�zpontos�tott l�tsz�m]
FROM [lk_TT-sekF�oszt�lyonk�nt] RIGHT JOIN lkSzem�lyekF�oszt�s�sszesen ON [lk_TT-sekF�oszt�lyonk�nt].F�oszt�ly = lkSzem�lyekF�oszt�s�sszesen.F�oszt�ly
ORDER BY [lkSzem�lyekF�oszt�s�sszesen].[Sor] & ".", [lk_TT-sekF�oszt�lyonk�nt].SzSz;
