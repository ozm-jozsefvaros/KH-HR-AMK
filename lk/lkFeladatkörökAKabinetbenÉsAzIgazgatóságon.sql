SELECT DISTINCT lkSzem�lyek.F�oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.[KIRA feladat megnevez�s]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.F�oszt�ly) Like "F�isp�ni*" Or (lkSzem�lyek.F�oszt�ly) Like "F�igazgat�i*") AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY lkSzem�lyek.F�oszt�ly DESC , lkSzem�lyek.[KIRA feladat megnevez�s], lkSzem�lyek.[Dolgoz� teljes neve];
