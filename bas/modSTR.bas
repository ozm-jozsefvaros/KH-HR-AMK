'E gy�tem�nyben, ha az MIT licencia eml�ttettik, (megjel�lve a szerz�t �s a m� sz�let�s�nek �v�t) azon az al�bbi felhaszn�l�si enged�lyt kell �rteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Function BFKH(k�d As String) As String
'#MIT Ol�h Zolt�n (c) 2022
'# Minden k�t pont k�z�tt, ha csak egy karakter van, besz�r el�je egy 0-t. Pl.:BFKH.1.2. -> BKFH.01.02.
'# C�l: Az �gy kialak�tott szervezeti egys�g azonos�t� ABC sorba rendezve �rtelmes sorrendet ad...
    Dim intN, i, intPoz As Integer
    Dim str�tm, strElv As String
    
    strElv = "."
    str�tm = ""
    intN = StrCount(k�d, strElv)
    
    For i = 1 To intN
        Select Case i
            Case 1 'els�
                str�tm = ffsplit(k�d, strElv, i)
            Case Else 'a k�zb�ls�k
                If Len(ffsplit(k�d, strElv, i)) = 1 Then
                    str�tm = str�tm & ".0" & ffsplit(k�d, strElv, i)
                Else
                    str�tm = str�tm & "." & ffsplit(k�d, strElv, i)
                End If
        End Select
                
    Next i
    BFKH = str�tm
End Function
Function tBFKH(ByVal strHivatalVagyF�oszt�ly As Variant) As String
'#MIT Ol�h Zolt�n (c) 2024

    If IsNull(strHivatalVagyF�oszt�ly) Then
        tBFKH = ""
        Exit Function
    End If
    tBFKH = Replace(strHivatalVagyF�oszt�ly, "Budapest F�v�ros Korm�nyhivatala", "BFKH")
End Function
Public Function ffsplit(ByVal mez� As Variant, Optional ByVal elv�laszt� As String = ",", Optional ByVal sz�m As Integer = 1) As String
'Licencia: MIT Ol�h Zolt�n 2022 (c)
'A megadott 'elv�laszt�'-val tagolt 'mez�' karakterl�ncban a Sz�m-nak megfelel� sorsz�m� tagot adja vissza.
'Ha a megadott 'mez�' �rt�k null, �res karakterl�ncot ad vissza.
'Ha a megadott �rt�k nem tartalmazza az 'elv�laszt�'-t, a megadott �rt�ket adja vissza
'Ha Sz�m nagyobb, mint ah�ny darabra oszthat� az elv�laszt�val a mez�, akkor az utols� �rt�ket adja.
    Dim temp() As String
    Dim n As Integer
On Error GoTo Hiba
    If IsNull(mez�) Then
        ffsplit = ""
        Exit Function
    End If
    n = StrCount(mez�, elv�laszt�)
    If n < 1 Then
        ffsplit = mez�
        Exit Function
    End If
    ReDim temp(n)
    'Debug.Print mez� & ", " & n

    temp = Split(mez�, elv�laszt�)
    If sz�m > n + 1 Then
        sz�m = n + 1
    End If
    ffsplit = Trim(temp(sz�m - 1))
    'Debug.Print temp(Sz�m - 1)

Exit Function
Hiba:
MsgBox (Err.Number & " - " & Err.Description)
End Function
Function Utols�(ByVal sz�veg As String, Optional ByVal elv�laszt� As String = "", Optional ByVal vissza As Integer = 0) As String
'Licencia: MIT Ol�h Zolt�n 2023 (c)
'Ez a fv az elv�laszt�-val tagolt megadott sz�veg utols� tagj�t adja eredm�ny�l.
'Ha a vissza �rt�k meg van adva, akkor az utols�t�l vissza �rt�kkel visszasz�mol, s annak a helynek az �rt�k�t adja vissza.
'Hasonl�t az InStrRev f�ggv�nyre, de:
'   az elv�laszt� nem k�telez� elem, megpr�b�lja kital�lni;
'   a 'vissza' param�ter az ism�tl�d� elemek sz�m�t jelenti, s nem a h�tulr�l sz�m�tott karakterek sz�m�t;
'   a 'vissza' param�ter lehet negat�v �s pozit�v is; �s Null is, de ekkor �res �rt�kkel t�r vissza (az InStrRev ilyenkor hib�ra fut)

    Dim db As Integer
    Dim i As Integer 'sz�ml�l�
    
    If elv�laszt� = "" Then
        Dim elv�laszt�k(7) As Variant
        elv�laszt�k(0) = ","
        elv�laszt�k(1) = ";"
        elv�laszt�k(2) = "."
        elv�laszt�k(3) = ":"
        elv�laszt�k(4) = "|"
        elv�laszt�k(5) = "\"
        elv�laszt�k(6) = "/"
        elv�laszt�k(7) = "-"
    
        For i = 0 To UBound(elv�laszt�k)
            If InStr(1, sz�veg, elv�laszt�k(i)) > 0 Then
                elv�laszt� = elv�laszt�k(i)
                Exit For
            End If
        Next i
    End If
    If elv�laszt� = "" Then
        Utols� = ""
        Exit Function ' ha mindezek ellen�re �res, akkor �res �rt�kkel t�r�nk vissza
    End If
    db = StrCount(sz�veg, elv�laszt�) + 1
    If IsNull(vissza) Then vissza = 0
    vissza = Abs(vissza)
    If vissza >= db Or vissza < 0 Then
        Utols� = ""
        Exit Function
    End If
    Utols� = ffsplit(sz�veg, elv�laszt�, db - vissza)

