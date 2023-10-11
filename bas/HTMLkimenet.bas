Option Compare Database
'###KEZDET:fejléc###
Sub ExportQueryResultsToHTMLWithClassNames(oÛrl As Object, Optional ByVal Kimutatás As Boolean = True, Optional ByVal Ellenõrzés As Boolean = True)
    'On Error GoTo Err_Export
    
    Dim db As Database
    Dim lkEll As Recordset ' A soron következõ ellenõrzõ lekérdezés
    Dim hfNév As String
    Dim hF As Object
    Dim queryName As String
    Dim oldalCím As String
    Dim fejezetCím As String
    Dim táblaCím As String
    Dim TáblaSzám As Integer
    Dim megj As String
    Dim sqlA, sqlB As String
    Dim qWhere As String
    Dim rowIndex As Integer ' Track the current row index
    Dim columnIndex As Integer ' Track the current column index
    Dim vaneGraf As Boolean
    Dim mezTip As Variant
    
    
    Select Case True
        Case Kimutatás = True And Ellenõrzés = True
            qWhere = " [Osztály]= 'kimutatás' OR [Osztály]= 'hiba' "
            hfNév = "EllenõrzésKimutatás_"
            oldalCím = "Ellenõrzés és kimutatás"
        Case Kimutatás = False And Ellenõrzés = True
            qWhere = " [Osztály]= 'hiba' "
            hfNév = "Ellenõrzés_"
            oldalCím = "Ellenõrzés"
        Case Kimutatás = True And Ellenõrzés = False
            qWhere = " [Osztály]= 'kimutatás' "
            hfNév = "Kimutatás_"
            oldalCím = "Kimutatás"
        Case Else
            Exit Sub 'Így nem készül üres tábla...???
            'qWhere = " [Osztály]<> 'kimutatás' AND [Osztály]<> 'hiba' "
    End Select
    
    Set db = CurrentDb()
    '### Ha nincs Kimenet megadva, akkor kilépünk, de elõtte üzenünk
    If Len(oÛrl.FileKimenet) = 0 Or IsNull(oÛrl.FileKimenet) Then
        MsgBox "Nincs megadva kimenet!", vbOKOnly, "Nincs kimenet..."
        Exit Sub
    End If
    
    '### A lefuttatandó lekérdezések tulajdonságainak beszerzése -----------
    Set lkEll = db.OpenRecordset("SELECT * FROM lkEllenõrzõLekérdezések2 WHERE " & qWhere & " ORDER BY [LapNév] ASC, [TáblaCím] ASC")
    
    '### A fájlnév meghatározása -------------------------------------------
    If Right(oÛrl.FileKimenet, 1) <> "\" Then
        hfNév = oÛrl.FileKimenet & "\" & hfNév '
    Else
        hfNév = oÛrl.FileKimenet & hfNév
    End If
    hfNév = hfNév & Format(Now(), "yyyy-mm-dd_hh-nn-ss") & ".html"
    
    '### A html fájl megnyitása --------------------------------------------
    Set hF = CreateObject("Scripting.FileSystemObject").CreateTextFile(hfNév, True)
    
    '### A html fejrész megírása -------------------------------------------
    With hF
        .WriteLine "<!DOCTYPE html>"
        .WriteLine "<html>"
        .WriteLine "<head>"
        .WriteLine "<title>" & oldalCím & "</title>"
        .WriteLine "<link rel=""stylesheet"" href=""./css/hrell.css"">"
        .WriteLine "<script src=""./js/hrell.js""></script>"
        .WriteLine "</head>"
        .WriteLine "<body>"
        .WriteLine "<div class=""fokeret"">" 'fõkeret
        TáblaSzám = 0
    End With
    '### Oldalpanel felépítése
    'lkell.MoveLast
    lkEll.MoveFirst
    With hF
        .WriteLine "<div id=""oldalpanel"" class=""oldalpanel"">"
        .WriteLine "<h2>Táblák</h2>"
        .WriteLine "<ul class=""table-list"">"
        Do Until lkEll.EOF
            táblaCím = lkEll("Táblacím")
            .WriteLine "<li class=""table-list-item""><a href=#" & RIC(táblaCím) & " class=""table-link"">" & táblaCím & "</a></li>"
            lkEll.MoveNext
        Loop
        .WriteLine "</ul></div>"
        .WriteLine "<div class=""fotartalom"">"
        .WriteLine "<h1 class=""oldal"">" & oldalCím & " (" & Date & ")</h1>"
    End With
    táblaCím = ""
    '### A lekérdezésenkénti táblák felépítése
