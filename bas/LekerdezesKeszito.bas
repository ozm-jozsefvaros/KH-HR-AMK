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
Sub Ellen�rz�s()
On Error GoTo Err_Ellen�rz�s
    Dim db                  As Database
    Dim lkEll               As Recordset    'A soron k�vetkez� ellen�rz� lek�rdez�s
    Dim sqlA                As String
    Dim lkEllLek, lkN�v     As String
    Dim tEll                As String       'Az ellen�rz�s t�bla neve
    
    lkEllLek = "SELECT * FROM lkEllen�rz�Lek�rdez�sek WHERE azET�pus = 1;"    'Ez a lek�rdez�s sorolja fel azokat a lek�rdez�seket, amelyeket le kell futtatnunk.
    tEll = "t__Ellen�rz�s_02"
    
    Set db = CurrentDb()
    db.Execute ("Delete * From " & tEll & ";") 'Kit�r�lj�k a t�bla tartalm�t
    
    
    Set lkEll = db.OpenRecordset(lkEllLek)
    lkEll.MoveLast
    lkEll.MoveFirst
    ' A felsorolt lek�rdez�sek lefuttat�sa
    sqlA = ""
    Do Until lkEll.EOF 'lk_Ellen�rz�s_01.T�bla, lk_Ellen�rz�s_01.Hi�nyz�_�rt�k, lk_Ellen�rz�s_01.Ad�azonos�t�, lk_Ellen�rz�s_01.[�ll�shely azonos�t�], lk_Ellen�rz�s_01.[�NYR SZERVEZETI EGYS�G AZONOS�T�], [Ad�azonos�t�]*1 AS Ad�jel
        lkN�v = lkEll("Name")
        sqlA = sqlA & " INSERT INTO " & tEll
        sqlA = sqlA & "      SELECT " & lkN�v & ".T�bla," & lkN�v & ".Hi�nyz�_�rt�k," & lkN�v & ".Ad�azonos�t�," & _
                                   "" & lkN�v & ".[�ll�shely azonos�t�]," & lkN�v & ".[�NYR SZERVEZETI EGYS�G AZONOS�T�]," & lkN�v & ".[Ad�azonos�t�]*1 AS Ad�jel"
        sqlA = sqlA & "      FROM " & lkN�v & ";"
        db.Execute (sqlA)
        
        Debug.Print sqlA
        sqlA = ""
        lkEll.MoveNext
    Loop
    'Az ad�azonos�t� jel (sz�veg) �talak�t�sa ad�jel-l� (dupla sz�m)
    db.Execute (GetQuerySQL("lk_Ellen�rz�s_02_t�bl�ba_ad�jelKonverzi�"))
    DoCmd.OpenQuery "lk_Ellen�rz�s_03"
    DoCmd.SelectObject acQuery, "lk_Ellen�rz�s_03"

Err_Kimenet:
    Exit Sub
    
Err_Ellen�rz�s:
    Select Case Err.Number
    Case 3417
        sqlA = GetQuerySQL(lkN�v)
        Resume 0
    Case Else
        MsgBox Err.Number & Err.Description & lkN�v
        Debug.Print Err.Number, Err.Description, sqlA
        Resume Next
    End Select
End Sub
Private Function GetQuerySQL(MyQueryName As String) As String
Dim QD As DAO.QueryDef
 
Set QD = CurrentDb.QueryDefs(MyQueryName)
GetQuerySQL = QD.sql
 
End Function


