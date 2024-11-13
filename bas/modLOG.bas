'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Public logconn As ADODB.Connection
Public logrst As ADODB.Recordset
Public logTmpRst As DAO.Recordset
Public Const logpath = "L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Háttértárak\log.accdb"
Public dbnév As String
Public FolyamatHASH As String
Public colFvNév As New Collection
Public Const intLoglevel As Integer = 2 'Logolás szintje: 0 = Hiba;
                                                         '1 = felhasználói tájékoztatás;
                                                         '2 = fõbb folyamat események;
                                                         '3 = hibakeresés 1. fok;
                                                         '4 = fv. szintû hibakeresés
Public Const sNB = "Nincs bejegyzés"
Public Flush As Boolean
Private Type GUID_TYPE
    Data1 As Long
    Data2 As Integer
    Data3 As Integer
    Data4(7) As Byte
End Type
#If VBA7 Then
    Private Declare PtrSafe Function CoCreateGuid Lib "ole32.dll" (guid As GUID_TYPE) As LongPtr
    Private Declare PtrSafe Function StringFromGUID2 Lib "ole32.dll" (guid As GUID_TYPE, ByVal lpStrGuid As LongPtr, ByVal cbMax As Long) As LongPtr
#Else
    Private Declare Function CoCreateGuid Lib "ole32.dll" (guid As GUID_TYPE) As Long
    Private Declare Function StringFromGUID2 Lib "ole32.dll" (guid As GUID_TYPE, ByVal lpStrGuid As Long, ByVal cbMax As Long) As Long
#End If
#If VBA7 Then
    ' For 64-bit systems
    Private Declare PtrSafe Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
#Else
    ' For 32-bit systems
    Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
#End If

Const ozAccessCollision As Integer = 5
Const intKiir As Integer = 20  ' Number of records to write in a batch (preset)
Public colLogba() As Collection  ' Array of collections to hold log data
Public intSzamlalo As Integer


Function CreateGuidString()
    Dim guid As GUID_TYPE
    Dim strGuid As String
    #If VBA7 Then
        Dim retValue As LongPtr
    #Else
        Dim retValue As Long
    #End If
    Const guidLength As Long = 39 'registry GUID format with null terminator {xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}

    retValue = CoCreateGuid(guid)
    If retValue = 0 Then
        strGuid = String$(guidLength, vbNullChar)
        retValue = StringFromGUID2(guid, StrPtr(strGuid), guidLength)
        If retValue = guidLength Then
            ' valid GUID as a string
            CreateGuidString = strGuid
        End If
    End If
End Function
Sub fvbe(fvnév As String)
    If intLoglevel > 1 Then
        If fvnév = "" Then fvnév = "-"
        If colFvNév.count = 0 Then
            colFvNév.Add item:=fvnév
        Else
            colFvNév.Add item:=fvnév, before:=1
        End If
        If intLoglevel > 3 Then
            logba , "belépés", 4
        End If
    End If
End Sub
Function sFN() As String
If colFvNév.count < 1 Then
    sFN = vbNullString
    Exit Function
End If
    If intLoglevel > 1 Then
        sFN = colFvNév.item(1)
    Else
        sFN = vbNullString
    End If
End Function
Sub fvki()
If colFvNév.count < 1 Then Exit Sub
    If intLoglevel > 1 Then
        colFvNév.Remove 1
        If intLoglevel > 3 Then
            logba , "kilépés", 4
        End If
    End If
End Sub

Sub sFoly(Ûrlap As Form, Üzenet As String, Optional idõtis As Boolean = True, Optional loglevel As Integer = 1)
'#MIT Oláh Zoltán (2023)
    Dim a As Boolean
    a = Foly(Ûrlap, Üzenet, idõtis)
End Sub
Function Foly(Ûrlap As Form, Üzenet As String, Optional idõtis As Boolean = True, Optional loglevel As Integer = 1) As Boolean
'#MIT Oláh Zoltán (2023)
Dim x
Dim most As Date
most = Now()
'Elõször a logtáblába írjuk ki
 logba ffsplit(Üzenet, ";", 1), ffsplit(Üzenet, ";", 2), loglevel
If loglevel = 1 Then
'Azután a log listába
    If idõtis Then
        If StrCount(Üzenet, ";") = 1 And Ûrlap.Folyamat.ListCount = 0 Then
            Üzenet = Üzenet & "; Idõpont"
        Else
            If StrCount(Üzenet, ";") = 1 Then
                Üzenet = Üzenet & "; " & most
            End If
        End If
    End If
    Ûrlap.Folyamat.AddItem item:=Üzenet
    Ûrlap.Repaint
    Ûrlap.Folyamat.Selected(Ûrlap.Folyamat.ListCount - 1) = True
    Ûrlap.Folyamat.Requery