lkEll.MoveFirst
Do Until lkEll.EOF 'Külsõ loop kezdete
        TáblaSzám = TáblaSzám + 1
        queryName = lkEll("EllenõrzõLekérdezés")
        táblaCím = lkEll("Táblacím")
        fejezetCím = lkEll("LapNév")
        megj = lkEll("Megjegyzés")
        vaneGraf = lkEll("vaneGraf")
        
        sFoly oÛrl, névelõvel(táblaCím, , , True) & ":; összeállítása indul..."
        sqlA = "SELECT * FROM " & queryName & ";"
        'A mezTip tömbben eltároljuk a mezõneveket és a hozzájuk tartozó kimeneti típust (hogy mire kell formázni)
        mezTip = vFldTípus("SELECT [MezõNeve],[MezõTípusa] FROM tLekérdezésMezõTípusok WHERE [LekrédezésNeve]='" & queryName & "';")
        Debug.Print queryName & " : "; LBound(mezTip) & vbTab & UBound(mezTip)
        
        ' Execute the query
        Dim rs As DAO.Recordset
        Set rs = db.OpenRecordset(sqlA)
        rs.MoveLast
        rs.MoveFirst
        
        sFoly oÛrl, névelõvel(táblaCím, , , True) & ":;" & rs.RecordCount & " sor."
        ' Initialize row and column indices
        rowIndex = 1
        columnIndex = 1
        
        ' Write the table header
        With hF
            .WriteLine "<div class=""tablediv "">"
            If vaneGraf Then
                ' Megszületik a canvas! A TáblaSzám változó beszámozza a canvdivtable id-t
                .WriteLine "<div class=""canvdiv"" id=""canvdivtable" & TáblaSzám & """>" & _
                           "    <canvas style=""display: block; box-sizing: border-box; height: 178px; width: 356px;"" width=""356"" height=""178"">" & _
                           "    </canvas>" & _
                           "</div>"
            End If
            
            .WriteLine "<table id=""table" & TáblaSzám & """ class=""collapsible-table "">"
            .WriteLine "<thead class=""collapsible-header tablehead""> "
            '## A tábla fejléce .........................................................
            .WriteLine "<tr>"
            If rs.Fields.Count < 3 Then
            'Ha a tábla egy vagy két oszlopos, akkor a keresõ a következõ sorba kerül.
                .WriteLine "<th colspan""" & rs.Fields.Count & """>" & táblaCím & "</th>" '
                .WriteLine "</tr><tr>"
                'A tábla is kap egy sorszámot
                .WriteLine "<th colspan="" & rs.Fields.Count & ""> <input type=""text"" id=""filterInputtable" & TáblaSzám & """ placeholder=""Keresendõ szöveg""></th>"
            Else
            'Ha a tábla több oszlopos, akkor az utolsó két oszlopot fenntartjuk a kersõnek.
                .WriteLine "<th colspan=""" & rs.Fields.Count - 2 & """>" & táblaCím & "</th>"
                'A tábla is kap egy sorszámot
                .WriteLine "<th colspan="" 2""> <input type=""text"" id=""filterInputtable" & TáblaSzám & """ placeholder=""Keresendõ szöveg""></th>"
            End If
            .WriteLine "</tr>"
            '## A tábla fejlécének elsõ sora véget ért.
        
            '## A tábla feljécének második vagy harmadik sora készül -- az oszlopnevekkel
            .WriteLine "<tr class=""collapsible-header elsosor "">"
        End With
        For Each fld In rs.Fields
        
            ' A fejléc páros és páratlan oszlopainak megjelölése
            Dim headerClassName As String
            If columnIndex Mod 2 = 0 Then
                headerClassName = "po" ' Even column
            Else
                headerClassName = "ptlo" ' Odd column
            End If
            ' CSS osztály név a fentiek szerint
            hF.WriteLine "<th class='" & headerClassName & "'>" & fld.Name & "</th>"
            
            ' Oszlopszám növelése
            columnIndex = columnIndex + 1
        Next fld
                hF.WriteLine "</tr>"
                    '## Elkészült a fejléc második sora
                hF.WriteLine "</thead>"
                    '## Lezárva a fejléc ................................................
                    
                    '## Kezdõdik a táblatest ............................................
                hF.WriteLine "<tbody>"
                ' Loop through the recordset and write rows and columns
        Do Until rs.EOF 'Belsõ loop
            hF.WriteLine "<tr class=""collapsible-content collapsed"">"
            
            ' Reset the column index for each row
            columnIndex = 1
            
            For Each fld In rs.Fields
                ' Determine the class names based on row and column indices
                Dim className As String
                
                If rowIndex Mod 2 = 0 Then
                    If columnIndex Mod 2 = 0 Then
                        className = "ps" ' Even row and even column
                    Else
                        className = "ptls" ' Even row and odd column
                    End If
                Else
                    If columnIndex Mod 2 = 0 Then
                        className = "po" ' Odd row and even column
                    Else
                        className = "ptlo" ' Odd row and odd column
                    End If
                End If
                
                ' Write the table cell with the determined class name
                If columnIndex = 1 Then
                    className = "elsooszlop " & className
                End If
                If columnIndex = rs.Fields.Count Then
                    className = "utolsooszlop " & className
                End If
                ' Debug.Print mezTip, fld.Name, fld.Value, className
                formáz = formazo(párkeresõ(mezTip, fld.Name), fld.Value, className)
                hF.WriteLine formáz
                ' Debug.Print
                columnIndex = columnIndex + 1
            Next fld
            
            hF.WriteLine "</tr>"
            
            ' Increment the row index
            rowIndex = rowIndex + 1
            
            rs.MoveNext
        Loop ' Belsõ loop vége
        With hF
            .WriteLine "</table>"
            .WriteLine "<script>"
            If vaneGraf Then
                .WriteLine " generateLineChart('table" & TáblaSzám & "');"
            End If
            .WriteLine " handleFilter('table" & TáblaSzám & "');"
            .WriteLine "</script>"
            .WriteLine "<span class=""megjegyzes"">" & megj & "</span>"
            .WriteLine "</div>"
            .WriteLine "<br/>"
        End With
        sFoly oÛrl, névelõvel(táblaCím, , , True) & ":; elkészült."
        ' Close the recordset
        rs.Close
        
        ' Move to the next query
        lkEll.MoveNext
