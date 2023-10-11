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
Sub FájlVálasztó(SzövegMezõ As TextBox, Felirat As String, Optional Munkakönyvtár As String = "", Optional Fájlnév As String = "")
'Open file ablakot nyit meg Felirat felirattal, s a kiválasztott értéket a SzövegMezõ beviteli mezõbe teszi.
'Meg lehet adni kezdõ mappát, vagy akár az alapértelmezetten megjelenõ állományok neveit is helykitöltõkkel (* és ?)
'Ezt meghívják az alábbi eljárások:
'   Havi_Click
'   Szervezeti_Click
'   Személytörzs_Click

    Dim fDialog As Office.FileDialog
    Dim varFile As Variant
 
    SzövegMezõ.Value = ""

    Set fDialog = Application.FileDialog(msoFileDialogFilePicker)
 
    With fDialog
 
      .AllowMultiSelect = False
             
      .Title = Felirat
 
      .Filters.Clear
      .Filters.Add "MsExcel tábla", "*.XLS*"
      .Filters.Add "Minden fajta", "*.*"
      If Right(Munkakönyvtár, 1) <> "\" Then
        Munkakönyvtár = Munkakönyvtár & "\"
      End If
      .InitialFileName = Munkakönyvtár & Fájlnév 'Hol nyíljon meg
 
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
Public Sub HaviTáblaImport(Fájlnév As String, Ûrlap As Object)
Dim a As Boolean
    Ûrlap.Folyamat.RowSource = ""
    a = fvHaviTáblaImport(Fájlnév, Ûrlap)
End Sub

Public Function fvHaviTáblaImport(Fájlnév As String, Ûrlap As Object)
'Licencia: MIT Oláh Zoltán 2022 (c)
    'Az Excel megnyitásához
    Dim objExcel        As Excel.Application
    Dim objBook         As Excel.Workbook
    Dim objSheet        As Excel.Worksheet
    Dim objRange        As Excel.Range
    
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
    Dim háttérdb        As DAO.Database     'Ez a háttéradatbázis, ahol a táblák laknak
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
    intVégcella = 0
'On Error GoTo hiba
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    'Set háttérdb =
    ' ha az útvonal végén nincs \, akkor hozzáfûzzük, [de ha van, akkor meg nem :)]
    fájl = Fájlnév
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
        If Nz(rs("Végcella"), "") = "" Then
            xlHosszmérõ = rs("HosszmérõCella")
            xlUtolsóOszlop = rs("UtolsóOszlop")
            '
            ' rs("HosszmérõCella") -- a hosszmérésre használt oszlopot keresi ki az adatbázisból.
            ' objBook.ActiveSheet.Range(rs("HosszmérõCella")&1).Column  -- a hosszmérõ cella oszlopának a számát adja meg.
            ' Cells(Rows.Count, 1).End(xlUp).Row -- az elsõ oszlopban található cellák számát adja
            ' Cells(Rows.Count, ActiveSheet.Range(rs("HosszmérõCella")&1).Column).End(xlUp).Row -- a hosszmérõ cella oszlopában a legalsó használt cella sorának a száma?
            intVégcella = objSheet.Range(xlHosszmérõ & 1).Column
            xlVégcella = objSheet.Cells(objSheet.Cells.Rows.Count, intVégcella).End(xlUp).row
            xlVégcella = xlUtolsóOszlop & xlVégcella
        Else
            xlVégcella = rs("Végcella")
        End If
        With objSheet
            .Range(.Range(rs("KezdõCella")), .Range(xlVégcella)).Name = xlTábla 'Elnevezzük a területet
            sFoly Ûrlap, xlTábla & ":;" & .Range(xlTábla).Rows.Count
            'Debug.Print .Range(xlTábla).Rows.Count
            
        End With
        
        
        If DCount("[Name]", "MSysObjects", "[Name] = '" & xlTábla & "'") = 1 Then
            DoCmd.Close acTable, xlTábla, acSaveYes
            DoCmd.Rename xlTábla & RIC(Now()), acTable, xlTábla
        End If
        DoCmd.CopyObject , xlTábla, acTable, xlTábla & "_tart"

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
                If rsCél.Fields.Count < oszlop Then
                    Exit For
                End If
                intMezõ = oszlop - 1
'                Debug.Print sor & ":" & oszlop & " = "
'                Debug.Print Értékek(sor, oszlop)
'                Debug.Print " Type:" & rsCél.Fields(intMezõ).Type
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


