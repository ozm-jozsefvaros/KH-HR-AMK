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


Public Sub HaviTáblaImport(fájlnév As String, Ûrlap As Object)
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
    Dim rs              As DAO.Recordset    'A beolvasandó lapok és területek adatait tartalmazó táblának
    Dim rsCél           As DAO.Recordset    'Ahová másolunk
    Dim Fájl            As String
    
    Dim eredmény        As Integer
    Dim tábla           As String           'A tábla : a táblák jellemzõit tároló tábla
    
    'A szöveges kimenethez
    Dim üzenet As String
    
    'Számláláshoz
    Dim sor, oszlop As Integer
    
    tábla = "tImportálandóTáblák"
    intVégcella = 0
    
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    ' ha az útvonal végén nincs \, akkor hozzáfûzzük, [de ha van, akkor meg nem :)]
    Fájl = fájlnév
    ' megnyitjuk az Excel táblát
    Set objBook = objExcel.Workbooks.Open(Fájl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)
    
    Set rs = db.OpenRecordset(tábla, dbOpenTable)
    rs.MoveLast
    rs.MoveFirst
    Ûrlap.Folyamat.RowSource = ""
    Ûrlap.Folyamat.AddItem Item:="Tábla neve;Beolvasott sorok száma"
    üzenet = ""
    
    Do Until rs.EOF
        Erase Értékek
        xlTábla = rs("AccessNév")
        xlTáblaEred = rs("EredetiNév"): Debug.Print xlTáblaEred & " -- " & xlTábla
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
            xlVégcella = objSheet.Cells(Rows.Count, intVégcella).End(xlUp).row
            xlVégcella = xlUtolsóOszlop & xlVégcella
        Else
            xlVégcella = rs("Végcella")
        End If
        With objSheet
            .Range(.Range(rs("KezdõCella")), .Range(xlVégcella)).Name = xlTábla 'Elnevezzük a területet
            üzenet = xlTábla & ":;" & .Range(xlTábla).Rows.Count
            Debug.Print .Range(xlTábla).Rows.Count
            Ûrlap.Folyamat.AddItem Item:=üzenet
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
End Sub
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
Function névelõ(szó As Variant) As String
'Licencia: MIT Oláh Zoltán 2022 (c)
    'A névelõ második betûjét z-re állítja, vagy semmire
    Dim magánhangzók As String
    Dim Keresett As String
    
    magánhangzók = "aáeéiíoóöõuúüûAÁEÉIÍOÓÖÕUÚÜÛ"
    Keresett = Left(szó, 1)
    Select Case Keresett
        Case 0 To 9
            Select Case Keresett
                Case 1, 5
                    névelõ = "z"
                Case Else
                    névelõ = ""
            End Select
            Exit Function
    End Select
    If InStr(1, magánhangzók, Left(szó, 1)) > 0 Then
        névelõ = "z"
    Else
        névelõ = ""
    End If
    
End Function
Function névelõvel(szó As Variant, Optional ez As Boolean = False, Optional határozói As Boolean = False, Optional nagybetû As Boolean) As String
'Licencia: MIT Oláh Zoltán 2022 (c)
    If ez Then
        névelõvel = "e"
        If nagybetû Then
            névelõvel = UCase(névelõvel)
        End If
        If határozói Then
            névelõvel = névelõvel & "me"
        End If
    Else
        névelõvel = "a"
        If nagybetû Then
            névelõvel = UCase(névelõvel)
        End If
        If határozói Then
            névelõvel = névelõvel & "ma"
        End If
    End If
    névelõvel = névelõvel & névelõ(szó) & " " & szó
End Function
Function ÚtvonalKészítõ(ByVal útvonal As String, ByVal fájlnév As String)
'****** (c) Oláh Zoltán 2022 - MIT Licence ****************
Dim per As String
    per = Right(útvonal, 1)
    'Debug.Print Útvonal, per
    
    If per <> "\" Then
        per = "\"
    Else
        per = ""
    End If
    'Debug.Print "per = " & per
    ÚtvonalKészítõ = útvonal & per & fájlnév
End Function
Sub ListTdfFields()
    Dim db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim fld As DAO.Field

    Set db = CurrentDb

    Set tdf = db.TableDefs("Határozottak")

    For Each fld In tdf.Fields
        Debug.Print fld.Name
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
        Debug.Print kSQL
        rs.MoveNext 'A következõ táblára ugrunk
    Loop 'rs

kijárat:

End Sub
Public Sub LekérdezésÍró0()

