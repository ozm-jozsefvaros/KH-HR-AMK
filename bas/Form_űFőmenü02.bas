Option Compare Database



Private Sub Form_Open(Cancel As Integer)
    Me.FilePipa.Visible = False
    Me.FileSzem�lyPipa.Visible = False
    Me.FileSzervezetPipa.Visible = False
    Me.FileKimenetPipa.Visible = False
    Me.Folyamat.RowSource = "T�bla ill. lek�rdez�s; Sor ill. esem�ny"
    Me.Beolvas�s = False
    Me.Ellen�rz�s = False
    Me.Kimutat�s = False
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
        Me.FilePipa.Visible = False
    End If
End Sub



Private Sub Szervezeti_Click()
    Dim f�jl As String
    f�jl = Nz(Me.FileSzervezet, "")
   
    F�jlV�laszt� Me.FileSzervezet, "A Szervezeti alapriport kiv�laszt�sa", "L:\Ugyintezok\Adatszolg�ltat�k\Alapadatok\Szervezet", "Szervezeti alapriport *"
    If Me.FileSzervezet <> f�jl Then
        Me.FileSzervezetPipa.Visible = False
    End If

End Sub
Private Sub Szem�lyt�rzs_Click()
    Dim f�jl As String
    f�jl = Nz(Me.FileSzem�ly, "")
    
    F�jlV�laszt� Me.FileSzem�ly, "A Szem�lyt�rzs alapriport kiv�laszt�sa", "L:\Ugyintezok\Adatszolg�ltat�k\Alapadatok\Szem�ly", "1-Szem�lyt�rzs alapriport*"
    
    If Me.FileSzem�ly = f�jl Then
        Me.FileSzem�lyPipa.Visible = False
    End If
    
End Sub
Private Sub Elb�r�latlan_Click()
    Dim f�jl As String
    f�jl = Nz(Me.FileElb�r�latlan, "")
    
    F�jlV�laszt� Me.FileElb�r�latlan, "Az elb�r�latlan ig�nyek jegyz�k kiv�laszt�sa", "L:\Ugyintezok\Adatszolg�ltat�k\Alapadatok\Elb�r�latlan ig�nyek (Adatv�ltoz�sok)", "Adatv�ltoz�si ig�nyek"
    
    If Me.FileElb�r�latlan = f�jl Then
        Me.FileElb�r�latlanPipa.Visible = False
    End If
    
End Sub
Private Sub NexonAzonos�t�_Click()
    Dim f�jl As String
    f�jl = Nz(Me.FileNexonAzonos�t�, "")
    
    F�jlV�laszt� Me.FileNexonAzonos�t�, "Az elb�r�latlan ig�nyek jegyz�k kiv�laszt�sa", "L:\Ugyintezok\Adatszolg�ltat�k\Alapadatok\Szem�ly", "Adatv�ltoz�si ig�nyek"
    
    If Me.FileNexonAzonos�t� = f�jl Then
        Me.FileNexonAzonos�t�Pipa.Visible = False
    End If
End Sub
Private Sub Kimenet_Click()
    Dim f�jl As String
    f�jl = Nz(Me.FileKimenet, "")
    
    MappaV�laszt� Me.FileKimenet, "A kimenet hely�nek kiv�laszt�sa", "\\Teve1-jkf-hrf2-oes\vol1\Human\HRF\Ugyintezok\Ol�h Zolt�n\HRELL"
    If Me.FileKimenet = f�jl Then
        Me.FileSzem�lyPipa.Visible = False
    End If
End Sub
Private Sub Eredm�ny_Click()
    Dim V As Integer
    V = 0
    Me.Folyamat.RowSource = "T�bla ill. lek�rdez�s; Sor ill. esem�ny; Id�pont "
    Me.FilePipa.Visible = False
    Me.FileSzervezetPipa.Visible = False
    Me.FileSzem�lyPipa.Visible = False
