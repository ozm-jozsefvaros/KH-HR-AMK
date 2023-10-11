SELECT lk_Osztályonkénti_átlagilletmény01.bfkh, lk_Osztályonkénti_átlagilletmény01.Fõosztály, lk_Osztályonkénti_átlagilletmény01.Osztály, Round([Illetmény]/100,0)*100 AS Átlagilletmény
FROM lk_Osztályonkénti_átlagilletmény01;
