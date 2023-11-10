SELECT HavibólBesorolások.Zóna, HavibólBesorolások.[Álláshely azonosító], HavibólBesorolások.[Besorolási fokozat kód:], HavibólBesorolások.[Besorolási fokozat megnevezése:], Replace(Replace([Besorolási fokozat kód:],"Mt.",""),"ÜÁ.","") AS Jel, Nz([Adóazonosító],0)*1 AS Adójel, bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS BFKH
FROM (SELECT Járási_állomány.[Álláshely azonosító]
, Járási_állomány.[Besorolási fokozat megnevezése:]
, [Besorolási fokozat kód:]
, "Alaplétszám" as Zóna
, Adóazonosító
, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM  lkJárási_állomány
UNION
SELECT  Kormányhivatali_állomány.[Álláshely azonosító]
, Kormányhivatali_állomány.[Besorolási fokozat megnevezése:]
, [Besorolási fokozat kód:]
, "Alaplétszám" as Zóna
, Adóazonosító
, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM  lkKormányhivatali_állomány
UNION
SELECT Központosítottak.[Álláshely azonosító]
, Központosítottak.[Besorolási fokozat megnevezése:]
, [Besorolási fokozat kód:]
, "Központosított" as Zóna
, Adóazonosító
, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM lkKözpontosítottak
)  AS HavibólBesorolások;
