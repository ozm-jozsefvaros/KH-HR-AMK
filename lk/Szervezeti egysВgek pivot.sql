PARAMETERS �ss�l_egy_entert Long;
TRANSFORM First(lkF�oszt�lyokOszt�lyokSorsz�mmal.Oszt�ly) AS FirstOfOszt�ly
SELECT lkF�oszt�lyokOszt�lyokSorsz�mmal.F�oszt�ly
FROM lkF�oszt�lyokOszt�lyokSorsz�mmal
WHERE (((lkF�oszt�lyokOszt�lyokSorsz�mmal.bfkhk�d) Like "BFKH*"))
GROUP BY lkF�oszt�lyokOszt�lyokSorsz�mmal.F�oszt�ly
PIVOT lkF�oszt�lyokOszt�lyokSorsz�mmal.Sorsz In (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21);
