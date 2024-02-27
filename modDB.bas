'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Function ElsõdlegesKulcsMezõ(ByVal táblanév As Variant, Optional adatbázis As Variant = "", Optional oÛrlap As Form) As String
'# Megkeresi, hogy az adott táblában van-e elsõdleges mezõ,
'# ha van, visszaadja a nevét,
'# ha nincs, üres string-gel tér vissza

    Dim db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim fld As DAO.Field
    Dim log As Boolean
    If Not IsNull(oÛrlap) Then: log = True
    
    ' Ha nincs megadva táblanév, vbNullString-et adunk vissza
    If táblanév = "" Or IsNull(táblanév) Then
        ElsõdlegesKulcsMezõ = vbNullString
        Exit Function
    End If
    
    ' Ha nincs megadva adatbázisnév, használjuk a CurrentDb-t
    If dbName = "" Or IsNull(adatbázis) Then
        Set db = CurrentDb
    Else
        ' Ellenkezõ esetben megpróbáljuk megnyitni a megadott adatbázist
        On Error Resume Next
        Set db = OpenDatabase(adatbázis)
        On Error GoTo 0
        
        ' Ha nem sikerül megnyitni az adatbázist, hibát jelzünk és kilépünk
        If db Is Nothing Then
            If log Then: sFoly oÛrlap, táblanév & ":; nincs adatbázisnév"
            ElsõdlegesKulcsMezõ = vbNullString
            Exit Function
        End If
    End If
    
    ' Megpróbáljuk megnyitni a táblát
    On Error Resume Next
    Set tdf = db.TableDefs(táblanév)
    On Error GoTo 0
    
    ' Ha nem sikerül megnyitni a táblát, hibát jelzünk, és kilépünk
    If tdf Is Nothing Then
        If log Then: sFoly oÛrlap, táblanév & "Nem sikerült megnyitni a táblát."
        ElsõdlegesKulcsMezõ = vbNullString
        Exit Function
    End If
    
    ' Keresünk egy mezõt, amely elsõdleges kulcsként van meghatározva
    For Each fld In tdf.Fields
        If fld.Attributes And dbAutoIncrField Then
            ElsõdlegesKulcsMezõ = fld.Name
            Exit Function
        End If
    Next fld
    
    ' Ha nem találtunk elsõdleges kulcsot, vbNullString-et adunk vissza
    ElsõdlegesKulcsMezõ = vbNullString
End Function
Function MezõVane(ByVal mezõnév As Variant, ByVal táblanév As Variant, Optional adatbázis As Variant = "", Optional oÛrlap As Form) As Boolean
'# Megkeresi, hogy az adott táblában van-e elsõdleges mezõ, ha van visszaadja a nevét, ha nincs üres string-gel tér vissza
    Dim log As Boolean
        If Not IsNull(oÛrlap) Then: log = True
    Dim db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim fld As DAO.Field
    
    
    If IsNull(mezõnév) Or mezõnév = "" Then
        If log Then: sFoly oÛrlap, táblanév & ":; nincs mezõnév megadva"
        Exit Function
    End If
    
    
    ' Ha nincs megadva táblanév, vbNullString-et adunk vissza
    If táblanév = "" Or IsNull(táblanév) Then
        MezõVane = False
        Exit Function
    End If
    
    ' Ha nincs megadva adatbázisnév, használjuk a CurrentDb-t
    If dbName = "" Or IsNull(adatbázis) Then
        Set db = CurrentDb
    Else
        ' Ellenkezõ esetben megpróbáljuk megnyitni a megadott adatbázist
        On Error Resume Next
        Set db = OpenDatabase(adatbázis)
        On Error GoTo 0
        
        ' Ha nem sikerül megnyitni az adatbázist, hibát jelzünk és kilépünk
        If db Is Nothing Then
            If log Then: sFoly oÛrlap, táblanév & ":; nincs adatbázisnév megadva"
            MezõVane = False
            Exit Function
        End If
    End If
    
    ' Megpróbáljuk megnyitni a táblát
    On Error Resume Next
    Set tdf = db.TableDefs(táblanév)
    On Error GoTo 0
    
    ' Ha nem sikerül megnyitni a táblát, hibát jelzünk és kilépünk
    If tdf Is Nothing Then
        If log Then: sFoly oÛrlap, táblanév & "Nem sikerült megnyitni a táblát."
        MezõVane = False
        Exit Function
    End If
    
    ' Keresünk egy mezõt, amely elsõdleges kulcsként van meghatározva
    For Each fld In tdf.Fields
        If fld.Name = mezõnév Then
            MezõVane = True
            Exit Function
        End If
    Next fld
    
    ' Ha nem találtunk elsõdleges kulcsot, vbNullString-et adunk vissza
    MezõVane = False
