SELECT [01D].Tábla, [01D].Hiányzó_érték, [01D].Adójel AS Adóazonosító, [01D].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Álláshely azonosító]
FROM (SELECT 'Járási_állomány' as Tábla, 'Illetmény' As [Hiányzó_érték], [Adóazonosító] As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]  , [Álláshely azonosító]
 FROM [Járási_állomány] WHERE [Mezõ18]=0 AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null )  
UNION 
SELECT 'Kormányhivatali_állomány' as Tábla, 'Illetmény' As [Hiányzó érték], [Adóazonosító] As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] As SzervezetKód , [Álláshely azonosító]
 FROM [Kormányhivatali_állomány] WHERE [Mezõ18]=0 AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null )  
UNION 
SELECT 'Központosítottak' as Tábla, 'Illetmény' As [Hiányzó érték], [Adóazonosító] As Adójel, [Nexon szótárelemnek megfelelõ szervezeti egység azonosító] As SzervezetKód , [Álláshely azonosító]
 FROM [Központosítottak] WHERE [Mezõ17]=0 AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )  
UNION 
SELECT 'lkBelépõk' as Tábla, 'Illetmény' As [Hiányzó érték], [Adóazonosító] As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] As SzervezetKód , [Álláshely azonosító]
FROM [lkBelépõk] WHERE [Illetmény (Ft/hó)]=0 AND ([lkBelépõk].[Üres]<> 'üres állás' OR [lkBelépõk].[Üres] is null )  
UNION 
SELECT 'lkKilépõk' as Tábla, 'Illetmény' As [Hiányzó érték], [Adóazonosító] As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] As SzervezetKód , [Álláshely azonosító]
FROM [lkKilépõk] WHERE [Illetmény (Ft/hó)]=0 AND ([lkKilépõk].[Üres]<> 'üres állás' OR [lkKilépõk].[Üres] is null )  
UNION 
SELECT 'lkHatározottak_TT' as Tábla, 'Illetmény' As [Hiányzó érték], [Adóazonosító] As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] As SzervezetKód, [Álláshely azonosító]
 FROM [lkHatározottak_TT] WHERE [Tartósan távollévõ illetményének teljes összege]=0 AND ([lkHatározottak_TT].[Üres]<> 'üres állás' OR [lkHatározottak_TT].[Üres] is null )  
UNION 
SELECT 'lkHatározottak_TTH' as Tábla, 'Illetmény' As [Hiányzó érték], [Mezõ17] As Adójel, [Mezõ25] As SzervezetKód , [Mezõ25]
FROM [lkHatározottak_TTH] WHERE [Tartós távollévõ státuszán foglalkoztatott illetményének teljes ]=0 AND ([lkHatározottak_TTH].[Üres]<> 'üres állás' OR [lkHatározottak_TTH].[Üres] is null )
)  AS 01D;
