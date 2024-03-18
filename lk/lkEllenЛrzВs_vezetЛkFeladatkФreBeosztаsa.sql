SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Szervezeti egység neve], lkSzemélyek.Besorolás, lkSzemélyek.Feladatok, lkSzemélyek.Feladatkör, lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.[Vezetõi beosztás megnevezése], lkSzemélyek.[Vezetõi megbízás típusa]
FROM kt_azNexon_Adójel INNER JOIN lkSzemélyek ON kt_azNexon_Adójel.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.Besorolás) Like "járási*" Or (lkSzemélyek.Besorolás) Like "*igazgató*" Or (lkSzemélyek.Besorolás) Like "*osztály*") AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null))
ORDER BY lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.[Dolgozó teljes neve];
