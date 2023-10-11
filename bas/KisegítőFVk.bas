'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Function Irsz(cím As Variant) As String
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
    If IsNull(Irsz) Or Len(Irsz) <> 4 Then
        Kerület = 0
        Exit Function
    End If
    If Left(Irsz, 1) = 1 Then
        Kerület = Mid(Irsz, 2, 2)
    End If
End Function

Function XMLátalakító(strXMLneve As String, újPath As String) As Boolean
    Dim strXML As String
    Dim strRégiFájl As String
    Dim strÚjFájl As String
    Dim intKezdPoz As Integer
    Dim intVégPoz As Integer
'on error goto hiba


'#           Az egész tag-et (záradékot?) cseréljük az XML-ben
        strÚjFájl = " Path=""" & újPath & """"
'           Debug.Print "1. Új fájl:" & strÚjFájl & "##" '1
        strXML = xmltisztító(CurrentProject.ImportExportSpecifications.Item(strXMLneve).XML) 'itt megszerezzük és megtisztítjuk

        intKezdPoz = InStr(1, strXML, "Path=") 'majd megnézzük, hol kezdõdik az útvonal
        intVégPoz = InStr(intKezdPoz + 7, strXML, """") ' és hogy hol a vége
'          Debug.Print "2. Régi XML:##" & Mid(strXML, intKezdPoz, intVégPoz) & "##" '2
        strRégiFájl = Mid(strXML, intKezdPoz, intVégPoz - intKezdPoz + 1) 'a két pont közötti részt kiemeljük
'           Debug.Print "3. Régi fájl:" & strRégiFájl
        strXML = Replace(strXML, strRégiFájl, strÚjFájl) 'no itt meg kicseréljük a régi fájlnevet, az újra
'           Debug.Print "4. Új XML:##" & Mid(strXML, intKezdPoz - 10, Len(strÚjFájl) + 16) & "##"
        CurrentProject.ImportExportSpecifications.Item(strXMLneve).XML = strXML 'és végül visszatöltjük a rendszerbe
XMLátalakító = True
Exit Function
hiba:

End Function

Public Function xmltisztító(ByVal szöveg As String) As String
    Dim vMirõlMire(2, 1) As Variant
    Dim n As Integer
    
    vMirõlMire(0, 0) = " =": vMirõlMire(0, 1) = "="
    vMirõlMire(1, 0) = "= ": vMirõlMire(1, 1) = "="
    For i = LBound(vMirõlMire, 1) To UBound(vMirõlMire, 1)
        n = 0
        If vMirõlMire(i, 0) <> "" Then
            Do While InStr(1, szöveg, vMirõlMire(i, 0))
                szöveg = Replace(szöveg, vMirõlMire(i, 0), vMirõlMire(i, 1))
                n = n + 1
                If n > 100 Then Exit Do
            Loop
        End If
    Next i
    xmltisztító = szöveg
End Function

Function bfkh(kód As String) As String
'Minden két pont között, ha csak egy karakter van, beszúr eléje egy 0-t. Pl.:BFKH.1.2. -> BKFH.01.02.
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
    bfkh = strÁtm
End Function
Public Function StrCount(ByVal szöveg As String, ByVal keresett As String) As Integer
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

    strHold = szöveg
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
Public Function ffsplit(ByVal mezõ As Variant, Optional ByVal elválasztó As String = ",", Optional ByVal Szám As Integer = 1) As String
'Az megadott elválasztóval tagolt karakterláncban a Szám-nak megfelelõ sorszámú tagot adja vissza.
'Ha a megadott érték null, üres karakterláncot ad vissza.
'Ha a megadott érték nem tartalmazza az elválasztót, a megadott értéket adja vissza
    Dim temp() As String
    Dim n As Integer
On Error GoTo hiba
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
    ffsplit = Trim(temp(Szám - 1))
    'Debug.Print temp(Szám - 1)

Exit Function
hiba:
MsgBox (Err.Number & " - " & Err.Description)
End Function
Function Utolsó(ByVal szöveg As String, Optional ByVal elválasztó As String = "", Optional ByVal vissza As Integer = 0) As String
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
Function nFrom(strLekérdNeve As String) As Integer
'Megszámolja, hogy a lekérdezés hány
    Dim nDarab As Integer
    Dim fDarab As Integer
    Dim strSzakasz As String
    Dim strXML As String
    
    strXML = CurrentDb.QueryDefs(strLekérdNeve).sql
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
Function nSelect(strLekérdNeve As String) As Integer
'Megszámolja, hogy egy lekérdezésben hány Select utasítás van.
'TODO: az idézõjelben lévõ Select karaktersorozatok kiszûrése: csak az ffsplit-tel kimetszett páratlan sorszámú részekben keresni
    nSelect = StrCount(CurrentDb.QueryDefs(strLekérdNeve).sql, "SELECT")
