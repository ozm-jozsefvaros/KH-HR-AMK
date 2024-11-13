Option Compare Database

Private Sub Jogviszony_Change()
Me.Összegzés.Caption = összegzõ
End Sub

Private Sub Kezdõév_Change()
    'Me.Összegzés.SetFocus
    Me.Összegzés.Caption = összegzõ
    Debug.Print Me.Kezdõév
End Sub

Private Sub Parancsgomb1_Click()
Me.Requery
End Sub
Private Function összegzõ()
Dim kÉv As Integer, _
    kHó As Integer, _
    kNap As Integer, _
    vÉv As Integer, _
    vHó As Integer, _
    vNap As Integer
    kÉv = Year(Nz(Me.Kezdõév, Now()))
    kHó = Month(Nz(Me.Kezdõév, Now()))
    kNap = Day(Nz(Me.Kezdõév, Now()))
    vÉv = Year(Nz(Me.VégeÉv, Now()))
    vHó = Month(Nz(Me.VégeÉv, Now()))
    vNap = Day(Nz(Me.VégeÉv, Now()))
    
összegzõ = "Lekérdezzük " & _
            névelõvel(kÉv) & ". évi " & _
            kHó & ". hó " & _
            kNap & ". napja és " & _
            névelõvel(vÉv) & ". évi " & _
            vHó & ". hó " & _
            vNap & ". napja közötti idõszakban minden hónapnak " & _
            névelõvel(Nz(Me.VálasztottNap, 1)) & ". napján " & _
            névelõvel(Nz(Me.Jogviszony, "Munkaviszony")) & " jogviszonyban, a kormányhivatalban foglalkoztatottak létszámát."
End Function

Private Sub VálasztottNap_Change()
Me.Összegzés.Caption = összegzõ
End Sub

Private Sub VégeÉv_Change()
Me.Összegzés.Caption = összegzõ
End Sub