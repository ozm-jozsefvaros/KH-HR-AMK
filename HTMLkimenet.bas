Option Compare Database
'###KEZDET:fejl�c###
Sub ExportQueryResultsToHTMLWithClassNames(o�rl As Object, Optional ByVal Kimutat�s As Boolean = False, Optional ByVal Ellen�rz�s As Boolean = True)
    'On Error GoTo Err_Export
    Const teszt As Boolean = False 'Ha ez True, akkor teszt �zemm�dban fut (nem futtatja a lek�rdez�seket)
    
    '# Adatb�zishoz k�t�d� v�ltoz�k
    Dim db As DAO.Database
    Dim qdf As DAO.QueryDef
    Dim lkEll As DAO.Recordset ' A soron k�vetkez� ellen�rz� lek�rdez�s
    Dim queryName As String
    Dim sqlA, sqlB As String
    Dim qWhere As String
    
    Dim intSorokSz�ma As Integer 'a rekordok sz�ma
    Dim intOszlopokSz�ma As Integer 'az mez�k sz�ma
    Dim rowIndex As Integer ' Track the current row index
    Dim columnIndex As Integer ' Track the current column index
    
    '# F�jlkezel�ssel kapcsolatos v�ltoz�k
    Dim hfN�v As String
    Dim hf As Object
    
    '# A HTML oldal v�ltoz�i
    Dim F�c�m, h�tt�rk�p As String
    Dim oldalc�m As String
    Dim fejezetC�m As String
    Dim el�z�FejezetC�m As String
    Dim FejezetV�lt As Boolean
    Dim t�blaC�m As String
    Dim T�blaSz�m As Integer '->> "<table id=""table" & T�blaSz�m...
    Dim megj As String
    Dim str�resT�bla As String 'ClassName az �res t�bl�k eset�n
    Dim CheckBox As String
    
    h�tt�rk�p = AlapadatLek("HTML", "h�tt�rk�p")
    If vane(h�tt�rk�p) Then
        h�tt�rk�p = "background-image: url(""" & h�tt�rk�p & """);"
    Else
        h�tt�rk�p = ""
    End If

    F�c�m = AlapadatLek("HTML", "f�c�m")
    Dim vaneGraf As Boolean
    Dim mezTip As Variant
    Dim v�lasz As Integer
    
    Dim maxsor As Integer 'Ha a t�bla t�bb sorb�l �ll, akkor az eg�sz t�bl�t nem �rjuk ki.
    maxsor = 1100
    
    qWhere = Forms!�F�men�02!Oszt�ly
    hfN�v = DLookup("F�jln�v", "tLek�rdez�sOszt�lyok", "[azOszt�ly]=" & Forms!�F�men�02!Oszt�ly)
    oldalc�m = DLookup("Oldalc�m", "tLek�rdez�sOszt�lyok", "[azOszt�ly]=" & Forms!�F�men�02!Oszt�ly)

    oldalc�m = oldalc�m & " (" & Date & ")" 'Az oldalc�m a d�tummal egy�tt az igazi oldalc�m
    Set db = CurrentDb()
    '### Ha nincs Kimenet megadva, akkor kil�p�nk, de el�tte �zen�nk
    
    Do While Len(o�rl.FileKimenet) = 0 Or IsNull(o�rl.FileKimenet) Or v�lasz = 0
        MappaV�laszt� o�rl.FileKimenet, "A kimenet hely�nek kiv�laszt�sa", "\\Teve1-jkf-hrf2-oes\vol1\Human\HRF\Ugyintezok\Adatszolg�ltat�k\HRELL"
        v�lasz = v�lasz + 1
    Loop
    If v�lasz > 1 Then Exit Sub
    
    '### A lefuttatand� lek�rdez�sek tulajdons�gainak beszerz�se -----------
    Set qdf = db.QueryDefs("parlkEllen�rz�Lek�rdez�sek")
    qdf.Parameters("qWhere") = qWhere
    Set lkEll = qdf.OpenRecordset
    If lkEll.EOF Then
        sFoly o�rl, "A v�lasztott gy�jtem�nyben:;nincsenek lek�rdez�sek!"
        sFoly o�rl, "Ez�rt a fut�s:;v�get �rt..."
        Exit Sub
    End If
    '### A f�jln�v meghat�roz�sa -------------------------------------------
    If Right(o�rl.FileKimenet, 1) <> "\" Then
        hfN�v = o�rl.FileKimenet & "\" & hfN�v '
    Else
        hfN�v = o�rl.FileKimenet & hfN�v
    End If
    hfN�v = hfN�v & Format(Now(), "yyyy-mm-dd-hh-nn-ss") & ".html"
    '#######################################################################
    '### A html f�jl megnyit�sa --------------------------------------------
    Set hf = CreateObject("Scripting.FileSystemObject").CreateTextFile(hfN�v, True)
    
    '### A html fejr�sz meg�r�sa -------------------------------------------
    With hf
        .writeline "<!DOCTYPE html>"
        .writeline "<html>"
        .writeline "<head>"
        .writeline "<title>" & oldalc�m & "</title>"
        .writeline "<link rel=""stylesheet"" href=""./css/hrell.css"">"
        .writeline "<script src=""./js/hrell.js""></script>"
        .writeline "<script src=""https://kvotariport.kh.gov.hu/static/quotarep/js/chart.bundle.min.js""></script>" 'bel�lr�l sz�rmazik!!!!!!!!
        .writeline "</head>"
        .writeline "<body style='" & h�tt�rk�p & "'>"
        .writeline "<div ><h3>" & F�c�m & "</h3></div>"
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
                .writeline "    <h2>T�bl�k</h2>"
        el�z�FejezetC�m = ""
        Do Until lkEll.EOF
            T�blaSz�m = T�blaSz�m + 1
            t�blaC�m = lkEll("T�blac�m")
            fejezetC�m = lkEll("LapN�v")
            megj = Nz(lkEll("Megjegyz�s"), "")
            If el�z�FejezetC�m = "" Then 'els� fejezet
                el�z�FejezetC�m = fejezetC�m
                .writeline "    <ul class=""chapter-list"">" 'Megnyitjuk a fejezetek list�t
                .writeline "    <li class=""chapter-list-item"">" & fejezetC�m & "</li>" 'Beillesztj�k az els� fejezetet
                .writeline "        <ul class=""table-list"">" 'Megnyitjuk az els� t�blalist�t
            End If
            If fejezetC�m <> el�z�FejezetC�m Then '�j fejezet
                
                el�z�FejezetC�m = fejezetC�m
                .writeline "        </ul>" 'Lez�rjuk az el�z� t�blalist�t
                .writeline "    <li class=""chapter-list"">" & fejezetC�m & "</li>" ' Bejegyezz�k a k�vetkez� fejezetlista elemet
                .writeline "        <ul class=""table-list"">" 'Megnyitjuk az �j t�blalist�t
            
            End If
            'K�vetkezik a t�blalista elem
                .writeline "        <li class=""table-list-item"" title=""" & megj & """><a href=#table" & T�blaSz�m & " class=""table-link"">" & t�blaC�m & "</a></li>"
            lkEll.MoveNext
        Loop
                .writeline "        </ul>" 'lez�rjuk az utols� t�blalist�t
                .writeline "    </ul>" 'lez�rjuk az utols� fejezetlist�t
                .writeline "</div>" 'lez�rjuk az oldalpanelt
                .writeline "<div class=""fotartalom"">"
                .writeline "    <h1 class=""oldal"">" & oldalc�m & "</h1>"
                .writeline "    <div id=""kereso""><input id=""pageSearch"" type=""text"" placeholder=""Az �sszes t�bl�ban keresend� sz�veg (pl.: F�oszt�ly neve)""></div>"
    End With
    t�blaC�m = ""
    megj = ""
    '##############################################
    '### A lek�rdez�senk�nti t�bl�k fel�p�t�se ####
    '##############################################
lkEll.MoveFirst
T�blaSz�m = 0
If teszt Then GoTo tesztpont
fejezetC�m = ""
el�z�FejezetC�m = ""
Do Until lkEll.EOF 'K�ls� loop kezdete: v�gigj�rjuk a t�bl�kat ###
        T�blaSz�m = T�blaSz�m + 1
        queryName = lkEll("Ellen�rz�Lek�rdez�s")
        t�blaC�m = lkEll("T�blac�m")
              hf.writeline "<div class=""tablediv "">"
        '## A Fejezetc�m ki�rat�sa, ha v�ltozott
        If fejezetC�m <> lkEll("LapN�v") Then
            fejezetC�m = lkEll("LapN�v")
               hf.writeline "    <h2 class=""fejezetcim"">" & fejezetC�m & "</h2>"
        End If
        megj = Nz(lkEll("Megjegyz�s"), "")
        vaneGraf = lkEll("vaneGraf")
        
        sFoly o�rl, n�vel�vel(t�blaC�m, , , True) & ":; �ssze�ll�t�sa indul..."
        sqlA = "SELECT * FROM [" & queryName & "];"
        'A mezTip t�mbben elt�roljuk a mez�neveket �s a hozz�juk tartoz� kimeneti t�pust (hogy mire kell form�zni)
        mezTip = vFldT�pus("SELECT [Mez�Neve],[Mez�T�pusa] FROM tLek�rdez�sMez�T�pusok WHERE [Lek�rdez�sNeve]='" & queryName & "';")
        'Debug.Print queryName & " : "; LBound(mezTip) & vbTab & UBound(mezTip)
        
        ' A lek�rdez�s futtat�sa
        Dim rs As DAO.Recordset
        Set rs = db.OpenRecordset(sqlA)

        intSorokSz�ma = rs.recordCount
        If intSorokSz�ma = 0 Then
            str�resT�bla = "uresTabla"
        Else
            str�resT�bla = ""
        End If

        sFoly o�rl, n�vel�vel(t�blaC�m, , , True) & ":;" & intSorokSz�ma & " sor."

        ' Index kezd��rt�kei
        rowIndex = 1
        columnIndex = 1
        intOszlopokSz�ma = rs.Fields.count
        ' A t�bl�t mag�ba foglal� keretnek �s a t�bla fejl�c�nek a ki�r�sa ###
        
        With hf
            
            .writeline "<table id=""table" & T�blaSz�m & """ class=""collapsible-table " & str�resT�bla & " "">"
            .writeline "<thead class=""collapsible-header tablehead " & str�resT�bla & " ""> "
            '## A t�bla fejl�ce .........................................................
            .writeline "<tr>"
            letoltoHTML = "<button class=""export-button"" onclick=""exportTableToCSV('table" & T�blaSz�m & "', '" & t�blaC�m & ".csv')"">Let�lt�s...</button>"
            Select Case intOszlopokSz�ma
                Case 1
                    'Ha a t�bla egy oszlopos, akkor a keres� a k�vetkez� sorba ker�l.
                    .writeline "<th class=""" & str�resT�bla & """>" & t�blaC�m & " </th>"  '
                    .writeline "</tr><tr>"
                    'A t�bla is kap egy sorsz�mot
                    .writeline "<th " & intOszlopokSz�ma & ">" & letoltoHTML & " <input type=""text"" id=""filterInputtable" & T�blaSz�m & """ placeholder=""Keresend� sz�veg""></th>"
                Case 2
                    'Ha a t�bla 2 oszlopos, akkor az egyik oszlop a c�m�, a m�sik a keres��.
                    .writeline "<th class=""" & str�resT�bla & """>" & t�blaC�m & " </th>"
                    'A t�bla is kap egy sorsz�mot
                    .writeline "<th >" & letoltoHTML & "<input type=""text"" id=""filterInputtable" & T�blaSz�m & """ placeholder=""Keresend� sz�veg""></th>"
                Case Else
                    'Ha a t�bla t�bb oszlopos, akkor az utols� k�t oszlopot fenntartjuk a keres�nek.
                    .writeline "<th colspan=""" & intOszlopokSz�ma - 2 & """ class = """ & str�resT�bla & """>" & t�blaC�m & " </th>"
                    'A t�bla is kap egy sorsz�mot
                    .writeline "<th colspan="" 2"">" & letoltoHTML & " <input type=""text"" id=""filterInputtable" & T�blaSz�m & """ placeholder=""Keresend� sz�veg""></th>"
            End Select
            .writeline "</tr>"
            '## A t�bla fejl�c�nek els� sora v�get �rt.
        
            '## A t�bla felj�c�nek m�sodik vagy harmadik sora k�sz�l -- az oszlopnevekkel
            .writeline "<tr class=""collapsible-header elsosor " & str�resT�bla & " "">"
        End With
        For Each fld In rs.Fields 'A t�bla sorait vessz�k egyenk�nt ###
        
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
            ' A jel�l�n�gyzet �ssze�ll�t�sa
            CheckBox = ""
            If vaneGraf Then
                CheckBox = "<input type=""checkbox"" class=""columnCheckbox"" data-table="" " & T�blaSz�m & " "" data-column="" " & columnIndex & " "" checked>"
            End If
            ' CSS oszt�ly n�v a fentiek szerint
            hf.writeline "<th class='" & headerClassName & "'>" & fld.Name & CheckBox & "</th>"
            
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
            
            '#####################################################
            '## A t�blatest sor�nak �ssze�ll�t�sa
            '#####################################################
            columnIndex = 1
            
            For Each fld In rs.Fields
                ' Determine the class names based on row and column indices
                Dim className As String
                
                If rowIndex Mod 2 = 0 Then
                    If columnIndex Mod 2 = 0 Then
                        className = "ps" ' P�ros sor (+ p�ratlan oszlop is)
                    Else
                        className = "ptls" ' P�ros sor (+ p�ratlan oszlop)
                    End If
                Else
                    If columnIndex Mod 2 = 0 Then
                        className = "po" '
                    Else
                        className = "ptlo" '
                    End If
                End If
                If str�resT�bla <> "" Then
                    className = str�resT�bla
                End If
                ' Write the table cell with the determined class name
                If columnIndex = 1 Then
                    className = "elsooszlop " & className
                End If
                If columnIndex = rs.Fields.count Then
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
tesztpont:
    hf.writeline "<button id=""tetejereGomb"">Vissza a tetej�re</button>"
    ' Beh�zzuk a javascriptet
    hf.writeline "<script src=""./js/hrellv�g.js""></script>"
    ' Write the HTML file footer
    hf.writeline "</div>" 'f�tartalom
    hf.writeline "</div>" 'f�keret
    'hf.writeline "<a href=""" & fvReferenseknekLev�l(hfN�v, oldalc�m) & """>&pi;</a>"
    hf.writeline "</body>"
    hf.writeline "</html>"
    
    ' Close the HTML file
    hf.Close
    
    ' Open the HTML file in the default web browser
    Shell "explorer.exe " & hfN�v, vbNormalFocus
    Call GenMailto(hfN�v, oldalc�m)
    
    
    Exit Sub
    