End Sub
Public Function RIC(ByVal strText As String) As String
'Forrás: https://www.access-programmers.co.uk/forums/threads/remove-special-characters-from-file-name-when-saving.261147/
'Licencia: MIT Oláh Zoltán 2022 (c)

    Const cstrIllegals As String = "\,/,:,*,?,"",<,>,|, ,;,(,),.,-,="
    
    Dim lngCounter As Long
    Dim astrChars() As String
    
    astrChars() = Split(cstrIllegals, ",")
    
    For lngCounter = LBound(astrChars()) To UBound(astrChars())
        strText = Replace(strText, astrChars(lngCounter), "_")
    Next lngCounter
    strText = Replace(strText, ",", "_")
    RIC = strText

End Function ' RemoveIllegalCharacters
Public Function Clean_NPC(Str As String) As String
'(C) Dave Scott https://stackoverflow.com/a/60062293  -- Licencia: CC BY-SA 4.0

    'Removes non-printable characters from a string

    Dim cleanString As String
    Dim i As Integer
    Dim szó As String

    cleanString = Str

    For i = Len(cleanString) To 1 Step -1
        'Debug.Print Asc(Mid(Str, i, 1))
        
        Select Case Asc(Mid(Str, i, 1))
            Case 1 To 31
                'Bad stuff
                'https://www.ionos.com/digitalguide/server/know-how/ascii-codes-overview-of-all-characters-on-the-ascii-table/
                cleanString = Left(cleanString, i - 1) & Mid(cleanString, i + 1)

            Case Else
                'Keep
        End Select
    Next i

    Clean_NPC = cleanString

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
    Debug.Print érték
    Call Kimutatás("O:\Átvilágítás\Átvilágítás2" & érték & ".xlsx", "SELECT * FROM lk__Átvilágításhoz_Személytörzs_02 WHERE [Szervezeti egység] = '" & érték & "';")
    Debug.Print "O:\Átvilágítás\Átvilágítás2" & érték & ".xlsx"
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
    Debug.Print érték
    Call BeszámolóTábla("O:\Átvilágítás\Átvilágítás2" & érték & ".xlsx", "SELECT * FROM lk__Átvilágításhoz_Személytörzs_02 WHERE [Szervezeti egység] = '" & érték & "';")
    Debug.Print "O:\Átvilágítás\Átvilágítás2" & érték & ".xlsx"
    rst.MoveNext
Loop
End Sub

Sub BeszámolóTábla(Fájl As String, Lekérdezés As String)
'****** (c) Oláh Zoltán 2022 - MIT Licence ****************
 
 'Az adatbázishoz
    Dim db          As Database
    Dim qdf         As QueryDef
    Dim rs          As DAO.Recordset
    Dim ÛrlapNév    As String
    
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
    oWb.SaveAs FileName:=Fájl, FileFormat:=xlOpenXMLWorkbook, AddToMru:=True, Local:=True
    oWb.Close
    Debug.Print Fájl & " kész (" & sor & " sor) ."
    Set oWb = Nothing
'   Kill oWb
    
End Sub
Sub Kimutatás(Fájl As String, Lekérdezés As String)
'****** (c) Oláh Zoltán 2022 - MIT Licence ****************
 
 'Az adatbázishoz
    Dim db          As Database
    Dim qdf         As QueryDef
    Dim rs          As DAO.Recordset
    Dim ÛrlapNév    As String
    
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
    oWb.SaveAs FileName:=Fájl, FileFormat:=xlOpenXMLWorkbook, AddToMru:=True, Local:=True
    oWb.Close
    Debug.Print Fájl & " kész (" & sor & " sor) ."
    Set oWb = Nothing
'   Kill oWb
    
End Sub

Public Sub SzemélytörzsImport(fájlnév As String, Ûrlap As Object)
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

    Dim Fájl            As String
    Dim helyzet         As Variant          'A feltöltendõ rekord eléréséhez
    Dim mezõ            As String           'A mezõ nevének átmeneti tárolására és tisztítására
    
    
    Dim eredmény        As Integer
    Dim MezõListaTábla  As String           'A tábla : a tábla mezõinek (eredeti oszlopcím, mezõnév, típus) jellemzõit tároló tábla
    
    'A szöveges kimenethez
    Dim üzenet          As String
    
    'Számláláshoz
    Dim sor, oszlop     As Integer
    Dim ehj             As New ehjoszt
    
    Dim Válasz          As Integer
On Error GoTo Hiba
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    MezõListaTábla = "tSzemélyMezõk"

    
    ' azt feltételezzük, hogy a fájlnév jó, helyes és alkalmas
    Fájl = fájlnév
    ' megnyitjuk az Excel táblát
'''
    üzenet = "Adatforrás megnyitása:; megkezdve..."
    Ûrlap.Folyamat.AddItem Item:=üzenet
    
    Set objBook = objExcel.Workbooks.Open(Fájl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)

'''
    üzenet = "Adatforrás megnyitása:; megtörtént!"
    Ûrlap.Folyamat.AddItem Item:=üzenet
    
        Erase Értékek
        xlTábla = "tSzemélyek"
        xlTáblaEred = "Személytörzs alapriport"
        Set objSheet = objBook.Worksheets(xlTáblaEred)
        objSheet.Select ' Ráugrunk a lapra
        
