SELECT [L�tsz�m �s Meghagyottak].[meghagy�sra kijel�lt munkak�r�k megnevez�se], Sum([L�tsz�m �s Meghagyottak].A) AS �sszes, Sum([L�tsz�m �s Meghagyottak].B) AS Meghagyand�k, Sum([L�tsz�m �s Meghagyottak].C) AS [Meg nem hagyand�k]
FROM tMeghagy�sraKijel�ltMunkak�r�k RIGHT JOIN (SELECT lkFeladatk�r�nk�ntiL�tsz�m.*
  FROM lkFeladatk�r�nk�ntiL�tsz�m
  UNION
  SELECT lkFeladatk�r�nk�ntiMeghagyottak.*
  FROM  lkFeladatk�r�nk�ntiMeghagyottak
)  AS [L�tsz�m �s Meghagyottak] ON tMeghagy�sraKijel�ltMunkak�r�k.Feladatk�r�k = [L�tsz�m �s Meghagyottak].[meghagy�sra kijel�lt munkak�r�k megnevez�se]
GROUP BY [L�tsz�m �s Meghagyottak].[meghagy�sra kijel�lt munkak�r�k megnevez�se];
