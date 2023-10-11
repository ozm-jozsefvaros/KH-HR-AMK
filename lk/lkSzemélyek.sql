SELECT tSzemélyek.*,
 Replace(Nz(
    IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység név]),
            IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység név]),
                [tSzemélyek].[Szint 2 szervezeti egység név] & "",
                [tSzemélyek].[Szint 3 szervezeti é név] & ""),
            [tSzemélyek].[Szint 4 szervezeti é név] & ""),
        ""),
    "Budapest F�v�ros Korm�nyhivatala ",
    "BFKH ") AS F�oszt�ly, 
Replace(Nz(IIf(IsNull(tSzemélyek.[Szint 4 szervezeti é k�d]),IIf(IsNull(tSzemélyek.[Szint 3 szervezeti é k�d]),tSzemélyek.[Szint 2 szervezeti é k�d] & "",tSzemélyek.[Szint 3 szervezeti é k�d] & ""),tSzemélyek.[Szint 4 szervezeti é k�d] & ""),""),"Budapest F�v�ros Korm�nyhivatala ","BFKH ") AS F�oszt�lyK�d, tSzemélyek.[Szint 5 szervezeti é név] AS Oszt�ly, Replace(Nz([Munkav�gz�s helye - c�m],"")," .",".") AS Munkav�gz�sC�me, tSzemélyek.[besorol�si  fokozat (KT)] AS Besorol�s, Replace(Nz([Besorol�si  fokozat (KT)],"/ "),"/ ","") AS Besorol�s2, bfkh(Nz([szervezeti é k�dja],0)) AS BFKH
FROM tSzemélyek
WHERE (
    (
        (
            (SELECT Max(Tmp.[Jogviszony sorszáma]) AS [MaxOfJogviszony sorszáma]         
            FROM tSzemélyek as Tmp         
            WHERE tSzemélyek.Adójel=Tmp.Adójel         
            GROUP BY Tmp.Adójel     
            )
        )=[Jogviszony sorszáma]
    )
)
ORDER BY tSzemélyek.[Dolgozó teljes neve];
