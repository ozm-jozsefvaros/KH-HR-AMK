SELECT tJavítandóMezõnevek.azJavítandó, "SELECT '" 
        & [Ellenõrzéshez] & "' AS Tábla, '" 
        & [Eredeti] & "' AS Hiányzó_érték, " 
        & [Ellenõrzéshez] & ".[Adóazonosító], " 
        & [Ellenõrzéshez] & ".[Álláshely azonosító], " 
        & [Ellenõrzéshez] & ".[" & [SzervezetKód_mezõ] & "] " AS [Select], "FROM [" & [Ellenõrzéshez] & "] " AS [From], "WHERE ([" & [Ellenõrzéshez] & "].[" & [Import] & "] Is Null " 
        & IIf([Szöveg],"OR [" & [Ellenõrzéshez] & "].[" & [Import] & "]='') ",") ") 
        & IIf(IsNull([ÜresÁlláshelyMezõk]),""," AND ([" & [Ellenõrzéshez] & "].[" & [ÜresÁlláshelyMezõk] & "]<> 'üres állás' OR [" & [Ellenõrzéshez] & "].[" & [ÜresÁlláshelyMezõk] & "] is null ) ") AS [Where], tJavítandóMezõnevek.NemKötelezõ, tJavítandóMezõnevek.NemKötelezõÜresÁlláshelyEsetén, [Select] & [From] & [Where] AS [SQL], Len([SQL]) AS Hossz, tJavítandóMezõnevek.Ellenõrzéshez
FROM tJavítandóMezõnevek
WHERE (((tJavítandóMezõnevek.NemKötelezõ)=False) AND ((tJavítandóMezõnevek.Ellenõrzéshez) Is Not Null))
ORDER BY tJavítandóMezõnevek.azJavítandó;
