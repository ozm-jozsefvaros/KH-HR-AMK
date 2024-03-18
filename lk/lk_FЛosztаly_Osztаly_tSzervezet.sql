SELECT bfkh(Nz([tSzervezet].[Szervezetmenedzsment k�d],"")) AS bfkhk�d, tSzervezet.[Szervezetmenedzsment k�d], IIf(Nz([tSzervezet].[Szint],1)>6,Nz([tSzervezet_1].[N�v],""),Nz([tSzervezet].[N�v],"")) AS F�oszt�ly, IIf([tSzervezet].[Szint]>6,[tSzervezet].[N�v],"") AS Oszt�ly, Replace(IIf([tSzervezet].[Szint]>6,[tSzervezet_1].[N�v],[tSzervezet].[N�v]),"Budapest F�v�ros Korm�nyhivatala","BFKH") AS F�oszt
FROM tSzervezet AS tSzervezet_1 RIGHT JOIN tSzervezet ON tSzervezet_1.[Szervezetmenedzsment k�d] = tSzervezet.[Sz�l� szervezeti egys�g�nek k�dja]
WHERE (((tSzervezet.OSZLOPOK)="szervezeti egys�g"))
ORDER BY bfkh(Nz([tSzervezet].[Szervezetmenedzsment k�d],""));
