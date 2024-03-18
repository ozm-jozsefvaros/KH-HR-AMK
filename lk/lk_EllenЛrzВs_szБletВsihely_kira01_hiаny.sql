SELECT bfkh(Nz([Szervezeti egység kódja],0)) AS bfkh, IIf(Nz([Fõosztály],"")="","_Kilépett",[Fõosztály]) AS Fõoszt, lkSzemélyek.Osztály, lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], "A születési hely nincs kitöltve" AS Hiba, "" AS [Születési helye], "" AS Javasolt, kt_azNexon_Adójel02.NLink
FROM lkSzemélyek LEFT JOIN kt_azNexon_Adójel02 ON lkSzemélyek.Adójel = kt_azNexon_Adójel02.Adójel
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((Len(Nz([Születési hely],"")))<2))
ORDER BY bfkh(Nz([Szervezeti egység kódja],0)), IIf(Nz([Fõosztály],"")="","_Kilépett",[Fõosztály]), lkSzemélyek.[Dolgozó teljes neve];
