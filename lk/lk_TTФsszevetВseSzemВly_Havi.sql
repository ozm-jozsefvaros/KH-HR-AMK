SELECT Havi.Bfkh AS bfkh, Havi.Ad�jel, Havi.N�v, Replace([J�r�si Hivatal],"Budapest F�v�ros Korm�nyhivatala","BFKH") AS [Szervezeti egys�g], Havi.Oszt�ly, Havi.Jogc�me AS [Inakt�v �llom�nyba ker�l�s oka], Szem�lyek.[Tart�s t�voll�t t�pusa], kt_azNexon_Ad�jel02.NLink
FROM kt_azNexon_Ad�jel02 RIGHT JOIN ((SELECT [Ad�azonos�t�]*1 AS Ad�jel, [lk_TT-sek].N�v, [lk_TT-sek].[J�r�si Hivatal], [lk_TT-sek].Oszt�ly, [lk_TT-sek].Jogc�me, BFKH FROM [lk_TT-sek])  AS Havi LEFT JOIN (SELECT lkSzem�lyek.Ad�jel, lkSzem�lyek.[Tart�s t�voll�t t�pusa] FROM lkSzem�lyek)  AS Szem�lyek ON Havi.Ad�jel = Szem�lyek.Ad�jel) ON kt_azNexon_Ad�jel02.Ad�jel = Havi.Ad�jel
WHERE (((Szem�lyek.[Tart�s t�voll�t t�pusa])<>[Jogc�me]))
ORDER BY Havi.Bfkh, Havi.N�v;
