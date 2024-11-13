Option Compare Database

Private Sub Beolvasás_Click()
    HaviTáblaPlus (Me.File)
    MsgBox Me.File & " beolvasása lefutott."
    Me.Lista13.Requery
End Sub

Private Sub File_AfterUpdate()
Me.Lista13.Requery
End Sub

Private Sub FileKeresõ_Click()
    Dim Fájl As String
    
    Fájl = Nz(Me.File, "")
    
    FájlVálasztó Me.File, "A Havi létszámjelentés kiválasztása", "L:\Ugyintezok\Adatszolgáltatók\Alapadatok\Havi létszámjelentés", "*"
  

End Sub
