Option Compare Database

Private Sub �nyr_Click()
    Dim objK1K2 As Object

    Set objK1K2 = CreateObject("Access.Application")
    
    objK1K2.OpenCurrentDatabase ("L:\Ugyintezok\Adatszolg�ltat�k\Adatb�zisok\K1K2\K1K2_2211.accdb")
    objK1K2.Visible = True
    objK1K2.UserControl = True
    objK1K2.DoCmd.OpenForm "�Megnyit�s_�nyr"
End Sub

Private Sub Parancsgomb10_Click()
    Ellen�rz�s
End Sub