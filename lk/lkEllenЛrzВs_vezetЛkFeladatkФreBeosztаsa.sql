SELECT lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.[Szervezeti egys�g neve], lkSzem�lyek.Besorol�s, lkSzem�lyek.Feladatok, lkSzem�lyek.Feladatk�r, lkSzem�lyek.[KIRA feladat megnevez�s], lkSzem�lyek.[Vezet�i beoszt�s megnevez�se], lkSzem�lyek.[Vezet�i megb�z�s t�pusa]
FROM kt_azNexon_Ad�jel INNER JOIN lkSzem�lyek ON kt_azNexon_Ad�jel.Ad�jel = lkSzem�lyek.Ad�jel
WHERE (((lkSzem�lyek.Besorol�s) Like "j�r�si*" Or (lkSzem�lyek.Besorol�s) Like "*igazgat�*" Or (lkSzem�lyek.Besorol�s) Like "*oszt�ly*") AND ((lkSzem�lyek.[Szervezeti egys�g k�dja]) Is Not Null))
ORDER BY lkSzem�lyek.[Szervezeti egys�g k�dja], lkSzem�lyek.[Dolgoz� teljes neve];
