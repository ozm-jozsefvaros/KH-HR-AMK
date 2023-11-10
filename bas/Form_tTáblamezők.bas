Option Compare Database

Private Sub mezõkeresõ_AfterUpdate()
    If Me.mezõkeresõ <> "" Or Not IsNull(Me.mezõkeresõ) Then
        Me.Filter = "[mezõnév] like '*" & Me.mezõkeresõ & "'"
        Me.FilterOn = True
    Else
        Me.Filter = ""
        Me.FilterOn = True
    End If
End Sub

Private Sub mezõkeresõ_KeyPress(KeyAscii As Integer)
    Me.mezõkeresõ.Requery
End Sub