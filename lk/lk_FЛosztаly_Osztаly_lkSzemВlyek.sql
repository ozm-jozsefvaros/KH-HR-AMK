SELECT DISTINCT lkSzem�lyek.[Szervezeti egys�g k�dja], lkSzem�lyek.BFKH, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, IIf([Oszt�ly]="" Or [Oszt�ly] Is Null,0,utols�([BFKH],".")*1)+1 AS Sorsz�m
FROM lkSzem�lyek;
