Option Compare Database
Global állj As Boolean
Public hibatábla As Recordset
Public jelenDb As DAO.Database
Public teszt As Boolean ' False 'Ha ez True, akkor teszt üzemmódban fut (nem futtatja a lekérdezéseket)
Const cMezõTípusa As Byte = 2
Const cGrafikonra As Byte = 3
Const cHashbe As Byte = 4
Sub OldalPanel(ByRef hf As Object, ByRef lkEll As DAO.Recordset, ByVal Fõcím As String, ByVal oldalcím As String)
fvbe ("OldalPanel")
    With hf
        .writeline "<div id=""oldalpanel"" class=""oldalpanel"">"
        .writeline "<div ><h3>" & Fõcím & "</h3></div>"
        .writeline "    <h1 class=""oldal"">" & oldalcím & "</h1>"
        .writeline "    <div id=""kereso""><input id=""pageSearch"" type=""text"" placeholder=""Minden táblában keres (min. 3 leütés)""></div>"
        .writeline "    <h2>Táblák</h2>"
        
        Dim elõzõFejezetCím As String
        elõzõFejezetCím = ""
        Dim TáblaSzám As Integer
        TáblaSzám = 0
        Do Until lkEll.EOF
            TáblaSzám = TáblaSzám + 1
            Dim fejezetCím As String
            fejezetCím = lkEll("LapNév")
            Dim fejezetmegj
            fejezetmegj = lkEll("Megjegyzés")
            
            If elõzõFejezetCím = "" Then 'elsõ fejezet
                elõzõFejezetCím = fejezetCím
                .writeline "    <ul class=""chapter-list"">" 'Megnyitjuk a fejezetek listát
                .writeline "    <li class=""chapter-list-item"" title=""" & fejezetmegj & """><a href=#" & Replace(fejezetCím, " ", "") & ">" & fejezetCím & "</a></li>" 'Beillesztjük az elsõ fejezetet
                .writeline "        <ul class=""table-list"">" 'Megnyitjuk az elsõ táblalistát
            End If
            
            If fejezetCím <> elõzõFejezetCím Then 'Új fejezet
                elõzõFejezetCím = fejezetCím
                .writeline "        </ul>" 'Lezárjuk az elõzõ táblalistát
                .writeline "    <li class=""chapter-list-item"" title=""" & fejezetmegj & """><a href=#" & Replace(fejezetCím, " ", "") & ">" & fejezetCím & "</a></li>" ' Bejegyezzük a következõ fejezetlista elemet
                .writeline "        <ul class=""table-list"">" 'Megnyitjuk az új táblalistát
            End If
            
            Dim Táblacím As String
            Táblacím = lkEll("Táblacím")
            Dim megj As String
            megj = Nz(lkEll("TáblaMegjegyzés"), "")
            Dim vaneGraf As Variant
            vaneGraf = lkEll("vaneGraf")
            
            .writeline "        <li class=""table-list-item"" title=""" & megj & """>"
            If vaneGraf <> vbNullString Then
                Dim grIkon As String
                grIkon = "&#x1F4CA;" ' A grafikont jelzõ ikon
                .writeline "            <div class=""linkIkon"" >"
                .writeline "                <a href=""#canv-table" & TáblaSzám & """>" & grIkon & "</a>"
                .writeline "            </div>"
            Else
                .writeline "            <div class=""linkIkon"" ></div>"
            End If
            .writeline "                <div class=""table-linkdiv"">"
            .writeline "                    <a href=#table" & TáblaSzám & " class=""table-link"">" & Táblacím & "</a>"
            .writeline "                </div></li>"
            
            lkEll.MoveNext
        Loop
        .writeline "        </ul>" 'lezárjuk az utolsó táblalistát
        .writeline "    </ul>" 'lezárjuk az utolsó fejezetlistát
        .writeline "</div>" 'lezárjuk az oldalpanelt
        .writeline "</div>" 'lezárjuk a gördülõ oldalpanelt
        .writeline "<div class=""fotartalom"">"
    End With
