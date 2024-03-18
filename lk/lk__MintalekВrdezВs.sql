SELECT 'Járási_állomány' AS Tábla, "Ellátott feladat" AS [Hiányzó érték], Járási_állomány.Adóazonosító, Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM Járási_állomány
WHERE (((Járási_állomány.Mezõ9) Is Null Or (Járási_állomány.Mezõ9)="") AND ((Járási_állomány.Mezõ4)<>"üres állás"));
