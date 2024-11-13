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
fvbe ("Ellenõrzés1")
'On Error GoTo Err_Ellenõrzés
    Dim db                  As Database
    Dim lkEll               As Recordset    'A soron következõ ellenõrzõ lekérdezés
    Dim ehj             As New ehjoszt      'A státusz megjelenítéséhez
    Dim sqlA                As String
    Dim lkEllLek, lknév     As String
    Dim tEll                As String       'Az ellenõrzés tábla neve
'    Dim lkEredm             As String       'Az eredmény lekérdezés neve
    Dim ûrl                 As Form
    Set ûrl = Application.Forms(Ûrlap)
    lkEllLek = "SELECT * FROM lkEllenõrzõLekérdezések2 WHERE azETípus = 1 AND Kimenet = False AND azUnion = 1 ;"    'Ez a lekérdezés sorolja fel azokat a lekérdezéseket, amelyeket le kell futtatnunk.
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
    ehj.Ini 100
    ehj.oszlopszam = lkEll.RecordCount
    Do Until lkEll.EOF
        lknév = lkEll("EllenõrzõLekérdezés")
        sqlA = sqlA & " INSERT INTO " & tEll
        sqlA = sqlA & "      SELECT " & lknév & ".*"
        sqlA = sqlA & "      FROM " & lknév & ";"
        db.Execute (sqlA)
        
        logba sFN & " - sqlA", sqlA, 4
        
        sqlA = ""
        
        
        lkEll.MoveNext
        ehj.Novel
    Loop
    'Az adóazonosító jel (szöveg) átalakítása adójel-lé (dupla szám)
sFoly ûrl, "Betöltés:; adójel konverzió"
    db.Execute (GetQuerySQL("lk_Ellenõrzés_02_táblába_adójelKonverzió"))
sFoly ûrl, "Betöltés:; elõkészítés véget ért"

Err_Kimenet:
    Exit Sub
    
Err_Ellenõrzés:
    Select Case Err.Number
    Case 3417
        sqlA = GetQuerySQL(lknév)
        logba , Err.Number, 0
        Resume 0
    Case Else
        MsgBox Err.Number & Err.Description
        logba , Err.Number & Err.Description, 0
        'Resume Next
    End Select
fvki
End Sub
Sub Ellenõrzés2(Ûrlap As Form, Optional Kimenet As Boolean = True)
' Ez a fv. az adathiány lekérdezéseket futtatja (azETípus = 1 vagyis Hiba)
' és a tEll változóban tárolt nevû táblába írja az eredményt,
' majd a végén megnyitja a
fvbe ("Ellenõrzés2")
On Error GoTo Err_Ellenõrzés
    Dim db                  As Database
    Dim lkEll               As Recordset    'A soron következõ ellenõrzõ lekérdezés
    Dim sqlA                As String
    Dim lkEllLek, lknév     As String
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
        lknév = lkEll("EllenõrzõLekérdezés")
        DoCmd.OpenQuery lknév, acViewNormal, acReadOnly
    sFoly Ûrlap, "Ellenõrzés:;" & lkEll("LapNév")
        lkEll.MoveNext
        DoCmd.OpenForm Ûrlap.Name, acNormal
    Loop
    'Az adóazonosító jel (szöveg) átalakítása adójel-lé (dupla szám)

Err_Kimenet:
    fvki
    Exit Sub
    
Err_Ellenõrzés:
    Select Case Err.Number
    Case 3417
        sqlA = GetQuerySQL(lknév)
        logba , Err.Number, 0
        Resume 0
    Case Else
        MsgBox Err.Number & Err.Description
        logba , Err.Number & Err.Description & sqlA, 0
        'Resume Next
    End Select
End Sub

Private Function GetQuerySQL(MyQueryName As String) As String
Dim QD As DAO.QueryDef
 
Set QD = CurrentDb.QueryDefs(MyQueryName)
GetQuerySQL = QD.sql
 
End Function


