SELECT tAIKiosk02.Azonos�t�, lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.Ad�jel, lkSzem�lyek.[Szervezeti egys�g k�dja], tAIKiosk02.F�oszt�ly
FROM lkSzem�lyek, tAIKiosk02
WHERE (((lkSzem�lyek.[Szervezeti egys�g k�dja]) Is Not Null) And ((Trim(Replace([Dolgoz� teljes neve],"dr.",""))) Like "*" & Trim(Replace([N�v],"dr.","")) & "*") And ((tAIKiosk02.F�oszt�ly)=lkSzem�lyek.F�oszt�ly))
ORDER BY tAIKiosk02.Azonos�t�;
