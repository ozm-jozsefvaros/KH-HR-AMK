'E gy�tem�nyben, ha az MIT licencia eml�ttettik, (megjel�lve a szerz�t �s a m� sz�let�s�nek �v�t) azon az al�bbi felhaszn�l�si enged�lyt kell �rteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Function Irsz(c�m As Variant) As String
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
    If IsNull(Irsz) Or Len(Irsz) <> 4 Then
        Ker�let = 0
        Exit Function
    End If
    If Left(Irsz, 1) = 1 Then
        Ker�let = Mid(Irsz, 2, 2)
    End If
End Function

Function XML�talak�t�(strXMLneve As String, �jPath As String) As Boolean
    Dim strXML As String
    Dim strR�giF�jl As String
    Dim str�jF�jl As String
    Dim intKezdPoz As Integer
    Dim intV�gPoz As Integer
'on error goto hiba


'#           Az eg�sz tag-et (z�rad�kot?) cser�lj�k az XML-ben
        str�jF�jl = " Path=""" & �jPath & """"
'           Debug.Print "1. �j f�jl:" & str�jF�jl & "##" '1
        strXML = xmltiszt�t�(CurrentProject.ImportExportSpecifications.Item(strXMLneve).XML) 'itt megszerezz�k �s megtiszt�tjuk

        intKezdPoz = InStr(1, strXML, "Path=") 'majd megn�zz�k, hol kezd�dik az �tvonal
        intV�gPoz = InStr(intKezdPoz + 7, strXML, """") ' �s hogy hol a v�ge
'          Debug.Print "2. R�gi XML:##" & Mid(strXML, intKezdPoz, intV�gPoz) & "##" '2
        strR�giF�jl = Mid(strXML, intKezdPoz, intV�gPoz - intKezdPoz + 1) 'a k�t pont k�z�tti r�szt kiemelj�k
'           Debug.Print "3. R�gi f�jl:" & strR�giF�jl
        strXML = Replace(strXML, strR�giF�jl, str�jF�jl) 'no itt meg kicser�lj�k a r�gi f�jlnevet, az �jra
'           Debug.Print "4. �j XML:##" & Mid(strXML, intKezdPoz - 10, Len(str�jF�jl) + 16) & "##"
        CurrentProject.ImportExportSpecifications.Item(strXMLneve).XML = strXML '�s v�g�l visszat�ltj�k a rendszerbe
XML�talak�t� = True
Exit Function
hiba:

End Function

Public Function xmltiszt�t�(ByVal sz�veg As String) As String
    Dim vMir�lMire(2, 1) As Variant
    Dim n As Integer
    
    vMir�lMire(0, 0) = " =": vMir�lMire(0, 1) = "="
    vMir�lMire(1, 0) = "= ": vMir�lMire(1, 1) = "="
    For i = LBound(vMir�lMire, 1) To UBound(vMir�lMire, 1)
        n = 0
        If vMir�lMire(i, 0) <> "" Then
            Do While InStr(1, sz�veg, vMir�lMire(i, 0))
                sz�veg = Replace(sz�veg, vMir�lMire(i, 0), vMir�lMire(i, 1))
                n = n + 1
                If n > 100 Then Exit Do
            Loop
        End If
    Next i
    xmltiszt�t� = sz�veg
End Function

Function bfkh(k�d As String) As String
'Minden k�t pont k�z�tt, ha csak egy karakter van, besz�r el�je egy 0-t. Pl.:BFKH.1.2. -> BKFH.01.02.
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
    bfkh = str�tm
End Function
Public Function StrCount(ByVal sz�veg As String, ByVal keresett As String) As Integer
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
'------------------------------------------------------------------
Dim i As Integer
Dim j As Integer
Dim placehold As Integer
Dim strHold As String
Dim itemhold As Variant

    strHold = sz�veg
    itemhold = keresett
    j = 0
    
    If InStr(1, strHold, itemhold) > 0 Then
        While InStr(1, strHold, itemhold) > 0
            placehold = InStr(1, strHold, itemhold)
            j = j + 1
            strHold = Mid(strHold, placehold + Len(itemhold))
        Wend
    End If
    StrCount = j
