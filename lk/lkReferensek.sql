SELECT kt_azNexon_Ad�jel02.azNexon, lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Hivatali email], lkSzem�lyek.[Hivatali telefon]
FROM kt_azNexon_Ad�jel02 RIGHT JOIN lkSzem�lyek ON kt_azNexon_Ad�jel02.Ad�jel = lkSzem�lyek.Ad�jel
WHERE (((kt_azNexon_Ad�jel02.azNexon) Not In (Select NexonAz From tReferensekTer�letN�lk�l)) AND ((lkSzem�lyek.F�oszt�ly) Like "Hum�n*") AND ((lkSzem�lyek.[KIRA feladat megnevez�s]) Like "hum�n*" Or (lkSzem�lyek.[KIRA feladat megnevez�s]) Like "*oszt�ly*") AND ((IIf(Nz([Tart�s t�voll�t t�pusa],False)<>False,True,False))=0))
ORDER BY lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve];
