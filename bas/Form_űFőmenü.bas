Option Compare Database

Private Sub Ányr_Click()
    Dim objK1K2 As Object

    Set objK1K2 = CreateObject("Access.Application")
    
    objK1K2.OpenCurrentDatabase ("L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\K1K2\K1K2_2211.accdb")
    objK1K2.Visible = True
    objK1K2.UserControl = True
    objK1K2.DoCmd.OpenForm "ûMegnyitás_Ányr"
End Sub

Private Sub Parancsgomb10_Click()
    Ellenõrzés
End Sub