Option Compare Database
Private Sub Ellen�rz�s_AfterUpdate()
    
End Sub

Private Sub AlapadatokGomb_Click()
    DoCmd.OpenForm ("�Alapadatok")
End Sub

Private Sub Beolvas�s_Click()
    Me.El�k�sz�t�s = True
End Sub

Private Sub Hozz�tartoz�kGomb_Click()
    Dim objHoz As Object

    Set objHoz = CreateObject("Access.Application")
    
    objHoz.OpenCurrentDatabase ("L:\Ugyintezok\Adatszolg�ltat�k\Adatb�zisok\Hozz�tartoz�k.accdb")
    'objHoz.Visible = True
    objHoz.UserControl = True
    objHoz.DoCmd.OpenForm "�F�men�"
End Sub
Private Sub Kimutat�s_AfterUpdate()
    
End Sub
Private Sub Form_Open(Cancel As Integer)

    Me.FilePipa = False
    Me.FileSzem�lyPipa = False
    Me.FileSzervezetPipa = False
    Me.FileKimenetPipa = False
    Me.FileElb�r�latlanPipa = False
    Me.FileNexonAzonos�t�Pipa = False
    Me.Folyamat.RowSource = "T�bla ill. lek�rdez�s; Sor ill. esem�ny"
    Me.Beolvas�s = False
    Me.El�k�sz�t�s = False
    Me.F�c�m = AlapadatLek("html", "F�c�m")
    Me.h�tt�rk�p = AlapadatLek("html", "H�tt�rk�p")
    Me.Sz�nv�laszt� = AlapadatLek("html", "H�tt�rsz�n")
    Me.sz�n.BackColor = Num2Num(Right(AlapadatLek("html", "H�tt�rsz�n"), 6), nnHex, nnDecimal)
    Me.Picture = AlapadatLek("access", "h�tt�rk�p")
    
End Sub
Private Sub �nyr_Click()
    Dim objK1K2 As Object

    Set objK1K2 = CreateObject("Access.Application")
    
    objK1K2.OpenCurrentDatabase ("L:\Ugyintezok\Adatszolg�ltat�k\Adatb�zisok\K1K2\K1K2_2211.accdb")
    objK1K2.Visible = True
    objK1K2.UserControl = True
    objK1K2.DoCmd.OpenForm "�Megnyit�s_�nyr"
End Sub
Private Sub Havi_Click()
    Dim f�jl As String
    
    f�jl = Nz(Me.File, "")
    
    F�jlV�laszt� Me.File, "A Havi l�tsz�mjelent�s kiv�laszt�sa", "L:\Ugyintezok\Adatszolg�ltat�k\Alapadatok\Havi l�tsz�mjelent�s", "1-Havi*"
    
    If Me.File <> f�jl Then
        Me.FilePipa = False
    End If
End Sub
Private Sub H�tt�rk�pGomb_Click()
    Dim f�jl As String
    f�jl = Nz(Me.h�tt�rk�p, "")
    F�jlV�laszt� Me.h�tt�rk�p, "A h�tt�rk�pnek a kiv�laszt�sa", "\\Teve1-jkf-hrf2-oes\vol1\Human\HRF\Ugyintezok\Adatszolg�ltat�k\HRELL\css", , "*.jpg, *.png"
    Alapadat�r "html", "H�tt�rk�p", Me.h�tt�rk�p.Value
End Sub
Private Sub Szervezeti_Click()
    Dim f�jl As String
    f�jl = Nz(Me.FileSzervezet, "")
   
    F�jlV�laszt� Me.FileSzervezet, "A Szervezeti alapriport kiv�laszt�sa", "L:\Ugyintezok\Adatszolg�ltat�k\Alapadatok\Szervezet", "Szervezeti alapriport *"
    If Me.FileSzervezet <> f�jl Then
        Me.FileSzervezetPipa = False
    End If

End Sub
Private Sub Szem�lyt�rzs_Click()
    Dim f�jl As String
    f�jl = Nz(Me.FileSzem�ly, "")
    
    F�jlV�laszt� Me.FileSzem�ly, "A Szem�lyt�rzs alapriport kiv�laszt�sa", "L:\Ugyintezok\Adatszolg�ltat�k\Alapadatok\Szem�ly", "1-Szem�lyt�rzs alapriport*"
    
    If Me.FileSzem�ly = f�jl Then
        Me.FileSzem�lyPipa = False
    End If
    