hiba:
Debug.Print Err.Number, Err.Description
fvHaviTáblaImport = False

End Function
Public Function konverter(fMezõ As Field, érték As Variant)
'****** (c) Oláh Zoltán 2022 - MIT Licence ****************
'Debug.Print fMezõ.Type; Érték
If IsNull(érték) Then
    konverter = Null
    Exit Function
End If
Select Case TypeName(érték)
    Case "String"
        Select Case fMezõ.Type
            Case 1 To 8, 19 To 23            'A tömbben található String típusú adatot nem alakítjuk át számmá, az értékét 0-ra állítjuk.
                     konverter = 0
            Case 10: konverter = CStr(érték) 'Text
            Case 12: konverter = CVar(érték) 'Memo
            Case 16: konverter = CLng(érték) 'Big Integer
            Case 17: konverter = CVar(érték) 'VarBinary
            Case 18: konverter = CStr(érték) 'Char
            Case Else
                MsgBox "Nem lehet konevertálni a" & névelõ(érték) & " " & érték & " értéket a" & névelõ(fMezõ.Type) & " " & fMezõ.Name & " " & fMezõ.Type & "típusába!"
        End Select
    Case Else
        Select Case fMezõ.Type
            Case 1:  konverter = CBool(érték) 'Boolean
            Case 2:  konverter = CByte(érték) 'Byte
            Case 3:  konverter = CInt(érték)  'Integer
            Case 4:  konverter = CLng(érték)  'Long
            Case 5:  konverter = CCur(érték)  'Currency
            Case 6:  konverter = CSng(érték)  'Single
            Case 7:  konverter = CDbl(érték)  'Double
            Case 8:  konverter = CDate(érték) 'Date/Time
            Case 10: konverter = CStr(érték)  'Text
            Case 12: konverter = CVar(érték)  'Memo
            Case 16: konverter = CLng(érték)  'Big Integer
            Case 17: konverter = CVar(érték)  'VarBinary
            Case 18: konverter = CStr(érték)  'Char
            Case 19: konverter = CLng(érték)  'Numeric
            Case 20: konverter = CDec(érték)  'Decimal
            Case 21: konverter = CDbl(érték)  'Float
            Case 22: konverter = CDate(érték) 'Time
            Case 23: konverter = CDate(érték) 'Time Stamp
            Case Else
                MsgBox "Nem lehet konevertálni a" & névelõ(érték) & " " & érték & " értéket a" & névelõ(fMezõ.Type) & " " & fMezõ.Name & " " & fMezõ.Type & "típusába!"
        End Select
End Select
End Function


Sub ListTdfFields()
    Dim db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim fld As DAO.Field

    Set db = CurrentDb

    Set tdf = db.TableDefs("Határozottak")

    For Each fld In tdf.Fields
        'Debug.Print fld.Name
    Next

    Set tdf = Nothing
    Set db = Nothing
End Sub
Sub LekérdezésÍró()
'Licencia: MIT Oláh Zoltán 2022 (c)
    Dim rs As Recordset
    Dim rs2 As Recordset
    Dim sql As String
    Dim sql2 As String
    Dim kSQL As String
    Dim lekérd As String
    Dim újnév As String
    Dim X As Integer
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

Sub tSzemélyekImport()
    On Error GoTo ErrorHandler

    Dim dlg As FileDialog
    Dim selectedFilePath As String
    Dim importSpecName As String
    Dim strXML As String
    Dim strRégiFájl As String
    Dim strÚjFájl As String
    Dim intKezdPoz As Integer
    Dim intVégPoz As Integer

    ' Replace "YourSavedImportSpecificationName" with the name of your saved import specification.
    importSpecName = "tSzemélyek"


    ' Create a FileDialog object to allow the user to select a file.
    Set dlg = Application.FileDialog(msoFileDialogFilePicker)

    ' Set the title and filters for the dialog box.
    dlg.Title = "Személtörzs alapriport kiválasztása"
    dlg.Filters.Clear
    dlg.Filters.Add "All Files", "*.xlsx"

    ' Show the FileDialog and check if the user selected a file.
    If dlg.Show = -1 Then
        ' Get the selected file path and name.
        strÚjFájl = " Path=""" & dlg.SelectedItems(1) & """"
'            Debug.Print "1. Új fájl:" & strÚjFájl & "##" '1
        UresOszlopokTorlese dlg.SelectedItems(1)

        'Átírjuk az XML-t
        On Error Resume Next
            strXML = CurrentProject.ImportExportSpecifications.Item(importSpecName).XML 'Itt megszerezzük
            If Err.Number <> 0 Then
                MsgBox "Error updating the XML of the import specification.", vbExclamation + vbOKOnly, "Error"
            End If
        On Error GoTo ErrorHandler
        intKezdPoz = InStr(1, strXML, "Path=") 'majd megnézzük, hol kezdõdik az útvonal
        intVégPoz = InStr(intKezdPoz + 7, strXML, """") ' és hogy hol a vége