End Function
Public Function StrCount(ByVal sz�veg As Variant, ByVal keresett As Variant) As Integer
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
'# M�dos�totta: Ol�h Zolt�n (2024) MIT
'# Dim I As Integer <- felesleges
'# If Instr(1,strHold,itemhold) > 0 then <-nem ezt kell vizsg�lni
'# hossz bevezet�s: �ttekinthet�bb, s tal�n gyorsabb is
'# A Null �rt�kek eset�n 0 eredm�nnyel t�r visssza,
'# variant: �gy sz�mokra is haszn�lhat�
'####################################################################
'------------------------------------------------------------------

Dim j As Integer
Dim placehold As Integer
Dim varHold As Variant
Dim itemhold As Variant
Dim hossz As Long

    varHold = Nz(sz�veg, "") 'Itt sz�rj�k ki a Null �rt�keket
    itemhold = Nz(keresett, "")
    hossz = Len(itemhold) 'El�re kisz�m�tjuk, t�bbsz�r haszn�ljuk
    j = 0
    
    If hossz > 0 Then ' A nullhossz� keresett sz�veg nagyon sok tal�latot eredm�nyez XD
        While InStr(1, varHold, itemhold) > 0
            placehold = InStr(1, varHold, itemhold)
            j = j + 1
            varHold = Mid(varHold, placehold + hossz)
        Wend
    End If
    StrCount = j
End Function
Function TrimX(ByVal tiszt�tand� As Variant, ByVal mit�l As Variant) As String
'Licencia: MIT Ol�h Zolt�n 2024 (c)
    If IsNull(tiszt�tand�) Or IsNull(mit�l) Then
        TrimX = vbNullString
        Exit Function
    End If
    If Left(tiszt�tand�, 1) = mit�l Then
        tiszt�tand� = Right(tiszt�tand�, Len(tiszt�tand�) - 1)
    End If
    If Right(tiszt�tand�, 1) = mit�l Then
        tiszt�tand� = Left(tiszt�tand�, Len(tiszt�tand�) - 1)
    End If
    TrimX = tiszt�tand�
End Function
Function z�rojeltelen�t�(ByVal n�v As Variant) As String
'Licencia: MIT Ol�h Zolt�n 2023 (c)
    Dim zjh As String 'A z�r�jel helye
    zjh = 0
    n�v = Nz(n�v, "")
    zjh = InStr(1, n�v, "(")
    If zjh > 0 Then
           z�rojeltelen�t� = Trim(Left(n�v, zjh - 1))
    Else
        z�rojeltelen�t� = n�v
    End If
End Function
Function n�vel�(sz� As Variant) As String
'Licencia: MIT Ol�h Zolt�n 2022 (c)
    'A n�vel� m�sodik bet�j�t z-re �ll�tja, vagy semmire
    Dim mag�nhangz�k As String
    Dim keresett As String
    
    mag�nhangz�k = "a�e�i�o���u���A�E�I�O���U���"
    keresett = Left(sz�, 1)
    Select Case keresett
        Case 0 To 9
            Select Case keresett
                Case 1, 5
                    n�vel� = "z"
                Case Else
                    n�vel� = ""
            End Select
            Exit Function
    End Select
    If InStr(1, mag�nhangz�k, Left(sz�, 1)) > 0 Then
        n�vel� = "z"
    Else
        n�vel� = ""
    End If
    
End Function

