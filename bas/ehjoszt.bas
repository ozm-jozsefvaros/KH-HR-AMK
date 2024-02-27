
Option Explicit
Private piSkála As Integer
Private pdblValue As Integer
Private pOszlopSzam As Long

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
    Dim dblÁllás As Double
    Dim dblXszám As Double
    Dim n As Long
    Dim xxx As String
    dblÁllás = Me.Value / Me.oszlopszam 'A jelenlegi állás
    dblXszám = Round(piSkála * dblÁllás, 0) ' Egész számra kerekítve a kiírandó X-ek száma
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
    xxx = xxx & dblXszám & "%"
    'Application.StatusBar = xxx
    Status (xxx)
    'Debug.Print dblÁllás, piSkála, dblXszám
    If dblXszám = piSkála Then Me.Torol
End Sub
Public Sub Torol()
    'Application.StatusBar = ""
    Status ("")
End Sub


