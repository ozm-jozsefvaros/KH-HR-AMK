Public Sub ExportQueriesAndProceduresToFiles()
    Dim db As DAO.Database
    Dim qdf As DAO.QueryDef
    Dim strExportPath As String
    Dim mappa As String
    Dim strFileName As String
    Dim fso As Object
    Dim ts As Object
    Dim con As Object ' Container for modules
    Dim mdl As Object ' Module
  '  Dim mdls As Modules
    
'    On Error GoTo ErrorHandler
    
    ' Set the export path where the files will be saved
    strExportPath = "C:\Users\olahzolt\Desktop\Fájlok\" ' Change this to your desired export path
    
    Set db = CurrentDb
    Set fso = CreateObject("Scripting.FileSystemObject")
    
    ' Loop through all queries
    mappa = "lk\"
    For Each qdf In db.QueryDefs
        If Not qdf.Name Like "~*" Then ' Exclude system queries
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
            strFileName = strExportPath & mappa & mdl.Name & ".bas"
            Set ts = fso.CreateTextFile(strFileName, True)
            ts.Write mdl.Lines(1, mdl.CountOfLines)
            ts.Close
            Set ts = Nothing
        End If
    Next i
    
    Set fso = Nothing
    Set db = Nothing
    
    MsgBox "Queries and Procedures have been exported to files.", vbInformation
    
    Exit Sub
    
ErrorHandler:
    MsgBox "An error occurred: " & Err.Description, vbExclamation
    
End Sub

Public Sub ExportFunctionsAndSubsToFiles()
    Dim strExportPath As String
    Dim fso As Object
    Dim ts As Object
    Dim mdl As Module ' Module
    Dim procName As String
    Dim codeLine As String
    Dim isInsideProc As Boolean
    
    On Error GoTo ErrorHandler
    
    ' Set the export path where the files will be saved
    strExportPath = "C:\Users\olahzolt\Desktop\FvFájlok\" ' Change this to your desired export path
    
    Set fso = CreateObject("Scripting.FileSystemObject")
    
    ' Loop through all modules (using Application.Modules collection)
    For Each mdl In Application.Modules
        If Not mdl.Name Like "msys*" Then ' Exclude system modules
            Set ts = Nothing
            isInsideProc = False
            procName = ""
            For i = 1 To mdl.CountOfLines
                codeLine = mdl.Lines(i, 1)
                If Trim(codeLine) <> "" Then
                    If Left(Trim(codeLine), 10) = "Sub " Or Left(Trim(codeLine), 9) = "Function " Then
                        isInsideProc = True
                        procName = Mid(codeLine, 5)
                        procName = Left(procName, Len(procName) - 1) ' Remove the closing parenthesis
                        strFileName = strExportPath & procName & ".txt"
                        Set ts = fso.CreateTextFile(strFileName, True)
                    End If
                    If isInsideProc And Not Left(Trim(codeLine), 9) = "End Sub" And Not Left(Trim(codeLine), 12) = "End Function" Then
                        ts.WriteLine codeLine
                    End If
                    If (Left(Trim(codeLine), 9) = "End Sub" Or Left(Trim(codeLine), 12) = "End Function") And isInsideProc Then
                        isInsideProc = False
                        ts.Close
                        Set ts = Nothing
                    End If
                End If
            Next i
        End If
    Next mdl
    
    Set fso = Nothing
    
    MsgBox "Functions and Subs have been exported to files.", vbInformation
    
    Exit Sub
    
ErrorHandler:
    MsgBox "An error occurred: " & Err.Description, vbExclamation
End Sub