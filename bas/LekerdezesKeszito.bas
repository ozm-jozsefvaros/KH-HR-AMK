Option Compare Database
'Option Explicit
' Collection to hold open tables
'Global Tables As New Collection
 
' GetTable() returns a table-type recordset by table name
'
'Function GetTable( _
'    TableName As String, _
'    Optional Index As String = "PrimaryKey" _
'    ) As DAO.Recordset
'
'    Dim recT As Recordset
'    Dim indx As Integer
'
'
'    ' do we already have a recordset?
'    For Each recT In Tables
'        If recT.Name = TableName Then Exit For
'    Next recT
'
'    ' if not, open it and add it to the collection
'    If recT Is Nothing Then
'
'        Set recT = CurrentDb(TableName).OpenRecordset
'        Tables.Add recT, recT.Name
'    End If
'    For indx = 0 To CurrentDb(TableName).Indexes.Count - 1
'        If CurrentDb(TableName).Indexes(indx).Primary Then
'            Index = CurrentDb(TableName).Indexes(indx).Name
'        End If
'    Next
'
'    If Len(Index) Then recT.Index = Index
'    Set GetTable = recT
'
'End Function

Sub Ellenõrzés1(ByVal Ûrlapnév As String)
' Ez a fv. az adathiány lekérdezéseket futtatja (azETípus=1 vagyis Hiba)
' és a tEll változóban tárolt nevû táblába írja az eredményt,
' majd a végén megnyitja az eredményt

'On Error GoTo Err_Ellenõrzés
    Dim db                  As Database
    Dim lkEll               As Recordset    'A soron következõ ellenõrzõ lekérdezés
    Dim sqlA                As String
    Dim lkEllLek, lkNév     As String
    Dim tEll                As String       'Az ellenõrzés tábla neve
'    Dim lkEredm             As String       'Az eredmény lekérdezés neve
    Dim ûrl                 As Form
    Set ûrl = Application.Forms(Ûrlap)
    lkEllLek = "SELECT * FROM lkEllenõrzõLekérdezések WHERE azETípus = 1 AND Kimenet = False;"    'Ez a lekérdezés sorolja fel azokat a lekérdezéseket, amelyeket le kell futtatnunk.
    tEll = "t__Ellenõrzés_02"
'    lkEredm = "lk_Ellenõrzés_03"
sFoly ûrl, "Betöltés:; Adathiány ellenõrzés elõkészítése"
    
    Set db = CurrentDb()
    db.Execute ("Delete * From " & tEll & ";") 'Kitöröljük a tábla tartalmát
    
    
    Set lkEll = db.OpenRecordset(lkEllLek)
    lkEll.MoveLast
    lkEll.MoveFirst
    
sFoly ûrl, "Betöltés:; " & lkEll.RecordCount & " db. lekérdezés indul..."
    ' A felsorolt lekérdezések lefuttatása
    sqlA = ""
    Do Until lkEll.EOF
        lkNév = lkEll("EllenõrzõLekérdezés")
        sqlA = sqlA & " INSERT INTO " & tEll
        sqlA = sqlA & "      SELECT " & lkNév & ".*"
        sqlA = sqlA & "      FROM " & lkNév & ";"
        db.Execute (sqlA)
        
        'Debug.Print sqlA
        sqlA = ""
        lkEll.MoveNext
    Loop
    'Az adóazonosító jel (szöveg) átalakítása adójel-lé (dupla szám)
sFoly ûrl, "Betöltés:; adójel konverzió"
    db.Execute (GetQuerySQL("lk_Ellenõrzés_02_táblába_adójelKonverzió"))
sFoly ûrl, "Betöltés:; elõkészítés véget ért"
'sFoly ûrl, "Ellenõrzés:; " & DCount("*", lkEredm)
    
'sFoly ûrl, "Ellenõrzés:; eredménytábla megnyitása"
'    DoCmd.OpenQuery lkEredm
'    DoCmd.SelectObject acQuery, lkEredm



Err_Kimenet:
    Exit Sub
    
Err_Ellenõrzés:
    Select Case Err.Number
    Case 3417
        sqlA = GetQuerySQL(lkNév)
        Resume 0
    Case Else
        MsgBox Err.Number & Err.Description
        'Resume Next
    End Select
End Sub
Sub Ellenõrzés2(Ûrlap As Form, Optional Kimenet As Boolean = True)
' Ez a fv. az adathiány lekérdezéseket futtatja (azETípus = 1 vagyis Hiba)
' és a tEll változóban tárolt nevû táblába írja az eredményt,
' majd a végén megnyitja a
On Error GoTo Err_Ellenõrzés
    Dim db                  As Database
    Dim lkEll               As Recordset    'A soron következõ ellenõrzõ lekérdezés
    Dim sqlA                As String
    Dim lkEllLek, lkNév     As String
    Dim tEll                As String       'Az ellenõrzés tábla neve
    Dim lkEredm             As String       'Az eredmény lekérdezés neve
    Dim Üzenet              As String       'Az üzenetek számára
    
    If Kimenet Then
        lkEllLek = "SELECT * FROM lkEllenõrzõLekérdezések2 WHERE Osztály ='kimutatás' Order By Osztály Asc;"    'Ez a lekérdezés sorolja fel azokat a lekérdezéseket, amelyeket le kell futtatnunk.
    Else
        lkEllLek = "SELECT * FROM lkEllenõrzõLekérdezések2 WHERE Osztály ='hiba' Order By Osztály Asc;"
    End If
    
    sFoly Ûrlap, "Ellenõrzés:; Futtatandó lekérdezések betöltése"
    Set db = CurrentDb()
    Set lkEll = db.OpenRecordset(lkEllLek)
    lkEll.MoveLast
    lkEll.MoveFirst
    
    sFoly Ûrlap, "Ellenõrzés:; " & lkEll.RecordCount & " db. lekérdezés indul..."
    
    ' A felsorolt lekérdezések lefuttatása
    sqlA = ""
    Do Until lkEll.EOF
        lkNév = lkEll("EllenõrzõLekérdezés")
        DoCmd.OpenQuery lkNév, acViewNormal, acReadOnly
    sFoly Ûrlap, "Ellenõrzés:;" & lkEll("LapNév")
        lkEll.MoveNext
        DoCmd.OpenForm Ûrlap.Name, acNormal
    Loop
    'Az adóazonosító jel (szöveg) átalakítása adójel-lé (dupla szám)

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
Sub sFoly(Ûrlap As Form, Üzenet As String, Optional idõtis As Boolean = True)

    Dim a As Boolean
    a = Foly(Ûrlap, Üzenet, idõtis)
    'MsgBox "sFoly Sub!"
End Sub
Function Foly(Ûrlap As Form, Üzenet As String, Optional idõtis As Boolean = True) As Boolean
    If idõtis Then
        If StrCount(Üzenet, ";") = 1 And Ûrlap.Folyamat.ListCount = 0 Then
            Üzenet = Üzenet & "; Idõpont"
        Else
            If StrCount(Üzenet, ";") = 1 Then
                Üzenet = Üzenet & "; " & Now()
            End If
        End If
    End If
    Ûrlap.Folyamat.AddItem Item:=Üzenet
    Ûrlap.Repaint
    Ûrlap.Folyamat.Selected(Ûrlap.Folyamat.ListCount - 1) = True
    
End Function


