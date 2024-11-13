'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Option Explicit



Sub prooba()
    Dim a() As Variant
    a = XMLoszlopok("tSzemélyek")
    Debug.Print "1:", LBound(a, 1), UBound(a, 1)
    
End Sub
Sub ParseAndLoadXMLToTable(strXMLneve As String)
    Dim xmlDoc As Object
    Dim i, j As Integer
    Set xmlDoc = CreateObject("MSXML2.DOMDocument.6.0")
    
    ' Load the XML string from ImportExportSpecification
    'Dim strXMLneve As String
    'strXMLneve = "YourXMLSpecificationName" ' Replace with the actual name of your specification
    xmlDoc.LoadXML CurrentProject.ImportExportSpecifications.item(strXMLneve).XML
    
    ' Check if XML was loaded successfully
    If xmlDoc.parseError.ErrorCode <> 0 Then
        MsgBox "Error parsing XML: " & xmlDoc.parseError.reason
        Exit Sub
    End If
    
    ' Select all child nodes with the base name "Column"
    Dim columnNodes As Object
    Set columnNodes = xmlDoc.DocumentElement.SelectNodes("Column")
    
    ' Assuming you have an existing table named "YourTableName" with fields matching the XML structure
    Dim tableName As String
    tableName = "XMLértékek" ' Replace with the actual name of your table
    
    ' Array to store values
    Dim columnArray() As Variant
    ReDim columnArray(1 To xmlDoc.DocumentElement.ChildNodes.Length, 1 To 5)
    
    ' Loop through each <Column> element
    Dim columnNode As Object
    For Each columnNode In xmlDoc.getElementsByTagName("columns").ChildNodes
        Dim columnIndex As Long
        columnIndex = columnNode.GetAttribute("baseName")
        
        ' Populate the array
        columnArray(columnIndex, 1) = columnNode.GetAttribute("FieldName")
        columnArray(columnIndex, 2) = columnNode.GetAttribute("Indexed")
        columnArray(columnIndex, 3) = columnNode.GetAttribute("SkipColumn")
        columnArray(columnIndex, 4) = columnNode.GetAttribute("DataType")
    Next columnNode
    
    ' Open the existing table for appending records
    Dim db As Object
    Set db = CurrentDb
    Dim rs As Object
    Set rs = db.OpenRecordset(tableName, dbOpenTable, dbAppendOnly)
    
    ' Loop through the array and add records to the table
    For i = 1 To UBound(columnArray, 1)
        rs.AddNew
        For j = 1 To UBound(columnArray, 2)
            rs.Fields(columnArray(i, 1)).Value = columnArray(i, j)
        Next j
        rs.Update
    Next i
    
    ' Close the recordset
    rs.Close
    
    ' Display a message indicating success
    MsgBox "XML data loaded into table successfully!"
End Sub

Function nFrom(strLekérdNeve As String) As Integer
'#MIT Oláh Zoltán (c) 2023
'Megszámolja, hogy a lekérdezés hány
    Dim nDarab, i As Integer
    Dim fDarab As Integer
    Dim strSzakasz As String
    Dim strSQL As String
    
    strSQL = CurrentDb.QueryDefs(strLekérdNeve).sql
    nDarab = StrCount(strSQL, "From")
    For i = 1 To 2 'nDarab
        strSzakasz = ffsplit(strSQL, "FROM", i)
        
        strSzakasz = ffsplit(strSzakasz, "SELECT")
        Debug.Print strSzakasz
        strSzakasz = ffsplit(strSzakasz, "UNION")
        Debug.Print strSzakasz
        strSzakasz = ffsplit(strSzakasz, "WHERE")
        Debug.Print strSzakasz
        strSzakasz = ffsplit(strSzakasz, "GROUP BY")
        Debug.Print strSzakasz
        fDarab = fDarab + StrCount(strSzakasz, ",") + 1
        Debug.Print strSzakasz, fDarab
    Next i
    nFrom = fDarab
End Function
Public Function xlTáblaImport(ByVal strFájl As String, ByVal táblanév As String) As Boolean 'Ûrlap As Form,
    '##################################
    Dim objExcel As excel.Application
    Dim objBook As excel.Workbook
    Dim objSheet As excel.Worksheet
    Dim objRange As excel.Range
    Set objExcel = excel.Application
    Set objBook = objExcel.Workbooks.Open(strFájl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)
    Set objSheet = objBook.Worksheets(táblanév)
    Set objRange = objSheet.Range("A2").CurrentRegion
    Debug.Print
End Function


