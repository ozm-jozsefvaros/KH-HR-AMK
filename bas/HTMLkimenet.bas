Option Compare Database
'###KEZDET:fejl�c###
Sub ExportQueryResultsToHTMLWithClassNames(o�rl As Object, Optional ByVal Kimutat�s As Boolean = True, Optional ByVal Ellen�rz�s As Boolean = True)
    'On Error GoTo Err_Export
    
    Dim db As Database
    Dim lkEll As Recordset ' A soron k�vetkez� ellen�rz� lek�rdez�s
    Dim hfN�v As String
    Dim hf As Object
    Dim queryName As String
    Dim oldalC�m As String
    Dim fejezetC�m As String
    Dim t�blaC�m As String
    Dim T�blaSz�m As Integer
    Dim megj As String
    Dim str�resT�bla As String 'ClassName az �res t�bl�k eset�n
    Dim sqlA, sqlB As String
    Dim qWhere As String
    Dim intSorokSz�ma As Integer 'a rekordok sz�ma
    Dim intOszlopokSz�ma As Integer 'az mez�k sz�ma
    Dim rowIndex As Integer ' Track the current row index
    Dim columnIndex As Integer ' Track the current column index
    Dim vaneGraf As Boolean
    Dim mezTip As Variant
    Dim v�lasz As Integer
    Dim maxsor As Integer 'A t�bl�zat, ha t�bb sorb�l �ll, akkor nem �rjuk ki.
    maxsor = 1000
    
    
    Select Case True
        Case Kimutat�s = True And Ellen�rz�s = True
            qWhere = " [Oszt�ly]= 'kimutat�s' OR [Oszt�ly]= 'hiba' "
            hfN�v = "Ellen�rz�sKimutat�s_"
            oldalC�m = "Ellen�rz�s �s kimutat�s"
        Case Kimutat�s = False And Ellen�rz�s = True
            qWhere = " [Oszt�ly]= 'hiba' "
            hfN�v = "Ellen�rz�s_"
            oldalC�m = "Ellen�rz�s"
        Case Kimutat�s = True And Ellen�rz�s = False
            qWhere = " [Oszt�ly]= 'kimutat�s' "
            hfN�v = "Kimutat�s_"
            oldalC�m = "Kimutat�s"
        Case Else
            Exit Sub '�gy nem k�sz�l �res t�bla...???
            'qWhere = " [Oszt�ly]<> 'kimutat�s' AND [Oszt�ly]<> 'hiba' "
    End Select
    
    Set db = CurrentDb()
    '### Ha nincs Kimenet megadva, akkor kil�p�nk, de el�tte �zen�nk
    
    Do While Len(o�rl.FileKimenet) = 0 Or IsNull(o�rl.FileKimenet) Or v�lasz = 0
        MappaV�laszt� o�rl.FileKimenet, "A kimenet hely�nek kiv�laszt�sa", "\\Teve1-jkf-hrf2-oes\vol1\Human\HRF\Ugyintezok\Ol�h Zolt�n\HRELL"
        v�lasz = v�lasz + 1
    Loop
    If v�lasz > 1 Then Exit Sub
    
    '### A lefuttatand� lek�rdez�sek tulajdons�gainak beszerz�se -----------
    Set lkEll = db.OpenRecordset("SELECT * FROM lkEllen�rz�Lek�rdez�sek2 WHERE " & qWhere & " ORDER BY [LapN�v] ASC, [T�blaC�m] ASC")
    
    '### A f�jln�v meghat�roz�sa -------------------------------------------
    If Right(o�rl.FileKimenet, 1) <> "\" Then
        hfN�v = o�rl.FileKimenet & "\" & hfN�v '
    Else
        hfN�v = o�rl.FileKimenet & hfN�v
    End If
    hfN�v = hfN�v & Format(Now(), "yyyy-mm-dd_hh-nn-ss") & ".html"
    
    '### A html f�jl megnyit�sa --------------------------------------------
    Set hf = CreateObject("Scripting.FileSystemObject").CreateTextFile(hfN�v, True)
    
    '### A html fejr�sz meg�r�sa -------------------------------------------
    With hf
        .writeline "<!DOCTYPE html>"
        .writeline "<html>"
        .writeline "<head>"
        .writeline "<title>" & oldalC�m & "</title>"
        .writeline "<link rel=""stylesheet"" href=""./css/hrell.css"">"
        .writeline "<script src=""./js/hrell.js""></script>"
        .writeline "</head>"
        .writeline "<body>"
        .writeline "<div class=""fokeret"">" 'f�keret
        
    End With
    '#############################
    '### Oldalpanel fel�p�t�se ###
    '#############################
    'lkell.MoveLast
    lkEll.MoveFirst
    T�blaSz�m = 0
    With hf
        .writeline "<div id=""oldalpanel"" class=""oldalpanel"">"
        .writeline "<h2>T�bl�k</h2>"
        .writeline "<ul class=""table-list"">"
        Do Until lkEll.EOF
            T�blaSz�m = T�blaSz�m + 1
            t�blaC�m = lkEll("T�blac�m")
            megj = lkEll("Megjegyz�s")
            .writeline "<li class=""table-list-item"" title=""" & megj & """><a href=#table" & T�blaSz�m & " class=""table-link"">" & t�blaC�m & "</a></li>"
            lkEll.MoveNext
        Loop
        .writeline "</ul></div>"
        .writeline "<div class=""fotartalom"">"
        .writeline "<h1 class=""oldal"">" & oldalC�m & " (" & Date & ")</h1>"
        .writeline "<div id=""kereso""><input id=""pageSearch"" type=""text"" placeholder=""Az �sszes t�bl�ban keresend� sz�veg (pl.: F�oszt�ly neve)""></div>"
    End With
    t�blaC�m = ""
    megj = ""
    '##############################################
    '### A lek�rdez�senk�nti t�bl�k fel�p�t�se ####
    '##############################################
lkEll.MoveFirst
T�blaSz�m = 0
Do Until lkEll.EOF 'K�ls�, t�bla szint� loop kezdete
        T�blaSz�m = T�blaSz�m + 1
        queryName = lkEll("Ellen�rz�Lek�rdez�s")
        t�blaC�m = lkEll("T�blac�m")
        fejezetC�m = lkEll("LapN�v")
        megj = lkEll("Megjegyz�s")
        vaneGraf = lkEll("vaneGraf")
        
        sFoly o�rl, n�vel�vel(t�blaC�m, , , True) & ":; �ssze�ll�t�sa indul..."
        sqlA = "SELECT * FROM " & queryName & ";"
        'A mezTip t�mbben elt�roljuk a mez�neveket �s a hozz�juk tartoz� kimeneti t�pust (hogy mire kell form�zni)
        mezTip = vFldT�pus("SELECT [Mez�Neve],[Mez�T�pusa] FROM tLek�rdez�sMez�T�pusok WHERE [Lek�rdez�sNeve]='" & queryName & "';")
        Debug.Print queryName & " : "; LBound(mezTip) & vbTab & UBound(mezTip)
        
        ' Execute the query
        Dim rs As DAO.Recordset
        Set rs = db.OpenRecordset(sqlA)

        intSorokSz�ma = rs.RecordCount
        If intSorokSz�ma = 0 Then
            str�resT�bla = "uresTabla"
        Else
            str�resT�bla = ""
        End If

        sFoly o�rl, n�vel�vel(t�blaC�m, , , True) & ":;" & intSorokSz�ma & " sor."

        ' Initialize row and column indices
        rowIndex = 1
        columnIndex = 1
        intOszlopokSz�ma = rs.Fields.Count
        ' Write the table header
        
        With hf
            .writeline "<div class=""tablediv "">"
            .writeline "<table id=""table" & T�blaSz�m & """ class=""collapsible-table " & str�resT�bla & " "">"
            .writeline "<thead class=""collapsible-header tablehead " & str�resT�bla & " ""> "
            '## A t�bla fejl�ce .........................................................
            .writeline "<tr>"
            Select Case intOszlopokSz�ma
                Case 1
                    'Ha a t�bla egy oszlopos, akkor a keres� a k�vetkez� sorba ker�l.
                    .writeline "<th class=""" & str�resT�bla & """>" & t�blaC�m & " </th>"  '
                    .writeline "</tr><tr>"
                    'A t�bla is kap egy sorsz�mot
                    .writeline "<th " & intOszlopokSz�ma & "> <input type=""text"" id=""filterInputtable" & T�blaSz�m & """ placeholder=""Keresend� sz�veg""></th>"
                Case 2
                    'Ha a t�bla 2 oszlopos, akkor az egyik oszlop a c�m�, a m�sik a keres��.
                    .writeline "<th class=""" & str�resT�bla & """>" & t�blaC�m & " </th>"
                    'A t�bla is kap egy sorsz�mot
                    .writeline "<th > <input type=""text"" id=""filterInputtable" & T�blaSz�m & """ placeholder=""Keresend� sz�veg""></th>"
                Case Else
                    'Ha a t�bla t�bb oszlopos, akkor az utols� k�t oszlopot fenntartjuk a kers�nek.
                    .writeline "<th colspan=""" & intOszlopokSz�ma - 2 & """ class = """ & str�resT�bla & """>" & t�blaC�m & " </th>"
                    'A t�bla is kap egy sorsz�mot
                    .writeline "<th colspan="" 2""> <input type=""text"" id=""filterInputtable" & T�blaSz�m & """ placeholder=""Keresend� sz�veg""></th>"
            End Select
            .writeline "</tr>"
            '## A t�bla fejl�c�nek els� sora v�get �rt.
        
            '## A t�bla felj�c�nek m�sodik vagy harmadik sora k�sz�l -- az oszlopnevekkel
            .writeline "<tr class=""collapsible-header elsosor " & str�resT�bla & " "">"
        End With
        For Each fld In rs.Fields
        
            ' A fejl�c p�ros �s p�ratlan oszlopainak megjel�l�se
            Dim headerClassName As String
            If columnIndex Mod 2 = 0 Then
                headerClassName = "po" ' Even column
            Else
                headerClassName = "ptlo" ' Odd column
            End If
            If str�resT�bla <> "" Then
                headerClassName = str�resT�bla
            End If
            ' CSS oszt�ly n�v a fentiek szerint
            hf.writeline "<th class='" & headerClassName & "'>" & fld.Name & "</th>"
            
            ' Oszlopsz�m n�vel�se
            columnIndex = columnIndex + 1
        Next fld
                hf.writeline "</tr>"
                    '## Elk�sz�lt a fejl�c m�sodik sora
                hf.writeline "</thead>"
                    '## Lez�rva a fejl�c ................................................
                    
                    '## Kezd�dik a t�blatest ............................................
                hf.writeline "<tbody>"
                ' Loop through the recordset and write rows and columns
                If intSorokSz�ma = 0 Then
                    hf.writeline "<tr class=""collapsible-content  " & str�resT�bla & """ >"
                    hf.writeline "<td colspan=""" & intOszlopokSz�ma & """> Ez a t�bla nem tartalmaz adatot. </td>"
                    hf.writeline "</tr>"
                End If
                
                If intSorokSz�ma > maxsor Then
                    sFoly o�rl, n�vel�vel(t�blaC�m, , , True) & ":; A sorok sz�ma t�bb, mint " & maxsor & ", ez�rt �tugorjuk."
                    hf.writeline "<tr class=""collapsible-content  " & str�resT�bla & """ >"
                    hf.writeline "<td colspan=""" & intOszlopokSz�ma & """> Ez a t�bla t�bb, mint " & maxsor & " sort tartalmazna, ez�rt ink�bb egyet sem... </td>"
                    hf.writeline "</tr>"
                    GoTo Toval�p
                End If
        Do Until rs.EOF 'Bels�, sor szint� loop
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
                If str�resT�bla <> "" Then
                    className = str�resT�bla
                End If
                ' Write the table cell with the determined class name
                If columnIndex = 1 Then
                    className = "elsooszlop " & className
                End If
                If columnIndex = rs.Fields.Count Then
                    className = "utolsooszlop " & className
                End If
                'Debug.Print mezTip(columnIndex, 1), fld.Name, fld.Value, className
                form�z = formazo(p�rkeres�(mezTip, fld.Name), fld.Value, className)
                hf.writeline form�z
                ' Debug.Print
                columnIndex = columnIndex + 1
            Next fld
            
            hf.writeline "</tr>"
            
            ' Increment the row index
            rowIndex = rowIndex + 1
            
            rs.MoveNext
        Loop ' Bels� loop v�ge
Toval�p:
        With hf
            .writeline "</table>"
            .writeline "<script>"
            If vaneGraf Then
                .writeline " generateLineChart('table" & T�blaSz�m & "');"
            End If
            .writeline " handleFilter('table" & T�blaSz�m & "');"
            .writeline "</script>"
            .writeline "<span class=""megjegyzes"">" & megj & "</span>"
            .writeline "</div>"
            .writeline "<br/>"
        End With
        sFoly o�rl, n�vel�vel(t�blaC�m, , , True) & ":; elk�sz�lt."
        ' Close the recordset
        rs.Close

        ' Move to the next query
        lkEll.MoveNext
Loop
'K�ls� loop
    hf.writeline "<button id=""tetejereGomb"">Vissza a tetej�re</button>"
    ' Beh�zzuk a javascriptet
    hf.writeline "<script src=""./js/hrellv�g.js""></script>"
    ' Write the HTML file footer
    hf.writeline "</div>" 'f�tartalom
    hf.writeline "</div>" 'f�keret
    hf.writeline "</body>"
    hf.writeline "</html>"
    
    ' Close the HTML file
    hf.Close
    
    ' Open the HTML file in the default web browser
    Shell "explorer.exe " & hfN�v, vbNormalFocus
    
    Exit Sub
    
Err_Export:
    MsgBox "Error: " & Err.Description, vbExclamation, "Error"
End Sub

Function formazo(mez�T�pus As Integer, �rt�k As Variant, Optional className As String = "") As String
    Dim hibakeres As Boolean
    
    Select Case mez�T�pus
        Case dbCurrency
        '5
            form�z = Format(�rt�k, "### ### ##0\ \F\t")
            className = className & " jobbrazart "
        Case dbLong, dbInteger
        '4 �s 3
            form�z = Format(�rt�k, "### ### ##0\ ")
            className = className & " jobbrazart "
        Case dbDouble
        '7
            form�z = Format(�rt�k, "### ### ##0.00")
            className = className & " jobbrazart "
        Case dbText
        '10
            form�z = Format(�rt�k, "\ @")
            className = className & " balrazart "
        Case Else
            form�z = Nz(�rt�k, "") 'form�zatlan
            className = className & " balrazart " '
            hibakeres = True
    End Select
    formazo = "<td class='" & className & "'>" & form�z & "</td>"
    'If hibakeres Then: Debug.Print formazo
End Function