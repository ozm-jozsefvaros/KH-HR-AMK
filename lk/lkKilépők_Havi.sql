SELECT Kilépõk.Név, [Kilépõk].[Adóazonosító]*1 AS Adóazonosító, Kilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja] AS Kilépés, Month([Jogviszony megszûnésének, megszüntetésének idõpontja]) AS Hó
FROM Kilépõk;
