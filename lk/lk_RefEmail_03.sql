PARAMETERS �ss�l_egy_entert Long;
TRANSFORM First(lk_RefEmail_02.[Hivatali email]) AS [FirstOfHivatali email]
SELECT lk_RefEmail_02.azSzervezet, lk_RefEmail_02.[Szervezeti egys�g k�dja], lk_RefEmail_02.F�oszt�ly, lk_RefEmail_02.Oszt�ly
FROM lk_RefEmail_02
GROUP BY lk_RefEmail_02.azSzervezet, lk_RefEmail_02.[Szervezeti egys�g k�dja], lk_RefEmail_02.F�oszt�ly, lk_RefEmail_02.Oszt�ly
PIVOT lk_RefEmail_02.Sorsz�m In (1,2,3,4,5,6);
