SELECT bfkh([lkszem�lyek].[Szervezeti egys�g k�dja]) AS BFKH, lkJogviszonyok.Ad�jel, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.FEOR AS [NEXON FEOR], lkJogviszonyok.FEOR AS [KIRA FEOR], kt_azNexon_Ad�jel02.NLink
FROM (lkJogviszonyok LEFT JOIN lkSzem�lyek ON lkJogviszonyok.Ad�jel=lkSzem�lyek.Ad�jel) LEFT JOIN kt_azNexon_Ad�jel02 ON lkJogviszonyok.Ad�jel=kt_azNexon_Ad�jel02.Ad�jel
WHERE (((lkSzem�lyek.FEOR) Not Like [lkJogviszonyok].[FEOR] & "*"));
