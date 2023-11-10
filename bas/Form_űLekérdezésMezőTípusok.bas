Option Compare Database

Private Sub KombináltLista13_AfterUpdate()
    If Nz(Me.KombináltLista13, "") = "" Then
        Me.Filter = ""
        Me.FilterOn = True
    Else
        Me.Filter = "[LekérdezésNeve] like '*" & Me.KombináltLista13 & "*'"
        Me.FilterOn = True
    End If
    
End Sub

Private Sub LekrédezésNeve_AfterUpdate()
    Me.MezõNeve.Requery
End Sub