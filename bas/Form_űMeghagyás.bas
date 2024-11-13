Option Compare Database

Private Sub Indít_Click()
fvbe (Me.Name & "Indít_Click()")
    Dim db As DAO.Database
    Dim i As Integer
    Dim qdf As QueryDef
    Dim lek(3, 1) As Variant
    lek(1, 1) = "lkMeghagyás03":    lek(1, 0) = "tMeghagyás03"
    lek(2, 1) = "lkMeghagyásB01":   lek(2, 0) = "tMeghagyásB01"
    lek(3, 1) = "lkMeghagyásB02":   lek(3, 0) = "tMeghagyásB02"
    Me.Folyamat.RowSource = "Tábla ill. lekérdezés; Sor ill. esemény; Idõpont "
    logba , "Meghagyás készítése indul..."
    Set db = CurrentDb
    
    For i = 1 To UBound(lek, 1)
        If TableExists(lek(i, 0), False, db) Then
            db.Execute "DROP TABLE [" & lek(i, 0) & "];", dbFailOnError
        End If
        Set qdf = db.QueryDefs(lek(i, 1))
                    sFoly Me, névelõvel(lek(i, 1), , , True) & " lekérdezés:; indul..."
                    logba , névelõvel(lek(i, 1), , , True) & " lekérdezés:; indul..."
        qdf.Execute (dbInconsistent)
                    sFoly Me, névelõvel(lek(i, 1), , , True) & " lekérdezés:; lefutott."
                    logba , névelõvel(lek(i, 1), , , True) & " lekérdezés:; indul..."
        qdf.Close
        logba , SetNavPaneGroup(lek(i, 1), "Meghagyás"), 3
        Set qdf = Nothing
    Next i
                    sFoly Me, "Az eredmények megnyitása:;megkezdve..."
                    logba , "Az eredmények megnyitása:;megkezdve..."
    DoCmd.OpenQuery "lkMeghagyásEredmény", acViewNormal, acReadOnly
                    sFoly Me, "lkMeghagyásEredmény:; megnyilt."
                    logba , "lkMeghagyásEredmény:; megnyilt."
    DoCmd.OpenQuery "lkMeghagyásMátrix", acViewNormal, acReadOnly
                    sFoly Me, "lkMeghagyásMátrix:; megnyilt."
                    logba , "lkMeghagyásMátrix:; megnyilt."
                    sFoly Me, "Az eredmények megnyitása:; véget ért!"
                    logba , "Az eredmények megnyitása:; véget ért!"
                    sFoly Me, "#########################;############", False
                    logba , "#########################;############"
    Me.Indít.Enabled = False
    Me.Mégse.Caption = "Kilépés"
fvki
End Sub