'''
    üzenet = "Üres oszlopok törlése:; megkezdve..."
    Ûrlap.Folyamat.AddItem Item:=üzenet
        
'        Call UresOszlopokTorlese(objSheet)
'''
    üzenet = "Üres oszlopok törlése:; befejezve!"
    Ûrlap.Folyamat.AddItem Item:=üzenet

        With objSheet
            .UsedRange.Name = xlTábla 'Elnevezzük a területet
'''
            üzenet = "Beolvasandó sorok száma:;" & .Range(xlTábla).Rows.Count
            Debug.Print üzenet
            Ûrlap.Folyamat.AddItem Item:=üzenet
            
        End With
        
        If DCount("[Name]", "MSysObjects", "[Name] = '" & xlTábla & "'") = 1 Then
            kieg = RIC(Now())
            DoCmd.Rename xlTábla & kieg, acTable, xlTábla
'''
            üzenet = névelõvel(xlTábla, , , True) & " átneveztetett:; " & xlTábla & kieg
            Ûrlap.Folyamat.AddItem Item:=üzenet
    
        End If
'''
        üzenet = "Az új " & xlTábla & " elkészítése:; megkezdve..."
        Ûrlap.Folyamat.AddItem Item:=üzenet
        
        Call Táblakészítõ(db, MezõListaTábla, xlTábla)

'''
        üzenet = "Az új " & xlTábla & " elkészült:; sikerült!"
        Ûrlap.Folyamat.AddItem Item:=üzenet

        'Elkezdjük az adatok betöltését
        Set rsCél = db.OpenRecordset(xlTábla)

        Értékek = objSheet.Range(xlTábla).Value
        
        ehj.Ini (100)
        'Sorok száma: !!!!
        ehj.OszlopSzam = UBound(Értékek, 1) - (LBound(Értékek, 1)) ' Az oszlopszám itt a sorok számát jelöli!
'''
        üzenet = "A beolvasandó oszlopok száma:;" & UBound(Értékek, 2) - (LBound(Értékek, 2) + 1)
        Ûrlap.Folyamat.AddItem Item:=üzenet

        For sor = LBound(Értékek, 1) + 1 To UBound(Értékek, 1)
            intMezõ = 0
            'új rekord hozzáadása kezdõdik...
            rsCél.AddNew
            rsCél.Update
            helyzet = rsCél.LastModified
            
            For oszlop = LBound(Értékek, 2) + 1 To UBound(Értékek, 2)

                intMezõ = oszlop
                rsCél.bookmark = helyzet
                rsCél.Edit
                mezõ = Clean_NPC(Trim(Left(Értékek(1, oszlop), 64))) 'A nem nyomtatható karaktereket kiszûrjük
                rsCél.Fields(mezõ) = konverter(rsCél.Fields(mezõ), Értékek(sor, oszlop))
                Debug.Print mezõ, rsCél.Fields(mezõ).Value
                rsCél.Update
            Next oszlop
            ehj.Novel
            'új rekord hozzáadása véget ért
            
        Next sor
'''
    üzenet = névelõvel(Fájl, , , True) & " adatai beolvastattak; " & névelõvel(xlTábla) & "táblába!"
    Ûrlap.Folyamat.AddItem Item:=üzenet
Exit Sub
Hiba:
If Err.Number = 3265 Then
    Válasz = ÚjOszlop(mezõ)
End If

End Sub
Function ÚjOszlop(strOszlopNév As String) As Integer
    Dim Szöveg As String
    Dim Válasz As Variant
    Dim Szám As Integer
On Error GoTo Hiba
Kezdet:
    Szöveg = strOszlopNév & Chr(10) & "2 - Byte" & Chr(10) & "3 - Integer" & Chr(10) & "4 - Long" & Chr(10) & "5 - Currency" & Chr(10) & "6 - Single" & Chr(10) & "7 - Double" & Chr(10) & "8 - Date/Time" & Chr(10) & "10 - Text" & Chr(10) & "12 - Memo" & Chr(10) & "16 - Big Integer" & Chr(10) & "17 - VarBinary" & Chr(10) & "18 - Char" & Chr(10) & "19 - Numeric" & Chr(10) & "20 - Decimal" & Chr(10) & "21 - Float" & Chr(10) & "22 - Time" & Chr(10) & "23 - Time Stamp"
    Válasz = InputBox(Szöveg, "Új oszlop", 10) 'Ha nem válaszol, akkor 10 lesz az érték.
    If StrPtr(Válasz) = 0 Then 'Mégsem gombot nyomott
        Exit Function
    End If
    If Len(Válasz) = 0 Then
        GoTo Kezdet
    End If
