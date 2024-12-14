Option Compare Database

Sub ExportTableDataToExcel()
    Dim db As DAO.Database
    Dim rs As DAO.Recordset
    Dim xlApp As Object
    Dim xlBook As Object
    Dim xlSheet As Object
    Dim curPath As String
    Dim curHead As String
    Dim curDept As String
    Dim row As Long
    
    Set db = CurrentDb()
    Debug.Print "Lek. indul...", Now()
    Set rs = db.OpenRecordset("SELECT * FROM lkEngedélyezettésLétszámKimenet02 ORDER BY Fõosztály, Oszt;") 'teszteléshez: WHERE [Fõosztály] Like 'Nyugd*' OR [Fõosztály] Like 'Egész*'
    Debug.Print "Lek. vége...", Now()
    Set xlApp = CreateObject("Excel.Application")
    xlApp.Visible = False 'change to True for debugging
    
    curPath = "L:\Ugyintezok\Adatszolgáltatók\Kimenet" & "\" 'modify as needed
    curHead = ""
    curDept = ""
    row = 1
    
    If Not (rs.BOF And rs.EOF) Then
        Do While Not rs.EOF
            If rs!Fõosztály <> curHead Then 'new head department
                If Not xlBook Is Nothing Then 'save and close previous workbook
                    Call igazítások(xlSheet, row) ' Mentés elõtt egy kis csínozás
                    xlBook.SaveAs curPath & curHead & ".xlsx"
                    xlBook.Close
                End If
                Set xlBook = xlApp.Workbooks.Add 'create new workbook
                Set xlSheet = xlBook.Worksheets(1) 'use first worksheet
                curHead = rs!Fõosztály 'update current head department
                Debug.Print curHead
                curDept = "" 'reset current department
                row = 1 'reset row number
                xlSheet.Range("A" & row & ":F" & row).Merge 'merge cells for department name
                xlSheet.Range("A" & row).Value = rs!Fõosztály 'write department name
                xlSheet.Range("A" & row).Font.Bold = True 'format department name
                xlSheet.Range("A" & row).Interior.ColorIndex = 37
                xlSheet.Range("A" & row).HorizontalAlignment = xlCenter
                row = 2
            End If

            If rs!Oszt <> curDept Then 'new department
                If row > 2 Then 'skip a row after previous department
                    xlSheet.Range("A" & row & ":F" & row).Interior.ColorIndex = 52
                    row = row + 1
                End If

                'row = row + 1 'Osztály megnevezése
                xlSheet.Range("A" & row).Value = rs!Oszt
                xlSheet.Range("A" & row & ":F" & row).Interior.ColorIndex = 15
                row = row + 1 ' tábla fejléc (évszámok stb.)
                xlSheet.Range("B" & row).Value = "2021.01.01." 'write year headers
                xlSheet.Range("C" & row).Value = "2022.01.01."
                xlSheet.Range("D" & row).Value = "2023.01.01."
                xlSheet.Range("E" & row).Value = "2024. évre a feladatellátásához szükséges, javasolt létszám"
                xlSheet.Range("F" & row).Value = "utolsó SZMSZ szerint engedélyezett létszám"
                With xlSheet.Range("B" & row & ":F" & row)
                    .Font.Bold = True 'format year headers
                    .WrapText = True
                End With
                xlSheet.Rows(row).HorizontalAlignment = xlHAlignCenter
                
                row = row + 1 'Jöhetnek az adatok
                curDept = rs!Oszt 'update current department
            End If
            xlSheet.Range("A" & row).Value = "személyi állomány létszáma:" 'write number of employees label
            xlSheet.Range("B" & row).Value = rs!L2021 'write number of employees data
            xlSheet.Range("C" & row).Value = rs!L2022
            xlSheet.Range("D" & row).Value = rs!L2023
            
            row = row + 1 'increment row number
            xlSheet.Range("A" & row).Value = "tartósan távollévõk létszáma:" 'write permanently absent employees label
            xlSheet.Range("B" & row).Value = rs!TT2021 'write permanently absent employees data
            xlSheet.Range("C" & row).Value = rs!TT2022
            xlSheet.Range("D" & row).Value = rs!TT2023
            xlSheet.Range("E" & row & ":F" & row).Interior.ColorIndex = 15
            row = row + 1
            xlSheet.Range("A" & row).Value = "ügyszám"
            xlSheet.Range("E" & row & ":F" & row).Interior.ColorIndex = 15
            row = row + 1 'increment row number
            rs.MoveNext 'move to next record
        Loop
        'Végsõ igazítások a munkalapon
        Call igazítások(xlSheet, row)

        If Not xlBook Is Nothing Then 'save and close last workbook
            xlBook.SaveAs curPath & curHead & ".xlsx"
            xlBook.Close
        End If
    Else
        Debug.Print "Üres volt a lekérdezés..."
    End If
    
    xlApp.Quit 'quit Excel application
    rs.Close 'close recordset
    db.Close 'close database
    Set xlSheet = Nothing 'clear objects
    Set xlBook = Nothing
    Set xlApp = Nothing
    Set rs = Nothing
    Set db = Nothing
    Debug.Print "Lefutott:", Now()
End Sub
Sub igazítások(ByRef xlSheet As Excel.Worksheet, ByVal row As Integer)
        With xlSheet.UsedRange.Borders
            .LineStyle = xlContinuous
            .Weight = xlThin
        End With
        xlSheet.Columns("A").ColumnWidth = 50
        xlSheet.Columns("B").ColumnWidth = 28.14
        xlSheet.Columns("C").ColumnWidth = 25.57
        xlSheet.Columns("D").ColumnWidth = 29.43
        xlSheet.Columns("E").ColumnWidth = 29.43
        xlSheet.Columns("F").ColumnWidth = 22.71
                row = row + 1
        Debug.Print row
        With xlSheet.Range("A" & row)
            .Value = "a szürkével jelölt cellák értelemszerûen nem kitöltendõk"
            .Font.Italic = True
        End With
End Sub