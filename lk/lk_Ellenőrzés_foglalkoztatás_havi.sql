SELECT Unió.Adójel, Unió.Név, Unió.[Járási Hivatal] AS Fõosztály, Unió.Mezõ7 AS Osztály, Unió.Foglalkoztatás, Unió.[Heti munkaórák száma], Unió.[Státusz típusa], Unió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Unió.Mezõ4 AS [Születési év], [Mezõ10] AS Belépés, *
FROM (SELECT Járási_állomány.Adóazonosító * 1 AS Adójel, Járási_állomány.Név, Járási_állomány.[Járási Hivatal], Járási_állomány.Mezõ7, right(Járási_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1) AS Foglalkoztatás, Járási_állomány.[Heti munkaórák száma], "Szervezeti alaplétszám" As [Státusz típusa], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Mezõ4, mezõ10
FROM Járási_állomány
WHERE Járási_állomány.Adóazonosító  <>""
UNION
SELECT Kormányhivatali_állomány.Adóazonosító * 1 AS Adójel, Kormányhivatali_állomány.Név, Kormányhivatali_állomány.Mezõ6, Kormányhivatali_állomány.Mezõ7, right(Kormányhivatali_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1),Kormányhivatali_állomány.[Heti munkaórák száma], "Szervezeti alaplétszám" As [Státusz típusa], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Mezõ4, Mezõ10
FROM  Kormányhivatali_állomány
WHERE Kormányhivatali_állomány.Adóazonosító  <>""
UNION SELECT Központosítottak.Adóazonosító * 1 AS Adójel, Központosítottak.Név, Központosítottak.Mezõ6, Központosítottak.Mezõ7, right(Központosítottak.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1), 0 As [Heti munkaórák száma],"Központosított állomány" As [Státusz típusa], [Nexon szótárelemnek megfelelõ szervezeti egység azonosító], Mezõ4, Mezõ11
FROM   Központosítottak
WHERE  Központosítottak.Adóazonosító <>"")  AS Unió;
