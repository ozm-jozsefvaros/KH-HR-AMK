SELECT Unió5tábla.Tábla, Unió5tábla.Hiányzó_érték, Unió5tábla.Adóazonosító, Unió5tábla.[Álláshely azonosító], Unió5tábla.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Adóazonosító]*1 AS Adójel
FROM (SELECT Járási_állomány.Adóazonosító, Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], "Járási_állomány" as Tábla, "Besorolási fokozat megnevezése:" as Hiányzó_érték, [Besorolási fokozat megnevezése:]
FROM Járási_állomány

UNION
SELECT Kormányhivatali_állomány.Adóazonosító, Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], "Kormányhivatali_állomány" as Tábla, "Besorolási fokozat megnevezése:" as Hiányzó_érték, [Besorolási fokozat megnevezése:]
FROM Kormányhivatali_állomány

UNION
SELECT Központosítottak.Adóazonosító, Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító], "Központosítottak" as Tábla, "Besorolási fokozat megnevezése:" as Hiányzó_érték,  [Besorolási fokozat megnevezése:]
FROM   Központosítottak
WHERE '///--- Töröltem, mert a ki- és belépõk táblákból a jogviszony nem állapítható meg, de a munkaviszonyosokra nem jön le adat
UNION
SELECT lkBelépõk.Adóazonosító, lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], "lkBelépõk" as Tábla, "Besorolási fokozat megnevezése:" as Hiányzó_érték, [Besorolási fokozat megnevezése:]
FROM lkBelépõk

UNION
SELECT lkKilépõk.Adóazonosító, lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], "lkKilépõk" as Tábla, "Besorolási fokozat megnevezése:" as Hiányzó_érték, [Besorolási fokozat megnevezése:]
FROM lkKilépõk
---///'

)  AS Unió5tábla
WHERE (((Unió5tábla.[Besorolási fokozat megnevezése:]) Is Null Or (Unió5tábla.[Besorolási fokozat megnevezése:])="Error 2042"));
