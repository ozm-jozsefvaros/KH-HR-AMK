SELECT "tSzemélyek" AS Tábla, "Munkavégzés helye - cím" AS Hiányzó_érték, lkSzemélyek.Adójel AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Munkavégzés helye - cím]) Is Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null));
