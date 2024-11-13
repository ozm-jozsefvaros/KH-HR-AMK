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

        Select Case Asc(Mid(Str, i, 1))
            Case 1 To 31
                cleanString = Left(cleanString, i - 1) & Mid(cleanString, i + 1)
            Case Else
                
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
Function FieldTypeName(fld As DAO.Field) As String
    'Purpose: Converts the numeric results of DAO Field.Type to text.
    'Provided by Allen Browne.  Last updated: April 2010.
    'Forrás: http://allenbrowne.com/func-06.html
    Dim strReturn As String    'Name to return

    Select Case CLng(fld.Type) 'fld.Type is Integer, but constants are Long.
        Case dbBoolean: strReturn = "Yes/No"            ' 1
        Case dbByte: strReturn = "Byte"                 ' 2
        Case dbInteger: strReturn = "Integer"           ' 3
        Case dbLong                                     ' 4
            If (fld.Attributes And dbAutoIncrField) = 0& Then
                strReturn = "Long Integer"
            Else
                strReturn = "AutoNumber"
            End If
        Case dbCurrency: strReturn = "Currency"         ' 5
        Case dbSingle: strReturn = "Single"             ' 6
        Case dbDouble: strReturn = "Double"             ' 7
        Case dbDate: strReturn = "DateTime"            ' 8
        Case dbBinary: strReturn = "Binary"             ' 9 (no interface)
        Case dbText                                     '10
            If (fld.Attributes And dbFixedField) = 0& Then
                strReturn = "Text"
            Else
                strReturn = "Text (fixed width)"        '(no interface)
            End If
        Case dbLongBinary: strReturn = "OLE Object"     '11
        Case dbMemo                                     '12
            If (fld.Attributes And dbHyperlinkField) = 0& Then
                strReturn = "Memo"
            Else
                strReturn = "Hyperlink"
            End If
        Case dbGUID: strReturn = "GUID"                 '15

        'Attached tables only: cannot create these in JET.
        Case dbBigInt: strReturn = "Big Integer"        '16
        Case dbVarBinary: strReturn = "VarBinary"       '17
        Case dbChar: strReturn = "Char"                 '18
        Case dbNumeric: strReturn = "Numeric"           '19
        Case dbDecimal: strReturn = "Decimal"           '20
        Case dbFloat: strReturn = "Float"               '21
        Case dbTime: strReturn = "Time"                 '22
        Case dbTimeStamp: strReturn = "Time Stamp"      '23

        'Constants for complex types don't work prior to Access 2007 and later.
        Case 101&: strReturn = "Attachment"         'dbAttachment
        Case 102&: strReturn = "Complex Byte"       'dbComplexByte
        Case 103&: strReturn = "Complex Integer"    'dbComplexInteger
        Case 104&: strReturn = "Complex Long"       'dbComplexLong
        Case 105&: strReturn = "Complex Single"     'dbComplexSingle
        Case 106&: strReturn = "Complex Double"     'dbComplexDouble
        Case 107&: strReturn = "Complex GUID"       'dbComplexGUID
        Case 108&: strReturn = "Complex Decimal"    'dbComplexDecimal
        Case 109&: strReturn = "Complex Text"       'dbComplexText
        Case Else: strReturn = "Field type " & fld.Type & " unknown"
    End Select

    FieldTypeName = strReturn
End Function