End Function
Function RenameColumn(RégiMezoNev As Variant, UjMezoNev As Variant, Optional tablaNev As Variant = "", Optional adatbazisNev As Variant = "", Optional oÛrlap As Form) As Boolean
   Dim log As Boolean
        If Not IsNull(oÛrlap) Then: log = True
        RenameColumn = False
    Dim db As Database
    Dim tblDef As TableDef
    Dim fld As Field
    
    
    On Error Resume Next
    If IsNull(mezoNev) Then: Exit Function

    
    If adatbazisNev = "" Or IsNull(adatbazisNev) Then
        Set db = CurrentDb
    Else
        Set db = OpenDatabase(adatbazisNev)
    End If
    
    If tablaNev = "" Or IsNull(tablaNev) Then: Exit Function
    
    Set tblDef = db.TableDefs(tablaNev)
    
    ' Ellenõrizzük, hogy létezik-e a megadott mezõnév a táblában
    For Each fld In tblDef.Fields
        If fld.Name = mezoNev Then
            ' Megváltoztatjuk a mezõ nevét
            tblDef.Fields(mezoNev).Name = UjMezoNev
            
            ' Frissítjük a tábladefiníciót
            db.TableDefs.Refresh
            
            ' Igaz értékkel tér vissza
            RenameColumn = True
            Exit Function
        End If
    Next fld
    
    ' Ha a mezõ név nem található a táblában
    RenameColumn = False
    
    ' Bezárja az adatbázis kapcsolatát
    db.Close
End Function

Function vFldTípus(sql As String) As Variant
'#MIT Oláh Zoltán (c) 2023
'A kapott lekérdezést lefuttatja, s a kapott értékpár eredményt egy tömbben adja vissza
    Dim db1 As Database
    Dim rs1 As Recordset
    Dim vFieldTypes() As Variant
    Dim i As Integer
    
    ' Set the database object
    Set db1 = CurrentDb
    
    ' Open the query that contains the fieldName and fieldType pairs
    Set rs1 = db1.OpenRecordset(sql)
    
    ' Check if there are records in the query result
    If Not rs1.EOF Then
        rs1.MoveLast
        rs1.MoveFirst
        
        ' Resize the array to hold the number of records
        ReDim vFieldTypes(1 To rs1.recordCount, 1 To 2)
        
        ' Loop through the records and populate the array
        i = 1
        Do While Not rs1.EOF
            vFieldTypes(i, 1) = "" & rs1("MezõNeve") & ""
            vFieldTypes(i, 2) = rs1("MezõTípusa")
            rs1.MoveNext
            i = i + 1
        Loop
    End If
    
    ' Close the recordset
    rs1.Close
    
    ' Now, vFieldTypes array contains fieldName and fieldType pairs
    ' You can access them like this: vFieldTypes(row, column)
    
    ' For example, to access the first pair:
    'MsgBox "Field Name: " & vFieldTypes(1, 1) & vbCrLf & "Field Type: " & vFieldTypes(1, 2)
    vFldTípus = vFieldTypes
    ' Clean up
    Set rs1 = Nothing
    Set db1 = Nothing