End Function
Public Function ffsplit(ByVal mez� As Variant, Optional ByVal elv�laszt� As String = ",", Optional ByVal Sz�m As Integer = 1) As String
'Az megadott elv�laszt�val tagolt karakterl�ncban a Sz�m-nak megfelel� sorsz�m� tagot adja vissza.
'Ha a megadott �rt�k null, �res karakterl�ncot ad vissza.
'Ha a megadott �rt�k nem tartalmazza az elv�laszt�t, a megadott �rt�ket adja vissza
    Dim temp() As String
    Dim n As Integer
On Error GoTo hiba
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
    ffsplit = Trim(temp(Sz�m - 1))
    'Debug.Print temp(Sz�m - 1)

Exit Function
hiba:
MsgBox (Err.Number & " - " & Err.Description)
End Function
Function Utols�(ByVal sz�veg As String, Optional ByVal elv�laszt� As String = "", Optional ByVal vissza As Integer = 0) As String
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
Function nFrom(strLek�rdNeve As String) As Integer
'Megsz�molja, hogy a lek�rdez�s h�ny
    Dim nDarab As Integer
    Dim fDarab As Integer
    Dim strSzakasz As String
    Dim strXML As String
    
    strXML = CurrentDb.QueryDefs(strLek�rdNeve).sql
    nDarab = StrCount(strXML, "From")
    For i = 1 To nDarab
        strSzakasz = ffsplit(strXML, "FROM", i)
        
        strSzakasz = ffsplit(strSzakasz, "SELECT")
        strSzakasz = ffsplit(strSzakasz, "UNION")
        'Debug.Print strSzakasz;
        strSzakasz = ffsplit(strSzakasz, "WHERE")
        strSzakasz = ffsplit(strSzakasz, "GROUP BY")
        fDarab = fDarab + StrCount(strSzakasz, ",") + 1
        'Debug.Print strSzakasz, fDarab
    Next i
    nFrom = fDarab
End Function
Function nSelect(strLek�rdNeve As String) As Integer
'Megsz�molja, hogy egy lek�rdez�sben h�ny Select utas�t�s van.
'TODO: az id�z�jelben l�v� Select karaktersorozatok kisz�r�se: csak az ffsplit-tel kimetszett p�ratlan sorsz�m� r�szekben keresni
    nSelect = StrCount(CurrentDb.QueryDefs(strLek�rdNeve).sql, "SELECT")
End Function
Sub UresOszlopokTorlese(ByVal strF�jln�v�tvonallal As String, Optional ByVal strT�blaN�v As String = "tSzem�lyek", Optional ByVal bAd�jelKellE As Boolean = True)

'A szem�lyt�rzs t�bl�ban kit�rli az �res (adatot nem tartalmaz�) oszlopokat,
'majd az els� oszlop el� besz�r egy oszlopot, ami az ad�jelet tartalmazza majd sz�m-k�nt t�rolva,
'az eg�sz t�bl�t elnevezi tSzem�lyek n�ven.
    'On Error GoTo hiba
    
    Dim xlApp As Excel.Application
    Dim xlWB As Excel.Workbook
    Dim iCol As Long
    Dim ehj As New ehjoszt
    Dim lap As Excel.Worksheet
    Dim sor As Long
    Dim ter�let As Range
    
    Set xlApp = New Excel.Application
    xlApp.DisplayAlerts = False
    Set xlWB = xlApp.Workbooks.Open(strF�jln�v�tvonallal)
    Set lap = xlWB.Sheets(1)
    
    With lap.UsedRange
        ehj.Ini (100)
        ehj.OszlopSzam = .Columns.Count
        For iCol = .Columns.Count To 1 Step -1
            If WorksheetFunction.CountA(.Columns(iCol)) = 1 Then .Columns(iCol).EntireColumn.Delete
'            ehj.Novel
        Next
        sor = .Rows.Count
    End With
    
    'Ad�jel besz�r�sa
    If bAd�jelKellE Then
        If lap.Range("A2").Value <> "Ad�jel" Then
            lap.Range("A1").EntireColumn.Insert
            Set ter�let = lap.Range("A3:A" & sor)
            lap.Range("A2").Value = "Ad�jel"
            ter�let.Formula = "=J3*1"
        End If
    End If 'bAd�jelKellE
    
    'Elnevezz�k a teljes t�bl�t
    If strT�blaN�v <> "" Then
        xlWB.Names.Add Name:="tSzem�lyek", RefersTo:=lap.UsedRange
       ' Debug.Print ImportT�blaHibaJav�t�(lap.UsedRange)
    End If
    
    xlWB.Save
    xlWB.Close
    xlApp.Quit
    
    Set lap = Nothing
    Set xlWB = Nothing
    Set xlApp = Nothing
    
    Exit Sub

