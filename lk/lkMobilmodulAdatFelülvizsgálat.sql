SELECT DISTINCT [SIM adatok - 2023-08-29 (2)].Azonos�t�, [SIM adatok - 2023-08-29 (2)].Telefonsz�mId, [SIM adatok - 2023-08-29 (2)].Telefonsz�m, [SIM adatok - 2023-08-29 (2)].Megjegyz�s, [SIM adatok - 2023-08-29 (2)].[Dolgoz� n�v], [SIM adatok - 2023-08-29 (2)].[Szem�lyt�rzsben akt�v -e], [SIM adatok - 2023-08-29 (2)].[Szem�lyt�rzs szerinti e-mail c�m], [SIM adatok - 2023-08-29 (2)].[Szem�lyt�rzsben szervezeti egys�ge], [SIM adatok - 2023-08-29 (2)].[NEXON ID], [SIM adatok - 2023-08-29 (2)].Beoszt�s, [SIM adatok - 2023-08-29 (2)].[Szervezeti egys�g], lkSzem�lyek�sNexonAz.F�oszt�ly, lkSzem�lyek�sNexonAz.[Dolgoz� teljes neve], lkSzem�lyek�sNexonAz.[Hivatali email], IIf([St�tusz neve] Is Null,
    "A dolgoz� kil�pett",
    Trim(
        IIf([F�oszt�ly]<>[Szervezeti egys�g],
            "A szervezeti egys�g:" & [F�oszt�ly] & ".",
            "") 
        & " " & 
        IIf([Dolgoz� teljes neve]<>[Dolgoz� n�v] AND [Dolgoz� n�v] NOT LIKE "Dr.*",
            "A n�v: " & [Dolgoz� teljes neve] & ".",
            "") 
        & " " & 
        IIf([Hivatali email]<>[Szem�lyt�rzs szerinti e-mail c�m],
            "A Nexonban nyilv�ntartott email: " & [Hivatali email] & ".",
            "")
        )
    ) AS Adathelyesb�t�s, ffsplit(lkSzem�lyek�sNexonAz.[Els�dleges feladatk�r],"-",2) AS [Els�dleges feladatk�r Nexon]
FROM lkSzem�lyek�sNexonAz RIGHT JOIN [SIM adatok - 2023-08-29 (2)] ON (lkSzem�lyek�sNexonAz.azNexon = [SIM adatok - 2023-08-29 (2)].[NEXON ID]) 
            OR 
            (lkSzem�lyek�sNexonAz.[Dolgoz� teljes neve] = [SIM adatok - 2023-08-29 (2)].[Dolgoz� n�v]);
