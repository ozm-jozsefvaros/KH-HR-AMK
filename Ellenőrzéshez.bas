'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Explicit
Option Compare Database
Sub FájlVálasztó(SzövegMezõ As TextBox, Felirat As String, Optional Munkakönyvtár As String = "", Optional fájlnév As String = "", Optional fájltípus As String = "")
'Open file ablakot nyit meg Felirat felirattal, s a kiválasztott értéket a SzövegMezõ beviteli mezõbe teszi.
'Meg lehet adni kezdõ mappát, vagy akár az alapértelmezetten megjelenõ állományok neveit is helykitöltõkkel (* és ?)
'Meg lehet adni a fájltípusok listáját, ha üres (vagy hiányzik) akkor *.xls és *.* az alapértelmezett
'Ezt meghívják az alábbi eljárások:
'   Havi_Click
'   Szervezeti_Click
'   Személytörzs_Click

    Dim fDialog As Office.FileDialog
    Dim varFile As Variant
    Dim i, n As Integer
 
    SzövegMezõ.Value = ""

    Set fDialog = Application.FileDialog(msoFileDialogFilePicker)
 
    With fDialog
 
      .AllowMultiSelect = False
             
      .Title = Felirat
 
      .Filters.Clear
      If fájltípus = "" Then
        '.Filters.Add "MsExcel tábla", "*.XLS*"
        '.Filters.Add "Minden fajta", "*.*"
        fájltípus = "*.XSL*,*.*"
      End If
      n = StrCount(fájltípus, ",") + 1
      For i = 1 To n
        .Filters.Add ffsplit(fájltípus, i), ffsplit(fájltípus, i)
      Next i
      If Right(Munkakönyvtár, 1) <> "\" Then
        Munkakönyvtár = Munkakönyvtár & "\"
      End If
      .InitialFileName = Munkakönyvtár & fájlnév 'Hol nyíljon meg
 
      If .Show = True Then
 
         For Each varFile In .SelectedItems
            SzövegMezõ.Value = varFile
         Next
 
       End If
   End With
End Sub
Sub MappaVálasztó(SzövegMezõ As TextBox, Felirat As String, Optional Munkakönyvtár As String = "")
'Open könyvtár ablakot nyit meg Felirat felirattal, s a kiválasztott értéket a SzövegMezõ beviteli mezõbe teszi.
'Meg lehet adni kezdõ mappát, vagy akár az alapértelmezetten megjelenõ állományok neveit is helykitöltõkkel (* és ?)
'Ezt meghívják az alábbi eljárások:
'   Kiemenet_Click()

    Dim fDialog As Office.FileDialog
    Dim varFile As Variant
 
    SzövegMezõ.Value = ""

    Set fDialog = Application.FileDialog(msoFileDialogFolderPicker)
 
    With fDialog
 
      .AllowMultiSelect = False
             
      .Title = Felirat
 
      .Filters.Clear

      If Right(Munkakönyvtár, 1) <> "\" Then
        Munkakönyvtár = Munkakönyvtár & "\"
      End If
      .InitialFileName = Munkakönyvtár  'Hol nyíljon meg
 
      If .Show = True Then
            For Each varFile In .SelectedItems
                SzövegMezõ.Value = varFile
            Next
            If SzövegMezõ.Value = "" Then
                SzövegMezõ.Value = Munkakönyvtár
            End If
       End If
   End With
End Sub
Public Sub HaviTáblaImport(fájlnév As String, Ûrlap As Object)
Dim a As Boolean
    Ûrlap.Folyamat.RowSource = ""
    a = fvHaviTáblaImport(fájlnév, Ûrlap)
End Sub

Public Function fvHaviTáblaImport(ByVal fájlnév As String, ByRef Ûrlap As Object) As Boolean
'Licencia: MIT Oláh Zoltán 2022 (c)
    'Az Excel megnyitásához
    Dim objExcel        As excel.Application
    Dim objBook         As excel.Workbook
    Dim objSheet        As excel.Worksheet
    Dim objRange        As excel.Range
    
    Dim xlTábla         As String
    Dim xlTáblaEred     As String
    Dim xlVégcella      As String
    
    Dim xlUtolsóOszlop  As String
    Dim intVégcella     As Integer
    Dim xlHosszmérõ     As String
    
    Dim Értékek()       As Variant
    Dim intMezõ         As Integer
    
    'Az adatbázis megnyitásához
    Dim db              As DAO.Database     'Ez lesz az adatbázisunk
    Dim strHáttérDb        As String     'Ez a háttéradatbázis, ahol a táblák laknak
    Dim rs              As DAO.Recordset    'A beolvasandó lapok és területek adatait tartalmazó táblának
    Dim rsCél           As DAO.Recordset    'Ahová másolunk
    Dim fájl            As String
    
    Dim Eredmény        As Integer
    Dim tábla           As String           'A tábla : a táblák jellemzõit tároló tábla
    
    'A szöveges kimenethez
    Dim Üzenet As String
    
    'Számláláshoz
    Dim sor, oszlop As Integer
    
    tábla = "tImportálandóTáblák"
    strHáttérDb = "L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Háttértárak\Ellenõrzés_0.9.6_háttér_.mdb.accdb"
    intVégcella = 0
