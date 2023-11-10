Option Explicit
Private piSk�la As Integer
Private pdblValue As Integer
Private pOszlopSzam As Long
Private piSzakaszSz�m As Integer 'a Szakaszok sz�ma �sszesen
Private piJelenlegiSzakasz As Integer 'a Szakaszok sz�ml�l�ja
'###
Public Sub Class_Initialize()
    piSzakaszSz�m = 5
    piJelenlegiSzakasz = 1
End Sub
Public Sub Ini(Optional Sk�la As Integer = 100)
        Dim xxx As String
        Dim i As Long
    xxx = ""
    piSk�la = Sk�la
    
    
    Status (xxx)
    For i = 1 To piSk�la
        xxx = xxx & "-"
    Next
    xxx = xxx & "   0%"

    Status (xxx)
End Sub
Public Property Get SzakaszSz�m() As Integer
     SzakaszSz�m = piSzakaszSz�m
End Property
Public Property Let SzakaszSz�m(ByVal SzakaszokSz�ma As Integer)
    If SzakaszokSz�ma = 0 Then piSzakaszSz�m = 1
    piSzakaszSz�m = SzakaszokSz�ma
End Property
Public Property Get JelenlegiSzakasz() As Integer
    JelenlegiSzakasz = SzakaszSz�ml�l�()
End Property
Public Property Get Sk�la() As Integer
    Sk�la = piSk�la
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
    Dim dblXsz�m As Double
    Dim n As Long
    Dim xxx As String
    Dim dbl�ll�s As Double
    
    dblXsz�m = Round(piSk�la * �ll�s(), 0) ' Eg�sz sz�mra kerek�tve a ki�rand� X-ek sz�ma
    xxx = ""
    For n = 1 To piSk�la
        If n <= dblXsz�m Then
            xxx = xxx & "x"
        Else
            xxx = xxx & "-"
        End If
    Next
    Select Case Len(dblXsz�m)
        Case 1
            xxx = xxx & "   "
        Case 2
            xxx = xxx & "  "
        Case 3
            xxx = xxx & " "
    End Select
    xxx = xxx & Round(�ll�s() * 100, 0) & "%"
    'Application.StatusBar = xxx
    Status (xxx)
    Debug.Print dbl�ll�s
    If dblXsz�m = piSk�la Then Me.Torol
End Sub
Public Sub Torol()
'    Application.StatusBar = ""
    Status ("")
    piSk�la = 0
    pdblValue = 0
    pOszlopSzam = 0
    piSzakaszSz�m = 0
    piJelenlegiSzakasz = 0
End Sub
Private Function �ll�s()
'A jelenlegi �ll�st adja vissza, kerek�t�s n�lk�l pl.:0,145789
    If Me.OszlopSzam = 0 Then
        �ll�s = 0
    Else
        �ll�s = Me.Value / Me.OszlopSzam
    End If
End Function
Private Function SzakaszSz�ml�l�() As Integer
    'a jelenlegi �ll�s / (sk�la / szakszok sz�ma) eg�sz r�sze
    SzakaszSz�ml�l� = Round(�ll�s() * 100 / (piSk�la / piSzakaszSz�m), 0)
End Function
