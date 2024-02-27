Option Compare Database
'# Ez a modul tartalmazza az idegen forrásból vett, esetleg átalakított kódokat
Public Function RIC(ByVal strSzöveg As String, Optional strHely As Variant = "_") As String 'Optional: OZ
'Forrás: https://www.access-programmers.co.uk/forums/threads/remove-special-characters-from-file-name-when-saving.261147/
'Licencia: MIT Oláh Zoltán 2022 (c)
    strHely = Nz(strHely, "_") 'OZ
    Const cstrTiltott As String = "\,/,:,*,?,"",<,>,|, ,;,(,),.,-,=,"
    
    Dim lnSzámláló As Long
    Dim aTiltottak() As String
    
    aTiltottak() = Split(cstrTiltott, ",")
    
    For lnSzámláló = LBound(aTiltottak()) To UBound(aTiltottak())
        strSzöveg = Replace(strSzöveg, aTiltottak(lnSzámláló), strHely)
    Next lnSzámláló
    strSzöveg = Replace(strSzöveg, ",", strHely)
    RIC = strSzöveg

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
' ********** Code Start **************
'This code was originally written by Dev Ashish
'It is not to be altered or distributed,
'except as part of an application.
'You are free to use it in any application,
'provided the copyright notice is left unchanged.
'
'Code Courtesy of
'Dev Ashish
'
Public Function Kerekít( _
    ByVal Number As Variant, _
    Optional NumDigits As Long = 0, _
    Optional UseBankersRounding As Boolean = False) As Double
'
' ---------------------------------------------------
' From "Visual Basic Language Developer's Handbook"
' by Ken Getz and Mike Gilbert
' Copyright 2000; Sybex, Inc. All rights reserved.
' ---------------------------------------------------
'
  Dim dblPower As Double
  Dim varTemp As Variant
  Dim intSgn As Integer

  If Not IsNumeric(Number) Then
    ' Raise an error indicating that
    ' you've supplied an invalid parameter.
    Err.Raise 5
  End If
  dblPower = 10 ^ NumDigits
  ' Is this a negative number, or not?
  ' intSgn will contain -1, 0, or 1.
  intSgn = Sgn(Number)
  Number = Abs(Number)

  ' Do the major calculation.
  varTemp = CDec(Number) * dblPower + 0.5
  
  ' Now round to nearest even, if necessary.
  If UseBankersRounding Then
    If Int(varTemp) = varTemp Then
      ' You could also use:
      ' varTemp = varTemp + (varTemp Mod 2 = 1)
      ' instead of the next If ...Then statement,
      ' but I hate counting on TRue == -1 in code.
      If varTemp Mod 2 = 1 Then
        varTemp = varTemp - 1
      End If
    End If
  End If
  ' Finish the calculation.
  Kerek = intSgn * Int(varTemp) / dblPower
End Function
' ********** Code End **************
Public Function TableExists(ByVal strTableName As String, Optional ysnRefresh As Boolean, Optional db As DAO.Database) As Boolean
    ' Originally Based on Tony Toews function in TempTables.MDB, http://www.granite.ab.ca/access/temptables.htm
    ' Based on testing, when passed an existing database variable, this is the fastest
    On Error GoTo errHandler
      Dim tdf As DAO.TableDef
    
      If db Is Nothing Then Set db = CurrentDb()
      If ysnRefresh Then db.TableDefs.Refresh
      Set tdf = db(strTableName)
      TableExists = True
    
exitRoutine:
      Set tdf = Nothing
      Exit Function
    
errHandler:
      Select Case Err.Number
        Case 3265
          TableExists = False
        Case Else
          MsgBox Err.Number & ": " & Err.Description, vbCritical, "Error in mdlBackup.TableExists()"
      End Select
      Resume exitRoutine
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