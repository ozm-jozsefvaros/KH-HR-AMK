Option Compare Database
Public Type változó
    név As String
    érték As Variant
End Type
Public vált1 As változó
Public vált2 As változó
Public vált3 As változó

Function ÜresE(EllenõrizendõVáltozó As változó) As Boolean
    ÜresE = Nz(EllenõrizendõVáltozó.érték, vbNullString) = vbNullString _
            And Nz(EllenõrizendõVáltozó.név, vbNullString) = vbNullString
'Dim válasz As Boolean
'    válasz = False
'        If Nz(EllenõrizendõVáltozó.érték, vbNullString) = vbNullString _
'            And Nz(EllenõrizendõVáltozó.név, vbNullString) = vbNullString _
'            Then _
'                válasz = True
'
'    ÜresE = válasz
End Function
Function Hiba(error As ErrObject) As String
'******************************************************************
' Ez a függvény kezeli a hibákat, naplózza a részleteket, és visszaadja a hibaüzenetet.
' Az eljárás összegyûjti és formázza a hibával kapcsolatos információkat, beleértve a változók értékeit és a meghívási hierarchiát.
'
' Paraméterek:
' - error: ErrObject - Az elõfordult hibát leíró objektum.
'
' Meghívott eljárások:
' 1. ÜresE(ByVal vált As Variant) As Boolean
'    - Leírás: Ellenõrzi, hogy a megadott változó üres-e.
'    - Paraméterek:
'      * vált: A vizsgálandó változó.
'    - Visszatérési érték: True, ha a változó üres; különben False.
'
' 2. logba(ByVal BejegyzésTárgya As String, ByVal bejegyzés As String, ByVal logszint As Integer)
'    - Leírás: Üzenetet ír a naplóba.
'    - Paraméterek:
'      * BejegyzésTárgya: A naplózás tárgya.
'      * bejegyzés: A naplózásra kerülõ üzenet.
'      * logszint: A naplózás szintje.
'
' Visszatérési érték:
' - String: A formázott hibaüzenet.
'
' Péda a használatra:
' hiba:
'   vált1.név = "intDb" ' az 1. változó neve
'   vált1.érték = "23" '<- az 1. változó értéke
'   ...
'   MsgBox hiba Err
'******************************************************************
'
Dim Bejegyzés As String, _
    fvnév As Variant
Dim n As Long
Dim MindÜres As Boolean
MindÜres = True


If intLoglevel >= 2 Then
    '# Változók felsorolása
    If Not ÜresE(vált1) Then
        MindÜres = False
        Bejegyzés = Bejegyzés & _
                    vált1.név & ":  " & vált1.érték & vbNewLine
    End If
    If Not ÜresE(vált2) Then
        MindÜres = False
        Bejegyzés = Bejegyzés & _
                    vált2.név & ":  " & vált2.érték & vbNewLine
    End If
    If Not ÜresE(vált3) Then
        MindÜres = False
        Bejegyzés = Bejegyzés & _
                    vált3.név & ":  " & vált3.érték & vbNewLine
    End If
    If Not MindÜres Then _
        Bejegyzés = "Változók:" & vbNewLine & Bejegyzés
    ''# A meghívási hierarchiában feljebb lévõ függvények listája
    n = colFvNév.count
    For Each fvnév In colFvNév
        n = n - 1
        Bejegyzés = Bejegyzés & vbNewLine & n & ": " & fvnév
    Next fvnév
End If
        Bejegyzés = "A hiba száma:  " & error.Number & vbNewLine & _
                    "A hiba leírása:" & error.Description & vbNewLine & _
                    "Forrása:       " & error.Source & vbNewLine & _
                    "A felsõbb szintû meghívó fv-ek:" & vbNewLine & _
                    Bejegyzés

    Flush = True
    logba BejegyzésTárgya:=sFN, _
          Bejegyzés:=Bejegyzés, _
          logszint:=0
    Hiba = Bejegyzés
                    
End Function
 Public Sub Próba()
10       fvbe ("Próba")
20       Dim a As Integer

30       On Error GoTo Hiba
31      For i = 1 To 100
32             a = 1 / 0
33  Next
50 Hiba:
60       vált1.név = "a"
62       vált1.érték = a
63       MsgBox Hiba(Err) & vbNewLine & Erl
59       fvki
90 End Sub