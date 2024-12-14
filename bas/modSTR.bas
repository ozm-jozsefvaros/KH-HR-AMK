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
fvbe ("BFKH")
'#MIT Oláh Zoltán (c) 2022, 2024
'# Minden két pont között, ha csak egy karakter van, beszúr eléje egy 0-t. Pl.:BFKH.1.2. -> BKFH.01.02.
'# Cél: Az így kialakított szervezeti egység azonosító ABC sorba rendezve értelmes sorrendet ad...
    Dim intN As Integer, i As Integer, intPoz As Integer
    Dim strÁtm As String, _
        strElv As String, _
        szakasz As String
    
    strElv = "."
    strÁtm = ""
    intN = StrCount(kód, strElv)
    
    For i = 1 To intN
        szakasz = ffsplit(kód, strElv, i)
        Select Case i
            Case 1 'elsõ
                strÁtm = szakasz
            Case Else 'a közbülsõk
                If Len(szakasz) = 1 Then 'If Len(ffsplit(kód, strElv, i)) = 1 Then
                    strÁtm = strÁtm & ".0" & szakasz 'strÁtm = strÁtm & ".0" & ffsplit(kód, strElv, i)
                Else
                    strÁtm = strÁtm & "." & szakasz 'strÁtm = strÁtm & "." & ffsplit(kód, strElv, i)
                End If
        End Select
                
    Next i
    BFKH = strÁtm
fvki
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
fvbe ("ffsplit")
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
    logba , mezõ & ", " & n, 4

    temp = Split(mezõ, elválasztó)
    If szám > n + 1 Then
        szám = n + 1
    End If
    ffsplit = Trim(temp(szám - 1))
    logba , temp(szám - 1), 4
fvki
Exit Function
Hiba:
    vált1.név = "mezõ"
    vált1.érték = mezõ
    vált2.név = "elválasztó"
    vált2.érték = elválasztó
    vált3.név = "szám"
    vált3.érték = szám
    MsgBox (Hiba(Err))
fvki
End Function
Function Utolsó(ByVal szöveg As Variant, Optional ByVal elválasztó As String = "", Optional ByVal vissza As Integer = 0) As String
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
Function strVége(ByVal szöveg As Variant, Optional ByVal elválasztó As String = "", Optional ByVal szakaszokSzáma As Integer = 1) As String
'Licencia: MIT Oláh Zoltán & Brányi Balázs 2024 (c)
Dim i As Integer
Dim Kimenet As String
szöveg = TrimX(szöveg, elválasztó)
szakaszokSzáma = Abs(szakaszokSzáma)
If szakaszokSzáma = 0 Then szakaszokSzáma = 1

For i = szakaszokSzáma To 1 Step -1
    If i = szakaszokSzáma Then
        Kimenet = Utolsó(szöveg, elválasztó, i - 1)
    Else
        Kimenet = Kimenet & elválasztó & Utolsó(szöveg, elválasztó, i - 1)
    End If
Next i
strVége = Kimenet & elválasztó
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
    
    If IsNumeric(szó) Then
        névelõ = ""
        Select Case Left(CStr(szó), 1)
            Case "1"
                Select Case szó
                    Case 1 To 9, 100 To 199, 1000 To 1999, 100000 To 1999999
                        névelõ = "z"
                End Select
            Case "5"
                névelõ = "z"
        End Select
        Exit Function
    End If
    
    magánhangzók = "aáeéiíoóöõuúüûAÁEÉIÍOÓÖÕUÚÜÛ"
    keresett = Left(Nz(szó, ""), 1)
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
Public Function dtÁtal(strDátum As Variant, Optional Sorrend As String = "éhn") As Date
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
    Dim i, j, darab, ihó, inap, iév As Integer
    Sorrend = Left(Sorrend, 3)
    If (StrCount(Sorrend, "é") <> 1) Or (StrCount(Sorrend, "h") <> 1) Or (StrCount(Sorrend, "n") <> 1) Then
        dtÁtal = 0
        Exit Function
    End If
    
            logba , CStr(Nz(strDátum, 0)), 3
    If IsNull(strDátum) Or strDátum = "" Or strDátum = 0 Then
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
    If InStr(1, Sorrend, "é") > darab + 1 Then
        év = "" & Year(Now())
    Else
         év = Left(ffsplit(strDátum, dtVál, InStr(1, Sorrend, "é")), 4) 'TODO Mi van ha több, mint 4 jegyû az év?
    End If
    If InStr(1, Sorrend, "h") > darab + 1 Then
        hó = "01"
    Else
         hó = Left(ffsplit(strDátum, dtVál, InStr(1, Sorrend, "h")), 4)
    End If
    If InStr(1, Sorrend, "n") > darab + 1 Then
        nap = "01"
    Else
         nap = Left(ffsplit(strDátum, dtVál, InStr(1, Sorrend, "n")), 4)
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
'Todo: negatív számok kezelése
On Error GoTo Hiba
    Dim jel As String
    Dim jel2 As String
    Dim p As Integer
    Dim hossz As Integer
    Dim maxhossz As Long
    
    hossz = Len(szöveg)
    maxhossz = 10
    For p = 1 To hossz
        jel2 = ""
        jel2 = CInt(Mid(szöveg, p, 1))
        If Len(jel2) > 0 Then
            jel = jel & jel2
            ¡ maxhossz '
            If maxhossz <= 0 Then
                Exit For
            End If
        End If
    Next p
    If maxhossz <= 0 And jel > "2147483647" Then
        jel = 0
    End If
    CsakSzám = CLng(jel)
