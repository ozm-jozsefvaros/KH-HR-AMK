SELECT [T�rzssz�m]*1 AS T�rzssz�m_, lkF�oszt�lyok.F�oszt�ly, lkSzem�lyek.[Szint 5 szervezeti egys�g n�v] AS Oszt�ly, Max(lkSzem�lyek.[Jogviszony sorsz�ma]) AS [MaxOfJogviszony sorsz�ma]
FROM lkSzem�lyek INNER JOIN lkF�oszt�lyok ON lkSzem�lyek.[Szervezeti egys�g k�dja] = lkF�oszt�lyok.[Szervezeti egys�g k�dja]
GROUP BY [T�rzssz�m]*1, lkF�oszt�lyok.F�oszt�ly, lkSzem�lyek.[Szint 5 szervezeti egys�g n�v];