End If
    'DoEvents

End Function
Sub loginit()
Dim új As Boolean
Dim i As Integer
új = False
    If logconn Is Nothing Then
        Set logconn = New ADODB.Connection 'OpenDatabase(logpath)
        logconn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & logpath
        logconn.Open
        logconn.CursorLocation = adUseClient
        új = True
    End If
    If logrst Is Nothing Then
        Set logrst = New ADODB.Recordset
        logrst.Open "Select * From [tlog]", logconn, adOpenForwardOnly, adLockBatchOptimistic
        új = True
    End If
        dbnév = CurrentDb.Name
    'Ideiglenes tábla, ami csak a memóriában létezik
    If logTmpRst Is Nothing Then
        CreateTempTableFromPersistentTable 'Ebbe fogjuk írni az üzeneteket, s innen írjuk majd ki õket egy kupacban
        Set logTmpRst = CurrentDb.OpenRecordset("Select * From [tTmpLog] Where 1=0;", dbOpenDynaset) 'Egy 0 soros tábla jön létre, amibe lehet írni, és amibõl lehet olvasni.
    End If
    If FolyamatHASH = vbNullString Then
        FolyamatHASH = CreateGuidString()
        új = True
    End If
    If új Then: logba "Log:", "Indul", 4
        intSzamlalo = 0
    
End Sub

Sub logba(Optional BejegyzésTárgya As String = vbNullString, Optional Bejegyzés As String = sNB, Optional logszint As Integer = 1)
Dim legkorábbiBejegyzés As Date

If logszint > intLoglevel Then Exit Sub
    Call loginit
    
    If BejegyzésTárgya = vbNullString Then
        If sFN = vbNullString Then
            BejegyzésTárgya = dbnév
        Else
            BejegyzésTárgya = sFN
        End If
    End If
    With logTmpRst
        .AddNew
            !BejegyzésTárgya = BejegyzésTárgya
            !Bejegyzés = Bejegyzés
            ![bejegyzés idõpontja] = Now()
            !FolyamatHASH = FolyamatHASH
            !felhasználó = Environ("Username")
            !számítógép = Environ("Computername")
            !adatbázis = dbnév
            !logszint = logszint
        .Update
        .Sort = "[bejegyzés idõpontja]"
        .MoveFirst
        legkorábbiBejegyzés = ![bejegyzés idõpontja]
        Debug.Print legkorábbiBejegyzés
    End With

    If logTmpRst.RecordCount >= intKiir Or DateDiff("s", legkorábbiBejegyzés, Now()) > 5 Or Flush Then
        Debug.Print "Kiíró"
        logkiíró
    End If
    
End Sub
Sub logkiíró()
    Const maxpróbálkozás = 5
    Const késleltetés = 100 'ms-ban
    Dim próbálkozás As Integer
    Dim i As Integer
On Error GoTo Hibapont
Kezd:
    logconn.BeginTrans
    
    logTmpRst.MoveFirst
    Do Until logTmpRst.EOF
        With logTmpRst
            logrst.AddNew
            logrst![BejegyzésTárgya] = ![BejegyzésTárgya]
            logrst![Bejegyzés] = ![Bejegyzés]
            logrst![bejegyzés idõpontja] = ![bejegyzés idõpontja]
            logrst![FolyamatHASH] = ![FolyamatHASH]
            logrst![felhasználó] = ![felhasználó]
            logrst![számítógép] = ![számítógép]
            logrst![adatbázis] = ![adatbázis]
            logrst![logszint] = ![logszint]
            logrst.Update
            .MoveNext
        End With
    Loop
    logconn.CommitTrans
    logrst.UpdateBatch adAffectAllChapters 'Ha itt ütközik egy másik kiírással, akkor a Hibapont-tól folytatja
    Debug.Print "Commit"
        'Kiürítjük
        With logTmpRst
            .MoveFirst
            Debug.Print "Töröl"
            Do Until .EOF
                .Delete
                .MoveNext
            Loop
        End With
    intSzamlalo = 0
    Flush = False
Ki:
Exit Sub
Hibapont:
Debug.Print "Err.Number"
    If Err.Number = ozAccessCollision Then 'Ütközés esetén
    
        If próbálkozás < maxpróbálkozás Then 'újra próbálkozunk
            startTime = Timer
            Do While Timer < startTime + (késleltetés / 1000)
                DoEvents
            Loop
            'Sleep késleltetés '
            logconn.RollbackTrans
            ÷ próbálkozás 'Eggyel növeljük, mint a C++. Zárójelet nem teszünk!
            Resume Kezd
        Else
            GoTo Ki 'elértük a próbálkozások megengedett számát, továbblépünk. Majd máskor kiírjuk, nemde?
        End If
    Else
        MsgBox Err.Number & " :" & Err.Description
        GoTo Ki
        
    End If
    