Err_Export:
    MsgBox "Error: " & Err.Description, vbExclamation, "Error"
End Sub
Function fvReferenseknekLev�l(ByVal f�jln�v As String, ByVal oldalc�m As String) As String
    Const nLN As String = "%0d%0a"
    Dim tart As String
    Dim c�m As String
    
    tart = tart & "Kedves Koll�g�k!" & nLN & nLN
    tart = tart & "Az al�bbi helyen tal�lj�tok a leg�jabb adatok alapj�n elk�sz�tett ellen�rz� t�bl�kat:" & nLN & nLN
    tart = tart & "file://" & f�jln�v '& "%22"
    c�m = fvRefLevC�m()
    
    fvReferenseknekLev�l = "mailto:" & c�m & "?subject=" & oldalc�m & "&body=" & tart
End Function
Sub GenMailto(ByVal f�jln�v As String, ByVal oldalc�m As String)
    'Specify the file path where you want to save the HTML file
    Dim filePath As String
    filePath = "\\Teve1-jkf-hrf2-oes\vol1\Human\HRF\Ugyintezok\Adatszolg�ltat�k\HRELL\levelek\" & oldalc�m & Format(Now(), "yyyy-mm-dd-hh-nn-ss") & ".html"
    
    'Create or overwrite the HTML file
    Dim fileNumber As Integer
    fileNumber = FreeFile
    Open filePath For Output As fileNumber
    
    'Write HTML content to the file
    Print #fileNumber, "<html>"
    Print #fileNumber, "<head><title>" & oldalc�m & "</title>"
    Print #fileNumber, "<script type='text/javascript'>"
    Print #fileNumber, "function onLoad() {"
    Print #fileNumber, "  document.getElementById('mailtoLink').click();"
    Print #fileNumber, "  setTimeout(function() { window.close(); }, 2000);"
    Print #fileNumber, "}"
    Print #fileNumber, "</script>"
    Print #fileNumber, "</head>"
    Print #fileNumber, "<body onload='onLoad()'>"
    Print #fileNumber, "<a id='mailtoLink' href='" & fvReferenseknekLev�l(f�jln�v, oldalc�m) & "'>Kattints ide az e-mailhez...</a>"
    Print #fileNumber, "</body>"
    Print #fileNumber, "</html>"
    
    'Close the file
    Close fileNumber
    
    Shell "explorer.exe " & filePath, vbNormalFocus
