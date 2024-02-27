Option Compare Database
Private Sub Ellenõrzés_AfterUpdate()
    
End Sub

Private Sub AlapadatokGomb_Click()
    DoCmd.OpenForm ("ûAlapadatok")
End Sub

Private Sub Beolvasás_Click()
    Me.Elõkészítés = True
End Sub

Private Sub HozzátartozókGomb_Click()
    Dim objHoz As Object

    Set objHoz = CreateObject("Access.Application")
    
    objHoz.OpenCurrentDatabase ("L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Hozzátartozók.accdb")
    'objHoz.Visible = True
    objHoz.UserControl = True
    objHoz.DoCmd.OpenForm "ûFõmenü"
End Sub
Private Sub Kimutatás_AfterUpdate()
    
End Sub
Private Sub Form_Open(Cancel As Integer)

    Me.FilePipa = False
    Me.FileSzemélyPipa = False
    Me.FileSzervezetPipa = False
    Me.FileKimenetPipa = False
    Me.FileElbírálatlanPipa = False
    Me.FileNexonAzonosítóPipa = False
    Me.Folyamat.RowSource = "Tábla ill. lekérdezés; Sor ill. esemény"
    Me.Beolvasás = False
    Me.Elõkészítés = False
    Me.Fõcím = AlapadatLek("html", "Fõcím")
    Me.háttérkép = AlapadatLek("html", "Háttérkép")
    Me.Színválasztó = AlapadatLek("html", "Háttérszín")
    Me.szín.BackColor = Num2Num(Right(AlapadatLek("html", "Háttérszín"), 6), nnHex, nnDecimal)
    Me.Picture = AlapadatLek("access", "háttérkép")
    
End Sub
Private Sub Ányr_Click()
    Dim objK1K2 As Object

    Set objK1K2 = CreateObject("Access.Application")
    
    objK1K2.OpenCurrentDatabase ("L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\K1K2\K1K2_2211.accdb")
    objK1K2.Visible = True
    objK1K2.UserControl = True
    objK1K2.DoCmd.OpenForm "ûMegnyitás_Ányr"
End Sub
Private Sub Havi_Click()
    Dim fájl As String
    
    fájl = Nz(Me.File, "")
    
    FájlVálasztó Me.File, "A Havi létszámjelentés kiválasztása", "L:\Ugyintezok\Adatszolgáltatók\Alapadatok\Havi létszámjelentés", "1-Havi*"
    
    If Me.File <> fájl Then
        Me.FilePipa = False
    End If
End Sub
Private Sub HáttérképGomb_Click()
    Dim fájl As String
    fájl = Nz(Me.háttérkép, "")
    FájlVálasztó Me.háttérkép, "A háttérképnek a kiválasztása", "\\Teve1-jkf-hrf2-oes\vol1\Human\HRF\Ugyintezok\Adatszolgáltatók\HRELL\css", , "*.jpg, *.png"
    AlapadatÍr "html", "Háttérkép", Me.háttérkép.Value
End Sub
Private Sub Szervezeti_Click()
    Dim fájl As String
    fájl = Nz(Me.FileSzervezet, "")
   
    FájlVálasztó Me.FileSzervezet, "A Szervezeti alapriport kiválasztása", "L:\Ugyintezok\Adatszolgáltatók\Alapadatok\Szervezet", "Szervezeti alapriport *"
    If Me.FileSzervezet <> fájl Then
        Me.FileSzervezetPipa = False
    End If

End Sub
Private Sub Személytörzs_Click()
    Dim fájl As String
    fájl = Nz(Me.FileSzemély, "")
    
    FájlVálasztó Me.FileSzemély, "A Személytörzs alapriport kiválasztása", "L:\Ugyintezok\Adatszolgáltatók\Alapadatok\Személy", "1-Személytörzs alapriport*"
    
    If Me.FileSzemély = fájl Then
        Me.FileSzemélyPipa = False
    End If
    
