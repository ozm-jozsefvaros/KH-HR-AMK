SELECT DISTINCT tSzemélyek.[Szervezeti egység kódja], Replace(Nz(IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység név]),[tSzemélyek].[Szint 2 szervezeti egység név] & "",[tSzemélyek].[Szint 3 szervezeti egység név] & ""),[tSzemélyek].[Szint 4 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") AS Fõosztály
FROM tSzemélyek
WHERE (((tSzemélyek.[Szint 5 szervezeti egység név]) Is Null));
