SELECT Illetm�ny, Ad�jel, SzervezetK�d
FROM (SELECT 'J�r�si_�llom�ny' as T�bla, [J�r�si_�llom�ny].[Mez�18] as [Illetm�ny], (Nz([Ad�azonos�t�],0)*1) As Ad�jel, [�NYR SZERVEZETI EGYS�G AZONOS�T�]  as SzervezetK�d
        FROM [J�r�si_�llom�ny] 
        WHERE ([J�r�si_�llom�ny].[Mez�4]<> '�res �ll�s' OR [J�r�si_�llom�ny].[Mez�4] is null )  
    UNION 
    SELECT 'Korm�nyhivatali_�llom�ny' as T�bla, [Korm�nyhivatali_�llom�ny].[Mez�18] as [Illetm�ny], (Nz([Ad�azonos�t�],0)*1) As Ad�jel, [�NYR SZERVEZETI EGYS�G AZONOS�T�] As SzervezetK�d 
        FROM [Korm�nyhivatali_�llom�ny] 
        WHERE ([Korm�nyhivatali_�llom�ny].[Mez�4]<> '�res �ll�s'  OR [Korm�nyhivatali_�llom�ny].[Mez�4] is null)  
    UNION 
    SELECT 'K�zpontos�tottak' as T�bla, [K�zpontos�tottak].[Mez�17] as [Illetm�ny], (Nz([Ad�azonos�t�],0)*1) As Ad�jel, [Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] As SzervezetK�d 
        FROM [K�zpontos�tottak] 
        WHERE ([K�zpontos�tottak].[Mez�4]<> '�res �ll�s' OR [K�zpontos�tottak].[Mez�4] is null  )  
)  AS Illetm�nyUni�;
