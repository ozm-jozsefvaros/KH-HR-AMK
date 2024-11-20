Option Compare Database

'Private Sub KombináltLista11_AfterUpdate()
'
'    If Me.KombináltLista11 = 0 Then
'        Me.FilterOn = False
'    Else
'
'        Me.Filter = "[Osztály]= " & Me.KombináltLista11
'        Me.FilterOn = True
'    End If
'End Sub

Private Sub ÚjOldal_Click()
    DoCmd.OpenForm "ûOldalcímek", acNormal, , , acFormAdd, acDialog
End Sub