Loop
'Külsõ loop
    ' Behúzzuk a javascriptet
    hF.WriteLine "<script src=""./js/hrellvég.js""></script>"
    ' Write the HTML file footer
    hF.WriteLine "</div>" 'fõtartalom
    hF.WriteLine "</div>" 'fõkeret
    hF.WriteLine "</body>"
    hF.WriteLine "</html>"
    
    ' Close the HTML file
    hF.Close
    
    ' Open the HTML file in the default web browser
    Shell "explorer.exe " & hfNév, vbNormalFocus
    
    Exit Sub
    
Err_Export:
    MsgBox "Error: " & Err.Description, vbExclamation, "Error"
End Sub

Function formazo(mezõTípus As Integer, érték As Variant, Optional className As String = "") As String
    Select Case mezõTípus
        Case dbCurrency
        '5
            formáz = Format(érték, "### ### ##0\ \F\t")
            className = className & " jobbrazart "
        Case dbLong, dbInteger
        '4 és 3
            formáz = Format(érték, "### ### ##0\ ")
            className = className & " jobbrazart "
        Case dbDouble
        '7
            formáz = Format(érték, "### ### ##0.00")
            className = className & " jobbrazart "
        Case dbText
        '10
            formáz = Format(érték, "\ @")
            className = className & " balrazart "
        Case Else
            formáz = Nz(érték, "") 'formázatlan
            className = className & " balrazart " '
    End Select
    formazo = "<td class='" & className & "'>" & formáz & "</td>"
End Function