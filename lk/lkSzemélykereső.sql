SELECT lkSzem�lyek.Azonos�t�, lkSzem�lyek.Ad�jel, lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.[Anyja neve], lkSzem�lyek.[St�tusz k�dja], lkSzem�lyek.[St�tusz neve], lkSzem�lyek.[KIRA jogviszony jelleg], lkSzem�lyek.[Besorol�si  fokozat (KT)], lkSzem�lyek.[Kerek�tett 100 %-os illetm�ny (elt�r�tett)], lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Iskolai v�gzetts�g foka], lkSzem�lyek.[Iskolai v�gzetts�g neve]
FROM lkSzem�lyek
ORDER BY lkSzem�lyek.[Dolgoz� teljes neve];
