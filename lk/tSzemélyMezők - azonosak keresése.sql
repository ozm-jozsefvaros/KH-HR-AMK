SELECT tSzem�lyMez�k.Mez�n�v, tSzem�lyMez�k.T�pus, tSzem�lyMez�k.Az
FROM tSzem�lyMez�k
WHERE (((tSzem�lyMez�k.Mez�n�v) In (SELECT [Mez�n�v] FROM [tSzem�lyMez�k] As Tmp GROUP BY [Mez�n�v],[T�pus] HAVING Count(*)>1  And [T�pus] = [tSzem�lyMez�k].[T�pus])))
ORDER BY tSzem�lyMez�k.Mez�n�v, tSzem�lyMez�k.T�pus;
