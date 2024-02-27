Option Compare Database
'###KEZDET:fejléc###
Sub ExportQueryResultsToHTMLWithClassNames(oÛrl As Object, Optional ByVal Kimutatás As Boolean = False, Optional ByVal Ellenõrzés As Boolean = True)
    'On Error GoTo Err_Export
    Const teszt As Boolean = False 'Ha ez True, akkor teszt üzemmódban fut (nem futtatja a lekérdezéseket)
    
    '# Adatbázishoz kötõdõ változók
    Dim db As DAO.Database
    Dim qdf As DAO.QueryDef
    Dim lkEll As DAO.Recordset ' A soron következõ ellenõrzõ lekérdezés
    Dim queryName As String
    Dim sqlA, sqlB As String
    Dim qWhere As String
    
    Dim intSorokSzáma As Integer 'a rekordok száma
    Dim intOszlopokSzáma As Integer 'az mezõk száma
    Dim rowIndex As Integer ' Track the current row index
    Dim columnIndex As Integer ' Track the current column index
    
    '# Fájlkezeléssel kapcsolatos változók
    Dim hfNév As String
    Dim hf As Object
    
    '# A HTML oldal változói
    Dim Fõcím, háttérkép As String
    Dim oldalcím As String
    Dim fejezetCím As String
    Dim elõzõFejezetCím As String
    Dim FejezetVált As Boolean
    Dim táblaCím As String
    Dim TáblaSzám As Integer '->> "<table id=""table" & TáblaSzám...
    Dim megj As String
    Dim strÜresTábla As String 'ClassName az üres táblák esetén
    Dim CheckBox As String
    
    háttérkép = AlapadatLek("HTML", "háttérkép")
    If vane(háttérkép) Then
        háttérkép = "background-image: url(""" & háttérkép & """);"
    Else
        háttérkép = ""
    End If

    Fõcím = AlapadatLek("HTML", "fõcím")
    Dim vaneGraf As Boolean
    Dim mezTip As Variant
    Dim válasz As Integer
    
    Dim maxsor As Integer 'Ha a tábla több sorból áll, akkor az egész táblát nem írjuk ki.
    maxsor = 1100
    
    qWhere = Forms!ûFõmenü02!Osztály
    hfNév = DLookup("Fájlnév", "tLekérdezésOsztályok", "[azOsztály]=" & Forms!ûFõmenü02!Osztály)
    oldalcím = DLookup("Oldalcím", "tLekérdezésOsztályok", "[azOsztály]=" & Forms!ûFõmenü02!Osztály)

    oldalcím = oldalcím & " (" & Date & ")" 'Az oldalcím a dátummal együtt az igazi oldalcím
    Set db = CurrentDb()
    '### Ha nincs Kimenet megadva, akkor kilépünk, de elõtte üzenünk
    
    Do While Len(oÛrl.FileKimenet) = 0 Or IsNull(oÛrl.FileKimenet) Or válasz = 0
        MappaVálasztó oÛrl.FileKimenet, "A kimenet helyének kiválasztása", "\\Teve1-jkf-hrf2-oes\vol1\Human\HRF\Ugyintezok\Adatszolgáltatók\HRELL"
        válasz = válasz + 1
    Loop
    If válasz > 1 Then Exit Sub
    
    '### A lefuttatandó lekérdezések tulajdonságainak beszerzése -----------
    Set qdf = db.QueryDefs("parlkEllenõrzõLekérdezések")
    qdf.Parameters("qWhere") = qWhere
    Set lkEll = qdf.OpenRecordset
    If lkEll.EOF Then
        sFoly oÛrl, "A választott gyûjteményben:;nincsenek lekérdezések!"
        sFoly oÛrl, "Ezért a futás:;véget ért..."
        Exit Sub
    End If
    '### A fájlnév meghatározása -------------------------------------------
    If Right(oÛrl.FileKimenet, 1) <> "\" Then
        hfNév = oÛrl.FileKimenet & "\" & hfNév '
    Else
        hfNév = oÛrl.FileKimenet & hfNév
    End If
    hfNév = hfNév & Format(Now(), "yyyy-mm-dd-hh-nn-ss") & ".html"
    '#######################################################################
    '### A html fájl megnyitása --------------------------------------------
    Set hf = CreateObject("Scripting.FileSystemObject").CreateTextFile(hfNév, True)
    
    '### A html fejrész megírása -------------------------------------------
    With hf
        .writeline "<!DOCTYPE html>"
        .writeline "<html>"
        .writeline "<head>"
        .writeline "<title>" & oldalcím & "</title>"
        .writeline "<link rel=""stylesheet"" href=""./css/hrell.css"">"
        .writeline "<script src=""./js/hrell.js""></script>"
        .writeline "<script src=""https://kvotariport.kh.gov.hu/static/quotarep/js/chart.bundle.min.js""></script>" 'belülrõl származik!!!!!!!!
        .writeline "</head>"
        .writeline "<body style='" & háttérkép & "'>"
        .writeline "<div ><h3>" & Fõcím & "</h3></div>"
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
                .writeline "    <h2>Táblák</h2>"
        elõzõFejezetCím = ""
        Do Until lkEll.EOF
            TáblaSzám = TáblaSzám + 1
            táblaCím = lkEll("Táblacím")
            fejezetCím = lkEll("LapNév")
            megj = Nz(lkEll("Megjegyzés"), "")
            If elõzõFejezetCím = "" Then 'elsõ fejezet
                elõzõFejezetCím = fejezetCím
                .writeline "    <ul class=""chapter-list"">" 'Megnyitjuk a fejezetek listát
                .writeline "    <li class=""chapter-list-item"">" & fejezetCím & "</li>" 'Beillesztjük az elsõ fejezetet
                .writeline "        <ul class=""table-list"">" 'Megnyitjuk az elsõ táblalistát
            End If
            If fejezetCím <> elõzõFejezetCím Then 'Új fejezet
                
                elõzõFejezetCím = fejezetCím
                .writeline "        </ul>" 'Lezárjuk az elõzõ táblalistát
                .writeline "    <li class=""chapter-list"">" & fejezetCím & "</li>" ' Bejegyezzük a következõ fejezetlista elemet
                .writeline "        <ul class=""table-list"">" 'Megnyitjuk az új táblalistát
            
            End If
            'Következik a táblalista elem
                .writeline "        <li class=""table-list-item"" title=""" & megj & """><a href=#table" & TáblaSzám & " class=""table-link"">" & táblaCím & "</a></li>"
            lkEll.MoveNext
        Loop
                .writeline "        </ul>" 'lezárjuk az utolsó táblalistát
                .writeline "    </ul>" 'lezárjuk az utolsó fejezetlistát
                .writeline "</div>" 'lezárjuk az oldalpanelt
                .writeline "<div class=""fotartalom"">"
                .writeline "    <h1 class=""oldal"">" & oldalcím & "</h1>"
                .writeline "    <div id=""kereso""><input id=""pageSearch"" type=""text"" placeholder=""Az összes táblában keresendõ szöveg (pl.: Fõosztály neve)""></div>"
    End With
    táblaCím = ""
    megj = ""
    '##############################################
    '### A lekérdezésenkénti táblák felépítése ####
    '##############################################
lkEll.MoveFirst
TáblaSzám = 0
If teszt Then GoTo tesztpont
fejezetCím = ""
elõzõFejezetCím = ""
Do Until lkEll.EOF 'Külsõ loop kezdete: végigjárjuk a táblákat ###
        TáblaSzám = TáblaSzám + 1
        queryName = lkEll("EllenõrzõLekérdezés")
        táblaCím = lkEll("Táblacím")
              hf.writeline "<div class=""tablediv "">"
        '## A Fejezetcím kiíratása, ha változott
        If fejezetCím <> lkEll("LapNév") Then
            fejezetCím = lkEll("LapNév")
               hf.writeline "    <h2 class=""fejezetcim"">" & fejezetCím & "</h2>"
        End If
        megj = Nz(lkEll("Megjegyzés"), "")
        vaneGraf = lkEll("vaneGraf")
        
        sFoly oÛrl, névelõvel(táblaCím, , , True) & ":; összeállítása indul..."
        sqlA = "SELECT * FROM [" & queryName & "];"
        'A mezTip tömbben eltároljuk a mezõneveket és a hozzájuk tartozó kimeneti típust (hogy mire kell formázni)
        mezTip = vFldTípus("SELECT [MezõNeve],[MezõTípusa] FROM tLekérdezésMezõTípusok WHERE [LekérdezésNeve]='" & queryName & "';")
        'Debug.Print queryName & " : "; LBound(mezTip) & vbTab & UBound(mezTip)
        
        ' A lekérdezés futtatása
        Dim rs As DAO.Recordset
        Set rs = db.OpenRecordset(sqlA)

        intSorokSzáma = rs.recordCount
        If intSorokSzáma = 0 Then
            strÜresTábla = "uresTabla"
        Else
            strÜresTábla = ""
        End If

        sFoly oÛrl, névelõvel(táblaCím, , , True) & ":;" & intSorokSzáma & " sor."

        ' Index kezdõértékei
        rowIndex = 1
        columnIndex = 1
        intOszlopokSzáma = rs.Fields.count
        ' A táblát magába foglaló keretnek és a tábla fejlécének a kiírása ###
        
        With hf
            
            .writeline "<table id=""table" & TáblaSzám & """ class=""collapsible-table " & strÜresTábla & " "">"
            .writeline "<thead class=""collapsible-header tablehead " & strÜresTábla & " ""> "
            '## A tábla fejléce .........................................................
            .writeline "<tr>"
            letoltoHTML = "<button class=""export-button"" onclick=""exportTableToCSV('table" & TáblaSzám & "', '" & táblaCím & ".csv')"">Letöltés...</button>"
            Select Case intOszlopokSzáma
                Case 1
                    'Ha a tábla egy oszlopos, akkor a keresõ a következõ sorba kerül.
                    .writeline "<th class=""" & strÜresTábla & """>" & táblaCím & " </th>"  '
                    .writeline "</tr><tr>"
                    'A tábla is kap egy sorszámot
                    .writeline "<th " & intOszlopokSzáma & ">" & letoltoHTML & " <input type=""text"" id=""filterInputtable" & TáblaSzám & """ placeholder=""Keresendõ szöveg""></th>"
                Case 2
                    'Ha a tábla 2 oszlopos, akkor az egyik oszlop a címé, a másik a keresõé.
                    .writeline "<th class=""" & strÜresTábla & """>" & táblaCím & " </th>"
                    'A tábla is kap egy sorszámot
                    .writeline "<th >" & letoltoHTML & "<input type=""text"" id=""filterInputtable" & TáblaSzám & """ placeholder=""Keresendõ szöveg""></th>"
                Case Else
                    'Ha a tábla több oszlopos, akkor az utolsó két oszlopot fenntartjuk a keresõnek.
                    .writeline "<th colspan=""" & intOszlopokSzáma - 2 & """ class = """ & strÜresTábla & """>" & táblaCím & " </th>"
                    'A tábla is kap egy sorszámot
                    .writeline "<th colspan="" 2"">" & letoltoHTML & " <input type=""text"" id=""filterInputtable" & TáblaSzám & """ placeholder=""Keresendõ szöveg""></th>"
            End Select
            .writeline "</tr>"
            '## A tábla fejlécének elsõ sora véget ért.
        
            '## A tábla feljécének második vagy harmadik sora készül -- az oszlopnevekkel
            .writeline "<tr class=""collapsible-header elsosor " & strÜresTábla & " "">"
        End With
        For Each fld In rs.Fields 'A tábla sorait vesszük egyenként ###
        
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
            ' A jelölõnégyzet összeállítása
            CheckBox = ""
            If vaneGraf Then
                CheckBox = "<input type=""checkbox"" class=""columnCheckbox"" data-table="" " & TáblaSzám & " "" data-column="" " & columnIndex & " "" checked>"
            End If
            ' CSS osztály név a fentiek szerint
            hf.writeline "<th class='" & headerClassName & "'>" & fld.Name & CheckBox & "</th>"
            
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
            
            '#####################################################
            '## A táblatest sorának összeállítása
            '#####################################################
            columnIndex = 1
            
            For Each fld In rs.Fields
                ' Determine the class names based on row and column indices
                Dim className As String
                
                If rowIndex Mod 2 = 0 Then
                    If columnIndex Mod 2 = 0 Then
                        className = "ps" ' Páros sor (+ páratlan oszlop is)
                    Else
                        className = "ptls" ' Páros sor (+ páratlan oszlop)
                    End If
                Else
                    If columnIndex Mod 2 = 0 Then
                        className = "po" '
                    Else
                        className = "ptlo" '
                    End If
                End If
                If strÜresTábla <> "" Then
                    className = strÜresTábla
                End If
                ' Write the table cell with the determined class name
                If columnIndex = 1 Then
                    className = "elsooszlop " & className
                End If
                If columnIndex = rs.Fields.count Then
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
tesztpont:
    hf.writeline "<button id=""tetejereGomb"">Vissza a tetejére</button>"
    ' Behúzzuk a javascriptet
    hf.writeline "<script src=""./js/hrellvég.js""></script>"
    ' Write the HTML file footer
    hf.writeline "</div>" 'fõtartalom
    hf.writeline "</div>" 'fõkeret
    'hf.writeline "<a href=""" & fvReferenseknekLevél(hfNév, oldalcím) & """>&pi;</a>"
    hf.writeline "</body>"
    hf.writeline "</html>"
    
    ' Close the HTML file
    hf.Close
    
    ' Open the HTML file in the default web browser
    Shell "explorer.exe " & hfNév, vbNormalFocus
    Call GenMailto(hfNév, oldalcím)
    
    
    Exit Sub
    