End Sub
Private Sub Elb�r�latlan_Click()
    Dim f�jl As String
    f�jl = Nz(Me.FileElb�r�latlan, "")
    
    F�jlV�laszt� Me.FileElb�r�latlan, "Az elb�r�latlan ig�nyek jegyz�k kiv�laszt�sa", "L:\Ugyintezok\Adatszolg�ltat�k\Alapadatok\Elb�r�latlan ig�nyek (Adatv�ltoz�sok)", "Adatv�ltoz�si ig�nyek"
    
    If Me.FileElb�r�latlan = f�jl Then
        Me.FileElb�r�latlanPipa = False
    End If
    
End Sub
Private Sub NexonAzonos�t�_Click()
    Dim f�jl As String
    f�jl = Nz(Me.FileNexonAzonos�t�, "")
    
    F�jlV�laszt� Me.FileNexonAzonos�t�, "A Nexon azonos�t�t tartalmaz� Szem�lyt�rzs kiv�laszt�sa", "L:\Ugyintezok\Adatszolg�ltat�k\Alapadatok\Szem�ly", "Szem�lyt�rzs (*"
    
    If Me.FileNexonAzonos�t� = f�jl Then
        Me.FileNexonAzonos�t�Pipa = False
    End If
End Sub
Private Sub Kimenet_Click() '####
    Dim f�jl As String
    f�jl = Nz(Me.FileKimenet, "")
    MappaV�laszt� Me.FileKimenet, "A kimenet hely�nek kiv�laszt�sa", "\\Teve1-jkf-hrf2-oes\vol1\Human\HRF\Ugyintezok\Adatszolg�ltat�k\HRELL"
    Alapadat�r "html", "kimenet", Me.FileKimenet
End Sub
Private Sub Eredm�ny_Click()
'START gomb
    Dim V As Integer
    Dim v�lasz As Boolean
    V = 0
    Me.Folyamat.RowSource = "T�bla ill. lek�rdez�s; Sor ill. esem�ny; Id�pont "
    Me.FilePipa = False
    Me.FileSzervezetPipa = False
    Me.FileSzem�lyPipa = False
    Me.FileElb�r�latlanPipa = False
    Me.FileNexonAzonos�t�Pipa = False
'## Ha a jel�l�n�gyzetek Null �rt�ken �llnak, hamis �rt�kre �ll�tjuk �ket.
If IsNull(Me.Beolvas�s) Then: Me.Beolvas�s = False
If IsNull(Me.El�k�sz�t�s) Then: Me.El�k�sz�t�s = False


