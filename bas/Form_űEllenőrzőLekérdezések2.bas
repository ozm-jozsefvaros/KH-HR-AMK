Option Compare Database

Private Sub FejezetekGomb_Click()
    DoCmd.OpenForm "�Lek�rdez�s fejezetek", acNormal, , , acFormEdit, acDialog
End Sub

Private Sub Keres�s_Change()
    Me.Requery
    Me.Keres�s.SetFocus
    Me.Keres�s.SelStart = Len(Me.Keres�s.Text)

End Sub

Private Sub OldalakGomb_Click()
    DoCmd.OpenForm "�Oldalc�mek", acNormal, , , acFormEdit, acDialog
End Sub

Private Sub �jFejezet_Click()
    DoCmd.OpenForm "s�Lek�rdez�s t�pusok", acNormal, , , acFormAdd, acDialog
End Sub