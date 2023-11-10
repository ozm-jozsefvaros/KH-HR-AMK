Option Compare Database
'###KEZDET:fejléc###
Sub ExportQueryResultsToHTMLWithClassNames(oÛrl As Object, Optional ByVal Kimutatás As Boolean = True, Optional ByVal Ellenõrzés As Boolean = True)
    'On Error GoTo Err_Export
    
    Dim db As Database
    Dim lkEll As Recordset ' A soron következõ ellenõrzõ lekérdezés
    Dim hfNév As String
    Dim hf As Object
    Dim queryName As String
    Dim oldalCím As String
    Dim fejezetCím As String
    Dim táblaCím As String
    Dim TáblaSzám As Integer
    Dim megj As String
    Dim strÜresTábla As String 'ClassName az üres táblák esetén
    Dim sqlA, sqlB As String
    Dim qWhere As String
    Dim intSorokSzáma As Integer 'a rekordok száma
    Dim intOszlopokSzáma As Integer 'az mezõk száma
    Dim rowIndex As Integer ' Track the current row index
    Dim columnIndex As Integer ' Track the current column index
    Dim vaneGraf As Boolean
    Dim mezTip As Variant
    Dim válasz As Integer
    Dim maxsor As Integer 'A táblázat, ha több sorból áll, akkor nem írjuk ki.
    maxsor = 1000
    
    
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
    
    Do While Len(oÛrl.FileKimenet) = 0 Or IsNull(oÛrl.FileKimenet) Or válasz = 0
        MappaVálasztó oÛrl.FileKimenet, "A kimenet helyének kiválasztása", "\\Teve1-jkf-hrf2-oes\vol1\Human\HRF\Ugyintezok\Oláh Zoltán\HRELL"
        válasz = válasz + 1
    Loop
    If válasz > 1 Then Exit Sub
    
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
    Set hf = CreateObject("Scripting.FileSystemObject").CreateTextFile(hfNév, True)
    
    '### A html fejrész megírása -------------------------------------------
    With hf
        .writeline "<!DOCTYPE html>"
        .writeline "<html>"
        .writeline "<head>"
        .writeline "<title>" & oldalCím & "</title>"
        .writeline "<link rel=""stylesheet"" href=""./css/hrell.css"">"
        .writeline "<script src=""./js/hrell.js""></script>"
        .writeline "</head>"
        .writeline "<body>"
        .writeline "<div class=""fokeret"">" 'fõkeret
        
    End With
    '#############################
    '### Oldalpanel felépítése ###
    '#############################
    'lkell.MoveLast
    lkEll.MoveFirst
    TáblaSzám = 0
    With hf
        .writeline "<div id=""oldalpanel"" class=""oldalpanel"">"
        .writeline "<h2>Táblák</h2>"
        .writeline "<ul class=""table-list"">"
        Do Until lkEll.EOF
            TáblaSzám = TáblaSzám + 1
            táblaCím = lkEll("Táblacím")
            megj = lkEll("Megjegyzés")
            .writeline "<li class=""table-list-item"" title=""" & megj & """><a href=#table" & TáblaSzám & " class=""table-link"">" & táblaCím & "</a></li>"
            lkEll.MoveNext
        Loop
        .writeline "</ul></div>"
        .writeline "<div class=""fotartalom"">"
        .writeline "<h1 class=""oldal"">" & oldalCím & " (" & Date & ")</h1>"
        .writeline "<div id=""kereso""><input id=""pageSearch"" type=""text"" placeholder=""Az összes táblában keresendõ szöveg (pl.: Fõosztály neve)""></div>"
    End With
    táblaCím = ""
    megj = ""
    '##############################################
    '### A lekérdezésenkénti táblák felépítése ####
    '##############################################
lkEll.MoveFirst
TáblaSzám = 0
Do Until lkEll.EOF 'Külsõ, tábla szintû loop kezdete
        TáblaSzám = TáblaSzám + 1
        queryName = lkEll("EllenõrzõLekérdezés")
        táblaCím = lkEll("Táblacím")
        fejezetCím = lkEll("LapNév")
        megj = lkEll("Megjegyzés")
        vaneGraf = lkEll("vaneGraf")
        
        sFoly oÛrl, névelõvel(táblaCím, , , True) & ":; összeállítása indul..."
        sqlA = "SELECT * FROM " & queryName & ";"
        'A mezTip tömbben eltároljuk a mezõneveket és a hozzájuk tartozó kimeneti típust (hogy mire kell formázni)
        mezTip = vFldTípus("SELECT [MezõNeve],[MezõTípusa] FROM tLekérdezésMezõTípusok WHERE [LekérdezésNeve]='" & queryName & "';")
        Debug.Print queryName & " : "; LBound(mezTip) & vbTab & UBound(mezTip)
        
        ' Execute the query
        Dim rs As DAO.Recordset
        Set rs = db.OpenRecordset(sqlA)

        intSorokSzáma = rs.RecordCount
        If intSorokSzáma = 0 Then
            strÜresTábla = "uresTabla"
        Else
            strÜresTábla = ""
        End If

        sFoly oÛrl, névelõvel(táblaCím, , , True) & ":;" & intSorokSzáma & " sor."

        ' Initialize row and column indices
        rowIndex = 1
        columnIndex = 1
        intOszlopokSzáma = rs.Fields.Count
        ' Write the table header
        
        With hf
            .writeline "<div class=""tablediv "">"
            .writeline "<table id=""table" & TáblaSzám & """ class=""collapsible-table " & strÜresTábla & " "">"
            .writeline "<thead class=""collapsible-header tablehead " & strÜresTábla & " ""> "
            '## A tábla fejléce .........................................................
            .writeline "<tr>"
            Select Case intOszlopokSzáma
                Case 1
                    'Ha a tábla egy oszlopos, akkor a keresõ a következõ sorba kerül.
                    .writeline "<th class=""" & strÜresTábla & """>" & táblaCím & " </th>"  '
                    .writeline "</tr><tr>"
                    'A tábla is kap egy sorszámot
                    .writeline "<th " & intOszlopokSzáma & "> <input type=""text"" id=""filterInputtable" & TáblaSzám & """ placeholder=""Keresendõ szöveg""></th>"
                Case 2
                    'Ha a tábla 2 oszlopos, akkor az egyik oszlop a címé, a másik a keresõé.
                    .writeline "<th class=""" & strÜresTábla & """>" & táblaCím & " </th>"
                    'A tábla is kap egy sorszámot
                    .writeline "<th > <input type=""text"" id=""filterInputtable" & TáblaSzám & """ placeholder=""Keresendõ szöveg""></th>"
                Case Else
                    'Ha a tábla több oszlopos, akkor az utolsó két oszlopot fenntartjuk a kersõnek.
                    .writeline "<th colspan=""" & intOszlopokSzáma - 2 & """ class = """ & strÜresTábla & """>" & táblaCím & " </th>"
                    'A tábla is kap egy sorszámot
                    .writeline "<th colspan="" 2""> <input type=""text"" id=""filterInputtable" & TáblaSzám & """ placeholder=""Keresendõ szöveg""></th>"
            End Select
            .writeline "</tr>"
            '## A tábla fejlécének elsõ sora véget ért.
        
            '## A tábla feljécének második vagy harmadik sora készül -- az oszlopnevekkel
            .writeline "<tr class=""collapsible-header elsosor " & strÜresTábla & " "">"
        End With
        For Each fld In rs.Fields
        
            ' A fejléc páros és páratlan oszlopainak megjelölése
            Dim headerClassName As String
            If columnIndex Mod 2 = 0 Then
                headerClassName = "po" ' Even column
            Else
                headerClassName = "ptlo" ' Odd column
            End If
            If strÜresTábla <> "" Then
                headerClassName = strÜresTábla
            End If
            ' CSS osztály név a fentiek szerint
            hf.writeline "<th class='" & headerClassName & "'>" & fld.Name & "</th>"
            
            ' Oszlopszám növelése
            columnIndex = columnIndex + 1
        Next fld
                hf.writeline "</tr>"
                    '## Elkészült a fejléc második sora
                hf.writeline "</thead>"
                    '## Lezárva a fejléc ................................................
                    
                    '## Kezdõdik a táblatest ............................................
                hf.writeline "<tbody>"
                ' Loop through the recordset and write rows and columns
                If intSorokSzáma = 0 Then
                    hf.writeline "<tr class=""collapsible-content  " & strÜresTábla & """ >"
                    hf.writeline "<td colspan=""" & intOszlopokSzáma & """> Ez a tábla nem tartalmaz adatot. </td>"
                    hf.writeline "</tr>"
                End If
                
                If intSorokSzáma > maxsor Then
                    sFoly oÛrl, névelõvel(táblaCím, , , True) & ":; A sorok száma több, mint " & maxsor & ", ezért átugorjuk."
                    hf.writeline "<tr class=""collapsible-content  " & strÜresTábla & """ >"
                    hf.writeline "<td colspan=""" & intOszlopokSzáma & """> Ez a tábla több, mint " & maxsor & " sort tartalmazna, ezért inkább egyet sem... </td>"
                    hf.writeline "</tr>"
                    GoTo Tovalép
                End If
        Do Until rs.EOF 'Belsõ, sor szintû loop
            hf.writeline "<tr class=""collapsible-content "">"
            
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
                If strÜresTábla <> "" Then
                    className = strÜresTábla
                End If
                ' Write the table cell with the determined class name
                If columnIndex = 1 Then
                    className = "elsooszlop " & className
                End If
                If columnIndex = rs.Fields.Count Then
                    className = "utolsooszlop " & className
                End If
                'Debug.Print mezTip(columnIndex, 1), fld.Name, fld.Value, className
                formáz = formazo(párkeresõ(mezTip, fld.Name), fld.Value, className)
                hf.writeline formáz
                ' Debug.Print
                columnIndex = columnIndex + 1
            Next fld
            
            hf.writeline "</tr>"
            
            ' Increment the row index
            rowIndex = rowIndex + 1
            
            rs.MoveNext
        Loop ' Belsõ loop vége
Tovalép:
        With hf
            .writeline "</table>"
            .writeline "<script>"
            If vaneGraf Then
                .writeline " generateLineChart('table" & TáblaSzám & "');"
            End If
            .writeline " handleFilter('table" & TáblaSzám & "');"
            .writeline "</script>"
            .writeline "<span class=""megjegyzes"">" & megj & "</span>"
            .writeline "</div>"
            .writeline "<br/>"
        End With
        sFoly oÛrl, névelõvel(táblaCím, , , True) & ":; elkészült."
        ' Close the recordset
        rs.Close

        ' Move to the next query
        lkEll.MoveNext
Loop
'Külsõ loop
    hf.writeline "<button id=""tetejereGomb"">Vissza a tetejére</button>"
    ' Behúzzuk a javascriptet
    hf.writeline "<script src=""./js/hrellvég.js""></script>"
    ' Write the HTML file footer
    hf.writeline "</div>" 'fõtartalom
    hf.writeline "</div>" 'fõkeret
    hf.writeline "</body>"
    hf.writeline "</html>"
    
    ' Close the HTML file
    hf.Close
    
    ' Open the HTML file in the default web browser
    Shell "explorer.exe " & hfNév, vbNormalFocus
    
    Exit Sub
    
Err_Export:
    MsgBox "Error: " & Err.Description, vbExclamation, "Error"
End Sub

Function formazo(mezõTípus As Integer, érték As Variant, Optional className As String = "") As String
    Dim hibakeres As Boolean
    
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
            hibakeres = True
    End Select
    formazo = "<td class='" & className & "'>" & formáz & "</td>"
    'If hibakeres Then: Debug.Print formazo
End Function