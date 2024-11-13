
Option Explicit
Private piSkála As Integer
Private pdblValue As Integer
Private pOszlopSzam As Long
Private idoKezdes As Date

Public Sub Ini(Optional skála As Integer = 100)
        Dim xxx As String
        Dim i As Long
    xxx = ""
    piSkála = skála
    'Application.DisplayStatusBar = True
    'Application.StatusBar = xxx
    Status (xxx)
    For i = 1 To piSkála
        xxx = xxx & "-"
    Next
    xxx = xxx & "   0%"
    'Application.StatusBar = xxx
    Status (xxx)
    
    idoKezdes = Now()
    
End Sub
Public Property Get oszlopszam() As Long
    oszlopszam = pOszlopSzam
End Property
Public Property Let oszlopszam(ByVal lMax As Long)
    pOszlopSzam = lMax
End Property
Public Property Get Value() As Double
    Value = pdblValue
End Property
Public Property Let Value(ByVal dblVal As Double)
    If Me.oszlopszam >= dblVal Then
        pdblValue = dblVal
    End If
End Property
Public Sub Novel()
    Me.Value = pdblValue + 1
    Frissit

End Sub
Private Sub Frissit()
fvbe ("Frissít")
    Dim dblÁllás As Double
    Dim dblXszám As Double
    Dim n As Long
    Dim xxx As String
    Dim oszlopszam As Long
    oszlopszam = Me.oszlopszam
    If oszlopszam Then
        dblÁllás = Me.Value / oszlopszam 'A jelenlegi állás
    Else
        dblÁllás = 1
        oszlopszam = 1
    End If
    dblXszám = Round(piSkála * dblÁllás, 0) ' Egész számra kerekítve a kiírandó X-ek száma
    If dblXszám > Round(piSkála * (Me.Value - 1) / oszlopszam) Then
        xxx = ""
        For n = 1 To piSkála
            If n <= dblXszám Then
                xxx = xxx & "x"
            Else
                xxx = xxx & "-"
            End If
        Next
        Select Case Len(dblXszám)
            Case 1
                xxx = xxx & "   "
            Case 2
                xxx = xxx & "  "
            Case 3
                xxx = xxx & " "
        End Select
        xxx = xxx & dblXszám & "%" & hatralevoIdo(dblÁllás)
        'Application.StatusBar = xxx
        Status (xxx)
    End If
    logba , dblÁllás & "," & piSkála & "," & dblXszám, 4
    If dblXszám = piSkála Then Me.Torol
    DoEvents
fvki
End Sub
Public Sub Torol()
    'Application.StatusBar = ""
    Status ("")
End Sub
Private Function hatralevoIdo(dblÁllás As Double) As String
Dim ido As Long, _
    óra As Long, _
    perc As Long, _
    mp  As Long
Dim Kimenet As String
Dim befejezés As Date

    ido = Int(DateDiff("s", idoKezdes, Now()) / dblÁllás) * (1 - dblÁllás)
    befejezés = Format(DateAdd("s", ido, Now()), "hh:mm:ss")
    óra = Int(ido / (60 * 60))
    perc = Int((ido - (óra * 60 * 60)) / 60)
    mp = ido - ((óra * 60 * 60) + perc * 60)
    'óra
    If óra > 0 Then
        Kimenet = Right(0 & óra, 2) & ":"
    End If
    'perc
    Kimenet = Kimenet & Right(0 & perc, 2) & ":"
    'másodperc
    Kimenet = Kimenet & Right(0 & mp, 2)
hatralevoIdo = " Hátralévõ idõ:" & Kimenet & ". Várható befejezés:" & befejezés & "."
End Function

