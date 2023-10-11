SELECT Alaplétszám.[járási hivatal] AS [Fõosztály\hivatal], Alaplétszám.Adóazonosító, Alaplétszám.Név, Alaplétszám.[Álláshely azonosító], Alaplétszám.[Besorolási fokozat megnevezése:], Alaplétszám.[Heti munkaórák száma], Alaplétszám.Mezõ18, Round([Mezõ18]/[Heti munkaórák száma]*40,0) AS [40 órára vetített illetmény], IIf(InStr(1,[Besorolási fokozat kód:],"Mt."),"Mt.","Kit.") AS [Folgalkoztatás jellege], Alaplétszám.mezõ4 AS Betöltés
FROM (SELECT [járási hivatal], Járási_állomány.Adóazonosító, Név, Járási_állomány.[Álláshely azonosító], [Besorolási fokozat megnevezése:], Járási_állomány.[Heti munkaórák száma], Járási_állomány.Mezõ18, [Besorolási fokozat kód:], mezõ4
FROM Járási_állomány
UNION
SELECT Mezõ6,Kormányhivatali_állomány.Adóazonosító, Név, [Álláshely azonosító], Kormányhivatali_állomány.[Besorolási fokozat megnevezése:], Kormányhivatali_állomány.[Heti munkaórák száma], Kormányhivatali_állomány.Mezõ18, [Besorolási fokozat kód:], mezõ4
FROM Kormányhivatali_állomány

)  AS Alaplétszám
WHERE (((Alaplétszám.[Besorolási fokozat megnevezése:]) Like "*hivatali tanácsos*"));
