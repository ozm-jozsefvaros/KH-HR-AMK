SELECT DISTINCT [SIM adatok - 2023-08-29 (2)].Azonosító, [SIM adatok - 2023-08-29 (2)].TelefonszámId, [SIM adatok - 2023-08-29 (2)].Telefonszám, [SIM adatok - 2023-08-29 (2)].Megjegyzés, [SIM adatok - 2023-08-29 (2)].[Dolgozó név], [SIM adatok - 2023-08-29 (2)].[Személytörzsben aktív -e], [SIM adatok - 2023-08-29 (2)].[Személytörzs szerinti e-mail cím], [SIM adatok - 2023-08-29 (2)].[Személytörzsben szervezeti egysége], [SIM adatok - 2023-08-29 (2)].[NEXON ID], [SIM adatok - 2023-08-29 (2)].Beosztás, [SIM adatok - 2023-08-29 (2)].[Szervezeti egység], lkSzemélyekÉsNexonAz.Fõosztály, lkSzemélyekÉsNexonAz.[Dolgozó teljes neve], lkSzemélyekÉsNexonAz.[Hivatali email], IIf([Státusz neve] Is Null,
    "A dolgozó kilépett",
    Trim(
        IIf([Fõosztály]<>[Szervezeti egység],
            "A szervezeti egység:" & [Fõosztály] & ".",
            "") 
        & " " & 
        IIf([Dolgozó teljes neve]<>[Dolgozó név] AND [Dolgozó név] NOT LIKE "Dr.*",
            "A név: " & [Dolgozó teljes neve] & ".",
            "") 
        & " " & 
        IIf([Hivatali email]<>[Személytörzs szerinti e-mail cím],
            "A Nexonban nyilvántartott email: " & [Hivatali email] & ".",
            "")
        )
    ) AS Adathelyesbítés, ffsplit(lkSzemélyekÉsNexonAz.[Elsõdleges feladatkör],"-",2) AS [Elsõdleges feladatkör Nexon]
FROM lkSzemélyekÉsNexonAz RIGHT JOIN [SIM adatok - 2023-08-29 (2)] ON (lkSzemélyekÉsNexonAz.azNexon = [SIM adatok - 2023-08-29 (2)].[NEXON ID]) 
            OR 
            (lkSzemélyekÉsNexonAz.[Dolgozó teljes neve] = [SIM adatok - 2023-08-29 (2)].[Dolgozó név]);