fvki
End Sub
Sub fejléc(ByRef hf As Object, ByVal oldalcím As String, ByVal háttérkép As String)
fvbe ("fejléc")
    With hf
        .writeline "<!DOCTYPE html>"
        .writeline "<html>"
        .writeline "<head>"
        .writeline "<title>" & oldalcím & "</title>"
        .writeline "<link rel=""stylesheet"" href=""./css/hrell.css"">"
        .writeline "<script src=""./js/hrell.js""></script>"
        .writeline "<script src=""https://kvotariport.kh.gov.hu/static/quotarep/js/chart.bundle.min.js""></script>"
        .writeline "</head>"
        .writeline "<body style='" & háttérkép & "'>"
        .writeline "<div id=""fejlec"">   <a href=""file:///L:/Ugyintezok/Adatszolg%C3%A1ltat%C3%B3k/HRELL/Ind%C3%ADt%C3%B3pult.html"" ><button id=""inditopultButton"">Indítópult</button> </a>" & _
                    "   <div id=""browser-warning"">Ennek az oldalnak a használatához a Firefox böngészõt ajánljuk!</br>Más böngészõk a visszajelzéseket nem, vagy csak hiányosan küldik el." & _
                    "       <button class=""close-btn"" onclick=""closeWarning()"">×</button>" & _
                    "   </div>" & _
                    "</div>"
        .writeline "<div class=""fokeret"">" 'fõkeret
        .writeline "<div id=""gordulooldalpanel"">"
    End With
fvki
End Sub
Function FájlMegnyitása(ByVal filePath As String) As Object
fvbe ("FájlMegnyitása")
    Dim fileSystem As Object
    Set fileSystem = CreateObject("Scripting.FileSystemObject")
    Set FájlMegnyitása = fileSystem.CreateTextFile(filePath, True)