'On Error GoTo hiba
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    'Set háttérdb =
    ' ha az útvonal végén nincs \, akkor hozzáfûzzük, [de ha van, akkor meg nem :)]
    fájl = fájlnév
    ' megnyitjuk az Excel táblát
    Set objBook = objExcel.Workbooks.Open(fájl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)
    
    Set rs = db.OpenRecordset(tábla)
    rs.MoveLast
    rs.MoveFirst

    
    Do Until rs.EOF
        Erase Értékek
        xlTábla = rs("AccessNév")
        xlTáblaEred = rs("EredetiNév"): 'Debug.Print xlTáblaEred & " -- " & xlTábla
        
        
        Set objSheet = objBook.Worksheets(xlTáblaEred)
        objSheet.Select ' Ráugrunk a lapra
        '### A Fedlap A2 cellájából a dátumot (a tábla hatályát) beírjuk a hatálytáblába.
        If xlTáblaEred = "Fedlap" Then
            Dim qdfHJH As DAO.QueryDef
            Dim sql As String
            sql = "INSERT INTO tHaviJelentésHatálya ([hatálya], [fájlnév]) VALUES ([hatály],[fájl]);"
            Set qdfHJH = db.CreateQueryDef("lkTmp01", sql)
            qdfHJH!hatály = objSheet.Range("a2").Value
            qdfHJH!fájl = fájl
            qdfHJH.Execute
            db.QueryDefs.Delete ("lktmp01")
            Set qdfHJH = Nothing
            sql = ""
        End If
        '### Hatály beírása: vége
        If Nz(rs("Végcella"), "") = "" Then
            xlHosszmérõ = rs("HosszmérõCella")
            xlUtolsóOszlop = rs("UtolsóOszlop")
            intVégcella = objSheet.Range(xlHosszmérõ & 1).Column
            xlVégcella = objSheet.Cells(objSheet.Cells.Rows.count, intVégcella).End(xlUp).row
            xlVégcella = xlUtolsóOszlop & xlVégcella
        Else
            xlVégcella = rs("Végcella")
        End If
        With objSheet
            .Range(.Range(rs("KezdõCella")), .Range(xlVégcella)).Name = xlTábla 'Elnevezzük a területet
            sFoly Ûrlap, xlTábla & ":;" & .Range(xlTábla).Rows.count
            'Debug.Print .Range(xlTábla).Rows.Count
            
        End With
        
        
        If DCount("[Name]", "MSysObjects", "[Name] = '" & xlTábla & "'") = 1 Then
            CurrentDb.Execute "Delete * From " & xlTábla & ";", dbFailOnError
        Else
            CurrentDb.Execute "Delete * From " & xlTábla & "_tart;", dbFailOnError
            DoCmd.CopyObject strHáttérDb, xlTábla, acTable, xlTábla & "_tart"
        End If


        'Elkezdjük az adatok betöltését
        Set rsCél = db.OpenRecordset(xlTábla)

        Értékek = objSheet.Range(xlTábla).Value
       ' Debug.Print "Az " & xlTábla & " területrõl az adatokat beolvastuk."
       ' Debug.Print "A céltábla:" & rsCél.Name

        For sor = LBound(Értékek, 1) To UBound(Értékek, 1)
            intMezõ = 0
            'új rekord hozzáadása kezdõdik...
            rsCél.AddNew
            For oszlop = LBound(Értékek, 2) To UBound(Értékek, 2)
                If rsCél.Fields.count < oszlop Then
                    Exit For
                End If
                intMezõ = oszlop - 1

                rsCél.Fields(intMezõ) = konverter(rsCél.Fields(intMezõ), Értékek(sor, oszlop))
                
            Next oszlop
            rsCél.Update
            'új rekord hozzáadása véget ért
        Next sor
        'Debug.Print "Az " & xlTábla & " nevû táblába az adatokat beírtuk:" & sor & " sor."
        'Debug.Print "Az " & xlTábla & " beolvasása megtörtént."
        rs.MoveNext
        intVégcella = 0
    Loop
fvHaviTáblaImport = True
Exit Function


Hiba:
Debug.Print Err.Number, Err.Description
fvHaviTáblaImport = False

