Option Compare Database
Private Sub valami()

End Sub

Private Sub Kombin�ltLista458_AfterUpdate()
    Me.FilterOn = True
    'DoCmd.ApplyFilter "[N�v] like '* " & Me.Kombin�ltLista458 & "*'"
End Sub