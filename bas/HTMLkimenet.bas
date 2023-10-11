Option Compare Database
'###KEZDET:fejl�c###
Sub ExportQueryResultsToHTMLWithClassNames(o�rl As Object, Optional ByVal Kimutat�s As Boolean = True, Optional ByVal Ellen�rz�s As Boolean = True)
    'On Error GoTo Err_Export
    
    Dim db As Database
    Dim lkEll As Recordset ' A soron k�vetkez� ellen�rz� lek�rdez�s
    Dim hfN�v As String
    Dim hF As Object
    Dim queryName As String
    Dim oldalC�m As String
    Dim fejezetC�m As String
    Dim t�blaC�m As String
    Dim T�blaSz�m As Integer
    Dim megj As String
    Dim sqlA, sqlB As String
    Dim qWhere As String
    Dim rowIndex As Integer ' Track the current row index
    Dim columnIndex As Integer ' Track the current column index
    Dim vaneGraf As Boolean
    Dim mezTip As Variant
    
    
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
    If Len(o�rl.FileKimenet) = 0 Or IsNull(o�rl.FileKimenet) Then
        MsgBox "Nincs megadva kimenet!", vbOKOnly, "Nincs kimenet..."
        Exit Sub
    End If
    
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
    Set hF = CreateObject("Scripting.FileSystemObject").CreateTextFile(hfN�v, True)
    
    '### A html fejr�sz meg�r�sa -------------------------------------------
    With hF
        .WriteLine "<!DOCTYPE html>"
        .WriteLine "<html>"
        .WriteLine "<head>"
        .WriteLine "<title>" & oldalC�m & "</title>"
        .WriteLine "<link rel=""stylesheet"" href=""./css/hrell.css"">"
        .WriteLine "<script src=""./js/hrell.js""></script>"
        .WriteLine "</head>"
        .WriteLine "<body>"
        .WriteLine "<div class=""fokeret"">" 'f�keret
        T�blaSz�m = 0
    End With
    '### Oldalpanel fel�p�t�se
    'lkell.MoveLast
    lkEll.MoveFirst
    With hF
        .WriteLine "<div id=""oldalpanel"" class=""oldalpanel"">"
        .WriteLine "<h2>T�bl�k</h2>"
        .WriteLine "<ul class=""table-list"">"
        Do Until lkEll.EOF
            t�blaC�m = lkEll("T�blac�m")
            .WriteLine "<li class=""table-list-item""><a href=#" & RIC(t�blaC�m) & " class=""table-link"">" & t�blaC�m & "</a></li>"
            lkEll.MoveNext
        Loop
        .WriteLine "</ul></div>"
        .WriteLine "<div class=""fotartalom"">"
        .WriteLine "<h1 class=""oldal"">" & oldalC�m & " (" & Date & ")</h1>"
    End With
    t�blaC�m = ""
    '### A lek�rdez�senk�nti t�bl�k fel�p�t�se