End Function
Sub LekérdezésÍró()
'Licencia: MIT Oláh Zoltán 2022 (c)
    Dim rs As Recordset
    Dim rs2 As Recordset
    Dim sql As String
    Dim sql2 As String
    Dim kSQL As String
    Dim lekérd As String
    Dim újnév As String
    Dim x As Integer
    Dim Találat, dbTalálat As Integer
    
    sql = "SELECT AccessNév, Hiány_lekérdezés FROM tImportálandóTáblák"
    Set rs = CurrentDb.OpenRecordset(sql)
    
    Do Until rs.EOF
        sql2 = "SELECT Import, Eredeti  FROM tJavítandóMezõnevek WHERE Tábla ='" & rs!AccessNév & "' AND NemKötelezõ = false ;"
        Set rs2 = CurrentDb.OpenRecordset(sql2)
        kSQL = ""
        Do Until rs2.EOF
            If kSQL <> "" Then kSQL = kSQL & ", " & Chr(10)
            újnév = RIC(Clean_NPC(rs2!Eredeti.Value))
            If Len(újnév) > 64 Then
                újnév = Left(újnév, 60)
            End If
            dbTalálat = 0
            Találat = InStr(1, kSQL, újnév) 'Az új név szerepelt-e már az elõzõekben
            Do Until dbTalálat >= Találat 'Ha igen, akkor a Találat nagyobb, mint a db találat
                dbTalálat = Találat 'elõre toljuk a mérési pontot,
                Találat = InStr(dbTalálat, kSQL, újnév) 'megnézzük innen is,
            Loop 'hogy nagyobb értéket kapunk-e, mint korábban (ami most a dbTalálat)
            If dbTalálat > 0 Then
                újnév = újnév & dbTalálat + 1
            End If
            If InStr(1, kSQL, újnév) > 0 Then
                'újnév
                dbTalálat = dbTalálat + 1
            End If
            If Len(újnév) = 0 Then MsgBox "!": GoTo kijárat
            kSQL = kSQL & rs!Hiány_lekérdezés.Value & ".[" & rs2!Import.Value & "] AS " & újnév
            rs2.MoveNext 'a következõ mezõre ugrunk
        Loop 'rs2

        kSQL = "SELECT " & kSQL & " FROM " & rs!Hiány_lekérdezés & ";"
        lekérd = rs!Hiány_lekérdezés & "2"
        
        If Not IsNull(DLookup("Type", "MSYSObjects", "Name='" & lekérd & "'")) Then
            CurrentDb.QueryDefs(lekérd).sql = kSQL
        Else
            CurrentDb.CreateQueryDef lekérd, kSQL
        End If
        'Debug.Print kSQL
        rs.MoveNext 'A következõ táblára ugrunk
    Loop 'rs

kijárat:

End Sub


Public Function tTáblaImport(strFájl As String, Ûrlap As Form, táblanév As String)
    'On Error GoTo ErrorHandler

    Dim importSpecName As String
'    Dim strXML As String
'    Dim strRégiFájl As String
'    Dim strÚjFájl As String
'    Dim intKezdPoz As Integer
'    Dim intVégPoz As Integer
    Dim Üzenet As String
    Dim válasz As Boolean
    
    importSpecName = táblanév 'pl.:"tAdatváltoztatásiIgények"

    If strFájl <> "" Then

                                                   ' sFoly Ûrlap, importSpecName & ":; importálás üres oszlopok törlése..."
       ' UresOszlopokTorlese strFájl 'A megadott állományból töröljük az üres oszlopokat
'#           Átírjuk az XML-t:
                                                    sFoly Ûrlap, importSpecName & ":; mentett import átalakítása"
        válasz = XMLátalakító(importSpecName, strFájl)
        

                                                    sFoly Ûrlap, importSpecName & ":; importálás indítása"
'#           Az átírt XML-lel pedig futtatjuk a mentett importot
        DoCmd.RunSavedImportExport importSpecName
                                                    sFoly Ûrlap, importSpecName & ":; importálás véget ért"
                                                    sFoly Ûrlap, importSpecName & ":; " & DCount("*", táblanév) & " sor."
    End If
   tTáblaImport = True
    
Kilépés:
    Exit Function

ErrorHandler:
    ' Szabványos hibaüzenet elõállítása
    If Err.Number = 3709 Then
        
        'Resume 0
    End If
    MsgBox "Error: " & Err.Number & " - " & Err.Description, vbExclamation + vbOKOnly, "Error"
    Debug.Print "Error: " & Err.Number & " - " & Err.Description
    tTáblaImport = False
    Resume Kilépés
End Function