Err_Export:
    MsgBox "Error: " & Err.Description, vbExclamation, "Error"
End Sub
Function fvReferenseknekLevél(ByVal fájlnév As String, ByVal oldalcím As String) As String
    Const nLN As String = "%0d%0a"
    Dim tart As String
    Dim cím As String
    
    tart = tart & "Kedves Kollégák!" & nLN & nLN
    tart = tart & "Az alábbi helyen találjátok a legújabb adatok alapján elkészített ellenõrzõ táblákat:" & nLN & nLN
    tart = tart & "file://" & fájlnév '& "%22"
    cím = fvRefLevCím()
    
    fvReferenseknekLevél = "mailto:" & cím & "?subject=" & oldalcím & "&body=" & tart
End Function
Sub GenMailto(ByVal fájlnév As String, ByVal oldalcím As String)
    'Specify the file path where you want to save the HTML file
    Dim filePath As String
    filePath = "\\Teve1-jkf-hrf2-oes\vol1\Human\HRF\Ugyintezok\Adatszolgáltatók\HRELL\levelek\" & oldalcím & Format(Now(), "yyyy-mm-dd-hh-nn-ss") & ".html"
    
    'Create or overwrite the HTML file
    Dim fileNumber As Integer
    fileNumber = FreeFile
    Open filePath For Output As fileNumber
    
    'Write HTML content to the file
    Print #fileNumber, "<html>"
    Print #fileNumber, "<head><title>" & oldalcím & "</title>"
    Print #fileNumber, "<script type='text/javascript'>"
    Print #fileNumber, "function onLoad() {"
    Print #fileNumber, "  document.getElementById('mailtoLink').click();"
    Print #fileNumber, "  setTimeout(function() { window.close(); }, 2000);"
    Print #fileNumber, "}"
    Print #fileNumber, "</script>"
    Print #fileNumber, "</head>"
    Print #fileNumber, "<body onload='onLoad()'>"
    Print #fileNumber, "<a id='mailtoLink' href='" & fvReferenseknekLevél(fájlnév, oldalcím) & "'>Kattints ide az e-mailhez...</a>"
    Print #fileNumber, "</body>"
    Print #fileNumber, "</html>"
    
    'Close the file
    Close fileNumber
    
    Shell "explorer.exe " & filePath, vbNormalFocus
