SELECT [01b].Tábla, [01b].Hiányzó_érték, [01b].Adóazonosító, [01b].[Álláshely azonosító], [01b].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Adóazonosító]*1 AS Adójel
FROM (SELECT 'lkBelépõk' AS Tábla, 'Adóazonosító' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk]  WHERE ([lkBelépõk].[Adóazonosító] Is Null )   

UNION SELECT 'lkBelépõk' AS Tábla, 'Név' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk]  WHERE ([lkBelépõk].[Név] Is Null OR [lkBelépõk].[Név]='')   

UNION SELECT 'Központosítottak' AS Tábla, 'Legmagasabb iskolai végzettség 1=8. osztály; 2=érettségi; 3=fõiskolai végzettség; 4=egyetemi végzettség; 5=technikus; 6= KAB vizsga' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] Is Null )  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )   

UNION SELECT 'Központosítottak' AS Tábla, 'Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] Is Null OR [Központosítottak].[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )   



  UNION SELECT 'Központosítottak' AS Tábla, 'Havi illetmény teljes összege (kerekítve) (FT)' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Mezõ17] Is Null )  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )  

 UNION SELECT 'Központosítottak' AS Tábla, 'Álláshely azonosító' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Álláshely azonosító] Is Null OR [Központosítottak].[Álláshely azonosító]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )

   UNION SELECT 'Központosítottak' AS Tábla, 'Besorolási fokozat megnevezése:' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Besorolási fokozat megnevezése:] Is Null OR [Központosítottak].[Besorolási fokozat megnevezése:]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )  

 UNION SELECT 'Központosítottak' AS Tábla, 'Besorolási fokozat kód:' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Besorolási fokozat kód:] Is Null OR [Központosítottak].[Besorolási fokozat kód:]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )   

UNION SELECT 'Központosítottak' AS Tábla, 'Álláshely betöltésének aránya és Üres álláshely betöltés aránya' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Mezõ13] Is Null )  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )
)  AS 01b;