Public Function SzervezetiTáblaImport(fájlnév As String, Ûrlap As Object) As Boolean
    'MIT Oláh Zoltán 2022
    'Az Excel megnyitásához
    Dim objExcel       As excel.Application
    Dim objBook         As excel.Workbook
    Dim objSheet        As excel.Worksheet
    Dim objRange        As excel.Range
    Dim objRange2       As excel.Range
    
    Dim xlTábla         As String
    Dim xlTáblaEred     As String
    Dim xlVégcella      As String
    
    Dim xlUtolsóOszlop  As Integer
    Dim intVégcella     As Integer
    Dim xlHosszmérõ     As Integer
    
    Dim Értékek()       As Variant
    Dim intMezõ         As Integer
    
    'Az adatbázis megnyitásához
    Dim db              As DAO.Database     'Ez lesz az adatbázisunk
    Dim rs              As DAO.Recordset    'A beolvasandó lapok és területek adatait tartalmazó táblának
    Dim rsCél           As DAO.Recordset    'Ahová másolunk
    Dim fájl            As String
    Dim archfájl        As String           'A régi fájl archiválás utáni neve
    
    Dim Eredmény        As Integer
    Dim tábla           As String           'A tábla : a táblák jellemzõit tároló tábla
    
    'A szöveges kimenethez
    Dim Üzenet As String
    
    'Számláláshoz
    Dim sor, oszlop     As Integer
    Dim ehj             As New ehjoszt
    Dim ElõzõSzakasz    As Integer
    
    
'On Error GoTo Hiba
    xlTábla = "tSzervezeti"
    xlTáblaEred = "Szervezeti alapriport"
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    ' ha az útvonal végén nincs \, akkor hozzáfûzzük, [de ha van, akkor meg nem :)]
    fájl = fájlnév
    If Not (vane(fájl)) Then 'Ha nincs ilyen fájl, akkor kiszállunk...
        SzervezetiTáblaImport = False
        sFoly Ûrlap, xlTábla & ":;fájl nem található, átugorjuk"
        Exit Function
    End If
    ' megnyitjuk az Excel táblát
    Set objBook = objExcel.Workbooks.Open(fájl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)
    


    Set rsCél = Nothing

'Az importálandó területet az objRange-be tesszük
    Set objSheet = objBook.Worksheets(xlTáblaEred)
    objSheet.Activate
    
    Set objRange = objSheet.Range("A2").CurrentRegion
        xlUtolsóOszlop = objRange.Columns.count
        xlHosszmérõ = objRange.Rows.count

    With objRange
        Set objRange2 = .Range(.Cells(2, 1), objRange.Cells(xlHosszmérõ, xlUtolsóOszlop + 0))  'leszedjük az elsõ sort
    End With
    sFoly Ûrlap, xlTábla & ":;" & xlHosszmérõ
                'Debug.Print "Sorok száma:" & xlHosszmérõ & ", oszlopok száma:" & xlUtolsóOszlop
   
    Erase Értékek

    If DCount("[Name]", "MSysObjects", "[Name] = '" & xlTábla & "'") = 1 Then 'Ha van már xlTábla nevû tábla, akkor
        archfájl = xlTábla & RIC(Now())
        DoCmd.CopyObject , archfájl, acTable, xlTábla 'készítünk egy tartalék másolatot
        db.Execute ("Delete * From [" & xlTábla & "];") 'majd (az xlTábla táblát) kiürítjük
        sFoly Ûrlap, xlTábla & ":;Az elõzõ táblát " & archfájl & " néven archiváltuk."
    End If
    
    ehj.Ini 100
    'Elkezdjük az adatok betöltését
    Set rsCél = db.OpenRecordset(xlTábla)
    Értékek = objRange2.Value
    'ehj.SzakaszSzám = 5 '20%-konként jelezzük ki az értéket
    ehj.oszlopszam = UBound(Értékek, 1) - (LBound(Értékek, 1) + 1) 'Itt az oszlopszám a sorokat jelöli :)
    For sor = LBound(Értékek, 1) + 1 To UBound(Értékek, 1)
        intMezõ = 0
        'új rekord hozzáadása kezdõdik...
        rsCél.AddNew
        For oszlop = LBound(Értékek, 2) - 1 To UBound(Értékek, 2)
            intMezõ = oszlop
            If intMezõ <> 0 Then
                rsCél.Fields(intMezõ) = konverter(rsCél.Fields(intMezõ), Értékek(sor, oszlop))
                'Debug.Print intMezõ, rsCél.Fields(intMezõ).Name & ": " & Értékek(1, oszlop) & " - " & rsCél.Fields(intMezõ)
            End If
 
        Next oszlop