End Sub
Function fvRefLevCím() As String
'Lekérdezzük az lkReferensek lekérdezésbõl
Dim db As DAO.Database
Dim rs As Recordset
Dim cím As String
Dim reksz As Integer

    Set db = CurrentDb
    Set rs = db.OpenRecordset("Select [Hivatali email] From lkReferensek")
    rs.MoveFirst
    reksz = 1
    Do Until rs.EOF
        If rs("Hivatali email") <> "" Then
            If reksz = 1 Then
                cím = cím & rs("Hivatali email")
            Else
                cím = cím & ";" & rs("Hivatali email")
            End If
        End If
        reksz = reksz + 1
        rs.MoveNext
    Loop
    fvRefLevCím = cím
End Function

Function formazo(mezõTípus As Integer, érték As Variant, Optional className As String = "") As String
    Dim hibakeres As Boolean
    
    Select Case mezõTípus
        Case dbCurrency
        '5
            formáz = Format(érték, "# ### ### ##0\ \F\t")
            className = className & " jobbrazart "
        Case dbLong
        '4
            formáz = Format(érték, "# ### ### ##0\ ")
            className = className & " jobbrazart "
        Case dbInteger
        '3
            formáz = Format(érték, "0\ ")
            className = className & " jobbrazart "
        Case dbDouble
        '7
            formáz = Format(érték, "# ### ### ##0.00")
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
