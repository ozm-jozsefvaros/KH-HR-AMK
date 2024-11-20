Public Sub ExportQueriesAndProceduresToFiles()
fvbe ("ExportQueriesAndProceduresToFiles")
    Dim db As DAO.Database
    Dim qdf As DAO.QueryDef
    Dim strExportPath As String
    Dim mappa As String
    Dim strFileName As String
    Dim strDbNev As String 'az adatb�zis nev�nek
    Dim fso As Object
    Dim ts As Object
    Dim con As Object ' Container for modules
    Dim mdl As Object ' Module
    Dim mentett As ImportExportSpecification
    Dim projekt As CurrentProject
    Dim accObj As AccessObject
    Dim objektumn�v As String
    
'   Dim mdls As Modules
    
'   On Error GoTo ErrorHandler
    
    ' Set the export path where the files will be saved
    strExportPath = "L:\Ugyintezok\Adatszolg�ltat�k\Adatb�zisok\F�jlok\" ' Change this to your desired export path
    
    Set db = CurrentDb
    Set fso = CreateObject("Scripting.FileSystemObject")
    strDbNev = Replace(ffsplit(db.Name, "\", StrCount(db.Name, "\") + 1), ".accdb", "")
    strExportPath = strExportPath & strDbNev & Year(Date) & Right(Replace("0" & Month(Date), "00", "0"), 2) & Right(Replace("0" & Day(Date), "00", "0"), 2) & "\"
    
    konyvtarzo strExportPath

' Loop through all queries
    mappa = "lk\"
    
    strFileName = strExportPath & mappa & RIC(strDbNev) & "_" & "lekerdezesek.sql" 'dif
    konyvtarzo strExportPath & mappa 'dif
    Set ts = fso.CreateTextFile(strFileName, True) 'dif
    For Each qdf In db.QueryDefs
        If Not qdf.Name Like "~*" Then ' Exclude system queries
            'konyvtarzo strExportPath & mappa 'dif
            'strFileName = strExportPath & mappa & qdf.Name & ".sql" 'dif
            'Set ts = fso.CreateTextFile(strFileName, True)
            ts.writeline "#/#/#/" 'dif
            ts.writeline qdf.Name 'dif
            ts.writeline "#/#/" 'dif
            ts.writeline qdf.sql 'dif
        End If
    Next qdf
    ts.Close 'dif
    Set ts = Nothing 'dif
    
' Loop through all modules (using Application.Modules collection)
    mappa = "bas\"

    For i = 0 To Application.Modules.count - 1 ' mdl In Application.Modules
        Set mdl = Application.Modules(i)
        If Not mdl.Name Like "msys*" Then ' Exclude system modules
            konyvtarzo strExportPath & mappa
            strFileName = strExportPath & mappa & RIC(mdl.Name) & ".bas"
            Set ts = fso.CreateTextFile(strFileName, True)
            ts.Write mdl.Lines(1, mdl.CountOfLines)
            ts.Close
            Set ts = Nothing
        End If
    Next i
    
'Mentett ExportImport-ok ki�rat�sa
    mappa = "XML\"
    For i = 0 To CurrentProject.ImportExportSpecifications.count - 1
        Set mentett = CurrentProject.ImportExportSpecifications.item(i)
        With mentett
            konyvtarzo strExportPath & mappa
            strFileName = strExportPath & mappa & RIC(.Name) & ".XML"
            Set ts = fso.CreateTextFile(strFileName, True)
            ts.Write .XML
            ts.Close
            Set ts = Nothing
        End With
    Next i

    
'    If MsgBox("A lek�rdez�sek, modulok �s XML-ek ebbe a mapp�ba ker�ltek:" & vbNewLine & _
'            strExportPath & vbNewLine & _
'            "Megnyissam a k�nyvt�rat?", vbYesNo) _
'        Then
'        CreateObject("Wscript.Shell").Run (strExportPath)
'    End If
    
        Set projekt = Application.CurrentProject
        mappa = "Forms\"
logba , "Forms kezd�dik", 1
'        For Each accObj In projekt.AllForms
'            objektumn�v = accObj.Name
'            strFileName = strExportPath & mappa & RIC(accObj.Name) & ".txt"
'            konyvtarzo strExportPath & mappa
'            Application.SaveAsText acForm, objektumn�v, strFileName
'                                    logba , "�rlap neve:" & accObj.Name, 3
'        Next accObj
logba , "Tables kezd�dik", 1
'        mappa = "Tables\"
'        For Each accObj In projekt.AllForms
'            objektumn�v = accObj.Name
'            strFileName = strExportPath & mappa & RIC(accObj.Name) & ".txt"
'            konyvtarzo strExportPath & mappa
'            Application.SaveAsText acTable, objektumn�v, strFileName
'                                    logba , "�rlap neve:" & accObj.Name, 3
'        Next accObj
'T�blaszerkezet export
logba , "T�blaszerkezet-> SQL kezd�dik"
    mappa = "SQL\"
    strFileName = strExportPath & mappa & RIC(strDbNev) & "_" & "t�bl�k.sql" 'dif
    konyvtarzo strExportPath & mappa 'dif
    GenerateSQLBackup strFileName, db
    
    Set fso = Nothing
    Set db = Nothing
Exit Sub
    
    
ErrorHandler:
    MsgBox "An error occurred: " & Err.Description, vbExclamation
    
End Sub
Function f�gg�k(lekn�v)
Dim db As DAO.Database
Set db = CurrentDb
Dim qdf As QueryDef

    For Each qdf In db.QueryDefs
        If Not qdf.Name Like "~*" Then ' Exclude system queries
            If InStr(1, qdf.sql, lekn�v) Then
                f�gg�k = f�gg�k & qdf.Name & ","
            End If
        End If
    Next qdf
    f�gg�k = Left(f�gg�k, Len(f�gg�k) - 1)
End Function
Sub konyvtarzo(�tvonal As String)
'Ha a megadott k�nyvt�r nem l�tezik, akkor l�tre hoz egyet.
    If Dir(�tvonal, vbDirectory) = "" Then
        MkDir �tvonal
    End If
End Sub




Sub ExportImportSpecXMLToFile(importSpecName As String, exportFilePath As String)
    On Error GoTo ErrorHandler
    
    Dim db As Database
    Dim impSpec As ImportExportSpecification
    Dim xmlData As String
    Dim fileNumber As Integer
    
    ' Open the current database.
    Set db = CurrentDb
    
    ' Get the ImportExportSpecification object by name.
    'Set impSpec = db.ImportExportSpecifications(importSpecName)
    
    ' Get the XML data of the import specification.
    xmlData = impSpec.XML
    
    ' Create a new text file for export.
    fileNumber = FreeFile
    Open exportFilePath For Output As #fileNumber
    
    ' Write the XML data to the file.
    Print #fileNumber, xmlData
    
    ' Close the file.
    Close #fileNumber
    
    ' Display a success message.
    MsgBox "Import specification XML exported to " & exportFilePath, vbInformation + vbOKOnly, "Export Completed"
    
    Exit Sub
    
ErrorHandler:
    ' Display an error message if something goes wrong.
    MsgBox "Error: " & Err.Description, vbExclamation + vbOKOnly, "Error"
End Sub
Sub meghagy�sLek()
    Dim db As DAO.Database
    Dim qdf As DAO.QueryDef
    Dim strExportPath As String
    Dim mappa As String
    Dim strFileName As String
    Dim strDbNev As String 'az adatb�zis nev�nek
    Dim fso As Object
    Dim ts As Object

    Dim mentett As ImportExportSpecification

    strExportPath = "C:\Users\olahzolt\Desktop\F�jlok\Meghagy�s\"
    
    Set db = CurrentDb
    Set fso = CreateObject("Scripting.FileSystemObject")
    strDbNev = Replace(ffsplit(db.Name, "\", StrCount(db.Name, "\") + 1), ".accdb", "")
    strExportPath = strExportPath & Year(Date) & Right(Replace("0" & Month(Date), "00", "0"), 2) & Right(Replace("0" & Day(Date), "00", "0"), 2) & "\"
    
    konyvtarzo strExportPath
    
    'mappa = "lk\"
    strFileName = strExportPath & mappa & strDbNev & "_" & "lekerdezesek.sql"
    konyvtarzo strExportPath & mappa
    Set ts = fso.CreateTextFile(strFileName, True)
    For Each qdf In db.QueryDefs
    
        If qdf.Name Like "*eghagy�s*" Then
Debug.Print qdf.Name
            'ts.Writeline "#/#/#/"
            'ts.Writeline qdf.Name
            'ts.Writeline "#/#/"
            ts.writeline qdf.sql
        End If
    Next qdf
    ts.Close 'dif
    Set ts = Nothing 'dif
    Debug.Print "K�sz!"
End Sub


Public Sub ExportDatabaseObjects()
On Error GoTo Err_ExportDatabaseObjects
    
    Dim db As Database
    'Dim db As DAO.Database
    Dim td As TableDef
    Dim d As Document
    Dim c As Container
    Dim i As Integer
    Dim sExportLocation As String
    
    Set db = CurrentDb()
    
    sExportLocation = "C:\Users\olahzolt\Desktop\F�jlok\Ellen�rz�s\" 'Do not forget the closing back slash! ie: C:\Temp\
    
'    For Each td In db.TableDefs 'Tables
'        If Left(td.Name, 4) <> "MSys" Then
'            DoCmd.TransferText acExportDelim, , td.Name, sExportLocation & "Table_" & td.Name & ".txt", True, , 1250
'        End If
'    Next td
    
    Set c = db.Containers("Forms")
    For Each d In c.Documents
        Application.SaveAsText acForm, d.Name, sExportLocation & "Form_" & d.Name & ".txt"
    Next d
    
    Set c = db.Containers("Reports")
    For Each d In c.Documents
        Application.SaveAsText acReport, d.Name, sExportLocation & "Report_" & d.Name & ".txt"
    Next d
    
    Set c = db.Containers("Scripts")
    For Each d In c.Documents
        Application.SaveAsText acMacro, d.Name, sExportLocation & "Macro_" & d.Name & ".txt"
    Next d
    
    Set c = db.Containers("Modules")
    For Each d In c.Documents
        Application.SaveAsText acModule, d.Name, sExportLocation & "Module_" & d.Name & ".txt"
    Next d
    
    For i = 0 To db.QueryDefs.count - 1
        Application.SaveAsText acQuery, db.QueryDefs(i).Name, sExportLocation & "Query_" & db.QueryDefs(i).Name & ".txt"
    Next i
    
    Set db = Nothing
    Set c = Nothing
    
    MsgBox "All database objects have been exported as a text file to " & sExportLocation, vbInformation
    
Exit_ExportDatabaseObjects:
    Exit Sub
    
Err_ExportDatabaseObjects:
    If Err.Number = 32584 Then
        Debug.Print "Nem tal�lta a k�vetkez� objektumot:" & d.Name
        Resume Next
    End If
    If Err.Number = 3270 Then
        Debug.Print d.Name
        Resume Next
    End If
    MsgBox Err.Number & " - " & Err.Description
    Resume Exit_ExportDatabaseObjects
    
End Sub
Sub GenerateSQLBackup(f�jln�v As String, db As DAO.Database)
fvbe ("GenerateSQLBackup")
    'Dim db As DAO.Database
    Dim tbl As DAO.TableDef
    Dim fld As DAO.Field
    Dim idx As DAO.Index
    Dim rel As DAO.Relation
    Dim strSQL As String
    Dim folyt As Boolean
    Dim outputFile As Integer
    Dim sz�ml As Integer
    Dim ehj As New ehjoszt
    Dim el�z�szakasz As Long, _
        SzakaszSz�m As Long
    
    ' Set database
    'Set db = CurrentDb
    
    ' Specify the path for the output SQL file
    filePath = f�jln�v '"C:\path\to\your\backup.sql"
    outputFile = FreeFile
    
    ' Open the output file
    Open filePath For Output As outputFile
    folyt = False
    ehj.Ini 100
    ehj.oszlopszam = db.TableDefs.count
    el�z�szakasz = 0
    SzakaszSz�m = 8 '12,5%-konk�nt jelezz�k ki az �rt�ket
                                                                                                logba , ehj.oszlopszam & " db. t�bla beolvas�sa", 1
    ' Loop through all tables
    sz�ml = 0
    For Each tbl In db.TableDefs
        On Error GoTo Hiba
        logba , tbl.Indexes.count, 3
        On Error GoTo 0
        If folyt = True Then
            folyt = False
        Else
            ' Skip system and temporary tables
                                                                                                logba , tbl.Name & " nev� t�bla feldolgoz�sa megkezdve...", 1
            If Left(tbl.Name, 4) <> "MSys" And Left(tbl.Name, 1) <> "~" Then
                ' Create table SQL
                strSQL = "CREATE TABLE [" & tbl.Name & "] (" & vbCrLf
                
                ' Loop through all fields in the table
                
                For Each fld In tbl.Fields
                    strSQL = strSQL & "[" & fld.Name & "] " & GetFieldType(fld) & " " & _
                             IIf(fld.Required, "NOT NULL", "NULL") & "," & vbCrLf
                                                                                                logba , strSQL, 4
                Next fld
                                                                                                logba , "Fields:" & tbl.Fields.count, 3
                ' Remove the last comma and add closing parenthesis
                strSQL = Left(strSQL, Len(strSQL) - 3) & vbCrLf & ");" & vbCrLf
                
                ' Write SQL to file
                Print #outputFile, strSQL
                
                ' Add indexes
                logba , tbl.Name & " t�bla indexeinek sz�ma:" & tbl.Indexes.count, 3
                For Each idx In tbl.Indexes
                    If Not idx.Primary Then
                        strSQL = "CREATE INDEX [" & idx.Name & "] ON [" & tbl.Name & "] ("
                        For Each fld In idx.Fields
                            strSQL = strSQL & "[" & fld.Name & "],"
                        Next fld
                        strSQL = Left(strSQL, Len(strSQL) - 1) & ");" & vbCrLf
                        Print #outputFile, strSQL
                                                                                                logba , strSQL, 4
                    End If
                Next idx
                                                                                                logba , tbl.Indexes.count, 3
                ' Add primary key constraint
                sz�ml = 0
                For Each idx In tbl.Indexes
                    If idx.Primary Then
                        strSQL = "ALTER TABLE [" & tbl.Name & "] ADD CONSTRAINT [PK_" & tbl.Name & "] PRIMARY KEY ("
                        For Each fld In idx.Fields
                            strSQL = strSQL & "[" & fld.Name & "],"
                        Next fld
                        strSQL = Left(strSQL, Len(strSQL) - 1) & ");" & vbCrLf
                        Print #outputFile, strSQL
                        � sz�ml
                        logba , tbl.Name & " t�bl�nak a megszor�t� felt�telei ki�rva", 3
                    End If
                Next idx
                                                                                                logba , tbl.Name & " nev� t�bla szerkezete ki�rva. Indexek sz�ma:" & tbl.Indexes.count & "; megszor�t� felt�telek sz�ma:" & sz�ml
            End If
        End If
    ehj.Novel
        If Int(ehj.Value / ehj.oszlopszam * SzakaszSz�m) > el�z�szakasz Then
                                                                                                logba , accT�bla & ":;" & Int(ehj.Value / ehj.oszlopszam * 100) & "% elk�sz�lt...", 1
            el�z�szakasz = Int(ehj.Value / ehj.oszlopszam * SzakaszSz�m)
            DoEvents
        End If
    Next tbl
    'Debug.Print "Relations:",
    ' Add relationships (foreign keys)
    ehj.Ini
    ehj.oszlopszam = db.Relations.count
    sz�ml = 0
                                                                                                logba , "Kapcsolatok sz�ma:" & ehj.oszlopszam, 1
    For Each rel In db.Relations
        If rel.Attributes = 0 Then ' Ignore internal relationships
            strSQL = "ALTER TABLE [" & rel.Table & "] ADD CONSTRAINT [" & rel.Name & "] FOREIGN KEY ("
            For Each fld In rel.Fields
                strSQL = strSQL & "[" & fld.Name & "],"
            Next fld
            strSQL = Left(strSQL, Len(strSQL) - 1) & ") REFERENCES [" & rel.ForeignTable & "] ("
            For Each fld In rel.Fields
                strSQL = strSQL & "[" & fld.ForeignName & "],"
            Next fld
            strSQL = Left(strSQL, Len(strSQL) - 1) & ");" & vbCrLf
            Print #outputFile, strSQL
                                                                                                logba , strSQL, 4
        End If
        � sz�ml
        ehj.Novel
    
                                                                                                logba , "A ki�rt rel�ci�k sz�ma:" & sz�ml
        If Int(ehj.Value / ehj.oszlopszam * SzakaszSz�m) > el�z�szakasz Then
            logba , accT�bla & ":;" & Int(ehj.Value / ehj.oszlopszam * 100) & "% elk�sz�lt...", 1
            el�z�szakasz = Int(ehj.Value / ehj.oszlopszam * SzakaszSz�m)
            DoEvents
        End If
    Next rel
    � ehj.Value
    ' Close the file
    Close #outputFile
    
    ' Notify the user
    MsgBox "SQL backup created successfully at " & filePath
Exit Sub
Hiba:
    If Err.Number = 3044 Or Err.Number = 3110 Then
        folyt = True
        Resume Next
    End If

End Sub

' Function to determine the SQL data type based on Access field type
Function GetFieldType(fld As DAO.Field) As String
    Select Case fld.Type
        Case dbText
            GetFieldType = "TEXT(" & fld.Size & ")"
        Case dbMemo
            GetFieldType = "MEMO"
        Case dbByte
            GetFieldType = "BYTE"
        Case dbInteger
            GetFieldType = "SHORT"
        Case dbLong
            GetFieldType = "LONG"
        Case dbSingle
            GetFieldType = "SINGLE"
        Case dbDouble
            GetFieldType = "DOUBLE"
        Case dbCurrency
            GetFieldType = "CURRENCY"
        Case dbDate
            GetFieldType = "DATETIME"
        Case dbBoolean
            GetFieldType = "YESNO"
        Case dbDecimal
            GetFieldType = "DECIMAL" '(" & fld.Precision & "," & fld.Scale & ")"
        Case dbGUID
            GetFieldType = "GUID"
        Case dbBinary
            GetFieldType = "BINARY"
        Case Else
            GetFieldType = "UNKNOWN"
    End Select
End Function