'            Debug.Print "2. Régi XML:##" & Mid(strXML, intKezdPoz, intVégPoz) & "##" '2
        strRégiFájl = Mid(strXML, intKezdPoz, intVégPoz - intKezdPoz + 1) 'a két pont közötti részt kiemeljük
'            Debug.Print "3. Régi fájl:" & strRégiFájl
        strXML = Replace(strXML, strRégiFájl, strÚjFájl) 'No itt meg kicseréljük a régi fájlnevet, az újra
'            Debug.Print "4. Új XML:##" & Mid(strXML, intKezdPoz - 10, Len(strÚjFájl) + 16) & "##"
        CurrentProject.ImportExportSpecifications.Item(importSpecName).XML = strXML
        ' Run the saved import specification with the selected file.
        DoCmd.RunSavedImportExport importSpecName

        ' Display a success message.
        'MsgBox "Import completed successfully!", vbInformation + vbOKOnly, "Import Completed"
    End If
    
Kilépés:
    ' Clean up the FileDialog object.
    Set dlg = Nothing

    Exit Sub

ErrorHandler:
    ' Display an error message if something goes wrong.
    MsgBox "Error: " & Err.Description, vbExclamation + vbOKOnly, "Error"
    Debug.Print "Error: " & Err.Description
    Resume Kilépés
End Sub
Public Function tTáblaImport(strFájl As String, Ûrlap As Form, táblaNév As String)
    'On Error GoTo ErrorHandler

    Dim importSpecName As String
'    Dim strXML As String
'    Dim strRégiFájl As String
'    Dim strÚjFájl As String
'    Dim intKezdPoz As Integer
'    Dim intVégPoz As Integer
    Dim Üzenet As String
    Dim válasz As Boolean
    
    importSpecName = táblaNév '"tAdatváltoztatásiIgények"

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
                                                    sFoly Ûrlap, importSpecName & ":; " & DCount("*", "tSzemélyek") & " sor."
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
Public Function tSzemélyekImport02(strFájl As String, Ûrlap As Form)
    'On Error GoTo ErrorHandler

    Dim importSpecName As String
'    Dim strXML As String
'    Dim strRégiFájl As String
'    Dim strÚjFájl As String
'    Dim intKezdPoz As Integer
'    Dim intVégPoz As Integer
    Dim Üzenet As String
    Dim válasz As Boolean
    
    importSpecName = "tSzemélyek"

    If strFájl <> "" Then

                                                    sFoly Ûrlap, "Személyek:; importálás üres oszlopok törlése..."
        UresOszlopokTorlese strFájl 'A megadott állományból töröljük az üres oszlopokat
                                                    sFoly Ûrlap, "Személyek:; importálás üres oszlopok törlése kész!"
'#           Átírjuk az XML-t:
                                                    sFoly Ûrlap, "Személyek:; mentett import átalakítása"
        válasz = XMLátalakító(importSpecName, strFájl)
        

                                                    sFoly Ûrlap, "Személyek:; importálás indítása"
'#           Az átírt XML-lel pedig futtatjuk a mentett importot
        DoCmd.RunSavedImportExport importSpecName
                                                    sFoly Ûrlap, "Személyek:; importálás véget ért"
                                                    sFoly Ûrlap, "Személyek:; " & DCount("*", "tSzemélyek") & " sor."
    End If
    tSzemélyekImport02 = True
    
Kilépés:
    Exit Function

ErrorHandler:
    ' Szabványos hibaüzenet elõállítása
    If Err.Number = 3709 Then
        
        'Resume 0
    End If
    MsgBox "Error: " & Err.Number & " - " & Err.Description, vbExclamation + vbOKOnly, "Error"
    Debug.Print "Error: " & Err.Number & " - " & Err.Description
    tSzemélyekImport02 = False
    Resume Kilépés
