SELECT Illetmény, Adójel, SzervezetKód
FROM (SELECT 'Járási_állomány' as Tábla, [Járási_állomány].[Mezõ18] as [Illetmény], (Nz([Adóazonosító],0)*1) As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]  as SzervezetKód
        FROM [Járási_állomány] 
        WHERE ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null )  
    UNION 
    SELECT 'Kormányhivatali_állomány' as Tábla, [Kormányhivatali_állomány].[Mezõ18] as [Illetmény], (Nz([Adóazonosító],0)*1) As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] As SzervezetKód 
        FROM [Kormányhivatali_állomány] 
        WHERE ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás'  OR [Kormányhivatali_állomány].[Mezõ4] is null)  
    UNION 
    SELECT 'Központosítottak' as Tábla, [Központosítottak].[Mezõ17] as [Illetmény], (Nz([Adóazonosító],0)*1) As Adójel, [Nexon szótárelemnek megfelelõ szervezeti egység azonosító] As SzervezetKód 
        FROM [Központosítottak] 
        WHERE ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null  )  
)  AS IlletményUnió;
