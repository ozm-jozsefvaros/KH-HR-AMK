'E gy�tem�nyben, ha az MIT licencia eml�ttettik, (megjel�lve a szerz�t �s a m� sz�let�s�nek �v�t) azon az al�bbi felhaszn�l�si enged�lyt kell �rteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Explicit
Option Compare Database


Public Sub HaviT�blaImport(f�jln�v As String, �rlap As Object)
'Licencia: MIT Ol�h Zolt�n 2022 (c)
    'Az Excel megnyit�s�hoz
    Dim objExcel        As Excel.Application
    Dim objBook         As Excel.Workbook
    Dim objSheet        As Excel.Worksheet
    Dim objRange        As Excel.Range
    
    Dim xlT�bla         As String
    Dim xlT�blaEred     As String
    Dim xlV�gcella      As String
    
    Dim xlUtols�Oszlop  As String
    Dim intV�gcella     As Integer
    Dim xlHosszm�r�     As String
    
    Dim �rt�kek()       As Variant
    Dim intMez�         As Integer
    
    'Az adatb�zis megnyit�s�hoz
    Dim db              As DAO.Database     'Ez lesz az adatb�zisunk
    Dim rs              As DAO.Recordset    'A beolvasand� lapok �s ter�letek adatait tartalmaz� t�bl�nak
    Dim rsC�l           As DAO.Recordset    'Ahov� m�solunk
    Dim F�jl            As String
    
    Dim eredm�ny        As Integer
    Dim t�bla           As String           'A t�bla : a t�bl�k jellemz�it t�rol� t�bla
    
    'A sz�veges kimenethez
    Dim �zenet As String
    
    'Sz�ml�l�shoz
    Dim sor, oszlop As Integer
    
    t�bla = "tImport�land�T�bl�k"
    intV�gcella = 0
    
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    ' ha az �tvonal v�g�n nincs \, akkor hozz�f�zz�k, [de ha van, akkor meg nem :)]
    F�jl = f�jln�v
    ' megnyitjuk az Excel t�bl�t
    Set objBook = objExcel.Workbooks.Open(F�jl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)
    
    Set rs = db.OpenRecordset(t�bla, dbOpenTable)
    rs.MoveLast
    rs.MoveFirst
    �rlap.Folyamat.RowSource = ""
    �rlap.Folyamat.AddItem Item:="T�bla neve;Beolvasott sorok sz�ma"
    �zenet = ""
    
    Do Until rs.EOF
        Erase �rt�kek
        xlT�bla = rs("AccessN�v")
        xlT�blaEred = rs("EredetiN�v"): Debug.Print xlT�blaEred & " -- " & xlT�bla
        Set objSheet = objBook.Worksheets(xlT�blaEred)
        objSheet.Select ' R�ugrunk a lapra
        If Nz(rs("V�gcella"), "") = "" Then
            xlHosszm�r� = rs("Hosszm�r�Cella")
            xlUtols�Oszlop = rs("Utols�Oszlop")
            '
            ' rs("Hosszm�r�Cella") -- a hosszm�r�sre haszn�lt oszlopot keresi ki az adatb�zisb�l.
            ' objBook.ActiveSheet.Range(rs("Hosszm�r�Cella")&1).Column  -- a hosszm�r� cella oszlop�nak a sz�m�t adja meg.
            ' Cells(Rows.Count, 1).End(xlUp).Row -- az els� oszlopban tal�lhat� cell�k sz�m�t adja
            ' Cells(Rows.Count, ActiveSheet.Range(rs("Hosszm�r�Cella")&1).Column).End(xlUp).Row -- a hosszm�r� cella oszlop�ban a legals� haszn�lt cella sor�nak a sz�ma?
            intV�gcella = objSheet.Range(xlHosszm�r� & 1).Column
            xlV�gcella = objSheet.Cells(Rows.Count, intV�gcella).End(xlUp).row
            xlV�gcella = xlUtols�Oszlop & xlV�gcella
        Else
            xlV�gcella = rs("V�gcella")
        End If
        With objSheet
            .Range(.Range(rs("Kezd�Cella")), .Range(xlV�gcella)).Name = xlT�bla 'Elnevezz�k a ter�letet
            �zenet = xlT�bla & ":;" & .Range(xlT�bla).Rows.Count
            Debug.Print .Range(xlT�bla).Rows.Count
            �rlap.Folyamat.AddItem Item:=�zenet
        End With
        
        
        If DCount("[Name]", "MSysObjects", "[Name] = '" & xlT�bla & "'") = 1 Then
            DoCmd.Close acTable, xlT�bla, acSaveYes
            DoCmd.Rename xlT�bla & RIC(Now()), acTable, xlT�bla
        End If
        DoCmd.CopyObject , xlT�bla, acTable, xlT�bla & "_tart"

        'Elkezdj�k az adatok bet�lt�s�t
        Set rsC�l = db.OpenRecordset(xlT�bla)

        �rt�kek = objSheet.Range(xlT�bla).Value
       ' Debug.Print "Az " & xlT�bla & " ter�letr�l az adatokat beolvastuk."
       ' Debug.Print "A c�lt�bla:" & rsC�l.Name

        For sor = LBound(�rt�kek, 1) To UBound(�rt�kek, 1)
            intMez� = 0
            '�j rekord hozz�ad�sa kezd�dik...
            rsC�l.AddNew
            For oszlop = LBound(�rt�kek, 2) To UBound(�rt�kek, 2)
                If rsC�l.Fields.Count < oszlop Then
                    Exit For
                End If
                intMez� = oszlop - 1
