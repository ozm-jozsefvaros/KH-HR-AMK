SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, tSzolgálatiIdõ.[Szolgálati elismerés idõ], tSzolgálatiIdõ.[Jogviszony kezdete]
FROM tSzolgálatiIdõ LEFT JOIN lkSzemélyek ON tSzolgálatiIdõ.Adójel=lkSzemélyek.Adójel
WHERE (((tSzolgálatiIdõ.[Jogviszony kezdete])>#10/1/2020#) AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Like "korm*") AND ((bfkh(Nz([Szervezeti egység kódja],0))) Is Not Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY bfkh(Nz([Szervezeti egység kódja],0));