End Sub

Sub logclose()
On Error GoTo Hiba
Dim Huba As Integer
    If Not logrst Is Nothing Then
        logba "Log:", "lezár"
        Set logrst = Nothing
        If Not logrst Is Nothing Then Err.Raise 999
    End If
    If Not logconn Is Nothing Then
        Set logconn = Nothing
        If Not logconn Is Nothing Then Err.Raise 998
    End If
    If FolyamatHASH <> vbNullString Then
        FolyamatHASH = vbNullString
    End If
    
Hiba:
    If Err.Number = 999 Then
        logba "Log:", "A logtábla nem zárható!", 0
        Huba = 999
        Resume Next
    End If
    If Err.Number = 998 Then
        If Huba = 999 Then
            logba "Log:", "A logkapcsolat sem zárható!", 0
            MsgBox "A logtábla és a logkapcsolat nem zárható!", , "Log:"
        Else
            MsgBox "A logtábla zárása sikerült, de a logkapcsolat nem zárható!", , "Log:"
        End If
        Resume Next
    End If
End Sub

'_________________________________________________________________________________________________________
'#########################################################################################################
'###################                                                                       ###############
'###################            ITT létrehozzuk az ideiglenes táblát                       ###############
'###################                                                                       ###############
'#########################################################################################################
'^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
'Forrás: chatopenAI
Sub CreateTempTableFromPersistentTable()
    Dim db As DAO.Database
    Dim rsTemp As DAO.Recordset
    Dim cn As ADODB.Connection
    Dim rsPersistent As ADODB.Recordset
    Dim fld As ADODB.Field
    Dim tableName As String
    Dim tempTableName As String
    Dim createTableSQL As String

    tableName = "tLog"
    tempTableName = "tTmpLog" ' ideiglenes tábla

    Set db = CurrentDb
    If TableExists(tempTableName) Then
        db.Execute "DROP TABLE " & tempTableName
    End If
    
    Set rsPersistent = New ADODB.Recordset
    rsPersistent.Open tableName, logconn, adOpenStatic, adLockReadOnly
    createTableSQL = "CREATE TABLE " & tempTableName & " ("

    For Each fld In rsPersistent.Fields
        createTableSQL = createTableSQL & "[" & fld.Name & "] " & GetFieldType(fld) & ", "
    Next fld

    createTableSQL = Left(createTableSQL, Len(createTableSQL) - 2) & ")"

    db.Execute createTableSQL

    rsPersistent.Close
    Set rsPersistent = Nothing
    Set cn = Nothing
    Set db = Nothing

    Debug.Print "Temporary table created successfully."
End Sub

Function GetFieldType(fld As ADODB.Field) As String
    Select Case fld.Type
        Case adBigInt: GetFieldType = "BIGINT"
        Case adBinary: GetFieldType = "BINARY"
        Case adBoolean: GetFieldType = "YESNO"
        Case adChar: GetFieldType = "CHAR(" & fld.DefinedSize & ")"
        Case adCurrency: GetFieldType = "CURRENCY"
        Case adDate: GetFieldType = "DATETIME"
        Case adDBDate: GetFieldType = "DATETIME"
        Case adDBTime: GetFieldType = "DATETIME"
        Case adDBTimeStamp: GetFieldType = "DATETIME"
        Case adDecimal: GetFieldType = "DECIMAL"
        Case adDouble: GetFieldType = "DOUBLE"
        Case adGUID: GetFieldType = "GUID"
        Case adInteger: GetFieldType = "INTEGER"
        Case adLongVarBinary: GetFieldType = "LONGBINARY"
        Case adLongVarChar: GetFieldType = "LONGTEXT"
        Case adNumeric: GetFieldType = "NUMERIC"
        Case adSingle: GetFieldType = "SINGLE"
        Case adSmallInt: GetFieldType = "SMALLINT"
        Case adTinyInt: GetFieldType = "BYTE"
        Case adUnsignedBigInt: GetFieldType = "UNSIGNED BIG INT"
        Case adUnsignedInt: GetFieldType = "UNSIGNED INT"
        Case adUnsignedSmallInt: GetFieldType = "UNSIGNED SMALL INT"
        Case adUnsignedTinyInt: GetFieldType = "BYTE"
        Case adVarBinary: GetFieldType = "VARBINARY"
        Case adVarChar: GetFieldType = "TEXT(" & fld.DefinedSize & ")"
        Case adVariant: GetFieldType = "VARIANT"
        Case adVarWChar: GetFieldType = "TEXT(" & fld.DefinedSize & ")"
        Case adWChar: GetFieldType = "TEXT(" & fld.DefinedSize & ")"
        Case Else: GetFieldType = "TEXT(255)" ' Default to TEXT if the type is unknown
    End Select
End Function