'        If ehj.JelenlegiSzakasz > ElõzõSzakasz Then
'            sFoly Ûrlap, xlTábla & ":;" & Round(ehj.JelenlegiSzakasz / ehj.SzakaszSzám * 100, 0) & "% elkészült..."
'            ElõzõSzakasz = ehj.JelenlegiSzakasz
'        End If
        rsCél.Update
        'új rekord hozzáadása véget ért
        'Debug.Print (sor / xlHosszmérõ) * 100 & "%"
'        ehj.Novel
    Next sor
    SzervezetiTáblaImport = True 'Visszatérési értéke Igaz, ha nincs hiba
Kilépés:
    
    rsCél.Close
Exit Function

Hiba:
    
    MsgBox "Hiba!! " & Err.Number & ": " & Err.Description
    SzervezetiTáblaImport = False 'Visszatérési értéke Hamis, ha hiba történt.
    Resume Kilépés
End Function



Function ImportTáblaHibaJavító(terület As excel.Range) As Integer
    'A kapott tábla (Excel.Range) fejlécében megkeresi az azonos nevûeket, és a másodiktól kezdve az oszlop számát hozzáfûzi.
    'Mindeközben a neveket trim-eli.
    'Ha hiba nem történt:0 értékkel tér vissza, egyébként a hibakóddal
    On Error GoTo Hiba
    Dim intOszlopok     As Integer  'Az oszlopok száma
    Dim i, n            As Integer  'Számláló
    Dim varOszlopNevek  As Variant   'Az oszlopok nevei
    Dim intOszlopSzám   As Integer  'Az oszlopok száma
    Dim gyûjt           As Collection
    Dim név             As Variant
    
    intOszlopSzám = terület.Columns.count
    ReDim varOszlopNevek(1, intOszlopSzám)
    
    Set gyûjt = New Collection
    
    varOszlopNevek = terület.Rows(1)
    
    For i = LBound(varOszlopNevek, 2) To UBound(varOszlopNevek, 2) 'Végig lépkedünk az összes elemen
        név = varOszlopNevek(1, i)
        gyûjt.Add név, név
        'és megkíséreljük betenni egy szótárba. Ha van azonos, akkor hibára fut, s a hibakeresõ hozzáfûzi az i-t és újra megpróbálja.
        'Debug.Print i, név
    Next i
    
    For n = 1 To gyûjt.count
        terület.Cells(1, n) = Trim(gyûjt(n)) 'Visszatesszük, de egyúttal levesszük a felesleges szóközöket.
    Next n
    
    ImportTáblaHibaJavító = 0
Exit Function
Hiba:
    If Err.Number = 457 Then
        gyûjt.Add név & i, név & i
        Debug.Print név; i
        Resume Next
    End If
    ImportTáblaHibaJavító = Err.Number
    
End Function
Public Sub táblagyártó(Optional ByVal SzervezetiLek As String = "lk_átvilágítás_mind_02", Optional ByVal AdatLek As String = "lk__Átvilágításhoz_Személytörzs_02")
'Licencia: MIT Oláh Zoltán 2022 (c)
Dim db As Database
Dim rst As Recordset
Dim qdf As QueryDef
Dim sql As String
Dim érték As Variant
Dim a As Integer
sql = "Select Distinct [Szervezeti egység] From  [" & SzervezetiLek & "] WHERE [Szervezeti egység] not like '' "
Set db = CurrentDb()
Set rst = qdf.OpenRecordset(sql)
rst.MoveLast
rst.MoveFirst
Do Until rst.EOF
    érték = rst.Fields("Szervezeti egység").Value
    'Debug.Print érték
    Call Kimutatás("O:\Átvilágítás\Átvilágítás2" & érték & ".xlsx", "SELECT * FROM [" & AdatLek & "] WHERE [Szervezeti egység] = '" & érték & "';")
    'Debug.Print "O:\Átvilágítás\Átvilágítás2" & érték & ".xlsx"
    rst.MoveNext
Loop
End Sub
Public Sub BeszámolóKészítõ()
'Licencia: MIT Oláh Zoltán 2022 (c)
Dim db As Database
Dim rst As Recordset
Dim sql As String
Dim érték As Variant
Dim a As Integer
sql = "Select Distinct [Szervezeti egység] From  lk_átvilágítás_mind_02 WHERE [Szervezeti egység] not like '' "
Set db = CurrentDb()
Set rst = db.OpenRecordset(sql, dbOpenDynaset)
rst.MoveLast
rst.MoveFirst
Do Until rst.EOF
    érték = rst.Fields("Szervezeti egység").Value
    'Debug.Print érték
    Call BeszámolóTábla("O:\Átvilágítás\Átvilágítás2" & érték & ".xlsx", "SELECT * FROM lk__Átvilágításhoz_Személytörzs_02 WHERE [Szervezeti egység] = '" & érték & "';")
    'Debug.Print "O:\Átvilágítás\Átvilágítás2" & érték & ".xlsx"
    rst.MoveNext
