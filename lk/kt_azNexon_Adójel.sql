SELECT tNexonAzonosítók.Azonosító, tNexonAzonosítók.Név, tNexonAzonosítók.[Személy azonosító] AS azNexon, [Adóazonosító jel]*1 AS Adójel, "<a href=""https://nexonport.kh.gov.hu/menu/hrm/szemelyiKarton/index?szemelyAzonosito=" & [azNexon] & "&r=13"">" & [Név] & "</a>" AS NLink, (SELECT COUNT(Azonosító) 
        FROM tNexonAzonosítók AS Tmp 
        Where Tmp.Kezdete <= tNexonAzonosítók.Kezdete
        AND Tmp.[Személy azonosító] = tNexonAzonosítók.[Személy azonosító]
    ) AS Sorszám
FROM tNexonAzonosítók
ORDER BY tNexonAzonosítók.Név;