End Function
Sub mezõTípusok(lek As String, hfNév As String)
'Licencia: MIT Oláh Zoltán 2022 (c)
' A lek nevû lekérdezésben felsorolt lekérdezéseket sorra megnyitja,
' s a lekérdezés nevét, továbbá a mezõ nevét és típusát egy hfNév nevû csv táblába írja.
' mezõTípusok "lkEllenõrzõLekérdezések2","C:\Users\olahzolt\Desktop\Fájlok\mezo.csv"

    Dim db As DAO.Database
    Dim rk As Recordset
    'Dim hfnév As String
    Dim hf As Object
    
    Set hf = CreateObject("Scripting.FileSystemObject").CreateTextFile(hfNév, True)

    Set db = CurrentDb
    Set rk = db.OpenRecordset(lek)
    rk.MoveFirst
    hf.writeline "LekérdezésNeve;MezõNeve;MezõTénylegesTípusa"
    
    Do Until rk.EOF
        Dim rklek As Recordset
        Set rklek = db.OpenRecordset(rk("EllenõrzõLekérdezés"))
        Debug.Print rklek.Name
        For Each mezõ In rklek.Fields
            hf.writeline rklek.Name & ";" & mezõ.Name & ";" & mezõ.Type
            'Debug.Print rklek.Name; ";"; mezõ.Name; ";"; mezõ.Type
        Next mezõ
        rk.MoveNext
        Set rklek = Nothing
    Loop
    hf.Close
    Set hf = Nothing
    Debug.Print "----------------"
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
                MsgBox "Nem lehet konvertálni a" & névelõ(érték) & " " & érték & " értéket a" & névelõ(fMezõ.Type) & " " & fMezõ.Name & " " & fMezõ.Type & "típusába!"
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
Function ListTdfFields(táblanév As Variant) As Variant
'#################################################
'#
'# Oláh Zoltán (c) 2024 MIT
'#
'# Egy tömböt ad vissza, amelyiknek a
'# 0. dimenziója tartalmazza a mezõ nevét,
'# 1. dimenziója pedig a mezõ típusát
'# a táblanév nevû táblára értendõ.
'#
'#################################################
If IsNull(táblanév) Then Exit Function
    Dim db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim fld As DAO.Field
    Dim tömb() As Variant
    Dim i As Long
    i = 0
    
    Set db = CurrentDb

    Set tdf = db.TableDefs(táblanév)
    ReDim tömb(tdf.Fields.count, 1)

    For Each fld In tdf.Fields
        tömb(i, 0) = fld.Name
        tömb(i, 1) = fld.Type
        i = i + 1
    Next fld
    
    ListTdfFields = tömb()
    
    Set tdf = Nothing
    Set db = Nothing
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
    For rsSorSzám = 0 To rsMezõk.recordCount - 1
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
Hiba:
    MsgBox (Err.Number & ": " & Err.Description & " - " & Err.Source)
    Exit Sub
End Sub
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
        szRek = rekordok.recordCount
    End If

    Set rekordok = Nothing
Exit Function
 
ErrorHandler:
   MsgBox "Error #: " & Err.Number & vbCrLf & vbCrLf & Err.Description
    
End Function

Public Function tSzemélyekImport02(strFájl As String, Ûrlap As Form)
    'On Error GoTo ErrorHandler

    Dim importSpecName As String
    Dim db As DAO.Database
    Set db = CurrentDb
    Dim Üzenet As String
    Dim válasz As Boolean
    Dim Hiba As Boolean
    Hiba = False
    
    importSpecName = "tSzemélyek_import"

    If strFájl <> "" Then

                                                    sFoly Ûrlap, importSpecName & ":; importálás üres oszlopok törlése..."
        UresOszlopokTorlese strFájl 'A megadott állományból töröljük az üres oszlopokat
                                                    sFoly Ûrlap, importSpecName & ":; importálás üres oszlopok törlése kész!"

                                                    sFoly Ûrlap, importSpecName & ":; importálás indítása"
'#           Kitöröljük a korábbi fájlhoz létrehozott kapcsolatot, ha van ilyen
        If Len(CurrentDb.TableDefs(importSpecName).Connect) > 0 Then
            DoCmd.DeleteObject acTable, importSpecName
                                                    sFoly Ûrlap, importSpecName & ":; a korábbi kapcsolat törölve"
        End If
