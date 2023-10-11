SELECT Unió.Adóazonosító, Unió.Név, Unió.[Járási Hivatal], Unió.Osztály, Unió.Jogcíme, Unió.Kinevezés, bfkh([BFKHkód]) AS bfkh, *
FROM (SELECT Járási_állomány.Adóazonosító, Járási_állomány.Név, Járási_állomány.[Járási Hivatal], Járási_állomány.Mezõ7 as Osztály, Járási_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] as Jogcíme, Mezõ10 as Kinevezés,[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] as BFKHkód
FROM Járási_állomány
WHERE ((Len(Járási_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp])>"0"))
UNION
SELECT Kormányhivatali_állomány.Adóazonosító, Kormányhivatali_állomány.Név, Kormányhivatali_állomány.Mezõ6, Kormányhivatali_állomány.Mezõ7, Kormányhivatali_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Mezõ10, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM  Kormányhivatali_állomány
WHERE ((Len(Kormányhivatali_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp])>"0"))
UNION 
SELECT Központosítottak.Adóazonosító, Központosítottak.Név, Központosítottak.Mezõ6, Központosítottak.Mezõ7, Központosítottak.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp],Mezõ11, [Nexon szótárelemnek megfelelõ szervezeti egység azonosító]
FROM   Központosítottak
WHERE ((Len(Központosítottak.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp])>"0"))
)  AS Unió;
