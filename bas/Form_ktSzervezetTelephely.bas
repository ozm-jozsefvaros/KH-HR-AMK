Option Compare Database


Private Sub lkF�oszt�ly_AfterUpdate()
Dim sql As String
Dim ker As String

ker = Me.lkF�oszt�ly.Text
If ker = "" Then
    ker = "*"
End If
    sql = ""
    sql = sql & "SELECT tSzervezetiEgys�gek.azSzervezet, tSzervezetiEgys�gek.Oszt�ly, tSzervezetiEgys�gek.F�oszt�ly "
    sql = sql & "FROM tSzervezetiEgys�gek "
    sql = sql & "WHERE (((tSzervezetiEgys�gek.F�oszt�ly) like '" & ker & "'));"

    Me.Oszt�ly.RowSource = sql
    Me.Oszt�ly.Requery

End Sub

Private Sub lkF�oszt�ly_Exit(Cancel As Integer)
Dim sql As String
Dim ker As String
'On Error Resume Next
ker = Me.lkF�oszt�ly.Text
If ker = "" Then
    ker = "*"
End If
    sql = ""
    sql = sql & "SELECT tSzervezetiEgys�gek.azSzervezet, tSzervezetiEgys�gek.Oszt�ly, tSzervezetiEgys�gek.F�oszt�ly "
    sql = sql & "FROM tSzervezetiEgys�gek "
    sql = sql & "WHERE (((tSzervezetiEgys�gek.F�oszt�ly) like '" & ker & "'));"

    Me.Oszt�ly.RowSource = sql
    Me.Oszt�ly.Requery
End Sub

Private Sub lkF�oszt�ly_GotFocus()
    Me.lkF�oszt�ly.SelText = Me.lkF�oszt�ly.Text
    
End Sub