'#          Majd létrehozunk ugyanezen a néven egy új kapcsolatot az új fájllal
        DoCmd.TransferSpreadsheet acLink, 10, importSpecName, strFájl, True, "tSzemélyek" 'TODO : új paraméter az UresOszlopokTorlese-hez: területnév
        '#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                                                    sFoly Ûrlap, importSpecName & ":; tábla csatolása kész"
        db.Execute ("lkháttértár_tSzemélyek_törlõ") ' töröljük a már meglévõ adatokat
                                                    sFoly Ûrlap, importSpecName & ":; korábbi adatok törlése kész"
                                                    sFoly Ûrlap, importSpecName & ":; adatok áttöltése háttértárba indul..."
        db.Execute ("lkháttértár_tSzemélyek_áttöltés") 'Áttöltjük az adatokat a háttértárba
                                                    sFoly Ûrlap, importSpecName & ":; importálás véget ért"
                                                    sFoly Ûrlap, importSpecName & ":; " & DCount("*", "tSzemélyek") & " sor."
    End If
    tSzemélyekImport02 = True
    
Kilépés:
    Exit Function

ErrorHandler:
    ' Szabványos hibaüzenet elõállítása
    If Err.Number = 3709 Then
        sFoly Ûrlap, importSpecName & ":;az importálás hibára futott, megpróbáljuk javítani..."
        Hiba = True
        Resume 0
    End If
    MsgBox "Error: " & Err.Number & " - " & Err.Description, vbExclamation + vbOKOnly, "Error"
    Debug.Print "Error: " & Err.Number & " - " & Err.Description
    tSzemélyekImport02 = False
    Resume Kilépés
End Function
Function vMezõkTípusaImporthoz(eRng As excel.Range) As Variant
'# Oláh Zoltán (c)2024 MIT
'# A tartomány címsorát végignézzük, s egy tömbbe összegyûjtjük az alábbi adatokat:
    '# - oszlopszám
    '# - a mezõNeve <- a lkMezõkÉsTípusuk lekérdezésbõl
    '# - a mezõTípusa <- lkMezõkÉsTípusuk lekérdezésbõl
    '# - skip (át kell-e ugrani) <- lkMezõkÉsTípusuk lekérdezésbõl
    '# Az lkMezõkÉsTípusuk egy lekérdezés, ami az alábbi mezõket adja vissza:
    '# oszlopnév - az excel tartomány (eRng) címsorában szereplõ lehetséges szövegek, oszlopnevek
    '# mezõnév - az adattábla mezõnevei,
    '# Típus - egy egész szám
    '# Skip - Boolean érték
    '# DbType - a JetSQL szerinti mezõtípus
    Dim i As Integer
    Dim arr() As Variant
    Dim oszlopszam As Integer
    Dim MezõNeve As String
    Dim MezõTípusa As String
    Dim skip As Boolean
    Dim rs As DAO.Recordset
    
    ' Initialize the array
    ReDim arr(1 To eRng.Columns.count, 1 To 5)
    
    ' Open the query
    Set rs = CurrentDb.OpenRecordset("lkMezõkÉsTípusuk")
    
    ' Loop through each column in the range
    For i = 1 To eRng.Columns.count
        ' Get the column number
        oszlopszam = i
        
        ' Find the corresponding record in the query
        rs.FindFirst "[oszlopnév] = '" & eRng.Cells(1, i).Value & "'"
        
        If Not rs.NoMatch Then
            ' Get the field name, field type, and whether to skip from the query
            MezõNeve = rs!mezõnév
            MezõTípusa = rs!Típus
            skip = rs!skip
        Else
            ' If no matching record is found, use default values
            MezõNeve = ""
            MezõTípusa = ""
            skip = True
        End If
        
        ' Store the information in the array
        arr(i, 1) = oszlopszam
        arr(i, 2) = MezõNeve
        arr(i, 3) = MezõTípusa
        arr(i, 4) = skip
        arr(i, 5) = rs!DbType
    Next i
    
    ' Close the recordset
    rs.Close
    Set rs = Nothing
    
    ' Return the array
    vMezõkTípusaImporthoz = arr
End Function