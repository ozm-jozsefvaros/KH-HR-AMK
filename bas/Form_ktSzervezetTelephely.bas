Option Compare Database


Private Sub lkFõosztály_AfterUpdate()
Dim sql As String
Dim ker As String

ker = Me.lkFõosztály.Text
If ker = "" Then
    ker = "*"
End If
    sql = ""
    sql = sql & "SELECT tSzervezetiEgységek.azSzervezet, tSzervezetiEgységek.Osztály, tSzervezetiEgységek.Fõosztály "
    sql = sql & "FROM tSzervezetiEgységek "
    sql = sql & "WHERE (((tSzervezetiEgységek.Fõosztály) like '" & ker & "'));"

    Me.Osztály.RowSource = sql
    Me.Osztály.Requery

End Sub

Private Sub lkFõosztály_Exit(Cancel As Integer)
Dim sql As String
Dim ker As String
'On Error Resume Next
ker = Me.lkFõosztály.Text
If ker = "" Then
    ker = "*"
End If
    sql = ""
    sql = sql & "SELECT tSzervezetiEgységek.azSzervezet, tSzervezetiEgységek.Osztály, tSzervezetiEgységek.Fõosztály "
    sql = sql & "FROM tSzervezetiEgységek "
    sql = sql & "WHERE (((tSzervezetiEgységek.Fõosztály) like '" & ker & "'));"

    Me.Osztály.RowSource = sql
    Me.Osztály.Requery
End Sub

Private Sub lkFõosztály_GotFocus()
    Me.lkFõosztály.SelText = Me.lkFõosztály.Text
    
End Sub