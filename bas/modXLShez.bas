'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database

Private Sub OszlopokÁtnevezése(rng As Object)
    Dim cell As Object
    Dim dict As Object
    Dim key As Variant
    Dim count As Long
    
    ' Create a dictionary to store counts of each value
    Set dict = CreateObject("Scripting.Dictionary")
    
    ' Loop through each cell in the range
    For Each cell In rng
        ' Check if the value is already in the dictionary
        If dict.Exists(cell.Value) Then
            ' Increment count and concatenate the value
            count = count + 1
            'Debug.Print cell.Value
            cell.Value = cell.Value & count
        Else
            ' Add the value to the dictionary with count as 1
            dict.Add cell.Value, 1
        End If
    Next cell
End Sub
Sub UresOszlopokTorlese(ByVal strFájlnévÚtvonallal As String, Optional ByVal strTáblaNév As String = "tSzemélyek", Optional ByVal bAdójelKellE As Boolean = True, Optional ByVal bTörölniKellE As Boolean = True, Optional ByVal kezdõcella As String = vbNullString)
'#####################################################################################################
'#
'#  A személytörzs táblában kitörli az üres (adatot nem tartalmazó) oszlopokat,
'#  majd az elsõ oszlop elé beszúr egy oszlopot, ami az adójelet tartalmazza majd szám-ként tárolva,
'#  az egész táblát elnevezi tSzemélyek néven.
'#
'#####################################################################################################
    On Error GoTo Hiba
    
    Dim xlApp As Excel.Application
    Dim xlWB As Excel.Workbook
    Dim iCol As Long
    Dim ehj As New ehjoszt
    Dim lap As Excel.Worksheet
    Dim sor As Long
    Dim ezaSor As Long
    Dim terület As Range
    Dim torolt As Boolean
    Dim fejléc As Range
    
    Set xlApp = New Excel.Application
    xlApp.DisplayAlerts = False
    Set xlWB = xlApp.Workbooks.Open(strFájlnévÚtvonallal)
    Set lap = xlWB.Sheets(1)
    Debug.Print lap.Name

    If bTörölniKellE Then
        With lap.UsedRange
            ehj.Ini (100)
            ehj.oszlopszam = .Columns.count
            For iCol = ehj.oszlopszam To 1 Step -1  '.Columns.Count
                If iCol Mod 10 = 0 Then: Debug.Print iCol & ",";
                ezaSor = lap.Cells(lap.Rows.count, iCol).End(xlUp).row
                
                torolt = False
                If ezaSor < 3 Then
                    Debug.Print ezaSor & ",";
                    lap.Columns(iCol).EntireColumn.Delete
                    torolt = True
                    Debug.Print torolt
                End If
                Debug.Print ".";
                ehj.Novel
            Next
            sor = .Rows.count
        End With
    End If
    'Adójel beszúrása
    If bAdójelKellE Then
        If lap.Range("A2").Value <> "Adójel" Then
            lap.Range("A1").EntireColumn.Insert
        End If
        'Biztos, ami biztos, az Adójel-et és a képletet beillesztjük akkor is, ha már ott van...
        Set terület = lap.Range("A3:A" & sor + 1) 'Hogy az utolsó sor ne maradjon ki
        lap.Range("A2").Value = "Adójel"
        terület.Formula = "=J3*1"
    End If 'bAdójelKellE
    With lap
        Set fejléc = .Range(.Cells(2, 1), .Cells(2, .UsedRange.Columns.count))
    End With
    Call OszlopokÁtnevezése(fejléc)
    
    'Elnevezzük a teljes táblát
    If strTáblaNév <> "" Then
        If kezdõcella = vbNullString Then
             xlWB.Names.Add Name:=strTáblaNév, RefersTo:=lap.UsedRange
            ' Debug.Print ImportTáblaHibaJavító(lap.UsedRange)
        Else
            Dim uOszlop, uSor As Long
            Dim kCella As Range
            
            Set kCella = lap.Range(kezdõcella)
            uOszlop = kCella.CurrentRegion.Columns.count
            uSor = kCella.CurrentRegion.Rows.count
            
            xlWB.Names.Add Name:=strTáblaNév, RefersTo:=kCella.Resize(uSor, uOszlop)
        End If
    End If
    
    xlWB.Save
    xlWB.Close
    xlApp.Quit
    
    Set lap = Nothing
    Set xlWB = Nothing
    Set xlApp = Nothing
    
    Exit Sub
   
Hiba:
    If Err.Number = 1004 Then
        strFájlnévÚtvonallal = Replace(strFájlnévÚtvonallal, ".xlsx", "") & CStr(CLng(Timer)) & ".xlsx"
        xlWB.SaveAs strFájlnévÚtvonallal
        Resume Next
    End If
    MsgBox "Error: " & Err.Description, vbExclamation + vbOKOnly, "Error"
End Sub
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