SELECT [01c].Tábla, [01c].Hiányzó_érték, [01c].Adóazonosító, [01c].[Álláshely azonosító], [01c].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Adóazonosító]*1 AS Adójel
FROM (SELECT 'lkKilépõk' AS Tábla, 'Név' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Név] Is Null OR [lkKilépõk].[Név]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Illetmény (Ft/hó)' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Illetmény (Ft/hó)] Is Null ) 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] Is Null OR [lkBelépõk].[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Jogviszony kezdõ dátuma' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Jogviszony kezdõ dátuma] Is Null ) 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Álláshely azonosító' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Álláshely azonosító] Is Null OR [lkBelépõk].[Álláshely azonosító]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Ellátott feladatok megjelölése
a fõvárosi és megyei kormányhivatalok szervezeti és mûködési szabályzatáról szóló 3/2020. (II. 28.) MvM utasítás alapján' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Mezõ8] Is Null OR [lkBelépõk].[Mezõ8]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] Is Null OR [lkBelépõk].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Szervezeti egység
Osztály megnevezése' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Mezõ6] Is Null OR [lkBelépõk].[Mezõ6]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Szervezeti egység
Fõosztály megnevezése' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Mezõ5] Is Null OR [lkBelépõk].[Mezõ5]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Megyei szint VAGY Járási Hivatal' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Megyei szint VAGY Járási Hivatal] Is Null OR [lkBelépõk].[Megyei szint VAGY Járási Hivatal]='')
)  AS 01c;
