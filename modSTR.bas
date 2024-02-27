'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Function BFKH(kód As String) As String
'#MIT Oláh Zoltán (c) 2022
'# Minden két pont között, ha csak egy karakter van, beszúr eléje egy 0-t. Pl.:BFKH.1.2. -> BKFH.01.02.
'# Cél: Az így kialakított szervezeti egység azonosító ABC sorba rendezve értelmes sorrendet ad...
    Dim intN, i, intPoz As Integer
    Dim strÁtm, strElv As String
    
    strElv = "."
    strÁtm = ""
    intN = StrCount(kód, strElv)
    
    For i = 1 To intN
        Select Case i
            Case 1 'elsõ
                strÁtm = ffsplit(kód, strElv, i)
            Case Else 'a közbülsõk
                If Len(ffsplit(kód, strElv, i)) = 1 Then
                    strÁtm = strÁtm & ".0" & ffsplit(kód, strElv, i)
                Else
                    strÁtm = strÁtm & "." & ffsplit(kód, strElv, i)
                End If
        End Select
                
    Next i
    BFKH = strÁtm
End Function
Function tBFKH(ByVal strHivatalVagyFõosztály As Variant) As String
'#MIT Oláh Zoltán (c) 2024

    If IsNull(strHivatalVagyFõosztály) Then
        tBFKH = ""
        Exit Function
    End If
    tBFKH = Replace(strHivatalVagyFõosztály, "Budapest Fõváros Kormányhivatala", "BFKH")
End Function
Public Function ffsplit(ByVal mezõ As Variant, Optional ByVal elválasztó As String = ",", Optional ByVal szám As Integer = 1) As String
'Licencia: MIT Oláh Zoltán 2022 (c)
'A megadott 'elválasztó'-val tagolt 'mezõ' karakterláncban a Szám-nak megfelelõ sorszámú tagot adja vissza.
'Ha a megadott 'mezõ' érték null, üres karakterláncot ad vissza.
'Ha a megadott érték nem tartalmazza az 'elválasztó'-t, a megadott értéket adja vissza
'Ha Szám nagyobb, mint ahány darabra osztható az elválasztóval a mezõ, akkor az utolsó értéket adja.
    Dim temp() As String
    Dim n As Integer
On Error GoTo Hiba
    If IsNull(mezõ) Then
        ffsplit = ""
        Exit Function
    End If
    n = StrCount(mezõ, elválasztó)
    If n < 1 Then
        ffsplit = mezõ
        Exit Function
    End If
    ReDim temp(n)
    'Debug.Print mezõ & ", " & n

    temp = Split(mezõ, elválasztó)
    If szám > n + 1 Then
        szám = n + 1
    End If
    ffsplit = Trim(temp(szám - 1))
    'Debug.Print temp(Szám - 1)

Exit Function
Hiba:
MsgBox (Err.Number & " - " & Err.Description)
End Function
Function Utolsó(ByVal szöveg As String, Optional ByVal elválasztó As String = "", Optional ByVal vissza As Integer = 0) As String
'Licencia: MIT Oláh Zoltán 2023 (c)
'Ez a fv az elválasztó-val tagolt megadott szöveg utolsó tagját adja eredményül.
'Ha a vissza érték meg van adva, akkor az utolsótól vissza értékkel visszaszámol, s annak a helynek az értékét adja vissza.
'Hasonlít az InStrRev függvényre, de:
'   az elválasztó nem kötelezõ elem, megpróbálja kitalálni;
'   a 'vissza' paraméter az ismétlõdõ elemek számát jelenti, s nem a hátulról számított karakterek számát;
'   a 'vissza' paraméter lehet negatív és pozitív is; és Null is, de ekkor üres értékkel tér vissza (az InStrRev ilyenkor hibára fut)

    Dim db As Integer
    Dim i As Integer 'számláló
    
    If elválasztó = "" Then
        Dim elválasztók(7) As Variant
        elválasztók(0) = ","
        elválasztók(1) = ";"
        elválasztók(2) = "."
        elválasztók(3) = ":"
        elválasztók(4) = "|"
        elválasztók(5) = "\"
        elválasztók(6) = "/"
        elválasztók(7) = "-"
    
        For i = 0 To UBound(elválasztók)
            If InStr(1, szöveg, elválasztók(i)) > 0 Then
                elválasztó = elválasztók(i)
                Exit For
            End If
        Next i
    End If
    If elválasztó = "" Then
        Utolsó = ""
        Exit Function ' ha mindezek ellenére üres, akkor üres értékkel térünk vissza
    End If
    db = StrCount(szöveg, elválasztó) + 1
    If IsNull(vissza) Then vissza = 0
    vissza = Abs(vissza)
    If vissza >= db Or vissza < 0 Then
        Utolsó = ""
        Exit Function
    End If
    Utolsó = ffsplit(szöveg, elválasztó, db - vissza)