Loop
End Sub

Sub BeszámolóTábla(fájl As String, lekérdezés As String)
'****** (c) Oláh Zoltán 2022 - MIT Licence ****************
 
 'Az adatbázishoz
    Dim db          As Database
    Dim qdf         As QueryDef
    Dim rs          As DAO.Recordset
    Dim Ûrlapnév    As String
    
    'Excelhez
    Dim sor, oszlop     As Long
    Dim oApp            As excel.Application
    Dim oWb             As Workbook
    Dim oWs1, oWs2      As Worksheet
    Dim oWc             As Chart
    
    'A lépegetéshez
    Dim maxoszlop, maxsor As Long
    Dim Adat As Variant
    Dim mezõ As Field
    'Az elõrehaladás-jelzõhöz

    
    'Alapadatok **********************************
    sor = 1
    oszlop = 1

    Set db = CurrentDb()
    'Set qdf = db.
    Set rs = db.OpenRecordset(lekérdezés)
    
    Set oApp = CreateObject("Excel.Application")
    Set oWb = oApp.Workbooks.Add
    Set oWs1 = oWb.Worksheets.Add
    Set oWs2 = oWb.Worksheets.Add(, oWs1)
    
    oWs1.Name = "Teljesítmény-értékelés"
    oWs1.Activate
    

    ' Tartalom kiírása
    
    With rs
        rs.MoveFirst
        rs.MoveLast
        maxoszlop = .Fields.count  'A leendõ oszlopok száma, ahány mezõ van a lekérdezésben és még egy a sorszám miatt
        maxsor = .recordCount
        'Az elõrehaladás-jelzõ elõkészítése

        .MoveFirst
        For sor = 1 To maxsor
            For oszlop = 1 To maxoszlop
                If oszlop = 1 Then
                    oWs1.Cells(sor + 1, oszlop).Value = sor
                Else
                    Adat = .Fields(oszlop - 2).Value
                    With oWs1
                        .Cells(sor + 1, oszlop).Value = Adat  'A sorszám oszlop miatt adunk hozzá egyet, így egyel odébb tesszük
                    End With
                End If
            Next oszlop
            .MoveNext
        Next sor
    End With
    With oWs1
        .Range(.Cells(1, 1), .Cells(maxsor + 1, maxoszlop)).Name = "Teljesítmény_értékelés"
        .Range(.Cells(maxsor + 2, 1), .Cells(maxsor + 2, 1)).Value = "*Minden feladatot külön sorban kell feltüntetni!"
    End With
  
    'A fejléc utólag jön a tetejére
    oszlop = 2
    With oWs1.Cells(1, 1)
                .Value = "Sorszám"
                .Font.Bold = True
                .Font.Name = "Calibri"
                .Font.Size = 11
                .Interior.Color = RGB(83, 142, 213)
                .Font.Color = RGB(255, 255, 255)
                .WrapText = True
                .VerticalAlignment = xlVAlignTop
                .HorizontalAlignment = xlHAlignCenter
    End With
    oWs1.Columns(oszlop).ColumnWidth = 10
    For Each mezõ In rs.Fields
        With oWs1
            With .Cells(1, oszlop)
                .Value = Replace(mezõ.Name, "_", ".")
                .Font.Bold = True
                .Font.Name = "Calibri"
                .Font.Size = 11
                .Interior.Color = RGB(83, 142, 213)
                .Font.Color = RGB(255, 255, 255)
                .WrapText = True
                .VerticalAlignment = xlVAlignTop
                .HorizontalAlignment = xlHAlignCenter
            End With
            Select Case oszlop
                Case 2, 3
                    .Columns(oszlop).ColumnWidth = 43
                Case 4
                    .Columns(oszlop).ColumnWidth = 36
                Case 5
                    .Columns(oszlop).ColumnWidth = 45
                    .Cells(1, oszlop).Value = "Az 1. számú táblázat alapján a kormánytisztviselõ ténylegesen ellátandó fealdatai*"
                Case 6
                    .Columns(oszlop).ColumnWidth = 45
                    .Cells(1, oszlop).Value = "Az 1. sz. táblázatban meghatározott teljesítmény-követelmény kormánytisztviselõre vonatkozó szövegszerû értékelése"
                Case 7
                    .Columns(oszlop).ColumnWidth = 13 'Teljesítmény-követelmény
                    .Cells(1, oszlop).Value = "Teljesítmény-követelmény (felett / szinten / alatt)"
            End Select
        End With
        oszlop = oszlop + 1
    Next mezõ
    oWs1.Range("G2:G1000").Validation.Add xlValidateList, xlValidAlertStop, xlEqual, "szint felett; szinten; szint alatt"
    oWs2.Name = "Adatok"
    oWs2.Range("A1").Value = "Készült:": oWs2.Range("B1").Value = Now()
    oWs2.Range("A2").Value = "Adatsor:": oWs2.Range("B2").Value = sor - 1
    
    'Takarítás
    oWb.SaveAs fileName:=fájl, FileFormat:=xlOpenXMLWorkbook, AddToMru:=True, Local:=True
    oWb.Close
    'Debug.Print fájl & " kész (" & sor & " sor) ."
    Set oWb = Nothing
