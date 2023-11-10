SELECT Uni��sszeggel.sor, Uni��sszeggel.F�oszt�ly, Uni��sszeggel.[Tart�san t�voll�v�k], Uni��sszeggel.SzSz
FROM (SELECT "1." as sor, Replace([lk_TT-sek].[J�r�si Hivatal],"Budapest F�v�ros Korm�nyhivatala","BFKH") AS F�oszt�ly, Count([lk_TT-sek].Ad�azonos�t�) AS [Tart�san t�voll�v�k],  IIf(Left(Replace([bfkh],"BFKH.01.",""),2)="02",Left(Replace([bfkh],"BFKH.01.",""),5),Left(Replace([bfkh],"BFKH.01.",""),2)) as SzSz
FROM [lk_TT-sek]
WHERE ((([lk_TT-sek].Jogc�me)<>"Mentes�t�s munk�ltat� enged�lye alapj�n"))
GROUP BY [lk_TT-sek].[J�r�si Hivatal], IIf(Left(Replace([bfkh],"BFKH.01.",""),2)="02",Left(Replace([bfkh],"BFKH.01.",""),5),Left(Replace([bfkh],"BFKH.01.",""),2))

UNION SELECT "2." as sor, "�sszesen:" AS F�oszt�ly, Count([lk_TT-sek].Ad�azonos�t�) AS [Tart�san t�voll�v�k], "999" as SzSz
FROM [lk_TT-sek]
WHERE ((([lk_TT-sek].Jogc�me)<>"Mentes�t�s munk�ltat� enged�lye alapj�n"))
GROUP BY "�sszesen:")  AS Uni��sszeggel
GROUP BY Uni��sszeggel.sor, Uni��sszeggel.F�oszt�ly, Uni��sszeggel.[Tart�san t�voll�v�k], Uni��sszeggel.SzSz
ORDER BY Uni��sszeggel.sor, Uni��sszeggel.SzSz;