fvki
End Function
'###KEZDET:fejléc###
Sub subHTMLKimenet(oÛrl As Object, oldal As Integer)
 fvbe ("subHTMLKimenet")
    'On Error GoTo Err_Export
    'Const teszt As Boolean
    
    teszt = oÛrl.Próba.Value 'Ha ez True, akkor teszt üzemmódban fut (nem futtatja a lekérdezéseket)
        If teszt Then _
            logba , "Tesztfuttatás indul, üres táblák készülnek!!!", 1
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
    Dim hfNév As String, _
        mappa As String
    Dim fájlobj As Object
    Dim hf As Object 'A fájl, amibe dolgozunk
    Dim mfnév As String 'A fájl másolat neve
    
    '#A visszajelzések kezeléséhez kapcsolódó változók
    Dim lekVisszJelTípus As QueryDef
    Dim VisszJelTípusok As Recordset
    Dim VisszTípCsop As Long
    
    '# A HTML oldal változói
    Dim Fõcím As String, _
        háttérkép As String, _
        háttérszín As String, _
        oldalcím As String, _
        fejezetCím As String, _
        fejezetmegj As String, _
        Táblacím As String, _
        megj As String, _
        CheckBox As String, _
        formázott As String
    Dim elõzõFejezetCím As String
    Dim strÜresTábla As String 'ClassName az üres táblák esetén
    Dim FejezetVált As Boolean
    Dim TáblaSzám As Integer '->> "<table id=""table" & TáblaSzám...
    Dim Most As Date 'tRégiHibák táblába kerülõ idõpont
    
    'Számláláshoz - folyamatjelzõ
    Dim sor, oszlop     As Integer
    Dim ehj             As New ehjoszt
    Dim elõzõszakasz    As Integer
    Dim SzakaszSzám     As Integer


    háttérkép = AlapadatLek("HTML", "háttérkép")
    If vane(háttérkép) Then
        háttérkép = "background-image: url(""" & háttérkép & """);background-repeat: repeat-y;background-size: 100% auto;"
    Else
        háttérkép = ""
    End If

    Fõcím = AlapadatLek("HTML", "fõcím")
    Dim blKellVisszajelzes As Boolean
    
    Dim gráftípus As Variant, _
        meztip As Variant
    'Dim válasz As Integer
    Dim vaneGraf As String, _
        strHash As String, _
        strDropdown As String ', _
'        grIkon As String
'    grIkon = "&#x1F4CA;" ' A grafikont jelzõ ikon áthelyezve: OldalPanel()
    
    
    Dim maxsor As Integer 'Ha a tábla ennél több sorból áll, akkor a táblát egyáltalán nem írjuk ki.
    maxsor = 1100 'TODO: Az ellenõrzõ lekérdezések táblába felvenni, hogy az adott lekérdezés esetén mi legyen a maxsor. De maradhatna itt alapértelmezés...
    
    qWhere = oldal 'oÛrl.Osztály
    hfNév = DLookup("Fájlnév", "tLekérdezésOsztályok", "[azOsztály]=" & oldal)
   
    oldalcím = DLookup("Oldalcím", "tLekérdezésOsztályok", "[azOsztály]=" & oldal)
    VisszTípCsop = Nz(DLookup("azVisszaJelzésTípusCsoport", "tLekérdezésOsztályok", "[Oldalcím]=""" & oldalcím & """"), 0)

    oldalcím = oldalcím & " (" & oÛrl.HaviHatálya & ")" 'Date & ")" 'Az oldalcím a dátummal együtt az igazi, ami pedig a havi jelentés hatálya


    If teszt Then
        mappa = ÚtvonalKészítõ(AlapadatLek("HTML", "próbaútvonal"), "")
    Else
        mappa = ÚtvonalKészítõ(AlapadatLek("HTML", "kimenet"), "")
    End If
    '### Az adatbázis megnyitása
    Set db = CurrentDb()
    '### A visszajelzések kezeléséhez szükséges adatok beszerzése

        Set lekVisszJelTípus = db.CreateQueryDef("", "SELECT tVisszajelzésTípusok.[VisszajelzésKód], tVisszajelzésTípusok.[VisszajelzésSzövege] " & _
                                        " From [tVisszajelzésTípusok]" & _
                                        " Where [VisszaJelzésTípusCsoport] = " & VisszTípCsop & _
                                        " ORDER BY tVisszajelzésTípusok.[VisszajelzésKód] DESC;")
        Set VisszJelTípusok = lekVisszJelTípus.OpenRecordset(dbOpenSnapshot)
    '### A lefuttatandó lekérdezések tulajdonságainak beszerzése -----------
    Set qdf = db.QueryDefs("parlkEllenõrzõLekérdezések")
    qdf.Parameters("qWhere") = qWhere
    Set lkEll = qdf.OpenRecordset
    If lkEll.EOF Then
        sFoly oÛrl, "A választott gyûjteményben:;nincsenek lekérdezések!", , 0
        sFoly oÛrl, "Ezért a futás:;véget ért...", , 0
        fvki
        Exit Sub
    End If
    '### A fájlnév meghatározása -------------------------------------------
    mfnév = hfNév & ".html" ' A másolat ezen a néven készül majd
    hfNév = hfNév & "_" & Format(Now(), "yyyy-mm-dd-hh-nn-ss") & ".html"
'    If teszt Then _
'        mappa = mappa & "Próba\"
        
    hfNév = mappa & "html\" & hfNév
    mfnév = mappa & mfnév
    
    '#######################################################################
    '### A html fájl megnyitása --------------------------------------------
    '#######################################################################
    Set hf = FájlMegnyitása(hfNév)
    Most = Now
    
    '### A html fejrész megírása -------------------------------------------
    fejléc hf, oldalcím, háttérkép

    '#############################
    '### Oldalpanel felépítése ###
    '#############################
    'lkell.MoveLast
    lkEll.MoveFirst
    TáblaSzám = 0
    OldalPanel hf, lkEll, Fõcím, oldalcím

    Táblacím = ""
    megj = ""
    vaneGraf = ""
    '##############################################
    '### A lekérdezésenkénti táblák felépítése ####
    '##############################################
lkEll.MoveLast
lkEll.MoveFirst
ehj.Ini 100
ehj.oszlopszam = lkEll.RecordCount

TáblaSzám = 0

fejezetCím = ""
'elõzõFejezetCím = ""
hf.writeline "<form id=""urlap"" >"
hf.writeline "<button class=""elkuldgomb"" type=""submit"">Visszajelzés...</button>"
Do Until lkEll.EOF 'Külsõ loop kezdete: végigjárjuk a táblákat ###
        TáblaSzám = TáblaSzám + 1
        queryName = lkEll("EllenõrzõLekérdezés")
        blKellVisszajelzes = lkEll("KellVisszajelzes")

'TODO:        If Not paraméterLek(queryName) Then

        Táblacím = lkEll("Táblacím")
              hf.writeline "<div class=""tablediv "">"
        '## A Fejezetcím kiíratása, ha változott
        If fejezetCím <> lkEll("LapNév") Then
            fejezetCím = lkEll("LapNév")
            fejezetmegj = Nz(lkEll("Megjegyzés"), "")
            hf.writeline "    <h2 id=""" & Replace(fejezetCím, " ", "") & """ class=""fejezetcim"" title=""" & fejezetmegj & """ >" & fejezetCím & "</h2>"
        End If
        megj = Nz(lkEll("TáblaMegjegyzés"), "")
        vaneGraf = lkEll("vaneGraf")
        
        sFoly oÛrl, névelõvel(Táblacím, , , True) & ":; összeállítása indul..."
        sqlA = "SELECT * FROM [" & queryName & "]" & _
                    IIf(teszt, "WHERE false", "") ' Ha teszt üzemmódban vagyunk, üres táblákat készítünk
'TODO:
        'A mezTip tömbben eltároljuk a mezõneveket és a hozzájuk tartozó kimeneti típust (hogy mire kell formázni)
        meztip = vFldTípus("SELECT [MezõNeve],[MezõTípusa],[Grafikonra], [Hashbe] FROM tLekérdezésMezõTípusok WHERE [LekérdezésNeve]='" & queryName & "';")
        'Debug.Print queryName & " : "; LBound(mezTip) & vbTab & UBound(mezTip)
        
        ' A lekérdezés futtatása
        Dim rs As DAO.Recordset
        Set rs = db.OpenRecordset(sqlA)
        
        '## A hibák feljegyzése a táblába
        If blKellVisszajelzes Then
            
            RégiHibákTáblába rs, queryName, VisszTípCsop, meztip, Most
        End If
        
            DoEvents
            If állj Then Exit Sub

        intSorokSzáma = rs.RecordCount
        If intSorokSzáma = 0 Then
            strÜresTábla = "uresTabla"
        Else
            strÜresTábla = ""
        End If

        sFoly oÛrl, névelõvel(Táblacím, , , True) & ":;" & intSorokSzáma & " sor"

        ' Index kezdõértékei
        rowIndex = 1
        columnIndex = 1
        intOszlopokSzáma = rs.Fields.count
        ' A táblát magába foglaló keretnek és a tábla fejlécének a kiírása ###
        
        With hf
            If vaneGraf <> vbNullString Then
                .writeline "<table id=""table" & TáblaSzám & """ charttype=""" & vaneGraf & """ class=""collapsible-table " & strÜresTábla & " "">"
            Else
                .writeline "<table id=""table" & TáblaSzám & """ class=""collapsible-table " & strÜresTábla & " "">"
            End If
            .writeline "<thead class=""collapsible-header tablehead " & strÜresTábla & " ""> "
            '## A tábla fejléce .........................................................
            .writeline "<tr>"
            letoltoHTML = "<button class=""export-button"" type=""button"" onclick=""exportTableToCSV('table" & TáblaSzám & "', '" & Táblacím & ".csv')"">Letöltés...</button>"
            Dim táblatitle As String
            táblatitle = " title=""" & megj & """ "
            Select Case intOszlopokSzáma
                Case 1
                    'Ha a tábla egy oszlopos, akkor a keresõ a következõ sorba kerül.
                    .writeline "<th class=""" & strÜresTábla & """" & táblatitle & ">" & Táblacím & " </th>"  '
                    .writeline "</tr><tr>"
                    'A tábla is kap egy sorszámot
                    .writeline "<th " & intOszlopokSzáma & ">" & letoltoHTML & " <input type=""text"" id=""filterInputtable" & TáblaSzám & """ placeholder=""Keresendõ szöveg""></th>"
                Case 2
                    'Ha a tábla 2 oszlopos, akkor az egyik oszlop a címé, a másik a keresõé.
                    .writeline "<th class=""" & strÜresTábla & """" & táblatitle & ">" & Táblacím & " </th>"
                    'A tábla is kap egy sorszámot
                    .writeline "<th >" & letoltoHTML & "<input type=""text"" id=""filterInputtable" & TáblaSzám & """ placeholder=""Keresendõ szöveg""></th>"
                Case Else
                    'Ha a tábla több oszlopos, akkor az utolsó két oszlopot fenntartjuk a keresõnek.
                    .writeline "<th colspan=""" & intOszlopokSzáma - 2 & """ class = """ & strÜresTábla & """" & táblatitle & ">" & Táblacím & " </th>"
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
            If vaneGraf <> vbNullString Then
                gráftípus = párkeresõ(meztip, fld.Name, cGrafikonra)
                If IsNull(gráftípus) Then
                CheckBox = ""
                Else
                CheckBox = "<input type=""checkbox"" class=""columnCheckbox"" data-table=""" & TáblaSzám & """ data-column="" " & columnIndex & " "" " & gráftípus & ">" 'párkeresõ(mezTip, fld.Name, 3)
                End If
            End If
            ' CSS osztály név a fentiek szerint
            hf.writeline "<th class='" & headerClassName & "'>" & fld.Name & CheckBox & "</th>"
            
            ' Oszlopszám növelése
            columnIndex = columnIndex + 1
        Next fld
                If blKellVisszajelzes Then
                    hf.writeline "<td class=""rejtettOszlop"">&nbsp;</td>"
                    hf.writeline "<td class=""valaszOszlop"">Visszajelzés</td>"
                End If
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
                    sFoly oÛrl, névelõvel(Táblacím, , , True) & ":; A sorok száma több, mint " & maxsor & ", ezért átugorjuk."
                    hf.writeline "<tr class=""collapsible-content  " & strÜresTábla & """ >"
                    hf.writeline "<td colspan=""" & intOszlopokSzáma & """> Ez a tábla több, mint " & maxsor & " sort tartalmazna, ezért inkább egyet sem... </td>"
                    hf.writeline "</tr>"
                    GoTo Tovalép
                End If
        
        If rs.RecordCount Then rs.MoveFirst
        Do Until rs.EOF 'Belsõ, sor szintû loop
            hf.writeline "<tr class=""collapsible-content "">"


            '#####################################################
            '## A táblatest sorának összeállítása
            '#####################################################
            columnIndex = 1
            
            For Each fld In rs.Fields
                ' Stílus osztályok meghatározása oszlop és sor alapján
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
                ' Táblamezõ a stílus osztály nevével
                If columnIndex = 1 Then
                    className = "elsooszlop " & className
                End If
                If columnIndex = rs.Fields.count Then
                    className = "utolsooszlop " & className
                End If

                    formázott = formazo(párkeresõ(meztip, fld.Name, cMezõTípusa), fld.Value, className)

                hf.writeline formázott '#**
                ' Debug.Print
                ÷ columnIndex '= columnIndex + 1
            Next fld
            If blKellVisszajelzes Then 'Ha kell visszajelzés,
                If VisszTípCsop <> 0 Then
                    
                    Select Case VisszTípCsop
                        Case 1 'Hibacsoport
                            strHash = TextToMD5Hex(egyesítettMezõk(rs, rs.Bookmark, meztip)) ' & queryName) 'Nem kell a queryName elõtt elválasztó, mert az összefûzés végén marad egy :) !
                            hf.writeline "<td class=""rejtettOszlop""  > " & Nz(DLookup("azIntfajta", "lkRégiHibákUtolsóIntézkedés", "[HASH]='" & strHash & "'"), "0") & "</td>"
                            strDropdown = "<select name=""" & strHash & """>" & vbNewLine
                            strDropdown = strDropdown & "<option value=""0"" selected>-</option>" & vbNewLine
                            Do Until VisszJelTípusok.EOF
                                strDropdown = strDropdown & "<option value=""" & VisszJelTípusok![VisszajelzésKód] & """ >" & VisszJelTípusok![VisszajelzésSzövege] & "</option>" & vbNewLine
                                VisszJelTípusok.MoveNext
                            Loop
                            VisszJelTípusok.MoveFirst
                            strDropdown = strDropdown & "</select>" & vbNewLine
                        Case 2 'Üres álláshely
                            strHash = TextToMD5Hex(rs![Álláshely azonosító])
                            
                            'Legördülõ menü
                            strDropdown = "<div class=""tooltip"" >" & vbNewLine
                            strDropdown = strDropdown & "<select name=""" & strHash & """>" & vbNewLine
                            strDropdown = strDropdown & "<option value=""0"" selected>-</option>" & vbNewLine
                            Do Until VisszJelTípusok.EOF
                                strDropdown = strDropdown & "<option value=""" & VisszJelTípusok![VisszajelzésKód] & """ >" & VisszJelTípusok![VisszajelzésSzövege] & "</option>" & vbNewLine
                                VisszJelTípusok.MoveNext
                            Loop
                            VisszJelTípusok.MoveFirst
                            strDropdown = strDropdown & "</select>" & vbNewLine
                            strDropdown = strDropdown & "   <div class=""left"">" & vbNewLine & _
                                                        "       <h3>A visszajelzések története</h3>" & vbNewLine & _
                                                                sBuborék(strHash, db) & vbNewLine & _
                                                        "           <i></i>" & vbNewLine & _
                                                        "    </div>" & vbNewLine & _
                                                        "</div>"
                            'Dátum választó
                            
                            strDropdown = strDropdown & "<div class=""tooltip valaszDatum""  > <input type=""date""  class=""valaszDatumInput"" ></div>" 'name=""" & strHash & """
                    End Select
                End If
                
                hf.writeline "<td class=""valaszOszlop""  > " & strDropdown & "</td>"
            End If
            hf.writeline "</tr>"
            
            ' A sorszámáló növelése
            rowIndex = rowIndex + 1
            
            rs.MoveNext
        Loop ' Belsõ loop vége
Tovalép:
        With hf
            .writeline "</table>"
            '.writeline "<script>"
                    '.writeline " handleFilter('table" & TáblaSzám & "');"
            '.writeline "</script>"
            .writeline "<span class=""megjegyzes"">" & megj & "</span>"
            .writeline "</div>"
            .writeline "<br/>"
        End With
        sFoly oÛrl, névelõvel(Táblacím, , , True) & ":; elkészült."
        ' A rekordkészlet lezárása
        rs.Close

        ' Ugrás a következõ lekérdezésre
        lkEll.MoveNext
        ehj.Novel
Loop 'Külsõ loop

tesztpont:
    lábléc hf
    ' Close the HTML file
    hf.Close
    Set fájlobj = CreateObject("Scripting.FileSystemObject")
    fájlobj.CopyFile hfNév, mfnév, True 'True = felülírja. Ez az alapértelmezett, itt csak az áttekinthetõség érdekében marad.
    
    ' Open the HTML file in the default web browser
    Shell "explorer.exe " & mfnév, vbNormalFocus
    
    If Not teszt And Not oÛrl.Mindet Then
        Call GenMailto(mfnév, oldalcím)
        sFoly oÛrl, "E-mail üzenet:;összeállítva. Fájlnév:" & hfNév, True, 2
    End If
    
    CloseHibaTábla
    fvki
    Exit Sub
    
Err_Export:
    MsgBox "Error: " & Err.Description, vbExclamation, "Error"
    logba , "Error: " & Err.Description & "," & vbExclamation & "," & "Error", 0
    fvki
End Sub
Function VisszajelzésTípusLista(db As Database, oldalcím As String)
    Dim lekVisszJelTípus As QueryDef
    Dim VisszJelTípusok As Recordset
    Dim ViszTípCsop As Long
    
    Dim Kimenet As String
    
    VisszTípCsop = Nz(DLookup("azVisszaJelzésTípusCsoport", "tLekérdezésOsztályok", "[Oldalcím]=""" & oldalcím & """"), 0)
    If VisszTípCsop = 0 Then Exit Function 'Az "If hibae Then" helyett
    
        Set lekVisszJelTípus = db.CreateQueryDef("", "SELECT tVisszajelzésTípusok.[VisszajelzésKód], tVisszajelzésTípusok.[VisszajelzésSzövege] " & _
                                        " From [tVisszajelzésTípusok]" & _
                                        " Where [VisszaJelzésTípusCsoport] = " & VisszTípCsop & _
                                        " ORDER BY tVisszajelzésTípusok.[VisszajelzésKód];")
        Set VisszJelTípusok = lekVisszJelTípus.OpenRecordset(dbOpenSnapshot)
                    'Ezzel mi legyen???
                    '                strHash = TextToMD5Hex(egyesítettMezõk(rs, rs.Bookmark))
                    '                hf.writeline "<td class=""rejtettOszlop""  > " & Nz(DLookup("azIntfajta", "lkRégiHibákUtolsóIntézkedés", "[HASH]='" & strHash & "'"), "0") & "</td>"
                    '                strDropdown = "<select name=""" & strHash & """>"
        Kimenet = "<option value=""0"" selected>-</option>" & vbNewLine
        Do Until VisszJelTípusok.EOF
            Kimenet = Kimenet & "<option value=""" & VisszJelTípusok![VisszajelzésKód] & """ >" & VisszJelTípusok![VisszajelzésSzövege] & "</option>" & vbNewLine
            VisszJelTípusok.MoveNext
        Loop
                    '                hf.writeline "<td class=""valaszOszlop""  > " & strDropdown & "</td>"
    
    VisszajelzésTípusLista = Kimenet
End Function
Sub lábléc(ByRef hf As Object)
    With hf
        .writeline "</form>"
        .writeline "<button id=""tetejereGomb"">Vissza a tetejére</button>"
        .writeline "<script src=""./js/hrellvég.js""></script>"
        .writeline "</div>" 'fõtartalom
        .writeline "</div>" 'fõkeret
        .writeline "</body>"
        .writeline "</html>"
    End With
End Sub

Sub GenMailto(ByVal fájlnév As String, ByVal oldalcím As String, Optional teszt As Boolean = False)
fvbe ("GenMailto")
'# Meghívja ezt: fvReferenseknekLevél(fájlnév, oldalcím,  teszt )
'#
'# Készít egy HTML állományt (szöveges fájlt),
'# amiben a javascript az oldal betöltésére indul,
'# s miután megnyitja a HTML hivatkozást, vár egy picit, majd bezárja a böngészõ ablakot.
'# Az utolsó sorban megynitjuk ezt a HTML fájlt az alapértelmezett böngészõben, s ezzel elindul a fenti folyamat.

    'Hova tegyük az állományt
    Dim filePath As String
    filePath = "\\Teve1-jkf-hrf2-oes\vol1\Human\HRF\Ugyintezok\Adatszolgáltatók\HRELL\levelek\" & oldalcím & Format(Now(), "yyyy-mm-dd-hh-nn-ss") & ".html"
    
    'A HTML állomány megkezdése
    Dim fileNumber As Integer
    fileNumber = FreeFile
    Open filePath For Output As fileNumber
    
    'A HTML tartalom
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
    Print #fileNumber, "<a id='mailtoLink' href='" & fvReferenseknekLevél(fájlnév, oldalcím, teszt) & "'>Kattints ide az e-mailhez...</a>"
    Print #fileNumber, "</body>"
    Print #fileNumber, "</html>"
    
    'Close the file
    Close fileNumber
    
    Shell "explorer.exe " & filePath, vbNormalFocus
fvki
End Sub
Function fvReferenseknekLevél(ByVal fájlnév As String, ByVal oldalcím As String, Optional teszt As Boolean = False) As String
fvbe ("fvReferenseknekLevél")
    Const nLN As String = "%0d%0a"
    Dim tart As String
    Dim címTO As String
    Dim címCC As String
    Dim a As Boolean
    
    tart = tart & "Kedves Kollégák!" & nLN & nLN
    tart = tart & "Az alábbi helyen találjátok a legújabb adatok alapján elkészített " & oldalcím & " táblákat:" & nLN & nLN
    tart = tart & "file://" & fájlnév '& "%22"
    címTO = fvRefLevCím(1)
        If teszt Then címTO = "example@example.com"
    címCC = fvRefLevCím(2)
        If teszt Then címCC = "cc@example.com"
    'logba sFN & "E-mail címek:", címTO, 2
    logba sFN & "CC:", címCC, 2
    logba sFN & "oldalcím:", oldalcím, 2
    
    fvReferenseknekLevél = "mailto:" & címTO & _
                            "?cc=" & címCC & _
                            "&subject=" & oldalcím & _
                            "&body=" & tart
fvki
End Function
Function fvRefLevCím(Típus As Integer) As String
'Lekérdezzük az lkReferensek lekérdezésbõl
fvbe ("fvRefLevCím")
Dim db As DAO.Database
Dim rs As Recordset
Dim cím As String
Dim reksz As Integer

Select Case Típus
    Case 1 'TO:
        feltétel = " VanTerülete = True and TT = False and Vezetõ=false"
    Case 2 'CC:
        feltétel = " TT = False and Vezetõ=true"
    Case 3 'BCC:
        fvRefLevCím = vbNullString
End Select

    Set db = CurrentDb
    logba sFN & "; lkReferensek", "Lekérdezés indul", 3
    Set rs = db.OpenRecordset("Select [Hivatali email] From lkReferensek WHERE " & feltétel & ";")
    logba sFN & "; lkReferensek", "Lekérdezés lefutott", 3
    rs.MoveFirst
    reksz = 1
    Do Until rs.EOF
        If rs("Hivatali email") <> "" Then
            If reksz = 1 Then
                cím = cím & rs("Hivatali email")
                        logba , cím, 4
            Else
                cím = cím & ";" & rs("Hivatali email")
                        logba , cím, 4
            End If
        End If
        reksz = reksz + 1
        rs.MoveNext
    Loop
    logba sFN & "; Referensek száma:", CStr(reksz), 3
    fvRefLevCím = cím
fvki
End Function

Function formazo(mezõTípus As Integer, érték As Variant, Optional className As String = "") As String
fvbe ("formazo")
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
fvki
End Function
Public Sub InitHibaTábla()
'On Error GoTo Hiba:
    If jelenDb Is Nothing Then _
        Set jelenDb = CurrentDb
        
    If hibatábla Is Nothing Then _
        Set hibatábla = jelenDb.OpenRecordset("tRégiHibák", dbOpenDynaset)

    Exit Sub
Hiba:
'MsgBox Err.Number, Err.Description
End Sub
Private Sub CloseHibaTábla()
    If Not hibatábla Is Nothing Then _
        Set hibatábla = Nothing
        
    If Not jelenDb Is Nothing Then _
        Set jelenDb = Nothing
        
End Sub
Private Function RégiHibákTáblába(HtmlKimenetRs As Recordset, leknév As String, VisszTípCsop As Long, meztip As Variant, Most As Date) As Long
fvbe ("RégiHibákTáblába")
    Dim vissza
    On Error GoTo ErrorHandler
    'Dim db As Database
    'Dim rs As DAO.Recordset
    'Dim hibatábla As DAO.Recordset

    'Set db = CurrentDb()
    'Set HtmlKimenetRs = db.OpenRecordset(lekNév)
    'Set hibatábla = db.OpenRecordset("tRégiHibák", dbOpenDynaset)
    
    InitHibaTábla

    Do While Not HtmlKimenetRs.EOF
        Dim unitedField As String
        Dim hashedText As String
        Dim recordExists As Boolean
        Dim LCounter As Integer
        Dim könyvjelzõ As Variant
        
'        unitedField = ""
'        For LCounter = 0 To HtmlKimenetRs.Fields.count - 1
'                    unitedField = unitedField & Replace(Nz(HtmlKimenetRs(LCounter).Value, ""), "'", "''") & "|"
'        Next LCounter
        könyvjelzõ = HtmlKimenetRs.Bookmark
        unitedField = egyesítettMezõk(HtmlKimenetRs, könyvjelzõ, meztip)
        hashedText = TextToMD5Hex(unitedField)
        HtmlKimenetRs.Bookmark = könyvjelzõ
        If Nz(unitedField, "") <> "" Then
        With hibatábla
            .AddNew
            ![Elsõ mezõ] = hashedText
            ![Második mezõ] = unitedField
            ![Elsõ Idõpont] = Most
            ![Utolsó Idõpont] = Most
            ![LekérdezésNeve] = leknév
            .Update
        End With
        End If
        HtmlKimenetRs.MoveNext
    Loop

'    hibatábla.Close
'    Set hibatábla = Nothing
    'rs.Close
    'Set rs = Nothing
    'Set db = Nothing
    RégiHibákTáblába = vissza
fvki
Exit Function


ErrorHandler:

    If Err.Number = 3022 Then
        With hibatábla
            .CancelUpdate
            .FindFirst "[Elsõ Mezõ] like '" & hashedText & "'"
            .Edit
            ![Utolsó Idõpont] = Most
            ![LekérdezésNeve] = leknév
            .Update
        End With
    Else
        vált1.név = "Hash:"
        vált1.érték = hashedText
        vált2.név = "unitedField"
        vált2.érték = unitedField
        MsgBox Hiba(Err) 'Err.Number & vbNewLine & Err.Description & vbNewLine & "Hash:" & hashedText & vbNewLine & "UnitedField:" & unitedField
    End If
Resume Next
End Function
Function egyesítettMezõk(rs As Recordset, pozíció As Variant, meztip As Variant) As Variant
'mezTip tartalmazza a boole-i értéket arról, hogy a mezõt bele kell-e tenni a Hash-be avagy sem
Dim egyMez As String
        egyMez = ""
        rs.Bookmark = pozíció
        For LCounter = 0 To rs.Fields.count - 1
            If párkeresõ(meztip, rs(LCounter).Name, cHashbe) Then 'Új:2024.11.11
                    egyMez = egyMez & Replace(Nz(rs(LCounter).Value, ""), "'", "''") & "|"
            End If 'Új:2024.11.11
        Next LCounter
        egyesítettMezõk = egyMez '!!Ehhez még hozzá kell fûzni - a meghívó eljárásban - a lekérdezés nevét!!!
End Function
Function oldalakFejezetek(db As Database) As String
' Az indítópult html kódját hozza létre
End Function