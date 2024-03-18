SELECT lkSzem�lyek.F�oszt�ly AS F�oszt�ly, lkSzem�lyek.Oszt�ly AS Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve] AS N�v, lkSzem�lyek.[Orvosi vizsg�lat k�vetkez� id�pontja], kt_azNexon_Ad�jel02.NLink AS NLink
FROM kt_azNexon_Ad�jel02 RIGHT JOIN lkSzem�lyek ON kt_azNexon_Ad�jel02.Ad�jel = lkSzem�lyek.Ad�jel
WHERE (((lkSzem�lyek.[Orvosi vizsg�lat k�vetkez� id�pontja])<DateSerial(Year(Date()),Month(Date())-11,1)-1) AND ((lkSzem�lyek.[Tart�s t�voll�t t�pusa]) Is Null) AND ((lkSzem�lyek.[st�tusz neve])="�ll�shely"))
ORDER BY lkSzem�lyek.BFKH;