'                Debug.Print sor & ":" & oszlop & " = "
'                Debug.Print �rt�kek(sor, oszlop)
'                Debug.Print " Type:" & rsC�l.Fields(intMez�).Type
                rsC�l.Fields(intMez�) = konverter(rsC�l.Fields(intMez�), �rt�kek(sor, oszlop))
                
            Next oszlop
            rsC�l.Update
            '�j rekord hozz�ad�sa v�get �rt
        Next sor
        'Debug.Print "Az " & xlT�bla & " nev� t�bl�ba az adatokat be�rtuk:" & sor & " sor."
        'Debug.Print "Az " & xlT�bla & " beolvas�sa megt�rt�nt."
        rs.MoveNext
        intV�gcella = 0
    Loop
End Sub
Public Function konverter(fMez� As Field, �rt�k As Variant)
'****** (c) Ol�h Zolt�n 2022 - MIT Licence ****************
'Debug.Print fMez�.Type; �rt�k
If IsNull(�rt�k) Then
    konverter = Null
    Exit Function
End If
Select Case TypeName(�rt�k)
    Case "String"
        Select Case fMez�.Type
            Case 1 To 8, 19 To 23            'A t�mbben tal�lhat� String t�pus� adatot nem alak�tjuk �t sz�mm�, az �rt�k�t 0-ra �ll�tjuk.
                     konverter = 0
            Case 10: konverter = CStr(�rt�k) 'Text
            Case 12: konverter = CVar(�rt�k) 'Memo
            Case 16: konverter = CLng(�rt�k) 'Big Integer
            Case 17: konverter = CVar(�rt�k) 'VarBinary
            Case 18: konverter = CStr(�rt�k) 'Char
            Case Else
                MsgBox "Nem lehet konevert�lni a" & n�vel�(�rt�k) & " " & �rt�k & " �rt�ket a" & n�vel�(fMez�.Type) & " " & fMez�.Name & " " & fMez�.Type & "t�pus�ba!"
        End Select
    Case Else
        Select Case fMez�.Type
            Case 1:  konverter = CBool(�rt�k) 'Boolean
            Case 2:  konverter = CByte(�rt�k) 'Byte
            Case 3:  konverter = CInt(�rt�k)  'Integer
            Case 4:  konverter = CLng(�rt�k)  'Long
            Case 5:  konverter = CCur(�rt�k)  'Currency
            Case 6:  konverter = CSng(�rt�k)  'Single
            Case 7:  konverter = CDbl(�rt�k)  'Double
            Case 8:  konverter = CDate(�rt�k) 'Date/Time
            Case 10: konverter = CStr(�rt�k)  'Text
            Case 12: konverter = CVar(�rt�k)  'Memo
            Case 16: konverter = CLng(�rt�k)  'Big Integer
            Case 17: konverter = CVar(�rt�k)  'VarBinary
            Case 18: konverter = CStr(�rt�k)  'Char
            Case 19: konverter = CLng(�rt�k)  'Numeric
            Case 20: konverter = CDec(�rt�k)  'Decimal
            Case 21: konverter = CDbl(�rt�k)  'Float
            Case 22: konverter = CDate(�rt�k) 'Time
            Case 23: konverter = CDate(�rt�k) 'Time Stamp
            Case Else
                MsgBox "Nem lehet konevert�lni a" & n�vel�(�rt�k) & " " & �rt�k & " �rt�ket a" & n�vel�(fMez�.Type) & " " & fMez�.Name & " " & fMez�.Type & "t�pus�ba!"
        End Select
End Select
End Function
Function n�vel�(sz� As Variant) As String
'Licencia: MIT Ol�h Zolt�n 2022 (c)
    'A n�vel� m�sodik bet�j�t z-re �ll�tja, vagy semmire
    Dim mag�nhangz�k As String
    Dim Keresett As String
    
    mag�nhangz�k = "a�e�i�o���u���A�E�I�O���U���"
    Keresett = Left(sz�, 1)
    Select Case Keresett
        Case 0 To 9
            Select Case Keresett
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
Function �tvonalK�sz�t�(ByVal �tvonal As String, ByVal f�jln�v As String)
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
    �tvonalK�sz�t� = �tvonal & per & f�jln�v
End Function
Sub ListTdfFields()
    Dim db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim fld As DAO.Field

    Set db = CurrentDb

    Set tdf = db.TableDefs("Hat�rozottak")

    For Each fld In tdf.Fields
        Debug.Print fld.Name
    Next

    Set tdf = Nothing
    Set db = Nothing
