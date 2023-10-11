SELECT [01D].T�bla, [01D].Hi�nyz�_�rt�k, [01D].Ad�jel AS Ad�azonos�t�, [01D].[�NYR SZERVEZETI EGYS�G AZONOS�T�], [�ll�shely azonos�t�]
FROM (SELECT 'J�r�si_�llom�ny' as T�bla, 'Illetm�ny' As [Hi�nyz�_�rt�k], [Ad�azonos�t�] As Ad�jel, [�NYR SZERVEZETI EGYS�G AZONOS�T�]  , [�ll�shely azonos�t�]
 FROM [J�r�si_�llom�ny] WHERE [Mez�18]=0 AND ([J�r�si_�llom�ny].[Mez�4]<> '�res �ll�s' OR [J�r�si_�llom�ny].[Mez�4] is null )  
UNION 
SELECT 'Korm�nyhivatali_�llom�ny' as T�bla, 'Illetm�ny' As [Hi�nyz� �rt�k], [Ad�azonos�t�] As Ad�jel, [�NYR SZERVEZETI EGYS�G AZONOS�T�] As SzervezetK�d , [�ll�shely azonos�t�]
 FROM [Korm�nyhivatali_�llom�ny] WHERE [Mez�18]=0 AND ([Korm�nyhivatali_�llom�ny].[Mez�4]<> '�res �ll�s' OR [Korm�nyhivatali_�llom�ny].[Mez�4] is null )  
UNION 
SELECT 'K�zpontos�tottak' as T�bla, 'Illetm�ny' As [Hi�nyz� �rt�k], [Ad�azonos�t�] As Ad�jel, [Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] As SzervezetK�d , [�ll�shely azonos�t�]
 FROM [K�zpontos�tottak] WHERE [Mez�17]=0 AND ([K�zpontos�tottak].[Mez�4]<> '�res �ll�s' OR [K�zpontos�tottak].[Mez�4] is null )  
UNION 
SELECT 'lkBel�p�k' as T�bla, 'Illetm�ny' As [Hi�nyz� �rt�k], [Ad�azonos�t�] As Ad�jel, [�NYR SZERVEZETI EGYS�G AZONOS�T�] As SzervezetK�d , [�ll�shely azonos�t�]
FROM [lkBel�p�k] WHERE [Illetm�ny (Ft/h�)]=0 AND ([lkBel�p�k].[�res]<> '�res �ll�s' OR [lkBel�p�k].[�res] is null )  
UNION 
SELECT 'lkKil�p�k' as T�bla, 'Illetm�ny' As [Hi�nyz� �rt�k], [Ad�azonos�t�] As Ad�jel, [�NYR SZERVEZETI EGYS�G AZONOS�T�] As SzervezetK�d , [�ll�shely azonos�t�]
FROM [lkKil�p�k] WHERE [Illetm�ny (Ft/h�)]=0 AND ([lkKil�p�k].[�res]<> '�res �ll�s' OR [lkKil�p�k].[�res] is null )  
UNION 
SELECT 'lkHat�rozottak_TT' as T�bla, 'Illetm�ny' As [Hi�nyz� �rt�k], [Ad�azonos�t�] As Ad�jel, [�NYR SZERVEZETI EGYS�G AZONOS�T�] As SzervezetK�d, [�ll�shely azonos�t�]
 FROM [lkHat�rozottak_TT] WHERE [Tart�san t�voll�v� illetm�ny�nek teljes �sszege]=0 AND ([lkHat�rozottak_TT].[�res]<> '�res �ll�s' OR [lkHat�rozottak_TT].[�res] is null )  
UNION 
SELECT 'lkHat�rozottak_TTH' as T�bla, 'Illetm�ny' As [Hi�nyz� �rt�k], [Mez�17] As Ad�jel, [Mez�25] As SzervezetK�d , [Mez�25]
FROM [lkHat�rozottak_TTH] WHERE [Tart�s t�voll�v� st�tusz�n foglalkoztatott illetm�ny�nek teljes ]=0 AND ([lkHat�rozottak_TTH].[�res]<> '�res �ll�s' OR [lkHat�rozottak_TTH].[�res] is null )
)  AS 01D;
