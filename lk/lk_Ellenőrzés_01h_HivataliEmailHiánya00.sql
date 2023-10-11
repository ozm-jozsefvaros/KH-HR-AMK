SELECT "Személytörzs" AS Tábla, "Hivatali email" AS Hiányzó_érték, tSzemélyek.[Adóazonosító jel] AS Adóazonosító, tSzemélyek.[Státusz kódja] AS [Álláshely azonosító], tSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], tSzemélyek.Adójel, tSzemélyek.[Jogviszony sorszáma]
FROM tSzemélyek
WHERE (((tSzemélyek.[Státusz neve])="Álláshely") AND ((Len(Nz([Hivatali email]," ")))<4) AND ((tSzemélyek.[Tartós távollét típusa]) Is Null))
ORDER BY tSzemélyek.Adójel, tSzemélyek.[Jogviszony sorszáma] DESC;
