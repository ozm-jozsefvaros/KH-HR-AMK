SELECT lk_F�oszt�ly_Oszt�ly_lkSzem�lyek.[Szervezeti egys�g k�dja], lk_F�oszt�ly_Oszt�ly_lkSzem�lyek.BFKH, lk_F�oszt�ly_Oszt�ly_lkSzem�lyek.F�oszt�ly, lk_F�oszt�ly_Oszt�ly_lkSzem�lyek.Oszt�ly, IIf([Oszt�ly]="" Or [Oszt�ly] Is Null,0,utols�([BFKH],".")*1)+1 AS Sorsz�m INTO tF�oszt�lyokOszt�lyokSorsz�mmal
FROM lk_F�oszt�ly_Oszt�ly_lkSzem�lyek
WHERE (((lk_F�oszt�ly_Oszt�ly_lkSzem�lyek.BFKH) Like "BFKH*"));