'   Kill oWb
    
End Sub
Sub Kimutatás(fájl As String, lekérdezés As String)
'****** (c) Oláh Zoltán 2022 - MIT Licence ****************
 
 'Az adatbázishoz
    Dim db          As Database
    Dim qdf         As QueryDef
    Dim rs          As DAO.Recordset
    Dim Ûrlapnév    As String
    
    'Excelhez
    Dim sor, oszlop     As Long
    Dim oApp            As excel.Application
    Dim oWb             As Workbook
    Dim oWs1, oWs2      As Worksheet
    Dim oWc             As Chart
    
    Dim maxoszlop, maxsor As Long
    Dim Adat As Variant
    Dim mezõ As Field
    'Az elõrehaladás-jelzõhöz

    
    'Alapadatok **********************************
    sor = 1
    oszlop = 1

    Set db = CurrentDb()
    'Set qdf = db.
    Set rs = db.OpenRecordset(lekérdezés)
    
    Set oApp = CreateObject("Excel.Application")
    Set oWb = oApp.Workbooks.Add
    Set oWs1 = oWb.Worksheets.Add
    Set oWs2 = oWb.Worksheets.Add(, oWs1)
    
    oWs1.Name = "Teljesítmény-értékelés"
    oWs1.Activate
    

    ' Tartalom kiírása
    
    With rs
        rs.MoveFirst
        rs.MoveLast
        maxoszlop = .Fields.count  'A leendõ oszlopok száma, ahány mezõ van a lekérdezésben és még egy a sorszám miatt
        maxsor = .recordCount
        'Az elõrehaladás-jelzõ elõkészítése

        .MoveFirst
        For sor = 1 To maxsor
            For oszlop = 1 To maxoszlop
                If oszlop = 1 Then
                    oWs1.Cells(sor + 1, oszlop).Value = sor
                Else
                    Adat = .Fields(oszlop - 2).Value
                    With oWs1
                        .Cells(sor + 1, oszlop).Value = Adat  'A sorszám oszlop miatt adunk hozzá egyet, így egyel odébb tesszük
                    End With
                End If
            Next oszlop
            .MoveNext
        Next sor
    End With
    With oWs1
        .Range(.Cells(1, 1), .Cells(maxsor + 1, maxoszlop)).Name = "Teljesítmény_értékelés"
        .Range(.Cells(maxsor + 2, 1), .Cells(maxsor + 2, 1)).Value = "*Minden feladatot külön sorban kell feltüntetni!"
    End With
  
    'A fejléc utólag jön a tetejére
    oszlop = 2
    With oWs1.Cells(1, 1)
                .Value = "Sorszám"
                .Font.Bold = True
                .Font.Name = "Calibri"
                .Font.Size = 11
                .Interior.Color = RGB(83, 142, 213)
                .Font.Color = RGB(255, 255, 255)
                .WrapText = True
                .VerticalAlignment = xlVAlignTop
                .HorizontalAlignment = xlHAlignCenter
    End With
    oWs1.Columns(oszlop).ColumnWidth = 10
    For Each mezõ In rs.Fields
        With oWs1
            With .Cells(1, oszlop)
                .Value = Replace(mezõ.Name, "_", ".")
                .Font.Bold = True
                .Font.Name = "Calibri"
                .Font.Size = 11
                .Interior.Color = RGB(83, 142, 213)
                .Font.Color = RGB(255, 255, 255)
                .WrapText = True
                .VerticalAlignment = xlVAlignTop
                .HorizontalAlignment = xlHAlignCenter
            End With
            Select Case oszlop
                Case 2, 3
                    .Columns(oszlop).ColumnWidth = 43
                Case 4
                    .Columns(oszlop).ColumnWidth = 36
                Case 5
                    .Columns(oszlop).ColumnWidth = 45
                    .Cells(1, oszlop).Value = "Az 1. számú táblázat alapján a kormánytisztviselõ ténylegesen ellátandó fealdatai*"
                Case 6
                    .Columns(oszlop).ColumnWidth = 45
                    .Cells(1, oszlop).Value = "Az 1. sz. táblázatban meghatározott teljesítmény-követelmény kormánytisztviselõre vonatkozó szövegszerû értékelése"
                Case 7
                    .Columns(oszlop).ColumnWidth = 13 'Teljesítmény-követelmény
                    .Cells(1, oszlop).Value = "Teljesítmény-követelmény (felett / szinten / alatt)"
            End Select
        End With
        oszlop = oszlop + 1
    Next mezõ
    oWs1.Range("G2:G1000").Validation.Add xlValidateList, xlValidAlertStop, xlEqual, "szint felett; szinten; szint alatt"
    oWs2.Name = "Adatok"
    oWs2.Range("A1").Value = "Készült:": oWs2.Range("B1").Value = Now()
    oWs2.Range("A2").Value = "Adatsor:": oWs2.Range("B2").Value = sor - 1
    
    'Takarítás
    oWb.SaveAs fileName:=fájl, FileFormat:=xlOpenXMLWorkbook, AddToMru:=True, Local:=True
    oWb.Close
    'Debug.Print fájl & " kész (" & sor & " sor) ."
    Set oWb = Nothing
