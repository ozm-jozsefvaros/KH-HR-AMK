'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database

Function test()
    Debug.Print "teszt"
    caller "fvVane"
End Function
Sub caller(fvnév)
fvnév = RIC(fvnév)
Dim fv As String
    If fvVane(fvnév) Then
        Eval (fvnév & "()")
    End If
End Sub
Function fvVane(ByVal fvnév As String) As Boolean
    ' Check if a procedure with the given name exists in the current module
    
    For Each modul In Application.VBE.ActiveVBProject.VBComponents
        On Error Resume Next
            fvVane = Not IsNull(modul.CodeModule.ProcBodyLine(fvnév, vbext_pk_Proc))
        On Error GoTo 0
    Next modul

End Function
Sub tSzemélyekImport()
fvbe ("tSzemélyekImport")
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
            strXML = CurrentProject.ImportExportSpecifications.item(importSpecName).XML 'Itt megszerezzük
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
        CurrentProject.ImportExportSpecifications.item(importSpecName).XML = strXML
        ' Run the saved import specification with the selected file.
        DoCmd.RunSavedImportExport importSpecName

        ' Display a success message.
        'MsgBox "Import completed successfully!", vbInformation + vbOKOnly, "Import Completed"
    End If
    
Kilépés:
    ' Clean up the FileDialog object.
    Set dlg = Nothing
    fvki
    Exit Sub

ErrorHandler:
    ' Display an error message if something goes wrong.
    MsgBox "Error: " & Err.Description, vbExclamation + vbOKOnly, "Error"
    logba , "Error: " & Err.Description & "(" & Err.Number & ")", 0
    Resume Kilépés
End Sub
Public Sub SzemélytörzsImport(fájlnév As String, Ûrlap As Object)
fvbe ("SzemélytörzsImport")
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
    
    
    Dim Eredmény        As Integer
    Dim MezõListaTábla  As String           'A tábla : a tábla mezõinek (eredeti oszlopcím, mezõnév, típus) jellemzõit tároló tábla
    
    'A szöveges kimenethez
    Dim Üzenet          As String
    
    'Számláláshoz
    Dim sor, oszlop     As Integer
    Dim ehj             As New ehjoszt
    
    Dim válasz          As Integer
On Error GoTo Hiba
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    MezõListaTábla = "tSzemélyMezõk"

    
    ' azt feltételezzük, hogy a fájlnév jó, helyes és alkalmas
    Fájl = fájlnév
    ' megnyitjuk az Excel táblát
'''
    sFoly Ûrlap, "Adatforrás megnyitása:; megkezdve..."
   
    
    Set objBook = objExcel.Workbooks.Open(Fájl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)

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
            sFoly Ûrlap, "Beolvasandó sorok száma:;" & .Range(xlTábla).Rows.count
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
        ehj.oszlopszam = UBound(Értékek, 1) - (LBound(Értékek, 1)) ' Az oszlopszám itt a sorok számát jelöli!
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
    sFoly Ûrlap, névelõvel(Fájl, , , True) & " adatai beolvastattak; " & névelõvel(xlTábla) & "táblába!"
    fvki
Exit Sub
Hiba:
If Err.Number = 3265 Then
    válasz = ÚjOszlop(mezõ)
End If

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