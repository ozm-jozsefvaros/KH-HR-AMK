Option Compare Database



Private Sub FennállE_AfterUpdate()
Me.Requery
End Sub

Private Sub Form_Current()
    Me.Hiba_részletei_.Requery
End Sub

Private Sub Form_Load()
Me.Keresõ = "*"
Me.Requery
End Sub

Private Sub Keresõ_AfterUpdate()
'    Me.FilterOn = False
'    Me.Filter = "[lekérdezésNeve] = '" & Me.Keresõ.Value & "'"
'    Me.FilterOn = True
Me.Requery

End Sub