End Sub
Sub Lek�rdez�s�r�()
'Licencia: MIT Ol�h Zolt�n 2022 (c)
    Dim rs As Recordset
    Dim rs2 As Recordset
    Dim sql As String
    Dim sql2 As String
    Dim kSQL As String
    Dim lek�rd As String
    Dim �jn�v As String
    Dim X As Integer
    Dim Tal�lat, dbTal�lat As Integer
    
    
    sql = "SELECT AccessN�v, Hi�ny_lek�rdez�s FROM tImport�land�T�bl�k"
    Set rs = CurrentDb.OpenRecordset(sql)
    
    Do Until rs.EOF
        sql2 = "SELECT Import, Eredeti  FROM tJav�tand�Mez�nevek WHERE T�bla ='" & rs!AccessN�v & "' AND NemK�telez� = false ;"
        Set rs2 = CurrentDb.OpenRecordset(sql2)
        kSQL = ""
        Do Until rs2.EOF
            If kSQL <> "" Then kSQL = kSQL & ", " & Chr(10)
            �jn�v = RIC(Clean_NPC(rs2!Eredeti.Value))
            If Len(�jn�v) > 64 Then
                �jn�v = Left(�jn�v, 60)
            End If
            dbTal�lat = 0
            Tal�lat = InStr(1, kSQL, �jn�v) 'Az �j n�v szerepelt-e m�r az el�z�ekben
            Do Until dbTal�lat >= Tal�lat 'Ha igen, akkor a Tal�lat nagyobb, mint a db tal�lat
                dbTal�lat = Tal�lat 'el�re toljuk a m�r�si pontot,
                Tal�lat = InStr(dbTal�lat, kSQL, �jn�v) 'megn�zz�k innen is,
            Loop 'hogy nagyobb �rt�ket kapunk-e, mint kor�bban (ami most a dbTal�lat)
            If dbTal�lat > 0 Then
                �jn�v = �jn�v & dbTal�lat + 1
            End If
            If InStr(1, kSQL, �jn�v) > 0 Then
                '�jn�v
                dbTal�lat = dbTal�lat + 1
            End If
            If Len(�jn�v) = 0 Then MsgBox "!": GoTo kij�rat
            kSQL = kSQL & rs!Hi�ny_lek�rdez�s.Value & ".[" & rs2!Import.Value & "] AS " & �jn�v
            rs2.MoveNext 'a k�vetkez� mez�re ugrunk
        Loop 'rs2

        kSQL = "SELECT " & kSQL & " FROM " & rs!Hi�ny_lek�rdez�s & ";"
        lek�rd = rs!Hi�ny_lek�rdez�s & "2"
        
        If Not IsNull(DLookup("Type", "MSYSObjects", "Name='" & lek�rd & "'")) Then
            CurrentDb.QueryDefs(lek�rd).sql = kSQL
        Else
            CurrentDb.CreateQueryDef lek�rd, kSQL
        End If
        Debug.Print kSQL
        rs.MoveNext 'A k�vetkez� t�bl�ra ugrunk
    Loop 'rs

kij�rat:

End Sub
Public Sub Lek�rdez�s�r�0()

End Sub
Public Function RIC(ByVal strText As String) As String
'Forr�s: https://www.access-programmers.co.uk/forums/threads/remove-special-characters-from-file-name-when-saving.261147/
'Licencia: MIT Ol�h Zolt�n 2022 (c)

    Const cstrIllegals As String = "\,/,:,*,?,"",<,>,|, ,;,(,),.,-,="
    
    Dim lngCounter As Long
    Dim astrChars() As String
    
    astrChars() = Split(cstrIllegals, ",")
    
    For lngCounter = LBound(astrChars()) To UBound(astrChars())
        strText = Replace(strText, astrChars(lngCounter), "_")
    Next lngCounter
    strText = Replace(strText, ",", "_")
    RIC = strText

End Function ' RemoveIllegalCharacters
Public Function Clean_NPC(Str As String) As String
'(C) Dave Scott https://stackoverflow.com/a/60062293  -- Licencia: CC BY-SA 4.0

    'Removes non-printable characters from a string

    Dim cleanString As String
    Dim i As Integer
    Dim sz� As String

    cleanString = Str

    For i = Len(cleanString) To 1 Step -1
        'Debug.Print Asc(Mid(Str, i, 1))
        
        Select Case Asc(Mid(Str, i, 1))
            Case 1 To 31
                'Bad stuff
                'https://www.ionos.com/digitalguide/server/know-how/ascii-codes-overview-of-all-characters-on-the-ascii-table/
                cleanString = Left(cleanString, i - 1) & Mid(cleanString, i + 1)

            Case Else
                'Keep
        End Select
    Next i

    Clean_NPC = cleanString

End Function
Public Sub t�blagy�rt�()
'Licencia: MIT Ol�h Zolt�n 2022 (c)
Dim db As Database
Dim rst As Recordset
Dim sql As String
Dim �rt�k As Variant
Dim a As Integer
sql = "Select Distinct [Szervezeti egys�g] From  lk_�tvil�g�t�s_mind_02 WHERE [Szervezeti egys�g] not like '' "
Set db = CurrentDb()
Set rst = db.OpenRecordset(sql, dbOpenDynaset)
rst.MoveLast
rst.MoveFirst
Do Until rst.EOF
    �rt�k = rst.Fields("Szervezeti egys�g").Value
    Debug.Print �rt�k
    Call Kimutat�s("O:\�tvil�g�t�s\�tvil�g�t�s2" & �rt�k & ".xlsx", "SELECT * FROM lk__�tvil�g�t�shoz_Szem�lyt�rzs_02 WHERE [Szervezeti egys�g] = '" & �rt�k & "';")
    Debug.Print "O:\�tvil�g�t�s\�tvil�g�t�s2" & �rt�k & ".xlsx"
    rst.MoveNext
Loop
End Sub
Public Sub Besz�mol�K�sz�t�()
'Licencia: MIT Ol�h Zolt�n 2022 (c)
Dim db As Database
Dim rst As Recordset
Dim sql As String
Dim �rt�k As Variant
Dim a As Integer
sql = "Select Distinct [Szervezeti egys�g] From  lk_�tvil�g�t�s_mind_02 WHERE [Szervezeti egys�g] not like '' "
Set db = CurrentDb()
Set rst = db.OpenRecordset(sql, dbOpenDynaset)
rst.MoveLast
rst.MoveFirst
Do Until rst.EOF
    �rt�k = rst.Fields("Szervezeti egys�g").Value
    Debug.Print �rt�k
    Call Besz�mol�T�bla("O:\�tvil�g�t�s\�tvil�g�t�s2" & �rt�k & ".xlsx", "SELECT * FROM lk__�tvil�g�t�shoz_Szem�lyt�rzs_02 WHERE [Szervezeti egys�g] = '" & �rt�k & "';")
    Debug.Print "O:\�tvil�g�t�s\�tvil�g�t�s2" & �rt�k & ".xlsx"
    rst.MoveNext
Loop
End Sub

