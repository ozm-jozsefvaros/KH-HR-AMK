SELECT �ll�shelyek.[�ll�shely azonos�t�], IIf(Nz([Dolgoz� teljes neve],"")="","Bet�ltetlen","Bet�lt�tt") AS �llapot, lkSzem�lyek.[Dolgoz� teljes neve] AS [Bet�lt� neve], lkSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)] AS Bel�p�s
FROM lkSzem�lyek RIGHT JOIN �ll�shelyek ON lkSzem�lyek.[St�tusz k�dja]=�ll�shelyek.[�ll�shely azonos�t�]
ORDER BY �ll�shelyek.[�ll�shely azonos�t�];
