SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Szervezeti egység neve], lkSzemélyek.Besorolás, lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.[Vezetõi megbízás típusa]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység neve]) Like "Humán*"))
ORDER BY IIf(InStr(1,[Besorolás],"osztály"),1,IIf(InStr(1,[KIRA feladat megnevezés],"titkár"),2,3)), lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.[Dolgozó teljes neve];