End Sub
Function fvRefLevC�m() As String
'Lek�rdezz�k az lkReferensek lek�rdez�sb�l
Dim db As DAO.Database
Dim rs As Recordset
Dim c�m As String
Dim reksz As Integer

    Set db = CurrentDb
    Set rs = db.OpenRecordset("Select [Hivatali email] From lkReferensek")
    rs.MoveFirst
    reksz = 1
    Do Until rs.EOF
        If rs("Hivatali email") <> "" Then
            If reksz = 1 Then
                c�m = c�m & rs("Hivatali email")
            Else
                c�m = c�m & ";" & rs("Hivatali email")
            End If
        End If
        reksz = reksz + 1
        rs.MoveNext
    Loop
    fvRefLevC�m = c�m
End Function

Function formazo(mez�T�pus As Integer, �rt�k As Variant, Optional className As String = "") As String
    Dim hibakeres As Boolean
    
    Select Case mez�T�pus
        Case dbCurrency
        '5
            form�z = Format(�rt�k, "# ### ### ##0\ \F\t")
            className = className & " jobbrazart "
        Case dbLong
        '4
            form�z = Format(�rt�k, "# ### ### ##0\ ")
            className = className & " jobbrazart "
        Case dbInteger
        '3
            form�z = Format(�rt�k, "0\ ")
            className = className & " jobbrazart "
        Case dbDouble
        '7
            form�z = Format(�rt�k, "# ### ### ##0.00")
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