'## Csak akkor fut le, ha legal�bb egy jel�l�n�gyzet igaz.
    If Me.Beolvas�s Or Not IsNull(Me.Oszt�ly) Or Not IsNull(Me.El�k�sz�t�s) Then
    '## Beolvas�s
        If Me.Beolvas�s Then
            If Me.File.Value <> "" Then
                v�lasz = fvHaviT�blaImport(Me.File.Value, Me)
                If v�lasz Then
                    V = V + 1
                    Me.FilePipa = True
                                    sFoly Me, "A havi l�tsz�mjelent�s:; beolvastatott."
                Else
                                    sFoly Me, "A havi l�tsz�mjelent�s:; a beolvas�s sikertelen."
                End If
            Else
                                    sFoly Me, "A havi l�tsz�mjelent�s:; a beolvas�s �tugorva."
            End If

            If Me.FileSzervezet.Value <> "" Then
                If SzervezetiT�blaImport(Me.FileSzervezet.Value, Me) Then
                    V = V + 1
                    Me.FileSzervezetPipa = True
                                    sFoly Me, "A szervezeti t�bla:; beolvastatott."
                Else
                                    sFoly Me, "A szervezeti t�bla:; a beolvas�s sikertelen."
                End If
            Else
                                    sFoly Me, "A szervezeti t�bla:; a beolvas�s �tugorva."
            End If

            If Me.FileSzem�ly.Value <> "" Then
                If tSzem�lyekImport02(Me.FileSzem�ly.Value, Me) Then
                    V = V + 1
                    Me.FileSzem�lyPipa = True
                                    sFoly Me, "A szem�lyt�rzs t�bla:; beolvastatott."
                Else
                                    sFoly Me, "A szem�lyt�rzs t�bla:; a beolvas�s sikertelen."
                End If
            Else
                                    sFoly Me, "A szem�lyt�rzs t�bla:; a beolvas�s �tugorva."
            End If
            If Me.FileElb�r�latlan.Value <> "" Then
                MegnyitMentBez�r (Me.FileElb�r�latlan.Value) 'Megnyitjuk, elmentj�k �s bez�rjuk - ez csak vaj�kol�s, de m�k�dik...
                If tT�blaImport(Me.FileElb�r�latlan.Value, Me, "tAdatv�ltoztat�siIg�nyek") Then
                    V = V + 1
                    Me.FileElb�r�latlanPipa = True
                                    sFoly Me, "A tAdatv�ltoztat�siIg�nyek t�bla:; beolvastatott."
                Else
                                    sFoly Me, "A tAdatv�ltoztat�siIg�nyek t�bla:; a beolvas�s sikertelen."
                End If
            Else
                                    sFoly Me, "Az tAdatv�ltoztat�siIg�nyek t�bla:; a beolvas�s �tugorva."
            End If
            
            
            Me.Refresh
            
            If Me.FileNexonAzonos�t�.Value <> "" Then
                MegnyitMentBez�r (Me.FileNexonAzonos�t�.Value) 'Megnyitjuk, elmentj�k �s bez�rjuk - ez csak "vaj�kol�s", de m�k�dik...
                If tT�blaImport(Me.FileNexonAzonos�t�.Value, Me, "tNexonAzonos�t�k") Then
                    V = V + 1
                    Me.FileNexonAzonos�t�Pipa = True
                                    sFoly Me, "A tNexonAzonos�t�k t�bla:; beolvastatott."
                Else
                                    sFoly Me, "A tNexonAzonos�t�k t�bla:; a beolvas�s sikertelen."
                End If
            Else
                                    sFoly Me, "Az tNexonAzonos�t�k t�bla:; a beolvas�s �tugorva."
            End If
            
             'Az ellen�rz�s k�l�n jel�l� n�gyzetet kapott...
            
        End If
    '## Beolvas�s v�ge
    '# El�k�sz�t�s kezdete

        If Me.El�k�sz�t�s Then
                                   sFoly Me, "Bet�lt�s:; ellen�rz�s el�k�sz�t�se megkezdve."
                Ellen�rz�s1 (Me.Name) 'Ellen�rz�s el�k�sz�t�se
                                        sFoly Me, "Beolvas�s:; ellen�rz�s el�k�sz�t�se befejezve."
                Me.Refresh
        End If
    '## Kimutat�s _�s_ _vagy_ ellen�rz�s folytat�sa!!

        If Not (IsNull(Me.Oszt�ly) Or IsNull(Me)) Then
            ExportQueryResultsToHTMLWithClassNames Me, Me.Oszt�ly
                                    sFoly Me, "##########################;########", False
        End If
    End If
    
    '## A kimutat�snak �s az ellen�rz�s folytat�s�nak a v�ge
'## Innen akkor is fut, ha egy jel�l� n�gyzet sem igaz
End Sub

Private Sub sz�n_Click()
    Call Sz�nGomb_Click
End Sub

Private Sub Sz�nGomb_Click()
    Dim iSz�n As Long
        iSz�n = DialogColor()
        Me.Sz�nv�laszt�.Value = "#" & Hex(iSz�n)
        Debug.Print Alapadat�r("html", "H�tt�rsz�n", "#" & Hex(iSz�n))
        Me.sz�n.BackColor = iSz�n
        Me.sz�n.SetFocus
        Me.sz�n.Text = ""
        Me.Sz�nGomb.SetFocus
        
End Sub

Private Sub Sz�nv�laszt�_AfterUpdate()
    Dim sz�n�rt�k As String
    sz�n�rt�k = Me.Sz�nv�laszt�.Value
    If Left(sz�n�rt�k, 1) <> "#" Then
        sz�n�rt�k = "#" & sz�n�rt�k
    End If
    If Len(sz�n�rt�k) <> 7 Then
        MsgBox "Hib�s sz�n�rt�k. A sz�n�rt�k 7 jegy� hexadecim�lis sz�m, el�tte # jellel", vbOKOnly, "Hiba"
        Me.Sz�nv�laszt�.SetFocus
        Exit Sub
    End If
    Debug.Print Alapadat�r("html", "H�tt�rsz�n", Me.Sz�nv�laszt�.Value)
    Me.sz�n.BackColor = Num2Num(Right(AlapadatLek("html", "H�tt�rsz�n"), 6), nnHex, nnDecimal)
    
End Sub

Private Sub V�gzetts�gekGomb_Click()
    Dim objHoz As Object

    Set objHoz = CreateObject("Access.Application")
    
    objHoz.OpenCurrentDatabase ("L:\Ugyintezok\Adatszolg�ltat�k\Adatb�zisok\Hozz�tartoz�k.accdb")
    'objHoz.Visible = True
    objHoz.UserControl = True
    objHoz.DoCmd.OpenForm "�F�men�"
End Sub