'## Ha a jel�l�n�gyzetek Null �rt�ken �llnak, hamis �rt�kre �ll�tjuk �ket.
If IsNull(Me.Beolvas�s) Then
    Me.Beolvas�s = False
End If
If IsNull(Me.Ellen�rz�s) Then
    Me.Ellen�rz�s = False
End If
If IsNull(Me.Kimutat�s) Then
    Me.Kimutat�s = False
End If

'## Csak akkor fut le, ha legal�bb egy jel�l�n�gyzet igaz.
    If Me.Beolvas�s Or Me.Ellen�rz�s Or Me.Kimutat�s Then
    '## Beolvas�s
        If Me.Beolvas�s Then
            If Me.File.Value <> "" Then
                If fvHaviT�blaImport(Me.File.Value, Me) Then
                    V = V + 1
                    Me.FilePipa.Visible = True
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
                    Me.FileSzervezetPipa.Visible = True
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
                    Me.FileSzem�lyPipa.Visible = True
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
                    Me.FileElb�r�latlanPipa.Visible = True
                                    sFoly Me, "A tAdatv�ltoztat�siIg�nyek t�bla:; beolvastatott."
                Else
                                    sFoly Me, "A tAdatv�ltoztat�siIg�nyek t�bla:; a beolvas�s sikertelen."
                End If
            Else
                                    sFoly Me, "Az tAdatv�ltoztat�siIg�nyek t�bla:; a beolvas�s �tugorva."
            End If
            
            
            Me.Refresh
            
            If Me.FileNexonAzonos�t�.Value <> "" Then
                MegnyitMentBez�r (Me.FileNexonAzonos�t�.Value) 'Megnyitjuk, elmentj�k �s bez�rjuk - ez csak vaj�kol�s, de m�k�dik...
                If tT�blaImport(Me.FileNexonAzonos�t�.Value, Me, "tNexonAzonos�t�k") Then
                    V = V + 1
                    Me.FileNexonAzonos�t�Pipa.Visible = True
                                    sFoly Me, "A tNexonAzonos�t�k t�bla:; beolvastatott."
                Else
                                    sFoly Me, "A tNexonAzonos�t�k t�bla:; a beolvas�s sikertelen."
                End If
            Else
                                    sFoly Me, "Az tNexonAzonos�t�k t�bla:; a beolvas�s �tugorva."
            End If
            
                                    sFoly Me, "Bet�lt�s:; ellen�rz�s el�k�sz�t�se megkezdve."
            Ellen�rz�s1 (Me.Name) 'Ellen�rz�s el�k�sz�t�se
                                    sFoly Me, "Beolvas�s:; ellen�rz�s el�k�sz�t�se befejezve."
            Me.Refresh
            
        End If
    '## Beolvas�s v�ge
    '## Kimutat�s _�s_ _vagy_ ellen�rz�s folytat�sa!!
        If IsNull(Me.FileKimenet) Or Len(Me.FileKimenet) > 0 Then
            ExportQueryResultsToHTMLWithClassNames Me, Me.Kimutat�s, Me.Ellen�rz�s
        Else
            If Me.Kimutat�s Then
                                        sFoly Me, "A kimutat�sok k�sz�t�se:; kezd�dik."
                    Call Ellen�rz�s2(Me, True)
                                        sFoly Me, "A kimutat�sok k�sz�t�se:; v�get �rt."
            ElseIf Me.Ellen�rz�s Then
                                        sFoly Me, "Az egy�b ellen�rz�sek k�sz�t�se:; kezd�dik."
                    Call Ellen�rz�s2(Me, False)
                                        sFoly Me, "Az egy�b ellen�rz�sek k�sz�t�se:; v�get �rt."
            End If
        End If
                                    sFoly Me, "##########################;########", False
                                    
    End If
    '## A kimutat�snak �s az ellen�rz�s folytat�s�nak a v�ge
'## Innen akkor is fut, ha egy jel�l� n�gyzet sem igaz
End Sub
