Option Compare Database

Private Sub klReferens_AfterUpdate()
    Me.Filter = "[azRef]=" & Me.klReferens
    Me.FilterOn = True
End Sub