hiba:
    
    MsgBox "Error: " & Err.Description, vbExclamation + vbOKOnly, "Error"
End Sub
Function vane(teljes�tvonal As String) As Boolean
    vane = (Dir(teljes�tvonal) <> "")
End Function
Function �tvonalK�sz�t�(ByVal �tvonal As String, ByVal F�jln�v As String)
'****** (c) Ol�h Zolt�n 2022 - MIT Licence ****************
Dim per As String
    per = Right(�tvonal, 1)
    'Debug.Print �tvonal, per
    
    If per <> "\" Then
        per = "\"
    Else
        per = ""
    End If
    'Debug.Print "per = " & per
    �tvonalK�sz�t� = �tvonal & per & F�jln�v
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
Sub mez�T�pusok(lek As String, hfN�v As String)
'Licencia: MIT Ol�h Zolt�n 2022 (c)
' A lek nev� lek�rdez�sben felsorolt lek�rdez�seket sorra megnyitja,
' s a lek�rdez�s nev�t, tov�bb� a mez� nev�t �s t�pus�t egy hfN�v nev� csv t�bl�ba �rja.
' mez�T�pusok "lkEllen�rz�Lek�rdez�sek2","C:\Users\olahzolt\Desktop\F�jlok\mezo.csv"

    Dim db As DAO.Database
    Dim rk As Recordset
    'Dim hfn�v As String
    Dim hF As Object
    
    Set hF = CreateObject("Scripting.FileSystemObject").CreateTextFile(hfN�v, True)

    Set db = CurrentDb
    Set rk = db.OpenRecordset(lek)
    rk.MoveFirst
    hF.WriteLine "Lek�rdez�sNeve;Mez�Neve;Mez�T�nylegesT�pusa"
    
    Do Until rk.EOF
        Dim rklek As Recordset
        Set rklek = db.OpenRecordset(rk("Ellen�rz�Lek�rdez�s"))
        Debug.Print rklek.Name
        For Each mez� In rklek.Fields
            hF.WriteLine rklek.Name & ";" & mez�.Name & ";" & mez�.Type
            'Debug.Print rklek.Name; ";"; mez�.Name; ";"; mez�.Type
        Next mez�
        rk.MoveNext
        Set rklek = Nothing
    Loop
    hF.Close
    Set hF = Nothing
    Debug.Print "----------------"
End Sub
Function vFldT�pus(sql As String) As Variant
'A kapott lek�rdez�st lefuttatja, s a kapott �rt�kp�r eredm�nyt egy t�mbben adja vissza
    Dim db1 As Database
    Dim rs1 As Recordset
    Dim vFieldTypes() As Variant
    Dim i As Integer
    
    ' Set the database object
    Set db1 = CurrentDb
    
    ' Open the query that contains the fieldName and fieldType pairs
    Set rs1 = db1.OpenRecordset(sql)
    
    ' Check if there are records in the query result
    If Not rs1.EOF Then
        rs1.MoveLast
        rs1.MoveFirst
        
        ' Resize the array to hold the number of records
        ReDim vFieldTypes(1 To rs1.RecordCount, 1 To 2)
        
        ' Loop through the records and populate the array
        i = 1
        Do While Not rs1.EOF
            vFieldTypes(i, 1) = "" & rs1("Mez�Neve") & ""
            vFieldTypes(i, 2) = rs1("Mez�T�pusa")
            rs1.MoveNext
            i = i + 1
        Loop
    End If
    
    ' Close the recordset
    rs1.Close
    
    ' Now, vFieldTypes array contains fieldName and fieldType pairs
    ' You can access them like this: vFieldTypes(row, column)
    
    ' For example, to access the first pair:
    'MsgBox "Field Name: " & vFieldTypes(1, 1) & vbCrLf & "Field Type: " & vFieldTypes(1, 2)
    vFldT�pus = vFieldTypes
    ' Clean up
    Set rs1 = Nothing
    Set db1 = Nothing
End Function
Function p�rkeres�(t�mb As Variant, keresett As Variant) As Variant

    For i = 1 To UBound(t�mb, 1)
        If t�mb(i, 1) = keresett Then
            
            p�rkeres� = t�mb(i, 2)
            Exit Function ' Kil�p, ha tal�ltunk
            
        End If
    Next i
    'Ha nem tal�ltunk �resen t�r vissza
    p�rkeres� = ""
End Function
