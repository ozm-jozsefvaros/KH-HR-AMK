TRANSFORM Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám01.Létszám) AS SumOfLétszám
SELECT lkVárosKerületenkéntiFõosztályonkéntiLétszám01.Fõosztály
FROM lkVárosKerületenkéntiFõosztályonkéntiLétszám01
GROUP BY lkVárosKerületenkéntiFõosztályonkéntiLétszám01.Fõosztály
PIVOT lkVárosKerületenkéntiFõosztályonkéntiLétszám01.Kerület in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,"egyéb");