End Function
Public Function SzervezetiTáblaImport(Fájlnév As String, Ûrlap As Object) As Boolean
    'MIT Oláh Zoltán 2022
    'Az Excel megnyitásához
    Dim objExcel       As Excel.Application
    Dim objBook         As Excel.Workbook
    Dim objSheet        As Excel.Worksheet
    Dim objRange        As Excel.Range
    Dim objRange2       As Excel.Range
    
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
    fájl = Fájlnév
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
        xlUtolsóOszlop = objRange.Columns.Count
        xlHosszmérõ = objRange.Rows.Count

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
    ehj.SzakaszSzám = 5 '20%-konként jelezzük ki az értéket
    ehj.OszlopSzam = UBound(Értékek, 1) - (LBound(Értékek, 1) + 1) 'Itt az oszlopszám a sorokat jelöli :)
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

hiba:
    
    MsgBox "Hiba!! " & Err.Number & ": " & Err.Description
    SzervezetiTáblaImport = False 'Visszatérési értéke Hamis, ha hiba történt.
    Resume Kilépés
End Function



Function ImportTáblaHibaJavító(terület As Excel.Range) As Integer
    'A kapott tábla (Excel.Range) fejlécében megkeresi az azonos nevûeket, és a másodiktól kezdve az oszlop számát hozzáfûzi.
    'Mindeközben a neveket trim-eli.
    'Ha hiba nem történt:0 értékkel tér vissza, egyébként a hibakóddal
    On Error GoTo hiba
    Dim intOszlopok     As Integer  'Az oszlopok száma
    Dim i, n            As Integer  'Számláló
    Dim varOszlopNevek  As Variant   'Az oszlopok nevei
    Dim intOszlopSzám   As Integer  'Az oszlopok száma
    Dim gyûjt           As Collection
    Dim név             As Variant
    
    intOszlopSzám = terület.Columns.Count
    ReDim varOszlopNevek(1, intOszlopSzám)
    
    Set gyûjt = New Collection
    
    varOszlopNevek = terület.Rows(1)
    
    For i = LBound(varOszlopNevek, 2) To UBound(varOszlopNevek, 2) 'Végig lépkedünk az összes elemen
        név = varOszlopNevek(1, i)
        gyûjt.Add név, név
        'és megkíséreljük betenni egy szótárba. Ha van azonos, akkor hibára fut, s a hibakeresõ hozzáfûzi az i-t és újra megpróbálja.
        'Debug.Print i, név
    Next i
    
    For n = 1 To gyûjt.Count
        terület.Cells(1, n) = Trim(gyûjt(n)) 'Visszatesszük, de egyúttal levesszük a felesleges szóközöket.
    Next n
    
    ImportTáblaHibaJavító = 0
Exit Function
hiba:
    If Err.Number = 457 Then
        gyûjt.Add név & i, név & i
        Debug.Print név; i
        Resume Next
    End If
    ImportTáblaHibaJavító = Err.Number
    
End Function
Public Sub táblagyártó()
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
    Call Kimutatás("O:\Átvilágítás\Átvilágítás2" & érték & ".xlsx", "SELECT * FROM lk__Átvilágításhoz_Személytörzs_02 WHERE [Szervezeti egység] = '" & érték & "';")
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

Sub BeszámolóTábla(fájl As String, Lekérdezés As String)
'****** (c) Oláh Zoltán 2022 - MIT Licence ****************
 
 'Az adatbázishoz
    Dim db          As Database
    Dim qdf         As QueryDef
    Dim rs          As DAO.Recordset
    Dim Ûrlapnév    As String
    
    'Excelhez
    Dim sor, oszlop     As Long
    Dim oApp            As Excel.Application
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
    Set rs = db.OpenRecordset(Lekérdezés)
    
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
        maxoszlop = .Fields.Count  'A leendõ oszlopok száma, ahány mezõ van a lekérdezésben és még egy a sorszám miatt
        maxsor = .RecordCount
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
    oWb.SaveAs FileName:=fájl, FileFormat:=xlOpenXMLWorkbook, AddToMru:=True, Local:=True
    oWb.Close
    'Debug.Print fájl & " kész (" & sor & " sor) ."
    Set oWb = Nothing
'   Kill oWb
    
