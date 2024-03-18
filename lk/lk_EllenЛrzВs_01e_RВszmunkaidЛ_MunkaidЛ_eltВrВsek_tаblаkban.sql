SELECT RészmunkaidõsUnió.Tábla, RészmunkaidõsUnió.Hiányzó_érték, RészmunkaidõsUnió.Adóazonosító, RészmunkaidõsUnió.[Álláshely azonosító], RészmunkaidõsUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Adóazonosító]*1 AS Adójel
FROM (SELECT "Kormányhivatali_állomány" AS Tábla
, "Részmunkaidõsnek van jelölve, de teljes munkaidõben dolgozik." AS [Hiányzó_érték]
, Kormányhivatali_állomány.Adóazonosító, Kormányhivatali_állomány.[Álláshely azonosító]
, Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
, Kormányhivatali_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]
, Kormányhivatali_állomány.[Heti munkaórák száma]
, IIf(Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="R" And [Heti munkaórák száma]=40,True,False) AS Hibás
FROM Kormányhivatali_állomány
WHERE (((
IIf
             (Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="R" 
     And [Heti munkaórák száma]=40
   ,True
   ,False))
=-1))
UNION
SELECT "Járási_állomány" AS Tábla
, "Részmunkaidõsnek van jelölve, de teljes munkaidõben dolgozik." AS [Hibás érték]
, Járási_állomány.Adóazonosító
, Járási_állomány.[Álláshely azonosító]
, Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
, Járási_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]
, Járási_állomány.[Heti munkaórák száma]
, IIf(Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="R" And [Heti munkaórák száma]=40,True,False) AS Hibás
FROM Járási_állomány
WHERE (((
IIf
             (Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="R" 
     And [Heti munkaórák száma]=40
   ,True
   ,False))
=-1))
UNION
SELECT "Kormányhivatali_állomány" AS Tábla
, "Teljes munkaidõsnek van jelölve, de részmunkaidõben dolgozik." AS [Hibás érték]
, Kormányhivatali_állomány.Adóazonosító, Kormányhivatali_állomány.[Álláshely azonosító]
, Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
, Kormányhivatali_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]
, Kormányhivatali_állomány.[Heti munkaórák száma]
, IIf(Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="T" And [Heti munkaórák száma]<>40,True,False) AS Hibás
FROM Kormányhivatali_állomány
WHERE (((
IIf
             (Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="T" 
     And [Heti munkaórák száma]<>40
   ,True
   ,False))
=-1))
UNION SELECT "Járási_állomány" AS Tábla
, "Teljes munkaidõsnek van jelölve, de részmunkaidõben dolgozik." AS [Hibás érték]
, Járási_állomány.Adóazonosító
, Járási_állomány.[Álláshely azonosító]
, Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
, Járási_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]
, Járási_állomány.[Heti munkaórák száma]
, IIf(Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="T" And [Heti munkaórák száma]<>40,True,False) AS Hibás
FROM Járási_állomány
WHERE (((
IIf
             (Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="T" 
     And [Heti munkaórák száma]<>40
   ,True
   ,False))
=-1))
)  AS RészmunkaidõsUnió;
