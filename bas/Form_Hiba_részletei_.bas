Option Compare Database


Private Sub Form_Current()
Dim tömb() As Variant
Me.Hiba.RowSource = "Mezõ; Tartalom"
tömb = szétbontó(Me.Második_mezõ, Me.LekérdezésNeve)
    For i = LBound(tömb) To UBound(tömb)
        Me.Hiba.AddItem tömb(i, 1) & ":;" & tömb(i, 2)
    Next i
End Sub


Private Sub hiba_Click()
    Me.Hiba.Requery
End Sub