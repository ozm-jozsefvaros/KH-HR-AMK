Option Compare Database

Private Sub Kombin�ltLista27_AfterUpdate()

End Sub

Private Sub Form_Open(Cancel As Integer)
    Dim tmpObjTip As TempVars
    Dim tmpObj  As TempVars
    Dim tmpTulNeve  As TempVars
    TempVars!tmpObjTip = vbNullString
    TempVars!tmpObj = vbNullString
    TempVars!tmpTulNeve = vbNullString
    
    Me.Requery
End Sub

Private Sub Keres�ObjT�pus_AfterUpdate()
    TempVars!tmpObjTip = Me.ObjektumT�pus
    Me.Requery
End Sub

Private Sub Objektum_AfterUpdate()
    Me.Refresh
End Sub

Private Sub ObjektumT�pus_AfterUpdate()
    Me.Refresh
End Sub
