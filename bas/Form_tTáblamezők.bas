Option Compare Database

Private Sub mez�keres�_AfterUpdate()
    If Me.mez�keres� <> "" Or Not IsNull(Me.mez�keres�) Then
        Me.Filter = "[mez�n�v] like '*" & Me.mez�keres� & "'"
        Me.FilterOn = True
    Else
        Me.Filter = ""
        Me.FilterOn = True
    End If
End Sub

Private Sub mez�keres�_KeyPress(KeyAscii As Integer)
    Me.mez�keres�.Requery
End Sub