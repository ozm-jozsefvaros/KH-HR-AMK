Option Compare Database

Private Sub Form_Current()
    Me.Hiba_részletei_.Requery
End Sub

Private Sub Parancsgomb33_Click()
    DoCmd.OpenForm "ûIntézkedések", acNormal, , , acFormAdd, acDialog
    Me.Requery
End Sub

Private Sub ÚjVisszajelzés_Click()
Dim GR As Integer
GR = GroupwiseRead

Me.ÚjVisszajelzés.Caption = Replace("Új visszajelzések ($)", "$", GR)
Me.Requery
    
End Sub