Sub Besz�mol�T�bla(F�jl As String, Lek�rdez�s As String)
'****** (c) Ol�h Zolt�n 2022 - MIT Licence ****************
 
 'Az adatb�zishoz
    Dim db          As Database
    Dim qdf         As QueryDef
    Dim rs          As DAO.Recordset
    Dim �rlapN�v    As String
    
    'Excelhez
    Dim sor, oszlop     As Long
    Dim oApp            As Excel.Application
    Dim oWb             As Workbook
    Dim oWs1, oWs2      As Worksheet
    Dim oWc             As Chart
    
    'A l�peget�shez
    Dim maxoszlop, maxsor As Long
    Dim Adat As Variant
    Dim mez� As Field
    'Az el�rehalad�s-jelz�h�z

    
    'Alapadatok **********************************
    sor = 1
    oszlop = 1

    Set db = CurrentDb()
    'Set qdf = db.
    Set rs = db.OpenRecordset(Lek�rdez�s)
    
    Set oApp = CreateObject("Excel.Application")
    Set oWb = oApp.Workbooks.Add
    Set oWs1 = oWb.Worksheets.Add
    Set oWs2 = oWb.Worksheets.Add(, oWs1)
    
    oWs1.Name = "Teljes�tm�ny-�rt�kel�s"
    oWs1.Activate
    

    ' Tartalom ki�r�sa
    
    With rs
        rs.MoveFirst
        rs.MoveLast
        maxoszlop = .Fields.Count  'A leend� oszlopok sz�ma, ah�ny mez� van a lek�rdez�sben �s m�g egy a sorsz�m miatt
        maxsor = .RecordCount
        'Az el�rehalad�s-jelz� el�k�sz�t�se

        .MoveFirst
        For sor = 1 To maxsor
            For oszlop = 1 To maxoszlop
                If oszlop = 1 Then
                    oWs1.Cells(sor + 1, oszlop).Value = sor
                Else
                    Adat = .Fields(oszlop - 2).Value
                    With oWs1
                        .Cells(sor + 1, oszlop).Value = Adat  'A sorsz�m oszlop miatt adunk hozz� egyet, �gy egyel od�bb tessz�k
                    End With
                End If
            Next oszlop
            .MoveNext
        Next sor
    End With
    With oWs1
        .Range(.Cells(1, 1), .Cells(maxsor + 1, maxoszlop)).Name = "Teljes�tm�ny_�rt�kel�s"
        .Range(.Cells(maxsor + 2, 1), .Cells(maxsor + 2, 1)).Value = "*Minden feladatot k�l�n sorban kell felt�ntetni!"
    End With
  
    'A fejl�c ut�lag j�n a tetej�re
    oszlop = 2
    With oWs1.Cells(1, 1)
                .Value = "Sorsz�m"
                .Font.Bold = True
                .Font.Name = "Calibri"
                .Font.Size = 11
                .Interior.Color = RGB(83, 142, 213)
                .Font.Color = RGB(255, 255, 255)
                .WrapText = True
                .VerticalAlignment = xlVAlignTop
                .HorizontalAlignment = xlHAlignCenter
    End With
    oWs1.Columns(oszlop).ColumnWidth = 10
    For Each mez� In rs.Fields
        With oWs1
            With .Cells(1, oszlop)
                .Value = Replace(mez�.Name, "_", ".")
                .Font.Bold = True
                .Font.Name = "Calibri"
                .Font.Size = 11
                .Interior.Color = RGB(83, 142, 213)
                .Font.Color = RGB(255, 255, 255)
                .WrapText = True
                .VerticalAlignment = xlVAlignTop
                .HorizontalAlignment = xlHAlignCenter
            End With
            Select Case oszlop
                Case 2, 3
                    .Columns(oszlop).ColumnWidth = 43
                Case 4
                    .Columns(oszlop).ColumnWidth = 36
                Case 5
                    .Columns(oszlop).ColumnWidth = 45
                    .Cells(1, oszlop).Value = "Az 1. sz�m� t�bl�zat alapj�n a korm�nytisztvisel� t�nylegesen ell�tand� fealdatai*"
                Case 6
                    .Columns(oszlop).ColumnWidth = 45
                    .Cells(1, oszlop).Value = "Az 1. sz. t�bl�zatban meghat�rozott teljes�tm�ny-k�vetelm�ny korm�nytisztvisel�re vonatkoz� sz�vegszer� �rt�kel�se"
                Case 7
                    .Columns(oszlop).ColumnWidth = 13 'Teljes�tm�ny-k�vetelm�ny
                    .Cells(1, oszlop).Value = "Teljes�tm�ny-k�vetelm�ny (felett / szinten / alatt)"
            End Select
        End With
        oszlop = oszlop + 1
    Next mez�
    oWs1.Range("G2:G1000").Validation.Add xlValidateList, xlValidAlertStop, xlEqual, "szint felett; szinten; szint alatt"
    oWs2.Name = "Adatok"
    oWs2.Range("A1").Value = "K�sz�lt:": oWs2.Range("B1").Value = Now()
    oWs2.Range("A2").Value = "Adatsor:": oWs2.Range("B2").Value = sor - 1
    
    'Takar�t�s
    oWb.SaveAs FileName:=F�jl, FileFormat:=xlOpenXMLWorkbook, AddToMru:=True, Local:=True
    oWb.Close
    Debug.Print F�jl & " k�sz (" & sor & " sor) ."
    Set oWb = Nothing
'   Kill oWb
    
