SELECT bfkh(Nz([tSzervezet].[Szervezetmenedzsment kód],"")) AS bfkhkód, tSzervezet.[Szervezetmenedzsment kód], IIf(Nz([tSzervezet].[Szint],1)>6,Nz([tSzervezet_1].[Név],""),Nz([tSzervezet].[Név],"")) AS Fõosztály, IIf([tSzervezet].[Szint]>6,[tSzervezet].[Név],"") AS Osztály, Replace(IIf([tSzervezet].[Szint]>6,[tSzervezet_1].[Név],[tSzervezet].[Név]),"Budapest Fõváros Kormányhivatala","BFKH") AS Fõoszt
FROM tSzervezet AS tSzervezet_1 RIGHT JOIN tSzervezet ON tSzervezet_1.[Szervezetmenedzsment kód] = tSzervezet.[Szülõ szervezeti egységének kódja]
WHERE (((tSzervezet.OSZLOPOK)="szervezeti egység"))
ORDER BY bfkh(Nz([tSzervezet].[Szervezetmenedzsment kód],""));
