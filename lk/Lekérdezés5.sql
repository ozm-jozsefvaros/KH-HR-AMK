SELECT lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)], lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)], lkSzem�lyek.[KIRA jogviszony jelleg], lkSzem�lyek.[St�tusz k�dja], lkSzem�lyek.Ad�jel
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[Dolgoz� teljes neve]) Like "Kahn*"));