End Sub
Sub Kimutat�s(F�jl As String, Lek�rdez�s As String)
'****** (c) Ol�h Zolt�n 2022 - MIT Licence ****************
 
 'Az adatb�zishoz
    Dim db          As Database
    Dim qdf         As QueryDef
    Dim rs          As DAO.Recordset
    Dim �rlapN�v    As String
    
    'Excelhez
    Dim sor, oszlop     As Long
    Dim oApp            As Excel.Application
    Dim oWb             As Workbook
    Dim oWs1, oWs2      As Worksheet
    Dim oWc             As Chart
    
    Dim maxoszlop, maxsor As Long
    Dim Adat As Variant
    Dim mez� As Field
    'Az el�rehalad�s-jelz�h�z

    
    'Alapadatok **********************************
    sor = 1
    oszlop = 1

    Set db = CurrentDb()
    'Set qdf = db.
    Set rs = db.OpenRecordset(Lek�rdez�s)
    
    Set oApp = CreateObject("Excel.Application")
    Set oWb = oApp.Workbooks.Add
    Set oWs1 = oWb.Worksheets.Add
    Set oWs2 = oWb.Worksheets.Add(, oWs1)
    
    oWs1.Name = "Teljes�tm�ny-�rt�kel�s"
    oWs1.Activate
    

    ' Tartalom ki�r�sa
    
    With rs
        rs.MoveFirst
        rs.MoveLast
        maxoszlop = .Fields.Count  'A leend� oszlopok sz�ma, ah�ny mez� van a lek�rdez�sben �s m�g egy a sorsz�m miatt
        maxsor = .RecordCount
        'Az el�rehalad�s-jelz� el�k�sz�t�se

        .MoveFirst
        For sor = 1 To maxsor
            For oszlop = 1 To maxoszlop
                If oszlop = 1 Then
                    oWs1.Cells(sor + 1, oszlop).Value = sor
                Else
                    Adat = .Fields(oszlop - 2).Value
                    With oWs1
                        .Cells(sor + 1, oszlop).Value = Adat  'A sorsz�m oszlop miatt adunk hozz� egyet, �gy egyel od�bb tessz�k
                    End With
                End If
            Next oszlop
            .MoveNext
        Next sor
    End With
    With oWs1
        .Range(.Cells(1, 1), .Cells(maxsor + 1, maxoszlop)).Name = "Teljes�tm�ny_�rt�kel�s"
        .Range(.Cells(maxsor + 2, 1), .Cells(maxsor + 2, 1)).Value = "*Minden feladatot k�l�n sorban kell felt�ntetni!"
    End With
  
    'A fejl�c ut�lag j�n a tetej�re
    oszlop = 2
    With oWs1.Cells(1, 1)
                .Value = "Sorsz�m"
                .Font.Bold = True
                .Font.Name = "Calibri"
                .Font.Size = 11
                .Interior.Color = RGB(83, 142, 213)
                .Font.Color = RGB(255, 255, 255)
                .WrapText = True
                .VerticalAlignment = xlVAlignTop
                .HorizontalAlignment = xlHAlignCenter
    End With
    oWs1.Columns(oszlop).ColumnWidth = 10
    For Each mez� In rs.Fields
        With oWs1
            With .Cells(1, oszlop)
                .Value = Replace(mez�.Name, "_", ".")
                .Font.Bold = True
                .Font.Name = "Calibri"
                .Font.Size = 11
                .Interior.Color = RGB(83, 142, 213)
                .Font.Color = RGB(255, 255, 255)
                .WrapText = True
                .VerticalAlignment = xlVAlignTop
                .HorizontalAlignment = xlHAlignCenter
            End With
            Select Case oszlop
                Case 2, 3
                    .Columns(oszlop).ColumnWidth = 43
                Case 4
                    .Columns(oszlop).ColumnWidth = 36
                Case 5
                    .Columns(oszlop).ColumnWidth = 45
                    .Cells(1, oszlop).Value = "Az 1. sz�m� t�bl�zat alapj�n a korm�nytisztvisel� t�nylegesen ell�tand� fealdatai*"
                Case 6
                    .Columns(oszlop).ColumnWidth = 45
                    .Cells(1, oszlop).Value = "Az 1. sz. t�bl�zatban meghat�rozott teljes�tm�ny-k�vetelm�ny korm�nytisztvisel�re vonatkoz� sz�vegszer� �rt�kel�se"
                Case 7
                    .Columns(oszlop).ColumnWidth = 13 'Teljes�tm�ny-k�vetelm�ny
                    .Cells(1, oszlop).Value = "Teljes�tm�ny-k�vetelm�ny (felett / szinten / alatt)"
            End Select
        End With
        oszlop = oszlop + 1
    Next mez�
    oWs1.Range("G2:G1000").Validation.Add xlValidateList, xlValidAlertStop, xlEqual, "szint felett; szinten; szint alatt"
    oWs2.Name = "Adatok"
    oWs2.Range("A1").Value = "K�sz�lt:": oWs2.Range("B1").Value = Now()
    oWs2.Range("A2").Value = "Adatsor:": oWs2.Range("B2").Value = sor - 1
    
    'Takar�t�s
    oWb.SaveAs FileName:=F�jl, FileFormat:=xlOpenXMLWorkbook, AddToMru:=True, Local:=True
    oWb.Close
    Debug.Print F�jl & " k�sz (" & sor & " sor) ."
    Set oWb = Nothing
'   Kill oWb
    
End Sub

