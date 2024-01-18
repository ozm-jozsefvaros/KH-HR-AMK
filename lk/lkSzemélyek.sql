SELECT tSzemélyek.*, 
  Replace
    (Nz
      (IIf
        (IsNull([tSzemélyek].[Szint 4 szervezeti egység név]),
        IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység név]),
          [tSzemélyek].[Szint 2 szervezeti egység név] & "",
          [tSzemélyek].[Szint 3 szervezeti egység név] & ""),
        [tSzemélyek].[Szint 4 szervezeti egység név] & "")
    ,""),
  "Budapest Főváros Kormányhivatala ",
  "BFKH ") & "" AS Főosztály, 
  Replace
    (Nz
      (IIf
        (IsNull(tSzemélyek.[Szint 4 szervezeti egység kód]),
        IIf(IsNull(tSzemélyek.[Szint 3 szervezeti egység kód]),
          tSzemélyek.[Szint 2 szervezeti egység kód] & "",
          tSzemélyek.[Szint 3 szervezeti egység kód] & ""),
        tSzemélyek.[Szint 4 szervezeti egység kód] & ""),
    ""),
  "Budapest Főváros Kormányhivatala ",
  "BFKH ") AS FőosztályKód,
  [Szint 5 szervezeti egység név] & "" AS Osztály, 
  Replace(Nz([Munkavégzés helye - cím],"")," .",".") AS MunkavégzésCíme, 
  tSzemélyek.[besorolási  fokozat (KT)] AS Besorolás, 
  Replace(Nz([Besorolási  fokozat (KT)],"/ "),"/ ","") AS Besorolás2, 
  bfkh(Nz([szervezeti egység kódja],0)) AS BFKH
FROM tSzemélyek
WHERE ((((SELECT Max(Tmp.[Jogviszony sorszáma]) AS [MaxOfJogviszony sorszáma]
  FROM tSzemélyek as Tmp
  WHERE tSzemélyek.Adójel=Tmp.Adójel
  GROUP BY Tmp.Adójel
  ))=[Jogviszony sorszáma]))
ORDER BY tSzemélyek.[Dolgozó teljes neve];
