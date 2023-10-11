SELECT bfkh(Nz([Szervezeti egys�g k�dja],"")) AS K�d, lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.[Ad�azonos�t� jel], lkSzem�lyek.F�oszt�ly AS Hivatal, lkSzem�lyek.[Sz�let�si hely], lkSzem�lyek.[Sz�let�si id�], lkSzem�lyek.[�lland� lakc�m], lkSzem�lyek.[Tart�zkod�si lakc�m], lkSzem�lyek.[Besorol�si  fokozat (KT)], lkSzem�lyek.[Vezet�i beoszt�s megnevez�se], lkSzem�lyek.[Kerek�tett 100 %-os illetm�ny (elt�r�tett)]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.F�oszt�ly) Like "BFKH*") AND ((lkSzem�lyek.[Besorol�si  fokozat (KT)]) Like "J�r�si*"))
ORDER BY bfkh(Nz([Szervezeti egys�g k�dja],""));