Public Sub Szem�lyt�rzsImport(f�jln�v As String, �rlap As Object)
'(c) Ol�h Zolt�n 2022. Licencia: MIT

    'Az Excel megnyit�s�hoz
    Dim objExcel        As Excel.Application
    Dim objBook         As Excel.Workbook
    Dim objSheet        As Excel.Worksheet
    Dim objRange        As Excel.Range
    
    Dim xlT�bla, kieg   As String
    Dim xlT�blaEred     As String
    
    Dim �rt�kek()       As Variant
    Dim intMez�         As Integer

    
    'Az adatb�zis megnyit�s�hoz
    Dim db              As DAO.Database     'Ez lesz az adatb�zisunk
    Dim rsC�l           As DAO.Recordset    'Ahov� m�solunk

    Dim F�jl            As String
    Dim helyzet         As Variant          'A felt�ltend� rekord el�r�s�hez
    Dim mez�            As String           'A mez� nev�nek �tmeneti t�rol�s�ra �s tiszt�t�s�ra
    
    
    Dim eredm�ny        As Integer
    Dim Mez�ListaT�bla  As String           'A t�bla : a t�bla mez�inek (eredeti oszlopc�m, mez�n�v, t�pus) jellemz�it t�rol� t�bla
    
    'A sz�veges kimenethez
    Dim �zenet          As String
    
    'Sz�ml�l�shoz
    Dim sor, oszlop     As Integer
    Dim ehj             As New ehjoszt
    
    Dim V�lasz          As Integer
On Error GoTo Hiba
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    Mez�ListaT�bla = "tSzem�lyMez�k"

    
    ' azt felt�telezz�k, hogy a f�jln�v j�, helyes �s alkalmas
    F�jl = f�jln�v
    ' megnyitjuk az Excel t�bl�t
'''
    �zenet = "Adatforr�s megnyit�sa:; megkezdve..."
    �rlap.Folyamat.AddItem Item:=�zenet
    
    Set objBook = objExcel.Workbooks.Open(F�jl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)

'''
    �zenet = "Adatforr�s megnyit�sa:; megt�rt�nt!"
    �rlap.Folyamat.AddItem Item:=�zenet
    
        Erase �rt�kek
        xlT�bla = "tSzem�lyek"
        xlT�blaEred = "Szem�lyt�rzs alapriport"
        Set objSheet = objBook.Worksheets(xlT�blaEred)
        objSheet.Select ' R�ugrunk a lapra
        
'''
    �zenet = "�res oszlopok t�rl�se:; megkezdve..."
    �rlap.Folyamat.AddItem Item:=�zenet
        
'        Call UresOszlopokTorlese(objSheet)
'''
    �zenet = "�res oszlopok t�rl�se:; befejezve!"
    �rlap.Folyamat.AddItem Item:=�zenet

        With objSheet
            .UsedRange.Name = xlT�bla 'Elnevezz�k a ter�letet
'''
            �zenet = "Beolvasand� sorok sz�ma:;" & .Range(xlT�bla).Rows.Count
            Debug.Print �zenet
            �rlap.Folyamat.AddItem Item:=�zenet
            
        End With
        
        If DCount("[Name]", "MSysObjects", "[Name] = '" & xlT�bla & "'") = 1 Then
            kieg = RIC(Now())
            DoCmd.Rename xlT�bla & kieg, acTable, xlT�bla
'''
            �zenet = n�vel�vel(xlT�bla, , , True) & " �tneveztetett:; " & xlT�bla & kieg
            �rlap.Folyamat.AddItem Item:=�zenet
    
        End If
'''
        �zenet = "Az �j " & xlT�bla & " elk�sz�t�se:; megkezdve..."
        �rlap.Folyamat.AddItem Item:=�zenet
        
        Call T�blak�sz�t�(db, Mez�ListaT�bla, xlT�bla)

'''
        �zenet = "Az �j " & xlT�bla & " elk�sz�lt:; siker�lt!"
        �rlap.Folyamat.AddItem Item:=�zenet

        'Elkezdj�k az adatok bet�lt�s�t
        Set rsC�l = db.OpenRecordset(xlT�bla)

        �rt�kek = objSheet.Range(xlT�bla).Value
        
        ehj.Ini (100)
        'Sorok sz�ma: !!!!
        ehj.OszlopSzam = UBound(�rt�kek, 1) - (LBound(�rt�kek, 1)) ' Az oszlopsz�m itt a sorok sz�m�t jel�li!
'''
        �zenet = "A beolvasand� oszlopok sz�ma:;" & UBound(�rt�kek, 2) - (LBound(�rt�kek, 2) + 1)
        �rlap.Folyamat.AddItem Item:=�zenet

        For sor = LBound(�rt�kek, 1) + 1 To UBound(�rt�kek, 1)
            intMez� = 0
            '�j rekord hozz�ad�sa kezd�dik...
            rsC�l.AddNew
            rsC�l.Update
            helyzet = rsC�l.LastModified
            
            For oszlop = LBound(�rt�kek, 2) + 1 To UBound(�rt�kek, 2)

                intMez� = oszlop
                rsC�l.bookmark = helyzet
                rsC�l.Edit
                mez� = Clean_NPC(Trim(Left(�rt�kek(1, oszlop), 64))) 'A nem nyomtathat� karaktereket kisz�rj�k
                rsC�l.Fields(mez�) = konverter(rsC�l.Fields(mez�), �rt�kek(sor, oszlop))
                Debug.Print mez�, rsC�l.Fields(mez�).Value
                rsC�l.Update
            Next oszlop
            ehj.Novel
            '�j rekord hozz�ad�sa v�get �rt
            
        Next sor
'''
    �zenet = n�vel�vel(F�jl, , , True) & " adatai beolvastattak; " & n�vel�vel(xlT�bla) & "t�bl�ba!"
    �rlap.Folyamat.AddItem Item:=�zenet
Exit Sub
Hiba:
If Err.Number = 3265 Then
    V�lasz = �jOszlop(mez�)
End If

End Sub
Function �jOszlop(strOszlopN�v As String) As Integer
    Dim Sz�veg As String
    Dim V�lasz As Variant
    Dim Sz�m As Integer