End Sub
Sub Kimutatás(fájl As String, Lekérdezés As String)
'****** (c) Oláh Zoltán 2022 - MIT Licence ****************
 
 'Az adatbázishoz
    Dim db          As Database
    Dim qdf         As QueryDef
    Dim rs          As DAO.Recordset
    Dim Ûrlapnév    As String
    
    'Excelhez
    Dim sor, oszlop     As Long
    Dim oApp            As Excel.Application
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
    Set rs = db.OpenRecordset(Lekérdezés)
    
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
        maxoszlop = .Fields.Count  'A leendõ oszlopok száma, ahány mezõ van a lekérdezésben és még egy a sorszám miatt
        maxsor = .RecordCount
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
    oWb.SaveAs FileName:=fájl, FileFormat:=xlOpenXMLWorkbook, AddToMru:=True, Local:=True
    oWb.Close
    'Debug.Print fájl & " kész (" & sor & " sor) ."
    Set oWb = Nothing
'   Kill oWb
    
End Sub

Public Sub SzemélytörzsImport(Fájlnév As String, Ûrlap As Object)
'(c) Oláh Zoltán 2022. Licencia: MIT

    'Az Excel megnyitásához
    Dim objExcel        As Excel.Application
    Dim objBook         As Excel.Workbook
    Dim objSheet        As Excel.Worksheet
    Dim objRange        As Excel.Range
    
    Dim xlTábla, kieg   As String
    Dim xlTáblaEred     As String
    
    Dim Értékek()       As Variant
    Dim intMezõ         As Integer

    
    'Az adatbázis megnyitásához
    Dim db              As DAO.Database     'Ez lesz az adatbázisunk
    Dim rsCél           As DAO.Recordset    'Ahová másolunk

    Dim fájl            As String
    Dim helyzet         As Variant          'A feltöltendõ rekord eléréséhez
    Dim mezõ            As String           'A mezõ nevének átmeneti tárolására és tisztítására
    
    
    Dim Eredmény        As Integer
    Dim MezõListaTábla  As String           'A tábla : a tábla mezõinek (eredeti oszlopcím, mezõnév, típus) jellemzõit tároló tábla
    
    'A szöveges kimenethez
    Dim Üzenet          As String
    
    'Számláláshoz
    Dim sor, oszlop     As Integer
    Dim ehj             As New ehjoszt
    
    Dim válasz          As Integer
On Error GoTo hiba
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    MezõListaTábla = "tSzemélyMezõk"

    
    ' azt feltételezzük, hogy a fájlnév jó, helyes és alkalmas
    fájl = Fájlnév
    ' megnyitjuk az Excel táblát
'''
    sFoly Ûrlap, "Adatforrás megnyitása:; megkezdve..."
   
    
    Set objBook = objExcel.Workbooks.Open(fájl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)

'''
    sFoly Ûrlap, "Adatforrás megnyitása:; megtörtént!"
    
    
        Erase Értékek
        xlTábla = "tSzemélyek"
        xlTáblaEred = "Személytörzs alapriport"
        Set objSheet = objBook.Worksheets(xlTáblaEred)
        objSheet.Select ' Ráugrunk a lapra
        
'''
    sFoly Ûrlap, "Üres oszlopok törlése:; megkezdve..."
    
        
'        Call UresOszlopokTorlese(objSheet)
'''
    sFoly Ûrlap, "Üres oszlopok törlése:; befejezve!"
   
        With objSheet
            .UsedRange.Name = xlTábla 'Elnevezzük a területet
'''
            sFoly Ûrlap, "Beolvasandó sorok száma:;" & .Range(xlTábla).Rows.Count
            'Debug.Print Üzenet
            
            
        End With
        
        If DCount("[Name]", "MSysObjects", "[Name] = '" & xlTábla & "'") = 1 Then
            kieg = RIC(Now())
            DoCmd.Rename xlTábla & kieg, acTable, xlTábla
'''
            sFoly Ûrlap, névelõvel(xlTábla, , , True) & " átneveztetett:; " & xlTábla & kieg
           
    
        End If
