Option Compare Database

Private Sub KombináltLista27_AfterUpdate()

End Sub

Private Sub Form_Open(Cancel As Integer)
'    Dim tmpObjTip As TempVars
'    Dim tmpObj  As TempVars
'    Dim tmpTulNeve  As TempVars
'    TempVars!tmpObjTip = vbNullString
'    TempVars!tmpObj = vbNullString
'    TempVars!tmpTulNeve = vbNullString
    
    Me.Requery
End Sub

Private Sub KeresõObjTípus_AfterUpdate()
    'TempVars!tmpObjTip = Me.ObjektumTípus.Name
    Me.Requery
End Sub



Private Sub Objektum_AfterUpdate()
    Me.Refresh
End Sub

Private Sub ObjektumTípus_AfterUpdate()
    Me.Refresh
End Sub

Private Sub TulajdonságÉrték_DblClick(Cancel As Integer)
    If IsNull(Me.Típus) Then _
        Exit Sub
    
    Select Case Me.Típus
        Case "mappa"
            MappaVálasztó Me.TulajdonságÉrték, Me.TulajdonságNeve, Me.TulajdonságÉrték
            
        Case "szín"
            Dim színérték As String
            színérték = Me.TulajdonságÉrték.Value
            If Left(színérték, 1) <> "#" Then
                színérték = "#" & színérték
            End If
            If Len(színérték) <> 7 Then
                MsgBox "Hibás színérték. A színérték 7 jegyû hexadecimális szám, elõtte # jellel", vbOKOnly, "Hiba"
                Me.TulajdonságÉrték.SetFocus
                Exit Sub
            End If
            logba , AlapadatÍr("html", Me.TulajdonságNeve, Me.TulajdonságÉrték.Value), 3
            'Me.TulajdonságÉrték.BackColor = Num2Num(Right(AlapadatLek("html", Me.TulajdonságNeve), 6), nnHex, nnDecimal)
    End Select
End Sub