On Error GoTo Hiba
Kezdet:
    Sz�veg = strOszlopN�v & Chr(10) & "2 - Byte" & Chr(10) & "3 - Integer" & Chr(10) & "4 - Long" & Chr(10) & "5 - Currency" & Chr(10) & "6 - Single" & Chr(10) & "7 - Double" & Chr(10) & "8 - Date/Time" & Chr(10) & "10 - Text" & Chr(10) & "12 - Memo" & Chr(10) & "16 - Big Integer" & Chr(10) & "17 - VarBinary" & Chr(10) & "18 - Char" & Chr(10) & "19 - Numeric" & Chr(10) & "20 - Decimal" & Chr(10) & "21 - Float" & Chr(10) & "22 - Time" & Chr(10) & "23 - Time Stamp"
    V�lasz = InputBox(Sz�veg, "�j oszlop", 10) 'Ha nem v�laszol, akkor 10 lesz az �rt�k.
    If StrPtr(V�lasz) = 0 Then 'M�gsem gombot nyomott
        Exit Function
    End If
    If Len(V�lasz) = 0 Then
        GoTo Kezdet
    End If
V�g:
    Sz�m = CInt(V�lasz)
    MsgBox ("Eredm�ny:" & Sz�m)
Exit Function
Hiba:
If Err.Number = 13 Then
    Select Case MsgBox(Err.Number & " sz�m� hiba." & Chr(10) & " Csak sz�m adhat� meg!", vbRetryCancel)
        Case 2
            Exit Function
        Case 4
            Resume Kezdet
        Case Else
            MsgBox ("!")
    End Select
End If
'    Resume Kezdet

End Function
Function mez�n�v(ByRef adatb�zis As DAO.Database, ByVal Mez�ListaT�bla As String, ByVal oszlopc�m As String) As String
    Dim sql As String
    Dim rekordok As Recordset
    Dim szRek As Long
    
On Error GoTo ErrorHandler
    
    sql = "SELECT TOP 1 [Mez�n�v]" _
        & " FROM [" & Mez�ListaT�bla & "]" _
        & " WHERE [Oszlopn�v]='" & oszlopc�m & "';"
    Set rekordok = adatb�zis.OpenRecordset(sql)
    
    If rekordok.EOF Then
        MsgBox Title:="Az oszlopn�v nincs " & n�vel�vel(Mez�ListaT�bla) & " t�bl�ban", _
               prompt:=n�vel�vel(oszlopc�m, , , True) & "nem szerepel " & n�vel�vel(Mez�ListaT�bla) & " t�bl�ban!"
    Else
        rekordok.MoveLast
        szRek = rekordok.RecordCount
    End If

    Set rekordok = Nothing
Exit Function
 
ErrorHandler:
   MsgBox "Error #: " & Err.Number & vbCrLf & vbCrLf & Err.Description
    
End Function
Sub T�blak�sz�t�(adatb�zis As DAO.Database, ByVal forr�st�bla As String, ByVal c�lt�bla As String)
'(c) Ol�h Zolt�n 2022. Licencia: MIT
' A forr�st�bl�ban tal�lhat� mez�nevek-nek �s t�pus-nak megfelel� mez�kkel hoz l�tre egy c�lt�bla nev� t�bl�t

    Dim db              As DAO.Database     'Ez lesz az adatb�zisunk
    Dim sqlMez�k        As String           'A mez�nevek lek�rdez�s�hez
    Dim sqlTgy          As String           'A tSzem�ly t�bl�t k�sz�t� lek�rdez�shez
    Dim rsSorSz�m       As Integer
    Dim rsMez�k         As DAO.Recordset    'A mez�nevek t�bl�ja
    Dim strMez�N�v     As String
    
On Error GoTo Hiba
    'Alap�rt�kek be�ll�t�sa
    Set db = adatb�zis
    sqlMez�k = "SELECT [" & forr�st�bla & "].[Az]" _
             & ", [" & forr�st�bla & "].[Oszlopn�v]" _
             & ", [" & forr�st�bla & "].[T�pus]" _
             & ", [" & forr�st�bla & "].[Mez�n�v]" _
             & ", (SELECT Count([Az])" _
             & "     FROM [" & forr�st�bla & "] as Tmp " _
             & "     WHERE   [Tmp].[Az] <= [" & forr�st�bla & "].[Az]" _
             & "        AND [Tmp].[T�pus] = [" & forr�st�bla & "].[T�pus]" _
             & "        AND [Tmp].[Mez�n�v] = [" & forr�st�bla & "].[Mez�n�v]" _
             & "  )" _
             & " FROM [" & forr�st�bla & "] " _
             & " WHERE " _
             & "  (SELECT Count([Az])" _
             & "     FROM [" & forr�st�bla & "] as Tmp " _
             & "     WHERE   [Tmp].[Az] <= [" & forr�st�bla & "].[Az]" _
             & "        AND [Tmp].[T�pus] = [" & forr�st�bla & "].[T�pus]" _
             & "        AND [Tmp].[Mez�n�v] = [" & forr�st�bla & "].[Mez�n�v]" _
             & "  ) = 1;"

    Set rsMez�k = db.OpenRecordset(sqlMez�k)
    rsMez�k.MoveLast
    rsMez�k.MoveFirst
    sqlTgy = "CREATE TABLE " & c�lt�bla & "([az" & c�lt�bla & "] COUNTER, CONSTRAINT [PrimaryKey] PRIMARY KEY ([az" & c�lt�bla & "]) );"
    db.Execute (sqlTgy)
    sqlTgy = ""
    For rsSorSz�m = 0 To rsMez�k.RecordCount - 1
        sqlTgy = "ALTER TABLE [" & c�lt�bla & "] ADD COLUMN [" & rsMez�k.Fields("Mez�n�v") & "] "  'A mez�n�v
        Select Case rsMez�k.Fields("T�pus")               'ut�na j�n t�pus
            Case 10
                sqlTgy = sqlTgy & "VARCHAR; "
            Case 8
                sqlTgy = sqlTgy & "DATETIME; "
            Case 5
                sqlTgy = sqlTgy & "MONEY; "
            Case 4
                sqlTgy = sqlTgy & "INTEGER; "             'LONG
            Case Else
                sqlTgy = sqlTgy & "CHAR; "                'ha semmi m�s nincs, legyen sz�veg
        End Select

