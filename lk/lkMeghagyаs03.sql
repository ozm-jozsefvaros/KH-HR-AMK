SELECT lkMeghagyás02.Azonosító, lkMeghagyás02.FõosztályKód, lkMeghagyás02.Fõosztály, lkMeghagyás02.CountOfLétszám, lkMeghagyás02.[Meghagyandó%], Round([Meghagyandó létszám]) AS Meghagyandók INTO tMeghagyás03
FROM lkMeghagyás02;
