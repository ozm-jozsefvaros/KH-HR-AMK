
Option Explicit
Private piSk�la As Integer
Private pdblValue As Integer
Private pOszlopSzam As Long

Public Sub Ini(sk�la As Integer)
        Dim xxx As String
        Dim i As Long
    xxx = ""
    piSk�la = sk�la
    'Application.DisplayStatusBar = True
    'Application.StatusBar = xxx
    Status (xxx)
    For i = 1 To piSk�la
        xxx = xxx & "-"
    Next
    xxx = xxx & "   0%"
    'Application.StatusBar = xxx
    Status (xxx)
End Sub
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
    Dim dbl�ll�s As Double
    Dim dblXsz�m As Double
    Dim n As Long
    Dim xxx As String
    dbl�ll�s = Me.Value / Me.OszlopSzam 'A jelenlegi �ll�s
    dblXsz�m = Round(piSk�la * dbl�ll�s, 0) ' Eg�sz sz�mra kerek�tve a ki�rand� X-ek sz�ma
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
    xxx = xxx & piSk�la & "%"
    'Application.StatusBar = xxx
    Status (xxx)
    'Debug.Print dbl�ll�s
    If dblXsz�m = piSk�la Then Me.Torol
End Sub
Public Sub Torol()
'    Application.StatusBar = ""
    Status ("")
End Sub

