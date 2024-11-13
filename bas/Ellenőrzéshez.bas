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
    
    If SzövegMezõ.Value <> "" Then 'Ha már van kiválasztott útvonal a mezõben,
        If Right(SzövegMezõ.Value, 1) = "\" Or InStr(1, Utolsó(SzövegMezõ.Value, "\"), ".") = 0 Then 'és az egy könyvtárra mutat, (mert \ jelre végzõdik vagy az utolsó \ jel után ".")
            Munkakönyvtár = SzövegMezõ.Value 'akkor ez lesz a munkakönyvtár
        Else 'de ha egy fájlra mutat,
            Munkakönyvtár = Replace(SzövegMezõ.Value, Utolsó(SzövegMezõ.Value, "\"), "") 'akkor a fájlnév részt csonkoljuk, s a maradékot használjuk...
        End If
    End If ' egyébként pedig a paraméterként (Munkakönyvtár) megadott útvonal lesz a barátunk.

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

Public Function fvHaviTáblaImport(ByVal fájlnév As String, ByRef Ûrlap As Object, Optional ByVal lnCsoport As Long = 1) As Boolean
fvbe ("fvHaviTáblaImport")
'Licencia: MIT Oláh Zoltán 2022 (c)
    'Az Excel megnyitásához
    Dim objExcel        As excel.Application
    Dim objBook         As excel.Workbook
    Dim objSheet        As excel.Worksheet
    Dim objRange        As excel.Range
    
    Dim accTábla         As String
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
    Dim Fájl            As String
    
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
    Fájl = fájlnév
    ' megnyitjuk az Excel táblát
    Set objBook = objExcel.Workbooks.Open(Fájl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)
    
    Set rs = db.OpenRecordset(tábla)
    rs.MoveLast
    rs.MoveFirst
        If lnCsoport = 1 Then 'Havi létszámjelentés tábla...
            xlTáblaEred = "Fedlap"
            Set objSheet = objBook.Worksheets(xlTáblaEred)
            objSheet.Select ' Ráugrunk a lapra
            Dim rHJH As DAO.Recordset
            Dim hatályID As Long
            
            Set rHJH = db.OpenRecordset("tHaviJelentésHatálya", dbOpenDynaset)
            rHJH.AddNew
            rHJH!hatálya = objSheet.Range("a2").Value
            rHJH!fájlnév = Fájl
            rHJH.Update
            
            rHJH.Bookmark = rHJH.LastModified
            hatályID = rHJH!hatályaID
            rHJH.Close
            Set rHJH = Nothing
        End If
    Do Until rs.EOF
        Erase Értékek
        If rs("Csoport") = lnCsoport Then
            
            accTábla = rs("AccessNév")
            xlTáblaEred = rs("EredetiNév"): 'Debug.Print xlTáblaEred & " -- " & accTábla
            Set objSheet = objBook.Worksheets(xlTáblaEred)
            xlVégcella = Nz(rs("Végcella"), "")
            If xlVégcella = "" Then
                xlHosszmérõ = rs("HosszmérõCella")
                xlUtolsóOszlop = rs("UtolsóOszlop")
                intVégcella = objSheet.Range(xlHosszmérõ & 1).Column
                xlVégcella = objSheet.Cells(objSheet.Cells.Rows.count, intVégcella).End(xlUp).row
                xlVégcella = xlUtolsóOszlop & xlVégcella
                logba , "hosszcella: " & xlHosszmérõ & ", utolsó oszl.: " & xlUtolsóOszlop & ", Végcella: " & xlVégcella, 3
            End If
            
                If DCount("[Name]", "MSysObjects", "[Name] = '" & accTábla & "'") = 1 Then
                        CurrentDb.Execute "Delete * From " & accTábla & ";", dbFailOnError
                    Else
                        CurrentDb.Execute "Delete * From " & accTábla & "_tart;", dbFailOnError
                        DoCmd.CopyObject strHáttérDb, accTábla, acTable, accTábla & "_tart"
                    End If
                If CsakSzám(rs("KezdõCella")) < CsakSzám(xlVégcella) Then
                    With objSheet
                        .Range(.Range(rs("KezdõCella")), .Range(xlVégcella)).Name = accTábla 'Elnevezzük a területet
                        sFoly Ûrlap, accTábla & ":;" & .Range(accTábla).Rows.count
                        logba , .Range(accTábla).Rows.count, 3
                    End With
                    
            
                    'Elkezdjük az adatok betöltését
                    Set rsCél = db.OpenRecordset(accTábla)
            
                    Értékek = objSheet.Range(accTábla).Value
                    logba , "Az " & accTábla & " területrõl az adatokat beolvastuk."
                    logba , "A céltábla:" & rsCél.Name
            
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
                        rsCél.Fields(oszlop - 1) = hatályID
                        rsCél.Update
                        'új rekord hozzáadása véget ért
                    Next sor
                    logba , "Az " & accTábla & " nevû táblába az adatokat beírtuk:" & sor & " sor."
                    logba , "Az " & accTábla & " beolvasása megtörtént."
                Else
                    logba , "Az " & accTábla & " nevû táblába nem írtunk adatokat, mert üres volt."
                    logba , "Az " & accTábla & " beolvasása megtörtént."
                End If

        End If
        rs.MoveNext
        intVégcella = 0
    Loop
    logba , objBook.Name & " bezárása mentés nélkül...", 3
    objBook.Close SaveChanges:=False
    
    Set objBook = Nothing
    'If objBook = Nothing Then logba , fájl & " bezárása mentés nélkül sikerült!", 3
    Set objExcel = Nothing
'    If objExcel = Nothing Then
'        logba , "Excel bezárása sikerült!", 3
'    Else
'        logba , fájl & " néven megnyitott Excel bezárása nem sikerült!", 2
'    End If
fvHaviTáblaImport = True
fvki
Exit Function


Hiba:
    logba , Err.Number & Err.Description, 0
    fvHaviTáblaImport = False

End Function



Public Function tTáblaImport(strFájl As String, Ûrlap As Form, táblanév As String)
fvbe ("tTáblaImport")
On Error GoTo ErrorHandler

    Dim importSpecName As String
    Dim strHiba As String
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
    fvki
    Exit Function

ErrorHandler:
    strHiba = "Error: " & Err.Number & " - " & Err.Description

    MsgBox strHiba, vbExclamation + vbOKOnly, "Error"
    logba , strHiba
    tTáblaImport = False
    Resume Kilépés
End Function


Public Function SzervezetiTáblaImport(fájlnév As String, Ûrlap As Object) As Boolean
fvbe ("SzervezetiTáblaImport")
    'MIT Oláh Zoltán 2022
    'Az Excel megnyitásához
    Dim objExcel       As excel.Application
    Dim objBook         As excel.Workbook
    Dim objSheet        As excel.Worksheet
    Dim objRange        As excel.Range
    Dim objRange2       As excel.Range
    
    Dim accTábla         As String
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
    Dim Fájl            As String
    Dim archfájl        As String           'A régi fájl archiválás utáni neve
    
    Dim Eredmény        As Integer
    Dim tábla           As String           'A tábla : a táblák jellemzõit tároló tábla
    
    'A szöveges kimenethez
    Dim Üzenet As String
    
    'Számláláshoz
    Dim sor, oszlop     As Integer
    Dim ehj             As New ehjoszt
    Dim elõzõszakasz    As Integer
    Dim SzakaszSzám     As Integer
    
    
'On Error GoTo Hiba
    accTábla = "tSzervezeti"
    xlTáblaEred = "Szervezeti alapriport"
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    ' ha az útvonal végén nincs \, akkor hozzáfûzzük, [de ha van, akkor meg nem :)]
    Fájl = fájlnév
    If Not (vane(Fájl)) Then 'Ha nincs ilyen fájl, akkor kiszállunk...
        SzervezetiTáblaImport = False
        sFoly Ûrlap, accTábla & ":;fájl nem található, átugorjuk"
        Exit Function
    End If
    ' megnyitjuk az Excel táblát
    Set objBook = objExcel.Workbooks.Open(Fájl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)
    


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
    sFoly Ûrlap, accTábla & ":;" & xlHosszmérõ & " sor"
                'Debug.Print "Sorok száma:" & xlHosszmérõ & ", oszlopok száma:" & xlUtolsóOszlop
   
    Erase Értékek

    If DCount("[Name]", "MSysObjects", "[Name] = '" & accTábla & "'") = 1 Then 'Ha van már accTábla nevû tábla, akkor
        archfájl = accTábla & RIC(Now())
        DoCmd.CopyObject , archfájl, acTable, accTábla 'készítünk egy tartalék másolatot
        db.Execute ("Delete * From [" & accTábla & "];") 'majd (az accTábla táblát) kiürítjük
        sFoly Ûrlap, accTábla & ":;Az elõzõ táblát " & archfájl & " néven archiváltuk."
    End If
    
    ehj.Ini 100
    'Elkezdjük az adatok betöltését
    Set rsCél = db.OpenRecordset(accTábla)
    Értékek = objRange2.Value
    elõzõszakasz = 0
    SzakaszSzám = 8 '12,5%-konként jelezzük ki az értéket
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
        If Int(ehj.Value / ehj.oszlopszam * SzakaszSzám) > elõzõszakasz Then
            sFoly Ûrlap, accTábla & ":;" & Int(ehj.Value / ehj.oszlopszam * 100) & "% elkészült..."
            elõzõszakasz = Int(ehj.Value / ehj.oszlopszam * SzakaszSzám)
        End If
        rsCél.Update
        'új rekord hozzáadása véget ért
        'Debug.Print (sor / xlHosszmérõ) * 100 & "%"
        ehj.Novel
    Next sor
    SzervezetiTáblaImport = True 'Visszatérési értéke Igaz, ha nincs hiba
    
Kilépés:
    
    rsCél.Close
    Set objRange = Nothing
    Set objRange2 = Nothing
    Set objSheet = Nothing
    Set objBook = Nothing
    Set objExcel = Nothing
fvki
Exit Function

Hiba:

    Hiba Err
    SzervezetiTáblaImport = False 'Visszatérési értéke Hamis, ha hiba történt.
    Resume Kilépés
End Function



Function ImportTáblaHibaJavító(terület As excel.Range) As Integer
    'A kapott tábla (Excel.Range) fejlécében megkeresi az azonos nevûeket, és a másodiktól kezdve az oszlop számát hozzáfûzi.
    'Mindeközben a neveket trim-eli.
    'Ha hiba nem történt:0 értékkel tér vissza, egyébként a hibakóddal
fvbe ("ImportTáblaHibaJavító")
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
fvki
Exit Function
Hiba:
    If Err.Number = 457 Then
        gyûjt.Add név & i, név & i
        logba , név & i, 0
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

Sub BeszámolóTábla(Fájl As String, lekérdezés As String)
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
    Dim adat As Variant
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
        maxsor = .RecordCount
        'Az elõrehaladás-jelzõ elõkészítése

        .MoveFirst
        For sor = 1 To maxsor
            For oszlop = 1 To maxoszlop
                If oszlop = 1 Then
                    oWs1.Cells(sor + 1, oszlop).Value = sor
                Else
                    adat = .Fields(oszlop - 2).Value
                    With oWs1
                        .Cells(sor + 1, oszlop).Value = adat  'A sorszám oszlop miatt adunk hozzá egyet, így egyel odébb tesszük
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
    oWb.SaveAs fileName:=Fájl, FileFormat:=xlOpenXMLWorkbook, AddToMru:=True, Local:=True
    oWb.Close
    'Debug.Print fájl & " kész (" & sor & " sor) ."
    Set oWb = Nothing
'   Kill oWb
    
End Sub
Sub Kimutatás(Fájl As String, lekérdezés As String)
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
    Dim adat As Variant
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
        maxsor = .RecordCount
        'Az elõrehaladás-jelzõ elõkészítése

        .MoveFirst
        For sor = 1 To maxsor
            For oszlop = 1 To maxoszlop
                If oszlop = 1 Then
                    oWs1.Cells(sor + 1, oszlop).Value = sor
                Else
                    adat = .Fields(oszlop - 2).Value
                    With oWs1
                        .Cells(sor + 1, oszlop).Value = adat  'A sorszám oszlop miatt adunk hozzá egyet, így egyel odébb tesszük
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
    oWb.SaveAs fileName:=Fájl, FileFormat:=xlOpenXMLWorkbook, AddToMru:=True, Local:=True
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
Public Sub HaviTáblaPlus( _
        ByVal Fájl As String, _
        Optional ByVal lnCsoport As Long = 1)
Debug.Print fvHaviimpTáblákImportPlus(Fájl, lnCsoport)
End Sub
Public Function _
    fvHaviimpTáblákImportPlus( _
        ByVal Fájl As String, _
        Optional ByVal lnCsoport As Long = 1) _
    As Boolean

fvbe ("fvHaviimpTáblákImportPlus")
    'Licencia: MIT Oláh Zoltán 2022 (c)
    '_____________________________________________________________________________________________________________________________
    '------------------------------------------ Változók deklarációja -----------------------------------------------------------¬
    'Az Excel megnyitásához
    '___________________________________|__________________________|______________________________|______________________________|
    '   Objects                         | Strings                  | Numbers                      | Variants                     |
    '___________________________________|__________________________|______________________________|______________________________|
    Dim objExcel   As excel.Application, xlUtolsóOszlop   As String, intVégcella       As Integer, Értékek()        As Variant, _
        objBook       As excel.Workbook, xlHosszmérõ      As String, intMezõ           As Integer, _
        objSheet     As excel.Worksheet, accTáblák        As String, intUtolsóSor      As Integer, _
        objRange         As excel.Range, xlTáblákEred     As String, _
        xlVégcella       As excel.Range, _
        xlKezdõCella     As excel.Range
    'Az adatbázis megnyitásához
    '___________________________________|__________________________|______________________________|______________________________|
    '   Objects                         | Strings                  | Numbers                      | Variants                     |
    '___________________________________|__________________________|______________________________|______________________________|
    Dim objAccess  As Access.Application, impTáblák       As String, oszlop       As Integer, _
        db              As DAO.Database, strHáttérDb      As String, sor          As Integer, _
        rs              As DAO.Recordset, _
        rsCél           As DAO.Recordset, _
        rsHatály        As DAO.Recordset     'Számláláshoz
                                                                Dim hatályaID As Long
    'A szöveges kimenethez
    '___________________________________|__________________________|______________________________|______________________________|
    '   Objects                         | Strings                  | Numbers                      | Variants                     |
    '___________________________________|__________________________|______________________________|______________________________|
                                     Dim Üzenet          As String
    '___________________________________|__________________________|______________________________|______________________________|
    
    
    strHáttérDb = "L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Háttértárak\EllenõrzésHavi_háttértár.accdb"
'   Set objAccess = New Access.Application
    Set db = CurrentDb 'objAccess.DBEngine.OpenDatabase(strHáttérDb, False, False)
    impTáblák = "tImportálandóTáblák1"
    
    intVégcella = 0
    'On Error GoTo hiba

    Set objExcel = CreateObject("Excel.Application")
    
    Set objBook = objExcel.Workbooks.Open(Fájl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)
    Set rs = db.OpenRecordset(impTáblák)
    
    rs.MoveLast
    rs.MoveFirst
    
    If DCount("*", "tHaviJelentésHatálya1", "fájlnév = '" & Fájl & "'") > 0 Then
        Set rsHatály = db.OpenRecordset("SELECT hatályaID FROM tHaviJelentésHatálya1 WHERE fájlnév = '" & Fájl & "'")
        If Not rsHatály.EOF Then
            hatályaID = rsHatály("hatályaID")
        End If
        rsHatály.Close
    Else
        Set rsHatály = db.OpenRecordset("tHaviJelentésHatálya1", dbOpenDynaset)
        rsHatály.AddNew
        rsHatály("hatálya") = objBook.Worksheets("Fedlap").Range("a2").Value
        rsHatály("fájlnév") = Fájl
        rsHatály.Update
        rsHatály.Bookmark = rsHatály.LastModified
        hatályaID = rsHatály("hatályaID")
        rsHatály.Close
    End If
    
    Do Until rs.EOF
        Erase Értékek
        If rs("Csoport") = lnCsoport Then
            accTáblák = rs("AccessNév")
            xlTáblákEred = rs("EredetiNév")
            
            Set objSheet = objBook.Worksheets(xlTáblákEred)
            With objSheet
                If .AutoFilterMode Then _
                    .AutoFilter.ShowAllData 'Kikapcsolja a szûrést az adott lapon???
                .Select
                logba sFN & " " & xlTáblákEred, "Adatok beolvasás indul..."
                If Nz(rs("Végcella"), "") = "" Then
                    xlHosszmérõ = rs("HosszmérõCella")
                    xlUtolsóOszlop = rs("UtolsóOszlop")
                    intVégcella = .Range(xlHosszmérõ & 1).Column
                    intUtolsóSor = .Cells(objSheet.Cells.Rows.count, intVégcella).End(xlUp).row
                    Set xlVégcella = .Range(xlUtolsóOszlop & intUtolsóSor)
                                    logba , "hosszcella: " & xlHosszmérõ & ", utolsó oszl.: " & xlUtolsóOszlop & ", Végcella: " & xlVégcella, 3
                Else
                    Set xlVégcella = .Range(rs("Végcella"))
                End If
                    Set xlKezdõCella = .Range(rs("KezdõCella"))
                    
                    If xlKezdõCella.row < xlVégcella.row Then 'Ha van adat a táblában ...
                        .Range(xlKezdõCella, xlVégcella).Name = accTáblák
                    
                                    logba , accTáblák & ":;" & .Range(accTáblák).Rows.count, 2
                
                
                        Set rsCél = db.OpenRecordset(accTáblák, dbOpenDynaset)
                        Értékek = .Range(accTáblák).Value
                                    logba sFN & " " & xlTáblákEred, " területrõl az adatokat beolvastuk."
                                    logba sFN & " " & xlTáblákEred, "Adatok kiírása indul. Cél:" & accTáblák
            
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
                            rsCél("hatályaID") = hatályaID  ' Add the hatályaID to the new record
                            rsCél.Update
                            'új rekord hozzáadása véget ért
                        Next sor
                                    logba sFN & " " & xlTáblákEred, "Adatok kiírása " & névelõvel(accTáblák) & "táblába véget ért."
                    Else 'Ha nincs adat a táblában ...
                        'nincs mit elnevezni,
                        'nincs mit kiírni,
                        'amibõl az következik, hogy ha nincs egy táblában egy hatálynapra ID, akkor arra a napra nem volt adat...
                    End If
            End With
        End If
        
        rs.MoveNext
        intVégcella = 0
    Loop
    
                                    logba sFN & " " & xlTáblákEred, objBook.Name & " bezárása mentés nélkül..."
    objBook.Close SaveChanges:=False
    
    fvHaviimpTáblákImportPlus = True
    Debug.Print Fájl
Ki:
    Set objBook = Nothing
    Set objExcel = Nothing
fvki
    Exit Function
Hiba:
    MsgBox Hiba(Err)
    fvHaviimpTáblákImportPlus = False
    If intLoglevel >= 2 Then
        Resume Next
    Else
        Resume Ki
    End If
End Function