Function n�vel�vel(sz� As Variant, Optional ez As Boolean = False, Optional hat�roz�i As Boolean = False, Optional nagybet� As Boolean) As String
'Licencia: MIT Ol�h Zolt�n 2022 (c)
    If ez Then
        n�vel�vel = "e"
        If nagybet� Then
            n�vel�vel = UCase(n�vel�vel)
        End If
        If hat�roz�i Then
            n�vel�vel = n�vel�vel & "me"
        End If
    Else
        n�vel�vel = "a"
        If nagybet� Then
            n�vel�vel = UCase(n�vel�vel)
        End If
        If hat�roz�i Then
            n�vel�vel = n�vel�vel & "ma"
        End If
    End If
    n�vel�vel = n�vel�vel & n�vel�(sz�) & " " & sz�
End Function
Function drh�tra(n�v As String) As String
'Licencia: MIT Ol�h Zolt�n 2023 (c)
'Megkeresi a n�v elej�n a "Dr. " sz�vegr�szt �s a v�g�re teszi
    Dim drv As Boolean
    drv = False
    
    If LCase(Left(n�v, 3)) = "dr." Then
        n�v = Trim(Right(n�v, Len(n�v) - 3)) & " dr."
    End If
    drh�tra = n�v
    n�v = ""
End Function
Function drLev�laszt(n�v As Variant, Optional el�tagot As Boolean = True) As String
'Licencia: MIT Ol�h Zolt�n 2023 (c)
'# Hib�s eredm�nyt ad az al�bbi esetekben:
'# dr. Kov�cs J�nosn� Horv�th Etelka dr.",False <-- Megold�s: csak az els�t kell meghagyni

Dim el�tag As String
    If IsNull(n�v) Then
        drLev�laszt = ""
        Exit Function
    End If
    n�v = Trim(n�v)
    el�tag = "dr." ' Ha csak m�s eredm�nyre nem jutunk

    Select Case ffsplit(n�v, " ", 1) 'Megvizsg�ljuk az els� sz�t, Dr-e
        Case "Dr."
            n�v = Trim(Mid(n�v, 4, Len(n�v) - 3))
        Case "Dr"
            n�v = Trim(Mid(n�v, 3, Len(n�v) - 2))
        Case Else
            Select Case ffsplit(n�v, " ", StrCount(n�v, " ") + 1) 'Ha az els� sz� nem Dr, akkor az utols� az-e
                Case "Dr."
                    n�v = Trim(Left(n�v, Len(n�v) - 4))
                Case "Dr"
                    n�v = Trim(Left(n�v, Len(n�v) - 3))
                Case Else 'ha sem el�l, sem h�tul nincs...
                    If ffsplit(n�v, ".", 1) = "dr" Then 'akkor m�g lehet, hogy a Dr.Kov�cs esete �ll fenn?
                        n�v = Trim(Mid(n�v, 4, Len(n�v) - 3))
                    Else
                        el�tag = ""
                    End If
             End Select
    End Select
    If el�tagot Then
        drLev�laszt = el�tag
    Else
        drLev�laszt = n�v
    End If

End Function
Function sz�vegF�z�(sz�veg As String, sz�m As Integer) As String
'#MIT Ol�h Zolt�n (c) 2023
'Print sz�vegF�z�("V", 3)
'VVV
    Dim n As Integer
    If sz�m < 1 Then Exit Function
    For n = 1 To sz�m
        sz�vegF�z� = sz�vegF�z� & sz�veg
    Next n
End Function
Function Irsz(c�m As Variant) As String
'#MIT Ol�h Zolt�n (c) 2023
'Ha a c�m els� 4 karaktere az ir�ny�t�sz�m, akkor azt adja vissza
    'Left(IIf(Len(Nz([Munkav�gz�s helye - c�m];""))<3;"000";Nz([Munkav�gz�s helye - c�m];"000"));3)*1
    If IsNull(c�m) Or Len(c�m) < 4 Then
        Irsz = "0000"
        Exit Function
    End If
    Irsz = Left(Trim(c�m), 4)
    If Not IsNumeric(Irsz) Then
        Irsz = "0000"
    End If
End Function
Function Ker�let(Irsz As Variant) As Integer
'#MIT (c) Ol�h Zolt�n  2023-2024
    Dim n, hossz As Integer
    hossz = Nz(Len(Irsz), 0)
    If IsNull(Irsz) Or hossz < 3 Or hossz > 4 Then
        Ker�let = 0
        Exit Function
    End If
    If Left(Irsz, 1) = 1 Then ' Csak Budapest
        Select Case hossz
            Case 4
                Ker�let = Mid(Irsz, 2, 2)
            Case 3
                Ker�let = Right(Irsz, 2)
            Case Else
                Ker�let = 0
                Exit Function
        End Select
    Else
        Ker�let = 0
    End If