End Sub
Private Sub Elbírálatlan_Click()
    Dim fájl As String
    fájl = Nz(Me.FileElbírálatlan, "")
    
    FájlVálasztó Me.FileElbírálatlan, "Az elbírálatlan igények jegyzék kiválasztása", "L:\Ugyintezok\Adatszolgáltatók\Alapadatok\Elbírálatlan igények (Adatváltozások)", "Adatváltozási igények"
    
    If Me.FileElbírálatlan = fájl Then
        Me.FileElbírálatlanPipa = False
    End If
    
End Sub
Private Sub NexonAzonosító_Click()
    Dim fájl As String
    fájl = Nz(Me.FileNexonAzonosító, "")
    
    FájlVálasztó Me.FileNexonAzonosító, "A Nexon azonosítót tartalmazó Személytörzs kiválasztása", "L:\Ugyintezok\Adatszolgáltatók\Alapadatok\Személy", "Személytörzs (*"
    
    If Me.FileNexonAzonosító = fájl Then
        Me.FileNexonAzonosítóPipa = False
    End If
End Sub
Private Sub Kimenet_Click() '####
    Dim fájl As String
    fájl = Nz(Me.FileKimenet, "")
    MappaVálasztó Me.FileKimenet, "A kimenet helyének kiválasztása", "\\Teve1-jkf-hrf2-oes\vol1\Human\HRF\Ugyintezok\Adatszolgáltatók\HRELL"
    AlapadatÍr "html", "kimenet", Me.FileKimenet
End Sub
Private Sub Eredmény_Click()
'START gomb
    Dim V As Integer
    Dim válasz As Boolean
    V = 0
    Me.Folyamat.RowSource = "Tábla ill. lekérdezés; Sor ill. esemény; Idõpont "
    Me.FilePipa = False
    Me.FileSzervezetPipa = False
    Me.FileSzemélyPipa = False
    Me.FileElbírálatlanPipa = False
    Me.FileNexonAzonosítóPipa = False
'## Ha a jelölõnégyzetek Null értéken állnak, hamis értékre állítjuk õket.
If IsNull(Me.Beolvasás) Then: Me.Beolvasás = False
If IsNull(Me.Elõkészítés) Then: Me.Elõkészítés = False


