SELECT Járási_állomány.[Álláshely azonosító] As Álláshely FROM Járási_állomány UNION 
SELECT Kormányhivatali_állomány.[Álláshely azonosító] As Álláshely FROM Kormányhivatali_állomány UNION SELECT Központosítottak.[Álláshely azonosító] As Álláshely  FROM Központosítottak;