End Function
Public Function dt�tal(strD�tum As Variant, Optional sorrend As String = "�hn") As Date
' (c) Ol�h Zolt�n 2024 MIT
' A megadott sz�veget (strD�tum) �talak�tja d�tumm�.
' �rv�nyes elv�laszt�k: . vagy - vagy /
' Ha az elv�laszt�val elv�lasztott �rt�keknek nincs megadva a sorrendje, akkor az �v, h�, nap sorrendet felt�telezi.
' Ha
' Ha a strD�tum �rt�ke Null vagy semmi, tov�bb�, ha a sorrend els� h�rom karaktere az �, h �s n bet�kb�l nem pontosan egyet-egyet tartalmaz,
' akkor 1-et ad vissza.
' Kell hozz� az ffsplit() fv., ahhoz meg a StrCount() f�ggv�ny.
    Dim dtV�l, dtV�laszt�k, strDate As String
    Dim �v, h�, nap As String
    Dim i, darab, ih�, inap, i�v As Integer
    sorrend = Left(sorrend, 3)
    If (StrCount(sorrend, "�") <> 1) Or (StrCount(sorrend, "h") <> 1) Or (StrCount(sorrend, "n") <> 1) Then
        dt�tal = 0
        Exit Function
    End If
    
    'Debug.Print strD�tum
    If IsNull(strD�tum) Or strD�tum = "" Then
        dt�tal = 0
        Exit Function
    End If
    
    dtV�laszt�k = ".-/"
    For j = 2 To 0 Step -1
        For i = 1 To Len(dtV�laszt�k)
            dtV�l = Mid(dtV�laszt�k, i, 1)
            strDate = strD�tum
            If Left(strDate, 1) = dtV�l Then: strDate = Right(strDate, Len(strDate) - 1)
            If Right(strDate, 1) = dtV�l Then: strDate = Left(strDate, Len(strDate) - 1)
            
            darab = StrCount(strDate, dtV�l)
            If darab >= j Then Exit For
        Next i
        If darab >= j Then Exit For
    Next j
    If InStr(1, sorrend, "�") > darab + 1 Then
        �v = "" & Year(Now())
    Else
         �v = Left(ffsplit(strD�tum, dtV�l, InStr(1, sorrend, "�")), 4) 'TODO Mi van ha t�bb, mint 4 jegy� az �v?
    End If
    If InStr(1, sorrend, "h") > darab + 1 Then
        h� = "01"
    Else
         h� = Left(ffsplit(strD�tum, dtV�l, InStr(1, sorrend, "h")), 4)
    End If
    If InStr(1, sorrend, "n") > darab + 1 Then
        nap = "01"
    Else
         nap = Left(ffsplit(strD�tum, dtV�l, InStr(1, sorrend, "n")), 4)
    End If
   

    i�v = CsakSz�m(�v)
    ih� = CsakSz�m(h�)
    inap = CsakSz�m(nap)
    If CInt(ih�) > 12 Then: h� = "12": ih� = 12
    If CInt(ih�) < 1 Then: h� = "01": ih� = 1
    If nap = "" Then: nap = 1
    ' A t�l nagy nap �rt�ket att�l f�gg�en vizsg�ljuk meg, hogy melyik h�napr�l van sz�
    Select Case CInt(ih�)
        Case 1, 3, 5, 7, 8, 10, 12
            If CInt(inap) > 31 Then: nap = "31"
        Case 4, 6, 9, 11
            If CInt(inap) > 30 Then: nap = "30"
        Case 2
            If CInt(inap) > Day(DateSerial(�v, 3, 1) - 1) Then
                nap = CStr(Day(DateSerial(�v, 3, 1) - 1))
            End If
        Case Else
            dt�tal = 1
            Exit Function
    End Select
    If CInt(inap) < 1 Then: h� = "01"
    
    dt�tal = DateSerial(CsakSz�m(�v), CsakSz�m(h�), CsakSz�m(nap))
End Function
Function CsakSz�m(sz�veg As Variant) As Long
If IsNull(sz�veg) Or sz�veg = "" Then: CsakSz�m = 0: Exit Function

On Error GoTo Hiba
    Dim jel As String
    Dim p As Integer
    
    For p = 1 To Len(sz�veg)
        jel = jel & CInt(Mid(sz�veg, p, 1))
    Next p
    CsakSz�m = CLng(jel)
Exit Function
Hiba:
    If Err.Number = 13 Then
        Resume Next
    End If
    MsgBox Err.Number & ", " & Err.Description, , "Hiba"
End Function