'''
        sFoly Ûrlap, "Az új " & xlTábla & " elkészítése:; megkezdve..."
        
        
        Call Táblakészítõ(db, MezõListaTábla, xlTábla)

'''
        sFoly Ûrlap, "Az új " & xlTábla & " elkészült:; sikerült!"
       

        'Elkezdjük az adatok betöltését
        Set rsCél = db.OpenRecordset(xlTábla)

        Értékek = objSheet.Range(xlTábla).Value
        
        ehj.Ini (100)
        'Sorok száma: !!!!
        ehj.OszlopSzam = UBound(Értékek, 1) - (LBound(Értékek, 1)) ' Az oszlopszám itt a sorok számát jelöli!
'''
        sFoly Ûrlap, "A beolvasandó oszlopok száma:;" & UBound(Értékek, 2) - (LBound(Értékek, 2) + 1)
        

        For sor = LBound(Értékek, 1) + 1 To UBound(Értékek, 1)
            intMezõ = 0
            'új rekord hozzáadása kezdõdik...
            rsCél.AddNew
            rsCél.Update
            helyzet = rsCél.LastModified
            
            For oszlop = LBound(Értékek, 2) + 1 To UBound(Értékek, 2)

                intMezõ = oszlop
                rsCél.Bookmark = helyzet
                rsCél.Edit
                mezõ = Clean_NPC(Trim(Left(Értékek(1, oszlop), 64))) 'A nem nyomtatható karaktereket kiszûrjük
                rsCél.Fields(mezõ) = konverter(rsCél.Fields(mezõ), Értékek(sor, oszlop))
                'Debug.Print mezõ, rsCél.Fields(mezõ).Value
                rsCél.Update
            Next oszlop
            ehj.Novel
            'új rekord hozzáadása véget ért
            
        Next sor
'''
    sFoly Ûrlap, névelõvel(fájl, , , True) & " adatai beolvastattak; " & névelõvel(xlTábla) & "táblába!"
    
Exit Sub
hiba:
If Err.Number = 3265 Then
    válasz = ÚjOszlop(mezõ)
End If

End Sub
Function ÚjOszlop(strOszlopNév As String) As Integer
    Dim szöveg As String
    Dim válasz As Variant
    Dim Szám As Integer
On Error GoTo hiba
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
    Szám = CInt(válasz)
    MsgBox ("Eredmény:" & Szám)
Exit Function
hiba:
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
Function mezõnév(ByRef adatbázis As DAO.Database, ByVal MezõListaTábla As String, ByVal oszlopcím As String) As String
    Dim sql As String
    Dim rekordok As Recordset
    Dim szRek As Long
    
On Error GoTo ErrorHandler
    
    sql = "SELECT TOP 1 [Mezõnév]" _
        & " FROM [" & MezõListaTábla & "]" _
        & " WHERE [Oszlopnév]='" & oszlopcím & "';"
    Set rekordok = adatbázis.OpenRecordset(sql)
    
    If rekordok.EOF Then
        MsgBox Title:="Az oszlopnév nincs " & névelõvel(MezõListaTábla) & " táblában", _
               prompt:=névelõvel(oszlopcím, , , True) & "nem szerepel " & névelõvel(MezõListaTábla) & " táblában!"
    Else
        rekordok.MoveLast
        szRek = rekordok.RecordCount
    End If

    Set rekordok = Nothing
Exit Function
 
ErrorHandler:
   MsgBox "Error #: " & Err.Number & vbCrLf & vbCrLf & Err.Description
    
End Function
Sub Táblakészítõ(adatbázis As DAO.Database, ByVal forrástábla As String, ByVal céltábla As String)
'(c) Oláh Zoltán 2022. Licencia: MIT
' A forrástáblában található mezõnevek-nek és típus-nak megfelelõ mezõkkel hoz létre egy céltábla nevû táblát

    Dim db              As DAO.Database     'Ez lesz az adatbázisunk
    Dim sqlMezõk        As String           'A mezõnevek lekérdezéséhez
    Dim sqlTgy          As String           'A tSzemély táblát készítõ lekérdezéshez
    Dim rsSorSzám       As Integer
    Dim rsMezõk         As DAO.Recordset    'A mezõnevek táblája
    Dim strMezõNév     As String
    
