Option Compare Database
'Option Explicit
' Collection to hold open tables
Global Tables As New Collection
 
' GetTable() returns a table-type recordset by table name
'
Function GetTable( _
    TableName As String, _
    Optional Index As String = "PrimaryKey" _
    ) As DAO.Recordset

    Dim recT As Recordset
    Dim indx As Integer

    
    ' do we already have a recordset?
    For Each recT In Tables
        If recT.Name = TableName Then Exit For
    Next recT
    
    ' if not, open it and add it to the collection
    If recT Is Nothing Then

        Set recT = CurrentDb(TableName).OpenRecordset
        Tables.Add recT, recT.Name
    End If
    For indx = 0 To CurrentDb(TableName).Indexes.Count - 1
        If CurrentDb(TableName).Indexes(indx).Primary Then
            Index = CurrentDb(TableName).Indexes(indx).Name
        End If
    Next

    If Len(Index) Then recT.Index = Index
    Set GetTable = recT
    
End Function
Sub Ellenõrzés()
On Error GoTo Err_Ellenõrzés
    Dim db                  As Database
    Dim lkEll               As Recordset    'A soron következõ ellenõrzõ lekérdezés
    Dim sqlA                As String
    Dim lkEllLek, lkNév     As String
    Dim tEll                As String       'Az ellenõrzés tábla neve
    
    lkEllLek = "SELECT * FROM lkEllenõrzõLekérdezések WHERE azETípus = 1;"    'Ez a lekérdezés sorolja fel azokat a lekérdezéseket, amelyeket le kell futtatnunk.
    tEll = "t__Ellenõrzés_02"
    
    Set db = CurrentDb()
    db.Execute ("Delete * From " & tEll & ";") 'Kitöröljük a tábla tartalmát
    
    
    Set lkEll = db.OpenRecordset(lkEllLek)
    lkEll.MoveLast
    lkEll.MoveFirst
    ' A felsorolt lekérdezések lefuttatása
    sqlA = ""
    Do Until lkEll.EOF 'lk_Ellenõrzés_01.Tábla, lk_Ellenõrzés_01.Hiányzó_érték, lk_Ellenõrzés_01.Adóazonosító, lk_Ellenõrzés_01.[Álláshely azonosító], lk_Ellenõrzés_01.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Adóazonosító]*1 AS Adójel
        lkNév = lkEll("Name")
        sqlA = sqlA & " INSERT INTO " & tEll
        sqlA = sqlA & "      SELECT " & lkNév & ".Tábla," & lkNév & ".Hiányzó_érték," & lkNév & ".Adóazonosító," & _
                                   "" & lkNév & ".[Álláshely azonosító]," & lkNév & ".[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]," & lkNév & ".[Adóazonosító]*1 AS Adójel"
        sqlA = sqlA & "      FROM " & lkNév & ";"
        db.Execute (sqlA)
        
        Debug.Print sqlA
        sqlA = ""
        lkEll.MoveNext
    Loop
    'Az adóazonosító jel (szöveg) átalakítása adójel-lé (dupla szám)
    db.Execute (GetQuerySQL("lk_Ellenõrzés_02_táblába_adójelKonverzió"))
    DoCmd.OpenQuery "lk_Ellenõrzés_03"
    DoCmd.SelectObject acQuery, "lk_Ellenõrzés_03"

Err_Kimenet:
    Exit Sub
    
Err_Ellenõrzés:
    Select Case Err.Number
    Case 3417
        sqlA = GetQuerySQL(lkNév)
        Resume 0
    Case Else
        MsgBox Err.Number & Err.Description & lkNév
        Debug.Print Err.Number, Err.Description, sqlA
        Resume Next
    End Select
End Sub
Private Function GetQuerySQL(MyQueryName As String) As String
Dim QD As DAO.QueryDef
 
Set QD = CurrentDb.QueryDefs(MyQueryName)
GetQuerySQL = QD.sql
 
End Function