Vég:
    Szám = CInt(Válasz)
    MsgBox ("Eredmény:" & Szám)
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
    
On Error GoTo Hiba
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

Debug.Print ".";
        strMezõNév = Clean_NPC(sqlTgy)
        If Len(strMezõNév) > 60 Then
            strMezõNév = Left(strMezõNév, 60) & rsSorSzám
        End If
        db.Execute (strMezõNév)
Debug.Print ".";
        rsMezõk.MoveNext
Debug.Print "."
Debug.Print rsSorSzám, Len(rsMezõk.Fields("Mezõnév")), strMezõNév;
    Next rsSorSzám
Debug.Print "!";
MsgBox ("!")
Exit Sub
Hiba:
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
    
    Dim táblanév As String
    
    
    sql = "SELECT Name FROM MSysObjects WHERE Flags=0 AND Type = 1 AND Name like 'tSzemélyek*' "
    
    Set db = CurrentDb()
    Set tbla = db.OpenRecordset("tTáblamezõk", dbOpenTable)
        
    Set rs = db.OpenRecordset(sql)
        rs.MoveLast
        rs.MoveFirst
    
    Do Until rs.EOF
        táblanév = rs.Fields("Name")
        sql2 = "SELECT TOP 1 * FROM [" & táblanév & "];"
        Set rs2 = db.OpenRecordset(sql2)
        Debug.Print táblanév, rs2.Fields.Count
        For mezõszám = 0 To rs2.Fields.Count - 1
            tbla.AddNew
            tbla.Fields("táblanév") = táblanév
            mezõnév = rs2.Fields(mezõszám).Name
            tbla.Fields("mezõnév") = mezõnév
            tbla.Fields("sorszám") = mezõszám
            If InStr(1, mezõnév, "dátum") Then
                'tbla.Fields = Date
            End If
            tbla.Update
            Debug.Print mezõszám, rs2.Fields(mezõszám).Name
        Next mezõszám
        Set rs2 = Nothing
        rs.MoveNext
    Loop
    
End Sub
Function bfkh(kód As String) As String
'Minden két pont között, ha csak egy karakter van, beszúr eléje egy 0-t. Pl.:BFKH.1.2. -> BKFH.01.02.
    Dim intN, i, intPoz As Integer
    Dim strÁtm, strElv As String
    
    strElv = "."
    strÁtm = ""
    intN = StrCount(kód, strElv)
    
    For i = 1 To intN
        Select Case i
            Case 1 'elsõ
                strÁtm = ffsplit(kód, strElv, i)
            Case Else 'a közbülsõk
                If Len(ffsplit(kód, strElv, i)) = 1 Then
                    strÁtm = strÁtm & ".0" & ffsplit(kód, strElv, i)
                Else
                    strÁtm = strÁtm & "." & ffsplit(kód, strElv, i)
                End If
        End Select
                
    Next i
    bfkh = strÁtm
End Function
Public Function StrCount(ByVal Szöveg As String, ByVal Keresett As String) As Integer
'------------------------------------------------------------------
' Purpose: Counts the numbers of times an item occurs
' in a string.
' Coded by: raskew
' Arguments: TheStr: The string to be searched.
' TheItem: The item to search for.
' Returns: The number of occurences as an integer.
'
' Note: To test: Type '? StrCount(""The quick brown fox jumped over
' the lazy dog"", ""the"") in the debug window.
' The function returns 2.
'------------------------------------------------------------------
Dim i As Integer
Dim j As Integer
Dim placehold As Integer
Dim strHold As String
Dim itemhold As Variant

    strHold = Szöveg
    itemhold = Keresett
    j = 0
    
    If InStr(1, strHold, itemhold) > 0 Then
        While InStr(1, strHold, itemhold) > 0
            placehold = InStr(1, strHold, itemhold)
            j = j + 1
            strHold = Mid(strHold, placehold + Len(itemhold))
        Wend
    End If
    StrCount = j
End Function
Public Function ffsplit(ByVal mezõ As String, Optional ByVal elválasztó As String = ",", Optional ByVal Szám As Integer = 0) As String
    Dim temp() As String
    Dim n As Integer
On Error GoTo Hiba
    If IsNull(mezõ) Then Exit Function
    n = StrCount(mezõ, elválasztó)
    ReDim temp(n)
    'Debug.Print mezõ & ", " & n

    temp = Split(mezõ, elválasztó)
    ffsplit = Trim(temp(Szám - 1))
    'Debug.Print temp(Szám - 1)

Exit Function
Hiba:
MsgBox (Err)
End Function
Public Function dtÁtal(strDátum As Variant) As Date
' Kell hozzá az ffsplit() fv., ahhoz meg a StrCount() függvény.
    Dim dtVál As String
    Debug.Print strDátum
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

Sub valami(izé As String)
Debug.Print izé
End Sub