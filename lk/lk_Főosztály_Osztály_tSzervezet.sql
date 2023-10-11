SELECT bfkh([tSzervezet].[Szervezetmenedzsment kód]) AS bfkhkód, tSzervezet.[Szervezetmenedzsment kód], IIf([tSzervezet].[Szint]>6,[tSzervezet_1].[Név],[tSzervezet].[Név]) AS Fõosztály, IIf([tSzervezet].[Szint]>6,[tSzervezet].[Név],"") AS Osztály
FROM tSzervezet AS tSzervezet_1 RIGHT JOIN tSzervezet ON tSzervezet_1.[Szervezetmenedzsment kód]=tSzervezet.[Szülõ szervezeti egységének kódja]
WHERE (((tSzervezet.OSZLOPOK)="szervezeti egység"))
ORDER BY bfkh([tSzervezet].[Szervezetmenedzsment kód]);
