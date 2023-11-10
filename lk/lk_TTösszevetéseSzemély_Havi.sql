SELECT Havi.Bfkh AS bfkh, Havi.Adójel, Havi.Név, Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS [Szervezeti egység], Havi.Osztály, Havi.Jogcíme AS [Inaktív állományba kerülés oka], Személyek.[Tartós távollét típusa], kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN ((SELECT [Adóazonosító]*1 AS Adójel, [lk_TT-sek].Név, [lk_TT-sek].[Járási Hivatal], [lk_TT-sek].Osztály, [lk_TT-sek].Jogcíme, BFKH FROM [lk_TT-sek])  AS Havi LEFT JOIN (SELECT lkSzemélyek.Adójel, lkSzemélyek.[Tartós távollét típusa] FROM lkSzemélyek)  AS Személyek ON Havi.Adójel = Személyek.Adójel) ON kt_azNexon_Adójel02.Adójel = Havi.Adójel
WHERE (((Személyek.[Tartós távollét típusa])<>[Jogcíme]))
ORDER BY Havi.Bfkh, Havi.Név;
