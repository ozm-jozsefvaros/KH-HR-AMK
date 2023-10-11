SELECT Álláshelyek.[3 szint], Álláshelyek.[4 szint], Álláshelyek.[5 szint], Count(Álláshelyek.[Álláshely azonosító]) AS [CountOfÁlláshely azonosító], 2 AS Sor
FROM Álláshelyek
WHERE (((Álláshelyek.[Álláshely besorolási kategóriája])="osztályvezetõ"))
GROUP BY Álláshelyek.[3 szint], Álláshelyek.[4 szint], Álláshelyek.[5 szint], 2
HAVING (((Count(Álláshelyek.[Álláshely azonosító]))>1));