Exit Function
Hiba:
    If Err.Number = 13 Then
        Resume Next
    End If
    MsgBox Hiba(Err)
End Function
Function CsakSzámJegy(szöveg As Variant) As String
If IsNull(szöveg) Or szöveg = "" Then: CsakSzámJegy = 0: Exit Function
'Todo: negatív számok kezelése
On Error GoTo Hiba
    Dim jel As String

    Dim p As Integer
    Dim hossz As Integer
    Dim maxhossz As Long
    
    hossz = Len(szöveg)
    maxhossz = 10
    For p = 1 To hossz

        jel = jel & CInt(Mid(szöveg, p, 1))

    Next p
    
    CsakSzámJegy = jel
Exit Function
Hiba:
    If Err.Number = 13 Then
        Resume Next
    End If
    MsgBox Hiba(Err)
End Function
Function szétbontó(mezõ As Variant, lekérdezés As Variant) As Variant
    If IsNull(mezõ) Then Exit Function
    If IsNull(lekérdezés) Then Exit Function
    If mezõ = vbNullString Then Exit Function
    If lekérdezés = vbNullString Then Exit Function
    Dim n As Long
    Dim Kimenet() As Variant
    Dim db As DAO.Database
    Dim qdf As QueryDef
    Dim mezõszám As Long
    
    Set db = CurrentDb
    Set qdf = db.QueryDefs(lekérdezés)
    With qdf
        mezõszám = StrCount(mezõ, "|")
        ReDim Kimenet(1 To mezõszám, 1 To 2)
        For n = 1 To mezõszám
            Kimenet(n, 1) = .Fields(n - 1).Name
            Kimenet(n, 2) = Trim(ffsplit(mezõ, "|", n))
        Next n
    End With
    szétbontó = Kimenet
End Function
Function CalcStrNumber(strInput As String) As Long
    Dim i As Integer
    Dim total As Long
    total = 0
    
    ' Loop through each character in the string
    For i = 1 To Len(strInput)
        ' Add ASCII value of each character to total
        total = total + Asc(Mid(strInput, i, 1))
    Next i
    
    CalcStrNumber = total
End Function
Function telefonszámjavító(telefonszám As Variant) As String
Dim poz As Integer
Dim eredeti As String
    If IsNull(telefonszám) Or telefonszám = vbNullString Then
        telefonszámjavító = vbNullString
        Exit Function
    End If
    eredeti = telefonszám
    '(1)1234-543 / 12345
    '06-1-896-2474
    '+3618962378
    '06-20/123-4567
    'Nem nyomtatható karakterek eltávolítása:
    If InStr(telefonszám, Chr(9)) > 0 Then telefonszám = Replace(telefonszám, Chr(9), vbNullString)
    If InStr(telefonszám, Chr(10)) > 0 Then telefonszám = Replace(telefonszám, Chr(10), vbNullString)
    If InStr(telefonszám, Chr(13)) > 0 Then telefonszám = Replace(telefonszám, Chr(13), vbNullString)
    If InStr(telefonszám, Chr(16)) > 0 Then telefonszám = Replace(telefonszám, Chr(16), vbNullString)
    'Ha a / az elõhívószámot határolja:
    poz = InStr(1, telefonszám, "/")
    If poz > 0 And poz <= 6 Then
        telefonszám = Left(telefonszám, poz - 1) & Replace(telefonszám, "/", "", poz - 1, 1)
    End If
    'Levágjuk a melléket
    telefonszám = ffsplit(telefonszám, "/", 1)
    'Elõtisztítás
    telefonszám = Replace(Replace(telefonszám, "(", ""), ")", "")
    'Ha +szal kezdõdik
    Select Case Left(telefonszám, 1)
        Case "+"
            Select Case Left(telefonszám, 3)
                Case "+36"
                    telefonszám = Right(telefonszám, Len(telefonszám) - 3)
                Case Else 'külföldi szám
                    telefonszámjavító = telefonszám
                    Exit Function
            End Select
        Case "0"
            Select Case Left(telefonszám, 2)
                Case "06" 'Elõhívó
                    telefonszám = Right(telefonszám, Len(telefonszám) - 2)
                Case "00" 'külföldi szám
                    telefonszámjavító = telefonszám
                    Exit Function
            End Select
    End Select
    
    
    'Átalakítjuk csak számokra
    telefonszám = CsakSzámJegy(telefonszám)
    'Ha túl rövid, akkor üres stringet adunk vissza és kilépünk
    If Len(telefonszám) < 7 Then
        telefonszámjavító = "Hibás szám:" & eredeti
        Exit Function
    End If
    'Ha hétjegyû, akkor budapesti
    If Len(telefonszám) = 7 Then
        telefonszám = "1" & telefonszám
    End If
    
    'Ha az elsõ számjegy 6, de a telefonszám több, mint 7 jegyû
    If Len(telefonszám) > 7 Then
        Select Case Left(telefonszám, 2)
            Case "61" To "69"
                telefonszám = "+3" & telefonszám
            Case "06"
                telefonszám = "+36" & Right(telefonszám, Len(telefonszám) - 2)
            Case Else
                telefonszám = "+36" & telefonszám
        End Select
    Else
        
    End If
    'Formázzuk
    Select Case Left(telefonszám, 4)
        Case "+361" 'Ez budapesti vezetékes telefonszám
            telefonszám = "(" & Left(telefonszám, 4) & ") " & Mid(telefonszám, 5, 3) & "-" & Mid(telefonszám, 8, 4)
        Case Else 'Mobil vagy nem budapesti vezetékes
            Select Case Left(telefonszám, 5)
                Case "+3620", "+3621", "+3630", "+3631", "+3640", "+3650", "+3651", "+3655", "+3660", "+3670", "+3680", "+3690", "+3691" 'Mobil
                    telefonszám = "(" & Left(telefonszám, 5) & ") " & Mid(telefonszám, 6, 3) & "-" & Mid(telefonszám, 9, 4)
                Case Else 'Vidéki vezetékes
                        telefonszám = "(" & Left(telefonszám, 5) & ") " & Mid(telefonszám, 6, 3) & "-" & Mid(telefonszám, 9, 3)
            End Select
    End Select
    'TODO:Kell ez egyáltalán?
    telefonszámjavító = telefonszám
