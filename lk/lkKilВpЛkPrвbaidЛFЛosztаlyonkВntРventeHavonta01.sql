SELECT Trim(Replace(Replace(Replace([lkKilépõUnió].[Fõosztály],"Budapest Fõváros Kormányhivatala","BFKH")," 20200229-ig",""),"Budapest FõvárosKormányhivatala","BFKH")) AS Fõosztály, Year([Jogviszony megszûnésének, megszüntetésének idõpontja]) AS Év, Month([Jogviszony megszûnésének, megszüntetésének idõpontja]) AS Hó, 1 AS fõ
FROM lkKilépõUnió
WHERE (((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva]) Like "*próbaidõ*"));