'   Kill oWb
    
End Sub


Function ÚjOszlop(strOszlopNév As String) As Integer
    Dim szöveg As String
    Dim válasz As Variant
    Dim szám As Integer
On Error GoTo Hiba
Kezdet:
    szöveg = strOszlopNév & Chr(10) & "2 - Byte" & Chr(10) & "3 - Integer" & Chr(10) & "4 - Long" & Chr(10) & "5 - Currency" & Chr(10) & "6 - Single" & Chr(10) & "7 - Double" & Chr(10) & "8 - Date/Time" & Chr(10) & "10 - Text" & Chr(10) & "12 - Memo" & Chr(10) & "16 - Big Integer" & Chr(10) & "17 - VarBinary" & Chr(10) & "18 - Char" & Chr(10) & "19 - Numeric" & Chr(10) & "20 - Decimal" & Chr(10) & "21 - Float" & Chr(10) & "22 - Time" & Chr(10) & "23 - Time Stamp"
    válasz = InputBox(szöveg, "Új oszlop", 10) 'Ha nem válaszol, akkor 10 lesz az érték.
    If StrPtr(válasz) = 0 Then 'Mégsem gombot nyomott
        Exit Function
    End If
    If Len(válasz) = 0 Then
        GoTo Kezdet
    End If
Vég:
    szám = CInt(válasz)
    MsgBox ("Eredmény:" & szám)
Exit Function
Hiba:
If Err.Number = 13 Then
    Select Case MsgBox(Err.Number & " számú hiba." & Chr(10) & " Csak szám adható meg!", vbRetryCancel)
        Case 2
            Exit Function
        Case 4
            Resume Kezdet
        Case Else
            MsgBox ("!")
    End Select
End If
'    Resume Kezdet

End Function


Sub TáblaMezõk()
    Dim db As Database
    Dim rs As Recordset
    Dim rs2 As Recordset
    Dim tbla As Recordset
    Dim sql, sql2, sql3 As String
    Dim mezõszám As Long
    Dim mezõnév As String
    'Dim mezõnevek() As Variant
    
    Dim táblanév As String
    
    
    sql = "SELECT Name FROM MSysObjects WHERE (Flags=0 AND Type = 1 AND Name not like '~*') OR (Type = 6 AND Name not like '~*')"
    
    Set db = CurrentDb()
    db.Execute ("Delete * from tTáblamezõk")
    Set tbla = db.OpenRecordset("select * from tTáblamezõk")
        
    Set rs = db.OpenRecordset(sql)
        rs.MoveLast
        rs.MoveFirst
    
    Do Until rs.EOF
        táblanév = rs.Fields("Name")
        sql2 = "SELECT TOP 1 * FROM [" & táblanév & "];"
        Set rs2 = db.OpenRecordset(sql2)
        'Debug.Print táblanév, rs2.Fields.Count
        For mezõszám = 0 To rs2.Fields.count - 1
            tbla.AddNew
            tbla.Fields("táblanév") = táblanév
            mezõnév = rs2.Fields(mezõszám).Name
            tbla.Fields("mezõnév") = mezõnév
            tbla.Fields("sorszám") = mezõszám
            tbla.Fields("típusa") = rs2.Fields(mezõszám).Type
            If InStr(1, mezõnév, "dátum") Then
                'tbla.Fields = Date
            End If
            tbla.Update
            'Debug.Print mezõszám, rs2.Fields(mezõszám).Name
        Next mezõszám
        Set rs2 = Nothing
        rs.MoveNext
    Loop
    
End Sub




