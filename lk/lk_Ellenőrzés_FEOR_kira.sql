SELECT bfkh([lkszemélyek].[Szervezeti egység kódja]) AS BFKH, lkJogviszonyok.Adójel, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.FEOR AS [NEXON FEOR], lkJogviszonyok.FEOR AS [KIRA FEOR], kt_azNexon_Adójel02.NLink
FROM (lkJogviszonyok LEFT JOIN lkSzemélyek ON lkJogviszonyok.Adójel=lkSzemélyek.Adójel) LEFT JOIN kt_azNexon_Adójel02 ON lkJogviszonyok.Adójel=kt_azNexon_Adójel02.Adójel
WHERE (((lkSzemélyek.FEOR) Not Like [lkJogviszonyok].[FEOR] & "*"));
