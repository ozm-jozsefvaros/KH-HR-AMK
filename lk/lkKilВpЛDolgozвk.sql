SELECT DISTINCT bfkh([Szervezeti egys�g k�dja]) AS BFKH, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.Ad�jel, lkSzem�lyek.[Dolgoz� teljes neve] AS N�v, lkSzem�lyek.[St�tusz k�dja], IIf(Nz([besorol�si  fokozat (KT)],"")="",[Tervezett bet�lt�si adatok - El�meneteli fokozat megnevez�s],Nz([besorol�si  fokozat (KT)],"")) AS Besorol�s, lkSzem�lyek.[St�tusz t�pusa], lkSzem�lyek.[KIRA jogviszony jelleg], lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)], lkSzem�lyek.[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)]
FROM lkSzem�lyek LEFT JOIN lkSzervezet�ll�shelyek ON lkSzem�lyek.[St�tusz k�dja] = lkSzervezet�ll�shelyek.�ll�shely
WHERE (((lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)])>Date()) AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely")) OR (((lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)]) Is Null) AND ((lkSzem�lyek.[HR kapcsolat megsz�n�s m�dja (Kil�p�s m�dja)]) Is Not Null) AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY bfkh([Szervezeti egys�g k�dja]);
