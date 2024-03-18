SELECT tSzemélyek230227.*
FROM tSzemélyek230227
WHERE ((((SELECT Max(Tmp.[Jogviszony sorszáma]) AS [MaxOfJogviszony sorszáma]
        FROM tSzemélyek230227 as Tmp
        WHERE tSzemélyek230227.Adójel=Tmp.Adójel
        GROUP BY Tmp.Adójel
    ))=[tSzemélyek230227].[Jogviszony sorszáma]));
