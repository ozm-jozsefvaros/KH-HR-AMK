SELECT lk_Garant�lt_b�rminimum_Illetm�nyek.[Dolgoz� teljes neve], lk_Garant�lt_b�rminimum_Illetm�nyek.[�ll�shely azonos�t�], lkSzem�lyek.[St�tusz k�dja], lkSzem�lyek.[Besorol�si  fokozat (KT)]
FROM lk_Garant�lt_b�rminimum_Illetm�nyek LEFT JOIN lkSzem�lyek ON lk_Garant�lt_b�rminimum_Illetm�nyek.[�ll�shely azonos�t�] = lkSzem�lyek.[St�tusz k�dja]
WHERE (((lkSzem�lyek.[Besorol�si  fokozat (KT)]) Is Null));
