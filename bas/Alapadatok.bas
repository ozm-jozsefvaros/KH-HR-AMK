Option Compare Database
Private Function AlapadatInit() As Recordset
    Dim db As DAO.Database
    Dim rst As Recordset
    Set db = CurrentDb
    Set rst = db.OpenRecordset("Select * From tAlapadatok")
    If rst.BOF <> True Then
        rst.MoveLast
        rst.MoveFirst
    End If
    'Debug.Print "Ini"; rst.RecordCount
    Set AlapadatInit = rst
    'Debug.Print AlapadatInit.RecordCount
End Function
Private Sub AlapadatCls(rst)
    Dim db As DAO.Database
    Set db = rst.Parent
    Set rst = Nothing
    Set db = Nothing
End Sub
Function AlapadatLek(objekt As String, tulnév As String) As String
    Dim rst As Recordset
    Set rst = AlapadatInit()
    rst.MoveFirst
    Do While Not rst.EOF
        If rst!TulajdonságNeve = tulnév And rst!Objektum = objekt Then
            AlapadatLek = Nz(rst!TulajdonságÉrték, "")
            Exit Do
        End If
        rst.MoveNext
    Loop
End Function
Function AlapadatÍr(objekt As String, tulnév As String, érték As Variant) As Boolean
On Error GoTo Hiba
    Dim rst As Recordset
    Dim beszúrás As Boolean
    beszúrás = False
    
    Set rst = AlapadatInit()
    rst.MoveFirst
    Do While Not rst.EOF
        If rst!TulajdonságNeve = tulnév And rst!Objektum = objekt Then
            rst.Edit
            rst!TulajdonságÉrték = érték
            rst.Update
            beszúrás = True
            Exit Do
        End If
        rst.MoveNext
    Loop
    If Not beszúrás Then
        rst.AddNew
        rst!TulajdonságNeve = tulnév
        rst!Objektum = objekt
        rst!TulajdonságÉrték = érték
        rst.Update
    End If
    AlapadatÍr = True
    Exit Function
Hiba:
    AlapadatÍr = False
    Debug.Print Err.Number, Err.Description, Err.Source, Err.LastDllError
    MsgBox "Hiba az alapadat rögzítése során:" & Err.Description & " | " & Err.Source, vbOKOnly, "Hiba"
End Function