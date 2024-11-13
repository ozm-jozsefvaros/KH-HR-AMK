Option Compare Database

Private Sub FejezetekGomb_Click()
    DoCmd.OpenForm "ûLekérdezés fejezetek", acNormal, , , acFormEdit, acDialog
End Sub

Private Sub Keresés_Change()
    Me.Requery
    Me.Keresés.SetFocus
    Me.Keresés.SelStart = Len(Me.Keresés.Text)

End Sub

Private Sub OldalakGomb_Click()
    DoCmd.OpenForm "ûOldalcímek", acNormal, , , acFormEdit, acDialog
End Sub

Private Sub ÚjFejezet_Click()
    DoCmd.OpenForm "sûLekérdezés típusok", acNormal, , , acFormAdd, acDialog
End Sub