SELECT DISTINCT tSzem�lyek.[Szervezeti egys�g k�dja], Replace(Nz(IIf(IsNull([tSzem�lyek].[Szint 4 szervezeti egys�g n�v]),IIf(IsNull([tSzem�lyek].[Szint 3 szervezeti egys�g n�v]),[tSzem�lyek].[Szint 2 szervezeti egys�g n�v] & "",[tSzem�lyek].[Szint 3 szervezeti egys�g n�v] & ""),[tSzem�lyek].[Szint 4 szervezeti egys�g n�v] & ""),""),"Budapest F�v�ros Korm�nyhivatala ","BFKH ") AS F�oszt�ly
FROM tSzem�lyek
WHERE (((tSzem�lyek.[Szint 5 szervezeti egys�g n�v]) Is Null));
