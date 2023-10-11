SELECT lkSzervezetÁlláshelyek.Álláshely, 
  lkSzervezetÁlláshelyek.[Tervezett betöltési adatok - Előmeneteli fokozat megnevezés], 
  lkSzemélyek.[Besorolási  fokozat (KT)], Álláshelyek.[Álláshely besorolási kategóriája], 
  lkSzemélyek.Besorolás, lkSzemélyek.[Jogviszony típusa / jogviszony típus], 
  IIf(UCase$(Nz([Álláshely besorolási kategóriája],""))=UCase$(Nz([Tervezett betöltési adatok - Előmeneteli fokozat megnevezés],"")),True,False) AS Ányr_vs_Szervezeti, 
  IIf(Nz([Tervezett betöltési adatok - Előmeneteli fokozat megnevezés],"")=Nz([lkSzemélyek].[Besorolás],""),True,False) AS Szervezeti_vs_Személyi
FROM Álláshelyek 
  RIGHT JOIN 
    (lkSzemélyek 
        RIGHT JOIN lkSzervezetÁlláshelyek 
        ON lkSzemélyek.[Státusz kódja] = lkSzervezetÁlláshelyek.Álláshely
    ) 
  ON Álláshelyek.[Álláshely azonosító] = lkSzervezetÁlláshelyek.Álláshely
;
