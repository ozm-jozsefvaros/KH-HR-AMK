Public Sub ExportQueriesAndProceduresToFiles()
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
'   Dim mdls As Modules
    
'   On Error GoTo ErrorHandler
    
    ' Set the export path where the files will be saved
    strExportPath = "C:\Users\olahzolt\Desktop\F�jlok\Ellen�rz�s\" ' Change this to your desired export path
    
    Set db = CurrentDb
    Set fso = CreateObject("Scripting.FileSystemObject")
    strDbNev = Replace(ffsplit(db.Name, "\", StrCount(db.Name, "\") + 1), ".accdb", "")
    strExportPath = strExportPath & strDbNev & Year(Date) & Right(Replace("0" & Month(Date), "00", "0"), 2) & Right(Replace("0" & Day(Date), "00", "0"), 2) & "\"
    
    konyvtarzo strExportPath
    
    
    ' Loop through all queries
    mappa = "lk\"
    For Each qdf In db.QueryDefs
        If Not qdf.Name Like "~*" Then ' Exclude system queries
            konyvtarzo strExportPath & mappa
            strFileName = strExportPath & mappa & qdf.Name & ".sql"
            Set ts = fso.CreateTextFile(strFileName, True)
            ts.Write qdf.sql
            ts.Close
            Set ts = Nothing
        End If
    Next qdf
    
    ' Loop through all modules (using Application.Modules collection)
    mappa = "bas\"

    For i = 0 To Application.Modules.Count - 1 ' mdl In Application.Modules
        Set mdl = Application.Modules(i)
        If Not mdl.Name Like "msys*" Then ' Exclude system modules
            konyvtarzo strExportPath & mappa
            strFileName = strExportPath & mappa & mdl.Name & ".bas"
            Set ts = fso.CreateTextFile(strFileName, True)
            ts.Write mdl.Lines(1, mdl.CountOfLines)
            ts.Close
            Set ts = Nothing
        End If
    Next i
    
    'Mentett ExportImport-ok ki�rat�sa
    mappa = "XML\"
    For i = 0 To CurrentProject.ImportExportSpecifications.Count - 1
        Set mentett = CurrentProject.ImportExportSpecifications.Item(i)
        With mentett
            konyvtarzo strExportPath & mappa
            strFileName = strExportPath & mappa & .Name & ".XML"
            Set ts = fso.CreateTextFile(strFileName, True)
            ts.Write .XML
            ts.Close
            Set ts = Nothing
        End With
    Next i
    Set fso = Nothing
    Set db = Nothing
    
    MsgBox "Queries and Procedures have been exported to files.", vbInformation
    
    Exit Sub
    
ErrorHandler:
    MsgBox "An error occurred: " & Err.Description, vbExclamation
    
End Sub
Sub konyvtarzo(�tvonal As String)
'Ha a megadott k�nyvt�r nem l�tezik, akkor l�tre hoz egyet.
    If Dir(�tvonal, vbDirectory) = "" Then
        MkDir �tvonal
    End If
End Sub
Sub pr�ba02()
    Dim sor, oszlop As Integer
    Dim ehj As New ehjoszt
    Dim El�z�Szakasz As Integer
    
    ehj.Ini
    ehj.OszlopSzam = 14
    ehj.SzakaszSz�m = 5
    'Debug.Print ehj.SzakaszSz�m, ehj.JelenlegiSzakasz
    For i = 0 To ehj.OszlopSzam - 1
        ehj.Novel
        If ehj.JelenlegiSzakasz > El�z�Szakasz Then
            'Debug.Print Round(ehj.JelenlegiSzakasz / ehj.SzakaszSz�m * 100, 0)
            El�z�Szakasz = ehj.JelenlegiSzakasz
        End If
        v�rakoz�s
    Next i
    ehj.Torol
End Sub
Sub v�rakoz�s(Optional mp As Integer = 1)
'M�sodpercben megadott ideig v�rakozik
Dim tMost As Variant
    tV�r = Time
    tV�r = DateAdd("s", mp, tV�r)
    Do Until tMost >= tV�r
        tMost = Time
    Loop
End Sub

Sub tAdatv�ltoztat�siIg�nyekXML()
'Dim a As String
'    a = "<?xml version=""1.0""?>" & Chr(13) + Chr(10)
'    a = a & "<ImportExportSpecification Path=""L:\Ugyintezok\Adatszolg�ltat�k\Alapadatok\Elb�r�latlan ig�nyek (Adatv�ltoz�sok)\Adatv�ltoz�si ig�nyek (14).xlsx"" xmlns=""urn:www.microsoft.com/office/access/imexspec"">" & Chr(13) + Chr(10)
'    a = a & "    <ImportExcel FirstRowHasNames=""true"" Destination=""tAdatv�ltoztat�siIg�nyek"" Range=""Sheet1$"">" & Chr(13) + Chr(10)
'    a = a & "        <Columns PrimaryKey=""{Auto}"">" & Chr(13) + Chr(10)
'    a = a & "           <Column Name=""Col1"" FieldName=""Dolgoz� neve"" Indexed=""NO"" SkipColumn=""false"" DataType=""Text""/>" & Chr(13) + Chr(10)
'    a = a & "           <Column Name=""Col2"" FieldName=""Ad�azonos�t� jel"" Indexed=""YESDUPLICATES"" SkipColumn=""false"" DataType=""Text""/>" & Chr(13) + Chr(10)
'    a = a & "           <Column Name=""Col3"" FieldName=""Egyedi azonos�t�"" Indexed=""NO"" SkipColumn=""true"" DataType=""Text""/>" & Chr(13) + Chr(10)
'    a = a & "           <Column Name=""Col4"" FieldName=""Adatk�r"" Indexed=""NO"" SkipColumn=""false"" DataType=""Text""/>" & Chr(13) + Chr(10)
'    a = a & "           <Column Name=""Col5"" FieldName=""Ig�ny d�tuma"" Indexed=""NO"" SkipColumn=""false"" DataType=""Text""/>" & Chr(13) + Chr(10)
'    a = a & "           <Column Name=""Col6"" FieldName=""�llapot"" Indexed=""NO"" SkipColumn=""false"" DataType=""Text""/>" & Chr(13) + Chr(10)
'    a = a & "           <Column Name=""Col7"" FieldName=""Elb�r�l�s d�tuma"" Indexed=""NO"" SkipColumn=""false"" DataType=""Text""/>" & Chr(13) + Chr(10)
'    a = a & "           <Column Name=""Col8"" FieldName=""Elb�r�l�"" Indexed=""NO"" SkipColumn=""false"" DataType=""Text""/>" & Chr(13) + Chr(10)
'    a = a & "        </Columns>" & Chr(13) + Chr(10)
'    a = a & "    </ImportExcel>" & Chr(13) + Chr(10)
'    a = a & "</ImportExportSpecification>" & Chr(13) + Chr(10)
'    CurrentProject.ImportExportSpecifications("Adatv�ltoz�si ig�nyek").XML = a
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