'## Csak akkor fut le, ha legalább egy jelölõnégyzet igaz.
    If Me.Beolvasás Or Not IsNull(Me.Osztály) Or Not IsNull(Me.Elõkészítés) Then
    '## Beolvasás
        If Me.Beolvasás Then
            If Me.File.Value <> "" Then
                válasz = fvHaviTáblaImport(Me.File.Value, Me)
                If válasz Then
                    V = V + 1
                    Me.FilePipa = True
                                    sFoly Me, "A havi létszámjelentés:; beolvastatott."
                Else
                                    sFoly Me, "A havi létszámjelentés:; a beolvasás sikertelen."
                End If
            Else
                                    sFoly Me, "A havi létszámjelentés:; a beolvasás átugorva."
            End If

            If Me.FileSzervezet.Value <> "" Then
                If SzervezetiTáblaImport(Me.FileSzervezet.Value, Me) Then
                    V = V + 1
                    Me.FileSzervezetPipa = True
                                    sFoly Me, "A szervezeti tábla:; beolvastatott."
                Else
                                    sFoly Me, "A szervezeti tábla:; a beolvasás sikertelen."
                End If
            Else
                                    sFoly Me, "A szervezeti tábla:; a beolvasás átugorva."
            End If

            If Me.FileSzemély.Value <> "" Then
                If tSzemélyekImport02(Me.FileSzemély.Value, Me) Then
                    V = V + 1
                    Me.FileSzemélyPipa = True
                                    sFoly Me, "A személytörzs tábla:; beolvastatott."
                Else
                                    sFoly Me, "A személytörzs tábla:; a beolvasás sikertelen."
                End If
            Else
                                    sFoly Me, "A személytörzs tábla:; a beolvasás átugorva."
            End If
            If Me.FileElbírálatlan.Value <> "" Then
                MegnyitMentBezár (Me.FileElbírálatlan.Value) 'Megnyitjuk, elmentjük és bezárjuk - ez csak vajákolás, de mûködik...
                If tTáblaImport(Me.FileElbírálatlan.Value, Me, "tAdatváltoztatásiIgények") Then
                    V = V + 1
                    Me.FileElbírálatlanPipa = True
                                    sFoly Me, "A tAdatváltoztatásiIgények tábla:; beolvastatott."
                Else
                                    sFoly Me, "A tAdatváltoztatásiIgények tábla:; a beolvasás sikertelen."
                End If
            Else
                                    sFoly Me, "Az tAdatváltoztatásiIgények tábla:; a beolvasás átugorva."
            End If
            
            
            Me.Refresh
            
            If Me.FileNexonAzonosító.Value <> "" Then
                MegnyitMentBezár (Me.FileNexonAzonosító.Value) 'Megnyitjuk, elmentjük és bezárjuk - ez csak "vajákolás", de mûködik...
                If tTáblaImport(Me.FileNexonAzonosító.Value, Me, "tNexonAzonosítók") Then
                    V = V + 1
                    Me.FileNexonAzonosítóPipa = True
                                    sFoly Me, "A tNexonAzonosítók tábla:; beolvastatott."
                Else
                                    sFoly Me, "A tNexonAzonosítók tábla:; a beolvasás sikertelen."
                End If
            Else
                                    sFoly Me, "Az tNexonAzonosítók tábla:; a beolvasás átugorva."
            End If
            
             'Az ellenõrzés külön jelölõ négyzetet kapott...
            
        End If
    '## Beolvasás vége
    '# Elõkészítés kezdete

        If Me.Elõkészítés Then
                                   sFoly Me, "Betöltés:; ellenõrzés elõkészítése megkezdve."
                Ellenõrzés1 (Me.Name) 'Ellenõrzés elõkészítése
                                        sFoly Me, "Beolvasás:; ellenõrzés elõkészítése befejezve."
                Me.Refresh
        End If
    '## Kimutatás _és_ _vagy_ ellenõrzés folytatása!!

        If Not (IsNull(Me.Osztály) Or IsNull(Me)) Then
            ExportQueryResultsToHTMLWithClassNames Me, Me.Osztály
                                    sFoly Me, "##########################;########", False
        End If
    End If
    
    '## A kimutatásnak és az ellenõrzés folytatásának a vége
'## Innen akkor is fut, ha egy jelölõ négyzet sem igaz
End Sub

Private Sub szín_Click()
    Call SzínGomb_Click
End Sub

Private Sub SzínGomb_Click()
    Dim iSzín As Long
        iSzín = DialogColor()
        Me.Színválasztó.Value = "#" & Hex(iSzín)
        Debug.Print AlapadatÍr("html", "Háttérszín", "#" & Hex(iSzín))
        Me.szín.BackColor = iSzín
        Me.szín.SetFocus
        Me.szín.Text = ""
        Me.SzínGomb.SetFocus
        
End Sub

Private Sub Színválasztó_AfterUpdate()
    Dim színérték As String
    színérték = Me.Színválasztó.Value
    If Left(színérték, 1) <> "#" Then
        színérték = "#" & színérték
    End If
    If Len(színérték) <> 7 Then
        MsgBox "Hibás színérték. A színérték 7 jegyû hexadecimális szám, elõtte # jellel", vbOKOnly, "Hiba"
        Me.Színválasztó.SetFocus
        Exit Sub
    End If
    Debug.Print AlapadatÍr("html", "Háttérszín", Me.Színválasztó.Value)
    Me.szín.BackColor = Num2Num(Right(AlapadatLek("html", "Háttérszín"), 6), nnHex, nnDecimal)
    
End Sub

Private Sub VégzettségekGomb_Click()
    Dim objHoz As Object

    Set objHoz = CreateObject("Access.Application")
    
    objHoz.OpenCurrentDatabase ("L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Hozzátartozók.accdb")
    'objHoz.Visible = True
    objHoz.UserControl = True
    objHoz.DoCmd.OpenForm "ûFõmenü"
End Sub