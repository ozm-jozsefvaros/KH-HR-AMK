SELECT tNexonAzonos�t�k.Azonos�t�, tNexonAzonos�t�k.N�v, tNexonAzonos�t�k.[Szem�ly azonos�t�] AS azNexon, [Ad�azonos�t� jel]*1 AS Ad�jel, "<a href=""https://nexonport.kh.gov.hu/menu/hrm/szemelyiKarton/index?szemelyAzonosito=" & [azNexon] & "&r=13"">" & [N�v] & "</a>" AS NLink, (SELECT COUNT(Azonos�t�) 
        FROM tNexonAzonos�t�k AS Tmp 
        Where Tmp.Kezdete <= tNexonAzonos�t�k.Kezdete
        AND Tmp.[Szem�ly azonos�t�] = tNexonAzonos�t�k.[Szem�ly azonos�t�]
    ) AS Sorsz�m
FROM tNexonAzonos�t�k
ORDER BY tNexonAzonos�t�k.N�v;