End Function
Sub UresOszlopokTorlese(ByVal strFájlnévÚtvonallal As String, Optional ByVal strTáblaNév As String = "tSzemélyek", Optional ByVal bAdójelKellE As Boolean = True)

'A személytörzs táblában kitörli az üres (adatot nem tartalmazó) oszlopokat,
'majd az elsõ oszlop elé beszúr egy oszlopot, ami az adójelet tartalmazza majd szám-ként tárolva,
'az egész táblát elnevezi tSzemélyek néven.
    'On Error GoTo hiba
    
    Dim xlApp As Excel.Application
    Dim xlWB As Excel.Workbook
    Dim iCol As Long
    Dim ehj As New ehjoszt
    Dim lap As Excel.Worksheet
    Dim sor As Long
    Dim terület As Range
    
    Set xlApp = New Excel.Application
    xlApp.DisplayAlerts = False
    Set xlWB = xlApp.Workbooks.Open(strFájlnévÚtvonallal)
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
    
    'Adójel beszúrása
    If bAdójelKellE Then
        If lap.Range("A2").Value <> "Adójel" Then
            lap.Range("A1").EntireColumn.Insert
            Set terület = lap.Range("A3:A" & sor)
            lap.Range("A2").Value = "Adójel"
            terület.Formula = "=J3*1"
        End If
    End If 'bAdójelKellE
    
    'Elnevezzük a teljes táblát
    If strTáblaNév <> "" Then
        xlWB.Names.Add Name:="tSzemélyek", RefersTo:=lap.UsedRange
       ' Debug.Print ImportTáblaHibaJavító(lap.UsedRange)
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
Function vane(teljesútvonal As String) As Boolean
    vane = (Dir(teljesútvonal) <> "")
End Function
Function ÚtvonalKészítõ(ByVal útvonal As String, ByVal Fájlnév As String)
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
    ÚtvonalKészítõ = útvonal & per & Fájlnév
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
Sub mezõTípusok(lek As String, hfNév As String)
'Licencia: MIT Oláh Zoltán 2022 (c)
' A lek nevû lekérdezésben felsorolt lekérdezéseket sorra megnyitja,
' s a lekérdezés nevét, továbbá a mezõ nevét és típusát egy hfNév nevû csv táblába írja.
' mezõTípusok "lkEllenõrzõLekérdezések2","C:\Users\olahzolt\Desktop\Fájlok\mezo.csv"

    Dim db As DAO.Database
    Dim rk As Recordset
    'Dim hfnév As String
    Dim hF As Object
    
    Set hF = CreateObject("Scripting.FileSystemObject").CreateTextFile(hfNév, True)

    Set db = CurrentDb
    Set rk = db.OpenRecordset(lek)
    rk.MoveFirst
    hF.WriteLine "LekérdezésNeve;MezõNeve;MezõTénylegesTípusa"
    
    Do Until rk.EOF
        Dim rklek As Recordset
        Set rklek = db.OpenRecordset(rk("EllenõrzõLekérdezés"))
        Debug.Print rklek.Name
        For Each mezõ In rklek.Fields
            hF.WriteLine rklek.Name & ";" & mezõ.Name & ";" & mezõ.Type
            'Debug.Print rklek.Name; ";"; mezõ.Name; ";"; mezõ.Type
        Next mezõ
        rk.MoveNext
        Set rklek = Nothing
    Loop
    hF.Close
    Set hF = Nothing
    Debug.Print "----------------"
End Sub
Function vFldTípus(sql As String) As Variant
'A kapott lekérdezést lefuttatja, s a kapott értékpár eredményt egy tömbben adja vissza
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
            vFieldTypes(i, 1) = "" & rs1("MezõNeve") & ""
            vFieldTypes(i, 2) = rs1("MezõTípusa")
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
    vFldTípus = vFieldTypes
    ' Clean up
    Set rs1 = Nothing
    Set db1 = Nothing
End Function
Function párkeresõ(tömb As Variant, keresett As Variant) As Variant

    For i = 1 To UBound(tömb, 1)
        If tömb(i, 1) = keresett Then
            
            párkeresõ = tömb(i, 2)
            Exit Function ' Kilép, ha találtunk
            
        End If
    Next i
    'Ha nem találtunk üresen tér vissza
    párkeresõ = ""
End Function