On Error GoTo hiba
    'Alapértékek beállítása
    Set db = adatbázis
    sqlMezõk = "SELECT [" & forrástábla & "].[Az]" _
             & ", [" & forrástábla & "].[Oszlopnév]" _
             & ", [" & forrástábla & "].[Típus]" _
             & ", [" & forrástábla & "].[Mezõnév]" _
             & ", (SELECT Count([Az])" _
             & "     FROM [" & forrástábla & "] as Tmp " _
             & "     WHERE   [Tmp].[Az] <= [" & forrástábla & "].[Az]" _
             & "        AND [Tmp].[Típus] = [" & forrástábla & "].[Típus]" _
             & "        AND [Tmp].[Mezõnév] = [" & forrástábla & "].[Mezõnév]" _
             & "  )" _
             & " FROM [" & forrástábla & "] " _
             & " WHERE " _
             & "  (SELECT Count([Az])" _
             & "     FROM [" & forrástábla & "] as Tmp " _
             & "     WHERE   [Tmp].[Az] <= [" & forrástábla & "].[Az]" _
             & "        AND [Tmp].[Típus] = [" & forrástábla & "].[Típus]" _
             & "        AND [Tmp].[Mezõnév] = [" & forrástábla & "].[Mezõnév]" _
             & "  ) = 1;"

    Set rsMezõk = db.OpenRecordset(sqlMezõk)
    rsMezõk.MoveLast
    rsMezõk.MoveFirst
    sqlTgy = "CREATE TABLE " & céltábla & "([az" & céltábla & "] COUNTER, CONSTRAINT [PrimaryKey] PRIMARY KEY ([az" & céltábla & "]) );"
    db.Execute (sqlTgy)
    sqlTgy = ""
    For rsSorSzám = 0 To rsMezõk.RecordCount - 1
        sqlTgy = "ALTER TABLE [" & céltábla & "] ADD COLUMN [" & rsMezõk.Fields("Mezõnév") & "] "  'A mezõnév
        Select Case rsMezõk.Fields("Típus")               'utána jön típus
            Case 10
                sqlTgy = sqlTgy & "VARCHAR; "
            Case 8
                sqlTgy = sqlTgy & "DATETIME; "
            Case 5
                sqlTgy = sqlTgy & "MONEY; "
            Case 4
                sqlTgy = sqlTgy & "INTEGER; "             'LONG
            Case Else
                sqlTgy = sqlTgy & "CHAR; "                'ha semmi más nincs, legyen szöveg
        End Select

'Debug.Print ".";
        strMezõNév = Clean_NPC(sqlTgy)
        If Len(strMezõNév) > 60 Then
            strMezõNév = Left(strMezõNév, 60) & rsSorSzám
        End If
        db.Execute (strMezõNév)
'Debug.Print ".";
        rsMezõk.MoveNext
'Debug.Print "."
'Debug.Print rsSorSzám, Len(rsMezõk.Fields("Mezõnév")), strMezõNév;
    Next rsSorSzám
'Debug.Print "!";
MsgBox ("!")
Exit Sub
hiba:
    MsgBox (Err.Number & ": " & Err.Description & " - " & Err.Source)
    Exit Sub
End Sub
Sub TáblaMezõk()
    Dim db As Database
    Dim rs As Recordset
    Dim rs2 As Recordset
    Dim tbla As Recordset
    Dim sql, sql2, sql3 As String
    Dim mezõszám As Long
    Dim mezõnév As String
    'Dim mezõnevek() As Variant
    
    Dim táblaNév As String
    
    
    sql = "SELECT Name FROM MSysObjects WHERE Flags=0 AND Type = 1 AND Name like 'tSzemélyek*' "
    
    Set db = CurrentDb()
    Set tbla = db.OpenRecordset("tTáblamezõk", dbOpenTable)
        
    Set rs = db.OpenRecordset(sql)
        rs.MoveLast
        rs.MoveFirst
    
    Do Until rs.EOF
        táblaNév = rs.Fields("Name")
        sql2 = "SELECT TOP 1 * FROM [" & táblaNév & "];"
        Set rs2 = db.OpenRecordset(sql2)
        'Debug.Print táblanév, rs2.Fields.Count
        For mezõszám = 0 To rs2.Fields.Count - 1
            tbla.AddNew
            tbla.Fields("táblanév") = táblaNév
            mezõnév = rs2.Fields(mezõszám).Name
            tbla.Fields("mezõnév") = mezõnév
            tbla.Fields("sorszám") = mezõszám
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

