'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Public Const ¸ As String = ";"
Function ¤(szöveg, Optional távtartó As Variant = "")
'##########
'# Oláh Zoltán (c) 2024 MIT
    távtartó = Left(távtartó, 1)
    Select Case távtartó
        Case ";"
            Debug.Print szöveg;
        Case ","
            Debug.Print szöveg,
        Case Else
            Debug.Print szöveg
    End Select
End Function
Function Nü(érték As Variant, értékhaüres As Variant) As Variant
'##########
'# Oláh Zoltán (c) 2024 MIT
'# Ha az érték üres (Null, "" vagy 0), akkor az értékhaüres értékét adja vissza, egyébként az értéket.
'# Akkor használható, ha nem tudjuk, hogy a vizsgált érték hogyan üres, de szeretnénk helyette egy másik értéket.
'##########
    If IsObject(érték) Then
        If IsEmpty(érték) Then
            If IsObject(értékhaüres) Then
                Set Nü = értékhaüres
            Else
                Nü = értékhaüres
            End If
        Else
           Set Nü = érték
        End If
        Exit Function
    End If
    If IsNull(érték) Or érték = vbNullString Or érték = 0 Then
        If IsObject(értékhaüres) Then
            Set Nü = értékhaüres
        Else
            Nü = értékhaüres
        End If
        Exit Function
    End If
    Nü = érték
End Function

Function ÷(ByRef növelendõ As Variant)
    On Error GoTo Hiba
        növelendõ = Nü(növelendõ, 0)
        növelendõ = CLng(növelendõ) + 1
         ÷ = növelendõ
    Exit Function
Hiba:
    Select Case Err.Number
        Case 13
            növelendõ = 1
        Case Else
            MsgBox Hiba(Err)
    End Select
   
End Function
Function ÷_(növelendõ As Long)

End Function
Function ¡(ByRef csökkentendõ As Long)
    On Error GoTo Hiba
        csökkentendõ = Nü(csökkentendõ, 0)
        csökkentendõ = CLng(csökkentendõ) - 1
        ¡ = csökkentendõ
    Exit Function
Hiba:
    Select Case Err.Number
        Case 13
            csökkentendõ = 1
        Case Else
            MsgBox Hiba(Err)
    End Select
End Function
Function §(Optional ByRef megismétlendõ As Variant = Null)
If Not IsNull(megismétlendõ) Then _
    megismétlendõ = megismétlendõ & megismétlendõ
    § = megismétlendõ
End Function
Function tömbDim(ByVal tömb As Variant) As Integer
'#MIT Oláh Zoltán (c) 2024
'# Egy tömb dimenzióinak a számát adja vissza
    Dim dimSzám As Long
    On Error GoTo Eredmény
    dimSzám = 1
    Do While LBound(tömb, dimSzám) Or True
        ÷ dimSzám
    Loop: Exit Function
Eredmény:
    ÷ dimSzám
    tömbDim = dimSzám
End Function

Function vane(teljesútvonal As String) As Boolean
    vane = (Dir(teljesútvonal) <> vbNullString)
End Function

Function ÚtvonalKészítõ(ByVal Útvonal As String, ByVal fájlnév As String)
'****** (c) Oláh Zoltán 2022 - MIT Licence ****************
Dim per As String
    per = Right(Útvonal, 1)
    'Debug.Print Útvonal, per
    
    If per <> "\" Then
        per = "\"
    Else
        per = ""
    End If
    'Debug.Print "per = " & per
    ÚtvonalKészítõ = Útvonal & per & fájlnév
End Function

