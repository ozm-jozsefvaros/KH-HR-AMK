SELECT tSzem�lyek230227.*
FROM tSzem�lyek230227
WHERE ((((SELECT Max(Tmp.[Jogviszony sorsz�ma]) AS [MaxOfJogviszony sorsz�ma]
        FROM tSzem�lyek230227 as Tmp
        WHERE tSzem�lyek230227.Ad�jel=Tmp.Ad�jel
        GROUP BY Tmp.Ad�jel
    ))=[tSzem�lyek230227].[Jogviszony sorsz�ma]));
