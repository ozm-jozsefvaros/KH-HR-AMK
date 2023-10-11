Option Compare Database



Private Sub Form_Open(Cancel As Integer)
    Me.FilePipa.Visible = False
    Me.FileSzemélyPipa.Visible = False
    Me.FileSzervezetPipa.Visible = False
    Me.FileKimenetPipa.Visible = False
    Me.Folyamat.RowSource = "Tábla ill. lekérdezés; Sor ill. esemény"
    Me.Beolvasás = False
    Me.Ellenõrzés = False
    Me.Kimutatás = False
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
        Me.FilePipa.Visible = False
    End If
End Sub



Private Sub Szervezeti_Click()
    Dim fájl As String
    fájl = Nz(Me.FileSzervezet, "")
   
    FájlVálasztó Me.FileSzervezet, "A Szervezeti alapriport kiválasztása", "L:\Ugyintezok\Adatszolgáltatók\Alapadatok\Szervezet", "Szervezeti alapriport *"
    If Me.FileSzervezet <> fájl Then
        Me.FileSzervezetPipa.Visible = False
    End If

End Sub
Private Sub Személytörzs_Click()
    Dim fájl As String
    fájl = Nz(Me.FileSzemély, "")
    
    FájlVálasztó Me.FileSzemély, "A Személytörzs alapriport kiválasztása", "L:\Ugyintezok\Adatszolgáltatók\Alapadatok\Személy", "1-Személytörzs alapriport*"
    
    If Me.FileSzemély = fájl Then
        Me.FileSzemélyPipa.Visible = False
    End If
    
End Sub
Private Sub Elbírálatlan_Click()
    Dim fájl As String
    fájl = Nz(Me.FileElbírálatlan, "")
    
    FájlVálasztó Me.FileElbírálatlan, "Az elbírálatlan igények jegyzék kiválasztása", "L:\Ugyintezok\Adatszolgáltatók\Alapadatok\Elbírálatlan igények (Adatváltozások)", "Adatváltozási igények"
    
    If Me.FileElbírálatlan = fájl Then
        Me.FileElbírálatlanPipa.Visible = False
    End If
    
End Sub
Private Sub NexonAzonosító_Click()
    Dim fájl As String
    fájl = Nz(Me.FileNexonAzonosító, "")
    
    FájlVálasztó Me.FileNexonAzonosító, "Az elbírálatlan igények jegyzék kiválasztása", "L:\Ugyintezok\Adatszolgáltatók\Alapadatok\Személy", "Adatváltozási igények"
    
    If Me.FileNexonAzonosító = fájl Then
        Me.FileNexonAzonosítóPipa.Visible = False
    End If
End Sub
Private Sub Kimenet_Click()
    Dim fájl As String
    fájl = Nz(Me.FileKimenet, "")
    
    MappaVálasztó Me.FileKimenet, "A kimenet helyének kiválasztása", "\\Teve1-jkf-hrf2-oes\vol1\Human\HRF\Ugyintezok\Oláh Zoltán\HRELL"
    If Me.FileKimenet = fájl Then
        Me.FileSzemélyPipa.Visible = False
    End If
End Sub
Private Sub Eredmény_Click()
    Dim V As Integer
    V = 0
    Me.Folyamat.RowSource = "Tábla ill. lekérdezés; Sor ill. esemény; Idõpont "
    Me.FilePipa.Visible = False
    Me.FileSzervezetPipa.Visible = False
    Me.FileSzemélyPipa.Visible = False
'## Ha a jelölõnégyzetek Null értéken állnak, hamis értékre állítjuk õket.
If IsNull(Me.Beolvasás) Then
    Me.Beolvasás = False
End If
If IsNull(Me.Ellenõrzés) Then
    Me.Ellenõrzés = False
End If
If IsNull(Me.Kimutatás) Then
    Me.Kimutatás = False
End If

'## Csak akkor fut le, ha legalább egy jelölõnégyzet igaz.
    If Me.Beolvasás Or Me.Ellenõrzés Or Me.Kimutatás Then
    '## Beolvasás
        If Me.Beolvasás Then
            If Me.File.Value <> "" Then
                If fvHaviTáblaImport(Me.File.Value, Me) Then
                    V = V + 1
                    Me.FilePipa.Visible = True
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
                    Me.FileSzervezetPipa.Visible = True
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
                    Me.FileSzemélyPipa.Visible = True
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
                    Me.FileElbírálatlanPipa.Visible = True
                                    sFoly Me, "A tAdatváltoztatásiIgények tábla:; beolvastatott."
                Else
                                    sFoly Me, "A tAdatváltoztatásiIgények tábla:; a beolvasás sikertelen."
                End If
            Else
                                    sFoly Me, "Az tAdatváltoztatásiIgények tábla:; a beolvasás átugorva."
            End If
            
            
            Me.Refresh
            
            If Me.FileNexonAzonosító.Value <> "" Then
                MegnyitMentBezár (Me.FileNexonAzonosító.Value) 'Megnyitjuk, elmentjük és bezárjuk - ez csak vajákolás, de mûködik...
                If tTáblaImport(Me.FileNexonAzonosító.Value, Me, "tNexonAzonosítók") Then
                    V = V + 1
                    Me.FileNexonAzonosítóPipa.Visible = True
                                    sFoly Me, "A tNexonAzonosítók tábla:; beolvastatott."
                Else
                                    sFoly Me, "A tNexonAzonosítók tábla:; a beolvasás sikertelen."
                End If
            Else
                                    sFoly Me, "Az tNexonAzonosítók tábla:; a beolvasás átugorva."
            End If
            
                                    sFoly Me, "Betöltés:; ellenõrzés elõkészítése megkezdve."
            Ellenõrzés1 (Me.Name) 'Ellenõrzés elõkészítése
                                    sFoly Me, "Beolvasás:; ellenõrzés elõkészítése befejezve."
            Me.Refresh
            
        End If
    '## Beolvasás vége
    '## Kimutatás _és_ _vagy_ ellenõrzés folytatása!!
        If IsNull(Me.FileKimenet) Or Len(Me.FileKimenet) > 0 Then
            ExportQueryResultsToHTMLWithClassNames Me, Me.Kimutatás, Me.Ellenõrzés
        Else
            If Me.Kimutatás Then
                                        sFoly Me, "A kimutatások készítése:; kezdõdik."
                    Call Ellenõrzés2(Me, True)
                                        sFoly Me, "A kimutatások készítése:; véget ért."
            ElseIf Me.Ellenõrzés Then
                                        sFoly Me, "Az egyéb ellenõrzések készítése:; kezdõdik."
                    Call Ellenõrzés2(Me, False)
                                        sFoly Me, "Az egyéb ellenõrzések készítése:; véget ért."
            End If
        End If
                                    sFoly Me, "##########################;########", False
                                    
    End If
    '## A kimutatásnak és az ellenõrzés folytatásának a vége
'## Innen akkor is fut, ha egy jelölõ négyzet sem igaz
End Sub
