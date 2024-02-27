'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Function Nü(érték As Variant, értékhaüres As Variant) As Variant
'##########
'# Oláh Zoltán (c) 2024 MIT
'# Ha az érték üres (Null, "" vagy 0), akkor az értékhaüres értékét adja vissza, egyébként az értéket.
'# Akkor használható, ha nem tudjuk, hogy a vizsgált érték hogyan üres, de szeretnénk helyette egy  másik értéket.
'##########
    If IsNull(érték) Or érték = vbNullString Or érték = 0 Then
        Nü = értékhaüres
        Exit Function
    End If
    Nü = érték
End Function

Function tömbDim(ByVal tömb As Variant) As Integer
'#MIT Oláh Zoltán (c) 2024
'# Egy tömb dimenzióinak a számát adja vissza
    Dim dimSzám As Long
    On Error GoTo Eredmény
    dimSzám = 1
    Do While LBound(tömb, dimSzám) Or True
        dimSzám = dimSzám + 1
    Loop: Exit Function
Eredmény:
    tömbDim = dimSzám - 1
End Function

Function vane(teljesútvonal As String) As Boolean
    vane = (Dir(teljesútvonal) <> vbNullString)
End Function
Function ÚtvonalKészítõ(ByVal útvonal As String, ByVal fájlnév As String)
'****** (c) Oláh Zoltán 2022 - MIT Licence ****************
Dim per As String
    per = Right(útvonal, 1)
    'Debug.Print Útvonal, per
    
    If per <> "\" Then
        per = "\"
    Else
        per = ""
    End If
    'Debug.Print "per = " & per
    ÚtvonalKészítõ = útvonal & per & fájlnév
End Function



Function párkeresõ(ByRef tömb As Variant, keresett As Variant) As Variant

    For i = 1 To UBound(tömb, 1)
        If tömb(i, 1) = keresett Then
            
            párkeresõ = tömb(i, 2)
            Exit Function ' Kilép, ha találtunk
            
        End If
    Next i
    'Ha nem találtunk üresen tér vissza
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


Function lejárat(perc As Integer) As Date
    Dim idõ As Date
    
    idõ = Now()
    lejárat = TimeSerial(Hour(idõ), Minute(idõ) + perc, Second(idõ))
    
End Function


