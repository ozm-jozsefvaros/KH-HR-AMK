SELECT kt_azNexon_Adójel02.azNexon, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Osztály, lkSzemélyek.[Hivatali email], lkSzemélyek.[Hivatali telefon]
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((kt_azNexon_Adójel02.azNexon) Not In (Select NexonAz From tReferensekTerületNélkül)) AND ((lkSzemélyek.Fõosztály) Like "Humán*") AND ((lkSzemélyek.[KIRA feladat megnevezés]) Like "humán*" Or (lkSzemélyek.[KIRA feladat megnevezés]) Like "*osztály*") AND ((IIf(Nz([Tartós távollét típusa],False)<>False,True,False))=0))
ORDER BY lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve];
