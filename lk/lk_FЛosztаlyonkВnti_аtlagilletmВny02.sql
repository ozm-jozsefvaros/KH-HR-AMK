SELECT lk_Fõosztályonkénti_átlagilletmény01.Fõosztály AS Fõosztály, Round([Illetmény]/100,0)*100 AS Átlagilletmény
FROM lk_Fõosztályonkénti_átlagilletmény01
ORDER BY lk_Fõosztályonkénti_átlagilletmény01.[FK];
