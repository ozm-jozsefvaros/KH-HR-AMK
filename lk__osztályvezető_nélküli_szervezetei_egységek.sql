SELECT DISTINCT Álláshelyek.[4 szint], Álláshelyek.[5 szint]
FROM Álláshelyek
WHERE (((Álláshelyek.[5 szint]) Not In (SELECT DISTINCT Álláshelyek.[5 szint]
FROM Álláshelyek
WHERE (((Álláshelyek.[Álláshely besorolási kategóriája]) = "osztályvezetõ")))));
