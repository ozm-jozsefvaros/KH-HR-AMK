PARAMETERS Üssél_egy_entert Long;
TRANSFORM First(lkFõosztályokOsztályokSorszámmal.Osztály) AS FirstOfOsztály
SELECT lkFõosztályokOsztályokSorszámmal.Fõosztály
FROM lkFõosztályokOsztályokSorszámmal
WHERE (((lkFõosztályokOsztályokSorszámmal.bfkhkód) Like "BFKH*"))
GROUP BY lkFõosztályokOsztályokSorszámmal.Fõosztály
PIVOT lkFõosztályokOsztályokSorszámmal.Sorsz In (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21);