Function párkeresõ(ByRef tömb As Variant, keresett As Variant, Optional hanyadik As Integer = 2) As Variant
'******************************************************************
'
' Ez a függvény megkeresi a megadott értéket (keresett) egy kétdimenziós tömb elsõ oszlopában, és visszaadja
' a keresett elemhez tartozó párját a tömb egy másik oszlopából (a hanyadik paraméter szerint).
'
' Paraméterek:
' - tömb (ByRef Variant): A kétdimenziós tömb, amelyben a keresést végezzük. Az elsõ oszlopban keresi a keresett értéket.
' - keresett (Variant): Az az érték, amelyet a tömb elsõ oszlopában keresünk.
' - hanyadik (Optional Integer): Az oszlop száma, amelybõl a keresett értékhez tartozó párt visszaadjuk. Alapértelmezett értéke 2.
'
' Mûködés:
' - A függvény végigmegy a tömb elsõ oszlopán, és ha megtalálja a keresett értéket, visszaadja annak párját a megadott oszlopból.
' - Ha nem találja a keresett értéket, akkor 0-t ad vissza.
'
' Visszatérési érték:
' - Variant: A keresett értékhez tartozó elem a megadott oszlopból, vagy 0, ha a keresett érték nem található.
'
'******************************************************************
    For i = 1 To UBound(tömb, 1)
        If tömb(i, 1) = keresett Then
            párkeresõ = tömb(i, hanyadik)
            Exit Function ' Kilép, ha találtunk
        End If
    Next i
    'Ha nem találtunk, üresen tér vissza
    párkeresõ = 0
End Function



Function LS(ByVal str1 As String, ByVal str2 As String) As Integer 'Levenshtein távolság számítása
    Dim arrLev, intLen1 As Integer, intLen2 As Integer, i As Integer
    Dim j, arrStr1, arrStr2, intMini As Integer
 
    intLen1 = Len(str1)
    ReDim arrStr1(intLen1 + 1)
    intLen2 = Len(str2)
    ReDim arrStr2(intLen2 + 1)
    ReDim arrLev(intLen1 + 1, intLen2 + 1)
 
    arrLev(0, 0) = 0
    For i = 1 To intLen1
        arrLev(i, 0) = i
        arrStr1(i) = Mid(str1, i, 1)
    Next
 
    For j = 1 To intLen2
        arrLev(0, j) = j
        arrStr2(j) = Mid(str2, j, 1)
    Next
 
    For j = 1 To intLen2
        For i = 1 To intLen1
            If arrStr1(i) = arrStr2(j) Then
                arrLev(i, j) = arrLev(i - 1, j - 1)
            Else
                intMini = arrLev(i - 1, j) 'deletion
                If intMini > arrLev(i, j - 1) Then intMini = arrLev(i, j - 1) 'insertion
                If intMini > arrLev(i - 1, j - 1) Then intMini = arrLev(i - 1, j - 1) 'deletion
 
                arrLev(i, j) = intMini + 1
            End If
        Next
    Next
 
    LS = arrLev(intLen1, intLen2)
End Function


Function Lejárat(perc As Integer) As Date
    Dim idõ As Date
    
    idõ = Now()
    Lejárat = TimeSerial(Hour(idõ), Minute(idõ) + perc, Second(idõ))
    
End Function
Function felhasználó()
    felhasználó = Environ("USERNAME")
End Function
Function szgép()
    szgép = Environ("Computername")
End Function
Function gép()
    gép = Environ("Computername")
End Function

Sub várakozás(Optional mp As Integer = 1)
'Másodpercben megadott ideig várakozik, közben fél mp-nként visszaadja a vezérlést...
Dim tMost As Variant
Dim tKöv As Variant
    tVár = Time
    tVár = DateAdd("s", mp, tVár)
    tKöv = DateAdd("s", 1, tMost)
    Do Until tMost >= tVár
        tMost = Time
        If tMost > tKöv Then
            tKöv = DateAdd("s", 0.5, tMost)
            DoEvents
        End If
    Loop
End Sub
Sub Status(pstrStatus As String)
    
    Dim lvarStatus As Variant
    
    If pstrStatus = "" Then
        lvarStatus = SysCmd(acSysCmdClearStatus)
    Else
        lvarStatus = SysCmd(acSysCmdSetStatus, pstrStatus)
    End If
    
End Sub