End Function
Public Function StrCount(ByVal szöveg As Variant, ByVal keresett As Variant) As Integer
'------------------------------------------------------------------
' Purpose: Counts the numbers of times an item occurs
' in a string.
' Coded by: raskew
' Arguments: TheStr: The string to be searched.
' TheItem: The item to search for.
' Returns: The number of occurences as an integer.
'
' Note: To test: Type '? StrCount(""The quick brown fox jumped over
' the lazy dog"", ""the"") in the debug window.
' The function returns 2.
'####################################################################
'# Módosította: Oláh Zoltán (2024) MIT
'# Dim I As Integer <- felesleges
'# If Instr(1,strHold,itemhold) > 0 then <-nem ezt kell vizsgálni
'# hossz bevezetés: áttekinthetõbb, s talán gyorsabb is
'# A Null értékek esetén 0 eredménnyel tér visssza,
'# variant: így számokra is használható
'####################################################################
'------------------------------------------------------------------

Dim j As Integer
Dim placehold As Integer
Dim varHold As Variant
Dim itemhold As Variant
Dim hossz As Long

    varHold = Nz(szöveg, "") 'Itt szûrjük ki a Null értékeket
    itemhold = Nz(keresett, "")
    hossz = Len(itemhold) 'Elõre kiszámítjuk, többször használjuk
    j = 0
    
    If hossz > 0 Then ' A nullhosszú keresett szöveg nagyon sok találatot eredményez XD
        While InStr(1, varHold, itemhold) > 0
            placehold = InStr(1, varHold, itemhold)
            j = j + 1
            varHold = Mid(varHold, placehold + hossz)
        Wend
    End If
    StrCount = j
End Function
Function TrimX(ByVal tisztítandó As Variant, ByVal mitõl As Variant) As String
'Licencia: MIT Oláh Zoltán 2024 (c)
    If IsNull(tisztítandó) Or IsNull(mitõl) Then
        TrimX = vbNullString
        Exit Function
    End If
    If Left(tisztítandó, 1) = mitõl Then
        tisztítandó = Right(tisztítandó, Len(tisztítandó) - 1)
    End If
    If Right(tisztítandó, 1) = mitõl Then
        tisztítandó = Left(tisztítandó, Len(tisztítandó) - 1)
    End If
    TrimX = tisztítandó
End Function
Function zárojeltelenítõ(ByVal név As Variant) As String
'Licencia: MIT Oláh Zoltán 2023 (c)
    Dim zjh As String 'A zárójel helye
    zjh = 0
    név = Nz(név, "")
    zjh = InStr(1, név, "(")
    If zjh > 0 Then
           zárojeltelenítõ = Trim(Left(név, zjh - 1))
    Else
        zárojeltelenítõ = név
    End If
End Function
Function névelõ(szó As Variant) As String
'Licencia: MIT Oláh Zoltán 2022 (c)
    'A névelõ második betûjét z-re állítja, vagy semmire
    Dim magánhangzók As String
    Dim keresett As String
    
    magánhangzók = "aáeéiíoóöõuúüûAÁEÉIÍOÓÖÕUÚÜÛ"
    keresett = Left(szó, 1)
    Select Case keresett
        Case 0 To 9
            Select Case keresett
                Case 1, 5
                    névelõ = "z"
                Case Else
                    névelõ = ""
            End Select
            Exit Function
    End Select
    If InStr(1, magánhangzók, Left(szó, 1)) > 0 Then
        névelõ = "z"
    Else
        névelõ = ""
    End If
    
End Function

Function névelõvel(szó As Variant, Optional ez As Boolean = False, Optional határozói As Boolean = False, Optional nagybetû As Boolean) As String
'Licencia: MIT Oláh Zoltán 2022 (c)
    If ez Then
        névelõvel = "e"
        If nagybetû Then
            névelõvel = UCase(névelõvel)
        End If
        If határozói Then
            névelõvel = névelõvel & "me"
        End If
    Else
        névelõvel = "a"
        If nagybetû Then
            névelõvel = UCase(névelõvel)
        End If
        If határozói Then
            névelõvel = névelõvel & "ma"
        End If
    End If
    névelõvel = névelõvel & névelõ(szó) & " " & szó
End Function
Function drhátra(név As String) As String
'Licencia: MIT Oláh Zoltán 2023 (c)
'Megkeresi a név elején a "Dr. " szövegrészt és a végére teszi
    Dim drv As Boolean
    drv = False
    
    If LCase(Left(név, 3)) = "dr." Then
        név = Trim(Right(név, Len(név) - 3)) & " dr."
    End If
    drhátra = név
    név = ""
End Function
Function drLeválaszt(név As Variant, Optional elõtagot As Boolean = True) As String
'Licencia: MIT Oláh Zoltán 2023 (c)
'# Hibás eredményt ad az alábbi esetekben:
'# dr. Kovács Jánosné Horváth Etelka dr.",False <-- Megoldás: csak az elsõt kell meghagyni

Dim elõtag As String
    If IsNull(név) Then
        drLeválaszt = ""
        Exit Function
    End If
    név = Trim(név)
    elõtag = "dr." ' Ha csak más eredményre nem jutunk

    Select Case ffsplit(név, " ", 1) 'Megvizsgáljuk az elsõ szót, Dr-e
        Case "Dr."
            név = Trim(Mid(név, 4, Len(név) - 3))
        Case "Dr"
            név = Trim(Mid(név, 3, Len(név) - 2))
        Case Else
            Select Case ffsplit(név, " ", StrCount(név, " ") + 1) 'Ha az elsõ szó nem Dr, akkor az utolsó az-e
                Case "Dr."
                    név = Trim(Left(név, Len(név) - 4))
                Case "Dr"
                    név = Trim(Left(név, Len(név) - 3))
                Case Else 'ha sem elõl, sem hátul nincs...
                    If ffsplit(név, ".", 1) = "dr" Then 'akkor még lehet, hogy a Dr.Kovács esete áll fenn?
                        név = Trim(Mid(név, 4, Len(név) - 3))
                    Else
                        elõtag = ""
                    End If
             End Select
    End Select
    If elõtagot Then
        drLeválaszt = elõtag
    Else
        drLeválaszt = név
    End If

End Function
Function szövegFûzõ(szöveg As String, szám As Integer) As String
'#MIT Oláh Zoltán (c) 2023
'Print szövegFûzõ("V", 3)
'VVV
    Dim n As Integer
    If szám < 1 Then Exit Function
    For n = 1 To szám
        szövegFûzõ = szövegFûzõ & szöveg
    Next n
End Function
Function Irsz(cím As Variant) As String
'#MIT Oláh Zoltán (c) 2023
'Ha a cím elsõ 4 karaktere az irányítószám, akkor azt adja vissza
    'Left(IIf(Len(Nz([Munkavégzés helye - cím];""))<3;"000";Nz([Munkavégzés helye - cím];"000"));3)*1
    If IsNull(cím) Or Len(cím) < 4 Then
        Irsz = "0000"
        Exit Function
    End If
    Irsz = Left(Trim(cím), 4)
    If Not IsNumeric(Irsz) Then
        Irsz = "0000"
    End If
End Function
Function Kerület(Irsz As Variant) As Integer
'#MIT (c) Oláh Zoltán  2023-2024
    Dim n, hossz As Integer
    hossz = Nz(Len(Irsz), 0)
    If IsNull(Irsz) Or hossz < 3 Or hossz > 4 Then
        Kerület = 0
        Exit Function
    End If
    If Left(Irsz, 1) = 1 Then ' Csak Budapest
        Select Case hossz
            Case 4
                Kerület = Mid(Irsz, 2, 2)
            Case 3
                Kerület = Right(Irsz, 2)
            Case Else
                Kerület = 0
                Exit Function
        End Select
    Else
        Kerület = 0
    End If
End Function
Public Function dtÁtal(strDátum As Variant, Optional sorrend As String = "éhn") As Date
' (c) Oláh Zoltán 2024 MIT
' A megadott szöveget (strDátum) átalakítja dátummá.
' Érvényes elválasztók: . vagy - vagy /
' Ha az elválasztóval elválasztott értékeknek nincs megadva a sorrendje, akkor az év, hó, nap sorrendet feltételezi.
' Ha
' Ha a strDátum értéke Null vagy semmi, továbbá, ha a sorrend elsõ három karaktere az é, h és n betûkbõl nem pontosan egyet-egyet tartalmaz,
' akkor 1-et ad vissza.
' Kell hozzá az ffsplit() fv., ahhoz meg a StrCount() függvény.
    Dim dtVál, dtVálasztók, strDate As String
    Dim év, hó, nap As String
    Dim i, darab, ihó, inap, iév As Integer
    sorrend = Left(sorrend, 3)
    If (StrCount(sorrend, "é") <> 1) Or (StrCount(sorrend, "h") <> 1) Or (StrCount(sorrend, "n") <> 1) Then
        dtÁtal = 0
        Exit Function
    End If
    
    'Debug.Print strDátum
    If IsNull(strDátum) Or strDátum = "" Then
        dtÁtal = 0
        Exit Function
    End If
    
    dtVálasztók = ".-/"
    For j = 2 To 0 Step -1
        For i = 1 To Len(dtVálasztók)
            dtVál = Mid(dtVálasztók, i, 1)
            strDate = strDátum
            If Left(strDate, 1) = dtVál Then: strDate = Right(strDate, Len(strDate) - 1)
            If Right(strDate, 1) = dtVál Then: strDate = Left(strDate, Len(strDate) - 1)
            
            darab = StrCount(strDate, dtVál)
            If darab >= j Then Exit For
        Next i
        If darab >= j Then Exit For
    Next j
    If InStr(1, sorrend, "é") > darab + 1 Then
        év = "" & Year(Now())
    Else
         év = Left(ffsplit(strDátum, dtVál, InStr(1, sorrend, "é")), 4) 'TODO Mi van ha több, mint 4 jegyû az év?
    End If
    If InStr(1, sorrend, "h") > darab + 1 Then
        hó = "01"
    Else
         hó = Left(ffsplit(strDátum, dtVál, InStr(1, sorrend, "h")), 4)
    End If
    If InStr(1, sorrend, "n") > darab + 1 Then
        nap = "01"
    Else
         nap = Left(ffsplit(strDátum, dtVál, InStr(1, sorrend, "n")), 4)
    End If
   

    iév = CsakSzám(év)
    ihó = CsakSzám(hó)
    inap = CsakSzám(nap)
    If CInt(ihó) > 12 Then: hó = "12": ihó = 12
    If CInt(ihó) < 1 Then: hó = "01": ihó = 1
    If nap = "" Then: nap = 1
    ' A túl nagy nap értéket attól függõen vizsgáljuk meg, hogy melyik hónapról van szó
    Select Case CInt(ihó)
        Case 1, 3, 5, 7, 8, 10, 12
            If CInt(inap) > 31 Then: nap = "31"
        Case 4, 6, 9, 11
            If CInt(inap) > 30 Then: nap = "30"
        Case 2
            If CInt(inap) > Day(DateSerial(év, 3, 1) - 1) Then
                nap = CStr(Day(DateSerial(év, 3, 1) - 1))
            End If
        Case Else
            dtÁtal = 1
            Exit Function
    End Select
    If CInt(inap) < 1 Then: hó = "01"
    
    dtÁtal = DateSerial(CsakSzám(év), CsakSzám(hó), CsakSzám(nap))
End Function
Function CsakSzám(szöveg As Variant) As Long
If IsNull(szöveg) Or szöveg = "" Then: CsakSzám = 0: Exit Function

On Error GoTo Hiba
    Dim jel As String
    Dim p As Integer
    
    For p = 1 To Len(szöveg)
        jel = jel & CInt(Mid(szöveg, p, 1))
    Next p
    CsakSzám = CLng(jel)
Exit Function
Hiba:
    If Err.Number = 13 Then
        Resume Next
    End If
    MsgBox Err.Number & ", " & Err.Description, , "Hiba"
End Function