Option Compare Database
Private Sub valami()

End Sub

Private Sub KombináltLista458_AfterUpdate()
    Me.FilterOn = True
    'DoCmd.ApplyFilter "[Név] like '* " & Me.KombináltLista458 & "*'"
End Sub