End Function
Function teljavító(telszám As Variant) As String
'Mintaalapú feldolgozás
Dim i As Integer
Dim poz As Integer
Dim eredeti As String
Dim telefonszám As String
    If IsNull(telszám) Then
        teljavító = vbNullString
        Exit Function
    End If
    If IsArray(telszám) Then
        teljavító = vbnullsrting
        Exit Function
    End If
    If telszám = vbNullString Then
        teljavító = vbNullString
        Exit Function
    End If
    eredeti = CStr(telefonszám)
    On Error GoTo Hiba:
    telefonszám = CStr(telszám)
    telefonszám = Replace(telefonszám, "/", "$")
    telefonszám = Replace(telefonszám, " ", "$")
    telefonszám = Replace(telefonszám, "-", "$")
    telefonszám = Replace(telefonszám, "(", "$")
    telefonszám = Replace(telefonszám, ")", "$")
    telefonszám = Replace(telefonszám, "+", "$")
    telefonszám = Duplátlanító(telefonszám)
    teljavító = telefonszám
    
Exit Function
Hiba:
    If Err.Number = 1033 Then
        Resume Next
    Else
        MsgBox Hiba(Err)
    End If
End Function
Function Duplátlanító(szöveg As String, Optional mit As String = "$") As String
    Do While StrCount(szöveg, mit & mit) > 0
        szöveg = Replace(szöveg, mit & mit, mit)
    Loop
    Duplátlanító = szöveg
End Function
Function feltöltõ(telefonszám As String) As String
Dim i As Integer
Dim kar As String
Dim Kimenet As String
telefonszám = teljavító(telefonszám)
    For i = 1 To Len(telefonszám)
        kar = Mid(telefonszám, i, 1)
        If kar <> "$" Then
            If kar = CStr(CsakSzám(kar)) Then
                kar = "1"
            Else
                kar = vbNullString
            End If
        End If
        Kimenet = Kimenet & kar
    Next i
    feltöltõ = Kimenet
End Function
Function RegExExec(szöveg As String, minta As String, Optional KisNagybetûNemSzámít As Boolean = True, Optional MindenTalálat As Boolean = True) As MatchCollection
'FirstIndex - A read-only value that contains the position within the original string where the match occurred. _
              This index uses a zero-based offset to record positions, meaning that the first position in a string is 0.
'Length - A read-only value that contains the total length of the matched string.
'Value - A read-only value that contains the matched value or text. It is also the default value when accessing the Match object.
   Dim Matches    ' Create variable.

   With New RegExp
    .Pattern = minta   ' Set pattern.
    .IgnoreCase = KisNagybetûNemSzámít   ' Set case insensitivity.
    .Global = MindenTalálat   ' Set global applicability.
    Set RegExExec = .Execute(szöveg)   ' Execute search.
   End With
End Function
Function RegExTest(szöveg As String, minta As String) As Boolean


End Function