lkEll.MoveFirst
Do Until lkEll.EOF 'K�ls� loop kezdete
        T�blaSz�m = T�blaSz�m + 1
        queryName = lkEll("Ellen�rz�Lek�rdez�s")
        t�blaC�m = lkEll("T�blac�m")
        fejezetC�m = lkEll("LapN�v")
        megj = lkEll("Megjegyz�s")
        vaneGraf = lkEll("vaneGraf")
        
        sFoly o�rl, n�vel�vel(t�blaC�m, , , True) & ":; �ssze�ll�t�sa indul..."
        sqlA = "SELECT * FROM " & queryName & ";"
        'A mezTip t�mbben elt�roljuk a mez�neveket �s a hozz�juk tartoz� kimeneti t�pust (hogy mire kell form�zni)
        mezTip = vFldT�pus("SELECT [Mez�Neve],[Mez�T�pusa] FROM tLek�rdez�sMez�T�pusok WHERE [Lekr�dez�sNeve]='" & queryName & "';")
        Debug.Print queryName & " : "; LBound(mezTip) & vbTab & UBound(mezTip)
        
        ' Execute the query
        Dim rs As DAO.Recordset
        Set rs = db.OpenRecordset(sqlA)
        rs.MoveLast
        rs.MoveFirst
        
        sFoly o�rl, n�vel�vel(t�blaC�m, , , True) & ":;" & rs.RecordCount & " sor."
        ' Initialize row and column indices
        rowIndex = 1
        columnIndex = 1
        
        ' Write the table header
        With hF
            .WriteLine "<div class=""tablediv "">"
            If vaneGraf Then
                ' Megsz�letik a canvas! A T�blaSz�m v�ltoz� besz�mozza a canvdivtable id-t
                .WriteLine "<div class=""canvdiv"" id=""canvdivtable" & T�blaSz�m & """>" & _
                           "    <canvas style=""display: block; box-sizing: border-box; height: 178px; width: 356px;"" width=""356"" height=""178"">" & _
                           "    </canvas>" & _
                           "</div>"
            End If
            
            .WriteLine "<table id=""table" & T�blaSz�m & """ class=""collapsible-table "">"
            .WriteLine "<thead class=""collapsible-header tablehead""> "
            '## A t�bla fejl�ce .........................................................
            .WriteLine "<tr>"
            If rs.Fields.Count < 3 Then
            'Ha a t�bla egy vagy k�t oszlopos, akkor a keres� a k�vetkez� sorba ker�l.
                .WriteLine "<th colspan""" & rs.Fields.Count & """>" & t�blaC�m & "</th>" '
                .WriteLine "</tr><tr>"
                'A t�bla is kap egy sorsz�mot
                .WriteLine "<th colspan="" & rs.Fields.Count & ""> <input type=""text"" id=""filterInputtable" & T�blaSz�m & """ placeholder=""Keresend� sz�veg""></th>"
            Else
            'Ha a t�bla t�bb oszlopos, akkor az utols� k�t oszlopot fenntartjuk a kers�nek.
                .WriteLine "<th colspan=""" & rs.Fields.Count - 2 & """>" & t�blaC�m & "</th>"
                'A t�bla is kap egy sorsz�mot
                .WriteLine "<th colspan="" 2""> <input type=""text"" id=""filterInputtable" & T�blaSz�m & """ placeholder=""Keresend� sz�veg""></th>"
            End If
            .WriteLine "</tr>"
            '## A t�bla fejl�c�nek els� sora v�get �rt.
        
            '## A t�bla felj�c�nek m�sodik vagy harmadik sora k�sz�l -- az oszlopnevekkel
            .WriteLine "<tr class=""collapsible-header elsosor "">"
        End With
        For Each fld In rs.Fields
        
            ' A fejl�c p�ros �s p�ratlan oszlopainak megjel�l�se
            Dim headerClassName As String
            If columnIndex Mod 2 = 0 Then
                headerClassName = "po" ' Even column
            Else
                headerClassName = "ptlo" ' Odd column
            End If
            ' CSS oszt�ly n�v a fentiek szerint
            hF.WriteLine "<th class='" & headerClassName & "'>" & fld.Name & "</th>"
            
            ' Oszlopsz�m n�vel�se
            columnIndex = columnIndex + 1
        Next fld
                hF.WriteLine "</tr>"
                    '## Elk�sz�lt a fejl�c m�sodik sora
                hF.WriteLine "</thead>"
                    '## Lez�rva a fejl�c ................................................
                    
                    '## Kezd�dik a t�blatest ............................................
                hF.WriteLine "<tbody>"
                ' Loop through the recordset and write rows and columns
        Do Until rs.EOF 'Bels� loop
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
                form�z = formazo(p�rkeres�(mezTip, fld.Name), fld.Value, className)
                hF.WriteLine form�z
                ' Debug.Print
                columnIndex = columnIndex + 1
            Next fld
            
            hF.WriteLine "</tr>"
            
            ' Increment the row index
            rowIndex = rowIndex + 1
            
            rs.MoveNext
        Loop ' Bels� loop v�ge
        With hF
            .WriteLine "</table>"
            .WriteLine "<script>"
            If vaneGraf Then
                .WriteLine " generateLineChart('table" & T�blaSz�m & "');"
            End If
            .WriteLine " handleFilter('table" & T�blaSz�m & "');"
            .WriteLine "</script>"
            .WriteLine "<span class=""megjegyzes"">" & megj & "</span>"
            .WriteLine "</div>"
            .WriteLine "<br/>"
        End With
        sFoly o�rl, n�vel�vel(t�blaC�m, , , True) & ":; elk�sz�lt."
        ' Close the recordset
        rs.Close
        
        ' Move to the next query
        lkEll.MoveNext
Loop
'K�ls� loop
    ' Beh�zzuk a javascriptet
    hF.WriteLine "<script src=""./js/hrellv�g.js""></script>"
    ' Write the HTML file footer
    hF.WriteLine "</div>" 'f�tartalom
    hF.WriteLine "</div>" 'f�keret
    hF.WriteLine "</body>"
    hF.WriteLine "</html>"
    
    ' Close the HTML file
    hF.Close
    
    ' Open the HTML file in the default web browser
    Shell "explorer.exe " & hfN�v, vbNormalFocus
    
    Exit Sub
    
Err_Export:
    MsgBox "Error: " & Err.Description, vbExclamation, "Error"
End Sub

Function formazo(mez�T�pus As Integer, �rt�k As Variant, Optional className As String = "") As String
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
    End Select
    formazo = "<td class='" & className & "'>" & form�z & "</td>"
End Function