Sub ImportExcelData(ByVal excelFileName As String, táblanév As String)
    Dim eApp As Object
    Dim eWb As Object
    Dim eWs As Object
    Dim db As Database
    Dim rs As Recordset
    Dim strSQL As String
    Dim eRng As Object
    Dim iMezõk As Integer
    Dim iRekordok As Integer
    Dim oszl, sor As Integer ' számlálók
    Dim mTípusok() As Variant
    
    ' Excel
    Set eApp = CreateObject("Excel.Application")
    Set eWb = eApp.Workbooks.Open(excelFileName)
    Set eWs = eWb.Sheets("Személytörzs alapriport")
    Set eRng = eWs.Range("tSzemélyek")
    
    iMezõk = eRng.Columns.count
    iRekordok = eRng.Rows.count
    ' Access
    Set db = CurrentDb
    
    ' Mezõ adatok
   mTípusok() = vMezõkTípusaImporthoz(eRng)
    
    
    For sor = 2 To iRekordok 'soronként / rekordonként lépkedünk
    
        strSQL = "INSERT INTO [" & táblanév & "] ("
        
        For oszl = 1 To iMezõk
            strSQL = strSQL & "[" & eRng.Cells(1, oszl).Value & "]"
            If oszl < iMezõk Then
                strSQL = strSQL & ", "
            End If
        Next oszl
        
        strSQL = strSQL & ") VALUES ("
        
        For oszl = 1 To iMezõk
            strSQL = strSQL & "'" & eRng.Cells(sor, oszl).Value & "'"
            If oszl < iMezõk Then
                strSQL = strSQL & ", "
            End If
        Next oszl
    
        strSQL = strSQL & ");"
        
        db.Execute strSQL
    Next sor
    
    ' Close and clean up
    eWb.Close
    Set eWs = Nothing
    Set eWb = Nothing
    eApp.Quit
    Set eApp = Nothing
    Set db = Nothing
End Sub

'Sub sqlizé()
''FeladatKat:
'a = IIf([a kormánytisztviselõ feldatköre] = "osztályvezetõ", _
'        Switch( _
'            [Fõosztály] Like "Egészségbizt*" Or [Osztály] Like "Egészségbizt*", "egészségbiztosítási", _
'            [Fõosztály] Like "Rehabil*" Or [Osztály] Like "Rehab*", "rehabilitációs", _
'            [Fõosztály] Like "Népegészség*" Or [Osztály] Like "Népegészség*", "népegészségügyi"), _
'        Switch( _
'            [a kormánytisztviselõ feladatköre] Like "Egészségbizt*", "egészségbiztosítási", _
'            [a kormánytisztviselõ feladatköre] Like "Rehab*", "rehabilitációs", _
'            [a kormánytisztviselõ feladatköre] Like "Népegészség*", "népegészségügyi") _
'        )
'End Sub

Sub jsonPróba()

    Dim json As Object
    Dim jsonString As String
    
    jsonString = DLookup("Próba", "Tábla3", "Azonosító=2")
    Set json = ParseJson(jsonString) 'JsonConverter.ParseJson(jsonString)
    
    'Access values from the parsed JSON
    MsgBox "activetab: " & json("activetab")
    MsgBox "tag_states: " & json("tag_states")
    MsgBox "count: " & json("count")
End Sub
Sub ParseComplexJSON()
    Dim json As Object
    Dim jsonString As String
    Dim item As Variant
    Dim searchArray As Object

    jsonString = DLookup("Próba", "Tábla3", "Azonosító=2")
    
    ' Parse the JSON string
    Set json = ParseJson(jsonString)

    ' Access and display "activetab"
    MsgBox "Active Tab: " & json("activetab")

    ' Check if "tag_states" is an empty object (dictionary)
    If json("tag_states").count = 0 Then
        MsgBox "Tag States is empty"
    End If

    ' Access the "data-prev-search" array
    Set searchArray = json("data-prev-search")
    
    ' Loop through the array and display each element's "text" and "count"
    For Each item In searchArray
        MsgBox "Search Text: " & item("text") & ", Count: " & item("count")
    Next item
End Sub

Sub táblaUtolsóFrissítése(táblanév As String)
    Dim db As Database
    Dim tábla As TableDef
    Dim a As Integer
    Set db = CurrentDb
    a = 1
    For Each tábla In db.TableDefs
        If tábla.Name = táblanév Then
            Debug.Print vbNewLine & tábla.LastUpdated
            Exit Sub
        Else
            ¤ (".")
            If ÷(a) Mod 10 = 0 Then ¤ vbNewLine
        End If
    Next
    
End Sub
Sub haladás()
    Dim ehj As New ehjoszt
    
    Dim i, j, x
    ehj.Ini 100
    ehj.oszlopszam = 0
    
    For i = 0 To ehj.oszlopszam
    ehj.Novel
        
        For j = 0 To 100000000
            If j Mod 1000000 = 0 Then
                
            End If
        Next j
    Next i
End Sub
Sub LekérdezésÍró()
'Licencia: MIT Oláh Zoltán 2022 (c)
    Dim db As DAO.Database
    Dim rs As Recordset
    Dim rs2 As Recordset
    Dim sql As String
    Dim sql2 As String
    Dim kSQL As String
    Dim lekérd As String
    Dim újnév As String
    Dim x As Integer
    Dim Találat, dbTalálat As Integer
    Set db = CurrentDb
    sql = "SELECT AccessNév, Hiány_lekérdezés FROM tImportálandóTáblák"
    Set rs = db.OpenRecordset(sql)
    
    Do Until rs.EOF
        sql2 = "SELECT Import, Eredeti  FROM tJavítandóMezõnevek WHERE Tábla ='" & rs!AccessNév & "' AND NemKötelezõ = false ;"
        Set rs2 = db.OpenRecordset(sql2)
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
        lekérd = "oz_" & rs!Hiány_lekérdezés & "2"
        
        If Not IsNull(DLookup("Type", "MSYSObjects", "Name='" & lekérd & "'")) Then
            db.QueryDefs(lekérd).sql = kSQL
        Else
            db.CreateQueryDef lekérd, kSQL
        End If
        'Debug.Print kSQL
        rs.MoveNext 'A következõ táblára ugrunk
    Loop 'rs

kijárat:

End Sub