Public Function dtÁtal(strDátum As Variant) As Date
' Kell hozzá az ffsplit() fv., ahhoz meg a StrCount() függvény.
    Dim dtVál As String
    'Debug.Print strDátum
    If IsNull(strDátum) Or strDátum = "" Then
        dtÁtal = 1
        Exit Function
    End If
    dtVál = "."
    
    dtÁtal = DateSerial(ffsplit(strDátum, dtVál, 1), ffsplit(strDátum, dtVál, 2), ffsplit(strDátum, dtVál, 3))
End Function

Public Function SetNavPaneGroup(strObjName, strGroupName)
'## © JBStovers (Apr 17, 2018 at 18:03)
'## forrás: https://stackoverflow.com/questions/12863959/access-custom-group

    Dim strSQL, idObj, idGrp, db
    Set db = CurrentDb
    idObj = DLookup("Id", "MSysNavPaneObjectIDs", "Name='" & strObjName & "'")
    idGrp = DLookup("Id", "MSysNavPaneGroups", "Name='" & strGroupName & "'")

    If DCount("*", "MSysNavPaneGroupToObjects", "GroupID = " & idGrp & " AND ObjectID = " & idObj) > 0 Then
        strSQL = "UPDATE MSysNavPaneGroupToObjects SET GroupID = " & idGrp & ", Name='" & strObjName & "' WHERE ObjectID = " & idObj
        db.Execute strSQL, dbFailOnError
    Else
        strSQL = "INSERT INTO MSysNavPaneGroupToObjects ( GroupID, ObjectID, Name ) " & vbCrLf & _
        "VALUES (" & idGrp & "," & idObj & ",'" & strObjName & "');"
        db.Execute strSQL, dbFailOnError
    End If
    RefreshDatabaseWindow
    Set db = Nothing
    
End Function

Public Sub CloseAllExcel()
    Dim obj As Object
    On Error GoTo ExitSub
    Dim i As Integer
    'There shouldn't be more than 10000 running Excel applications
    'Can use While True too, but small risk of infinite loop
    For i = 0 To 10000
        Set obj = GetObject(, "Excel.Application")
        obj.Quit
    Next i
ExitSub:
End Sub

Sub MoveTableAndCreateLink()
'# Oláh Zoltán (c) 2023 Licencia: MIT
'
    Dim forrásDB As DAO.Database
    Dim targetDB As DAO.Database
    Dim tableName As String
    Dim newTableName As String
    Dim linkTableName As String
    
    ' Set the source and target database file paths
    Dim sourceDBPath As String
    Dim targetDBPath As String
    
    sourceDBPath = "C:\Path\To\Source\Database.accdb"
    targetDBPath = "C:\Path\To\Target\Database.accdb"
    
    ' Set the table name you want to move
    tableName = "TableNameToMove"
    
    ' Set the new table name in the target database
    newTableName = "NewTableName"
    
    ' Set the linked table name in the source database
    linkTableName = "LinkedTableName"
    
    ' Open the source and target databases
    Set forrásDB = OpenDatabase(sourceDBPath)
    Set targetDB = OpenDatabase(targetDBPath)
    
    ' Copy the table from the source to the target database
    DoCmd.TransferDatabase acExport, "Microsoft Access", targetDBPath, acTable, tableName, newTableName
    
    ' Close the source and target databases
    forrásDB.Close
    targetDB.Close
    
    ' Open the source database again
    Set forrásDB = OpenDatabase(sourceDBPath)
    
    ' Create a link to the table in the target database
    Dim tdf As DAO.TableDef
    Set tdf = forrásDB.CreateTableDef(linkTableName)
    tdf.Connect = ";DATABASE=" & targetDBPath
    tdf.SourceTableName = newTableName
    forrásDB.TableDefs.Append tdf
    
    ' Refresh the linked table to get the latest data
    DoCmd.RunCommand acCmdRefresh
    
    ' Close the source database
    forrásDB.Close
    
    ' Clean up
    Set forrásDB = Nothing
    Set targetDB = Nothing
    Set tdf = Nothing
End Sub

Sub MegnyitMentBezár(ByVal fájlNévÚtv As String)
    Dim ojExcel As Object
    Dim ojWB As Object
    
    Set ojExcel = CreateObject("Excel.Application")
    Set ojWB = ojExcel.Workbooks.Open(fájlNévÚtv, ReadOnly:=False, IgnoreReadOnlyRecommended:=True, Editable:=True, Notify:=False)
    ojWB.Save
    ojWB.Close
    ojExcel.Quit
    Set ojWB = Nothing
    Set ojExcel = Nothing
    
End Sub