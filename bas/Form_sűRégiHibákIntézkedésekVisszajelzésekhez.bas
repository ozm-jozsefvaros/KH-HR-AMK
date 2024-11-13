Option Compare Database





Private Sub Keresõ_AfterUpdate()
'    Me.FilterOn = False
'    Me.Filter = "[lekérdezésNeve] = '" & Me.Keresõ.Value & "'"
'    Me.FilterOn = True
Me.Requery

End Sub