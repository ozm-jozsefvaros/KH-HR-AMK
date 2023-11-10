SELECT UnióÖsszeggel.sor, UnióÖsszeggel.Fõosztály, UnióÖsszeggel.[Tartósan távollévõk], UnióÖsszeggel.SzSz
FROM (SELECT "1." as sor, Replace([lk_TT-sek].[Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS Fõosztály, Count([lk_TT-sek].Adóazonosító) AS [Tartósan távollévõk],  IIf(Left(Replace([bfkh],"BFKH.01.",""),2)="02",Left(Replace([bfkh],"BFKH.01.",""),5),Left(Replace([bfkh],"BFKH.01.",""),2)) as SzSz
FROM [lk_TT-sek]
WHERE ((([lk_TT-sek].Jogcíme)<>"Mentesítés munkáltató engedélye alapján"))
GROUP BY [lk_TT-sek].[Járási Hivatal], IIf(Left(Replace([bfkh],"BFKH.01.",""),2)="02",Left(Replace([bfkh],"BFKH.01.",""),5),Left(Replace([bfkh],"BFKH.01.",""),2))

UNION SELECT "2." as sor, "Összesen:" AS Fõosztály, Count([lk_TT-sek].Adóazonosító) AS [Tartósan távollévõk], "999" as SzSz
FROM [lk_TT-sek]
WHERE ((([lk_TT-sek].Jogcíme)<>"Mentesítés munkáltató engedélye alapján"))
GROUP BY "Összesen:")  AS UnióÖsszeggel
GROUP BY UnióÖsszeggel.sor, UnióÖsszeggel.Fõosztály, UnióÖsszeggel.[Tartósan távollévõk], UnióÖsszeggel.SzSz
ORDER BY UnióÖsszeggel.sor, UnióÖsszeggel.SzSz;
