SELECT 'Kilépõk' AS Tábla, 'Besorolási fokozat megnevezése:' AS Hiányzó_érték, Kilépõk.[Adóazonosító], Kilépõk.[Álláshely azonosító], Kilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kilépõk] WHERE ([Kilépõk].[Besorolási fokozat megnevezése:] Is Null OR [Kilépõk].[Besorolási fokozat megnevezése:] = '')
UNION
SELECT 'Határozottak' AS Tábla, 'Megyei szint VAGY Járási Hivatal' AS Hiányzó_érték, Határozottak.[Adóazonosító], Határozottak.[Álláshely azonosító], Határozottak.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Határozottak] WHERE ([Határozottak].[Megyei szint VAGY Járási Hivatal] Is Null OR [Határozottak].[Megyei szint VAGY Járási Hivatal] = '')
UNION
SELECT 'Határozottak' AS Tábla, 'Mezõ5' AS Hiányzó_érték, Határozottak.[Adóazonosító], Határozottak.[Álláshely azonosító], Határozottak.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Határozottak] WHERE ([Határozottak].[Mezõ5] Is Null OR [Határozottak].[Mezõ5] = '')
UNION
SELECT 'Határozottak' AS Tábla, 'Mezõ6' AS Hiányzó_érték, Határozottak.[Adóazonosító], Határozottak.[Álláshely azonosító], Határozottak.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Határozottak] WHERE ([Határozottak].[Mezõ6] Is Null OR [Határozottak].[Mezõ6] = '')
UNION
SELECT 'Határozottak' AS Tábla, 'ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ' AS Hiányzó_érték, Határozottak.[Adóazonosító], Határozottak.[Álláshely azonosító], Határozottak.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Határozottak] WHERE ([Határozottak].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] Is Null OR [Határozottak].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] = '')
UNION
SELECT 'Határozottak' AS Tábla, 'Besorolási fokozat megnevezése:' AS Hiányzó_érték, Határozottak.[Adóazonosító], Határozottak.[Álláshely azonosító], Határozottak.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Határozottak] WHERE ([Határozottak].[Besorolási fokozat megnevezése:] Is Null OR [Határozottak].[Besorolási fokozat megnevezése:] = '')
UNION SELECT 'Határozottak' AS Tábla, 'Mezõ24' AS Hiányzó_érték, Határozottak.[Adóazonosító], Határozottak.[Álláshely azonosító], Határozottak.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Határozottak] WHERE ([Határozottak].[Mezõ24] Is Null OR [Határozottak].[Mezõ24] = '');