Debug.Print ".";
        strMez�N�v = Clean_NPC(sqlTgy)
        If Len(strMez�N�v) > 60 Then
            strMez�N�v = Left(strMez�N�v, 60) & rsSorSz�m
        End If
        db.Execute (strMez�N�v)
Debug.Print ".";
        rsMez�k.MoveNext
Debug.Print "."
Debug.Print rsSorSz�m, Len(rsMez�k.Fields("Mez�n�v")), strMez�N�v;
    Next rsSorSz�m
Debug.Print "!";
MsgBox ("!")
Exit Sub
Hiba:
    MsgBox (Err.Number & ": " & Err.Description & " - " & Err.Source)
    Exit Sub
End Sub
Sub T�blaMez�k()
    Dim db As Database
    Dim rs As Recordset
    Dim rs2 As Recordset
    Dim tbla As Recordset
    Dim sql, sql2, sql3 As String
    Dim mez�sz�m As Long
    Dim mez�n�v As String
    'Dim mez�nevek() As Variant
    
    Dim t�blan�v As String
    
    
    sql = "SELECT Name FROM MSysObjects WHERE Flags=0 AND Type = 1 AND Name like 'tSzem�lyek*' "
    
    Set db = CurrentDb()
    Set tbla = db.OpenRecordset("tT�blamez�k", dbOpenTable)
        
    Set rs = db.OpenRecordset(sql)
        rs.MoveLast
        rs.MoveFirst
    
    Do Until rs.EOF
        t�blan�v = rs.Fields("Name")
        sql2 = "SELECT TOP 1 * FROM [" & t�blan�v & "];"
        Set rs2 = db.OpenRecordset(sql2)
        Debug.Print t�blan�v, rs2.Fields.Count
        For mez�sz�m = 0 To rs2.Fields.Count - 1
            tbla.AddNew
            tbla.Fields("t�blan�v") = t�blan�v
            mez�n�v = rs2.Fields(mez�sz�m).Name
            tbla.Fields("mez�n�v") = mez�n�v
            tbla.Fields("sorsz�m") = mez�sz�m
            If InStr(1, mez�n�v, "d�tum") Then
                'tbla.Fields = Date
            End If
            tbla.Update
            Debug.Print mez�sz�m, rs2.Fields(mez�sz�m).Name
        Next mez�sz�m
        Set rs2 = Nothing
        rs.MoveNext
    Loop
    
End Sub
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
Public Function StrCount(ByVal Sz�veg As String, ByVal Keresett As String) As Integer
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

    strHold = Sz�veg
    itemhold = Keresett
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
Public Function ffsplit(ByVal mez� As String, Optional ByVal elv�laszt� As String = ",", Optional ByVal Sz�m As Integer = 0) As String
    Dim temp() As String
    Dim n As Integer
On Error GoTo Hiba
    If IsNull(mez�) Then Exit Function
    n = StrCount(mez�, elv�laszt�)
    ReDim temp(n)
    'Debug.Print mez� & ", " & n

    temp = Split(mez�, elv�laszt�)
    ffsplit = Trim(temp(Sz�m - 1))
    'Debug.Print temp(Sz�m - 1)

Exit Function
Hiba:
MsgBox (Err)
End Function
Public Function dt�tal(strD�tum As Variant) As Date
' Kell hozz� az ffsplit() fv., ahhoz meg a StrCount() f�ggv�ny.
    Dim dtV�l As String
    Debug.Print strD�tum
    If IsNull(strD�tum) Or strD�tum = "" Then
        dt�tal = 1
        Exit Function
    End If
    dtV�l = "."
    
    dt�tal = DateSerial(ffsplit(strD�tum, dtV�l, 1), ffsplit(strD�tum, dtV�l, 2), ffsplit(strD�tum, dtV�l, 3))
End Function

Public Function SetNavPaneGroup(strObjName, strGroupName)
'## � JBStovers (Apr 17, 2018 at 18:03)
'## forr�s: https://stackoverflow.com/questions/12863959/access-custom-group

    Dim strSQL, idObj, idGrp, db
    Set db = CurrentDb
    idObj = DLookup("Id", "MSysNavPaneObjectIDs", "Name='" & strObjName & "'")
    idGrp = DLookup("Id", "MSysNavPaneGroups", "Name='" & strGroupName & "'")

    If DCount("*", "MSysNavPaneGroupToObjects", "GroupID = " & idGrp & " AND ObjectID = " & idObj) > 0 Then
        strSQL = "UPDATE MSysNavPaneGroupToObjects SET GroupID = " & idGrp & ", Name='" & strObjName & "' WHERE ObjectID = " & idObj
        db.Execute strSQL, dbFailOnError
    Else
        strSQL = "INSERT INTO MSysNavPaneGroupToObjects ( GroupID, ObjectID, Name ) " & vbCrLf & _
        "VALUES (" & idGrp & "," & idObj & ",'" & strObjName & "');"
        db.Execute strSQL, dbFailOnError
    End If
    RefreshDatabaseWindow
    Set db = Nothing
    
End Function

Sub valami(iz� As String)
Debug.Print iz�
End Sub