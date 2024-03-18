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
'Sub egy()
'    Dim ehj             As New ehjoszt
'    ehj.Ini
'    ehj.OszlopSzam = 14
'    ehj.SzakaszSzám = 5
'    Debug.Print "sor", "JelSzak", "SzakaszSzám", "Érték", "Skála", "Oszlopszám"
'    For n = 0 To ehj.OszlopSzam
'
'        Debug.Print n, ehj.JelenlegiSzakasz, ehj.SzakaszSzám, ehj.Value, ehj.skála, ehj.OszlopSzam
'        ehj.Novel
'    Next n
'    ehj.Torol
'
'End Sub


Sub Status(pstrStatus As String)
    
    Dim lvarStatus As Variant
    
    If pstrStatus = "" Then
        lvarStatus = SysCmd(acSysCmdClearStatus)
    Else
        lvarStatus = SysCmd(acSysCmdSetStatus, pstrStatus)
    End If
    
End Sub

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
    xmlDoc.LoadXML CurrentProject.ImportExportSpecifications.Item(strXMLneve).XML
    
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

