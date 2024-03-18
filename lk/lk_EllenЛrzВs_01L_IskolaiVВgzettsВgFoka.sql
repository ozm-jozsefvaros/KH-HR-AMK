SELECT "tSzemélyek" AS Tábla, "A legmagasabb iskolai végzettség foka" AS Hiányzó_érték, lkSzemélyek.Adójel AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Iskolai végzettség foka]) Is Null) AND ((lkSzemélyek.[Státusz típusa]) Is Not Null));
