SELECT [01a].Tábla, [01a].Hiányzó_érték, [01a].Adóazonosító, [01a].[Álláshely azonosító], [01a].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Adóazonosító]*1 AS adójel
FROM (SELECT 'lkKilépõk' AS Tábla, 'Jogviszony megszûnésének, megszüntetésének idõpontja' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Jogviszony megszûnésének, megszüntetésének idõpontja] Is Null ) 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Jogviszony kezdõ dátuma' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Jogviszony kezdõ dátuma] Is Null ) 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hivatkozás száma (§, bek., pontja)' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva] Is Null OR [lkKilépõk].[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Álláshely azonosító' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Álláshely azonosító] Is Null OR [lkKilépõk].[Álláshely azonosító]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Ellátott feladatok megjelölése
a fõvárosi és megyei kormányhivatalok szervezeti és mûködési szabályzatáról szóló 3/2020. (II. 28.) MvM utasítás alapján' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Mezõ8] Is Null OR [lkKilépõk].[Mezõ8]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] Is Null OR [lkKilépõk].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Szervezeti egység
Osztály megnevezése' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Mezõ6] Is Null OR [lkKilépõk].[Mezõ6]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Szervezeti egység
Fõosztály megnevezése' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Mezõ5] Is Null OR [lkKilépõk].[Mezõ5]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Megyei szint VAGY Járási Hivatal' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Megyei szint VAGY Járási Hivatal] Is Null OR [lkKilépõk].[Megyei szint VAGY Járási Hivatal]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Adóazonosító' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Adóazonosító] Is Null )
)  AS 01a;
