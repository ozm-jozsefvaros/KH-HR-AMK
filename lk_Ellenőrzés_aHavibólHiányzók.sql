SELECT lkSzem�lyek.[St�tusz k�dja], lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve]
FROM lkSzem�lyek LEFT JOIN (SELECT Korm�nyhivatali_�llom�ny.[�ll�shely azonos�t�]
FROM Korm�nyhivatali_�llom�ny
UNION
SELECT J�r�si_�llom�ny.[�ll�shely azonos�t�]
FROM J�r�si_�llom�ny
UNION
SELECT K�zpontos�tottak.[�ll�shely azonos�t�]
FROM K�zpontos�tottak)  AS Havi�ll�shelyAz ON lkSzem�lyek.[St�tusz k�dja] = Havi�ll�shelyAz.[�ll�shely azonos�t�]
WHERE (((lkSzem�lyek.[st�tusz neve])="�ll�shely") AND ((Havi�ll�shelyAz.[�ll�shely azonos�t�]) Is Null))
ORDER BY lkSzem�lyek.BFKH, lkSzem�lyek.[Dolgoz� teljes neve];
