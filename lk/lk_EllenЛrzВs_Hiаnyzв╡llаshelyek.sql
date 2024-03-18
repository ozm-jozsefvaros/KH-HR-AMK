SELECT Álláshelyek.[Álláshely azonosító], Álláshelyek.[Álláshely besorolási kategóriája], Álláshelyek.[Álláshely típusa]
FROM lkÁlláshelyAzonosítókHaviból LEFT JOIN Álláshelyek ON lkÁlláshelyAzonosítókHaviból.Álláshely = Álláshelyek.[Álláshely azonosító]
WHERE (((Álláshelyek.[Álláshely azonosító]) Is Null));
