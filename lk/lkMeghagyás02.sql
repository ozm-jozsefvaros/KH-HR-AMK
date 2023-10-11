SELECT lkMeghagyás01.Azonosító, lkMeghagyás01.FõosztályKód, lkMeghagyás01.Fõosztály, Count(lkMeghagyás01.Létszám) AS CountOfLétszám, lkMeghagyás01.[Meghagyandó%], Sum([Létszám]*[Meghagyandó%]/100) AS [Meghagyandó létszám]
FROM lkMeghagyás01
GROUP BY lkMeghagyás01.Azonosító, lkMeghagyás01.FõosztályKód, lkMeghagyás01.Fõosztály, lkMeghagyás01.[Meghagyandó%];
