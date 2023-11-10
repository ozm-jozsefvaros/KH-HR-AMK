Option Explicit
Private piSkála As Integer
Private pdblValue As Integer
Private pOszlopSzam As Long
Private piSzakaszSzám As Integer 'a Szakaszok száma összesen
Private piJelenlegiSzakasz As Integer 'a Szakaszok számlálója
'###
Public Sub Class_Initialize()
    piSzakaszSzám = 5
    piJelenlegiSzakasz = 1
End Sub
Public Sub Ini(Optional Skála As Integer = 100)
        Dim xxx As String
        Dim i As Long
    xxx = ""
    piSkála = Skála
    
    
    Status (xxx)
    For i = 1 To piSkála
        xxx = xxx & "-"
    Next
    xxx = xxx & "   0%"

    Status (xxx)
End Sub
Public Property Get SzakaszSzám() As Integer
     SzakaszSzám = piSzakaszSzám
End Property
Public Property Let SzakaszSzám(ByVal SzakaszokSzáma As Integer)
    If SzakaszokSzáma = 0 Then piSzakaszSzám = 1
    piSzakaszSzám = SzakaszokSzáma
End Property
Public Property Get JelenlegiSzakasz() As Integer
    JelenlegiSzakasz = SzakaszSzámláló()
End Property
Public Property Get Skála() As Integer
    Skála = piSkála
End Property
Public Property Get OszlopSzam() As Long
    OszlopSzam = pOszlopSzam
End Property
Public Property Let OszlopSzam(ByVal lMax As Long)
    pOszlopSzam = lMax
End Property
Public Property Get Value() As Double
    Value = pdblValue
End Property
Public Property Let Value(ByVal dblVal As Double)
    If Me.OszlopSzam >= dblVal Then
        pdblValue = dblVal
    End If
End Property
Public Sub Novel()
    Me.Value = pdblValue + 1
    Frissit
End Sub
Private Sub Frissit()
    Dim dblXszám As Double
    Dim n As Long
    Dim xxx As String
    Dim dblÁllás As Double
    
    dblXszám = Round(piSkála * állás(), 0) ' Egész számra kerekítve a kiírandó X-ek száma
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
    xxx = xxx & Round(állás() * 100, 0) & "%"
    'Application.StatusBar = xxx
    Status (xxx)
    Debug.Print dblÁllás
    If dblXszám = piSkála Then Me.Torol
End Sub
Public Sub Torol()
'    Application.StatusBar = ""
    Status ("")
    piSkála = 0
    pdblValue = 0
    pOszlopSzam = 0
    piSzakaszSzám = 0
    piJelenlegiSzakasz = 0
End Sub
Private Function állás()
'A jelenlegi állást adja vissza, kerekítés nélkül pl.:0,145789
    If Me.OszlopSzam = 0 Then
        állás = 0
    Else
        állás = Me.Value / Me.OszlopSzam
    End If
End Function
Private Function SzakaszSzámláló() As Integer
    'a jelenlegi állás / (skála / szakszok száma) egész része
    SzakaszSzámláló = Round(állás() * 100 / (piSkála / piSzakaszSzám), 0)
End Function
