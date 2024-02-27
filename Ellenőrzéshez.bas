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
Sub F�jlV�laszt�(Sz�vegMez� As TextBox, Felirat As String, Optional Munkak�nyvt�r As String = "", Optional f�jln�v As String = "", Optional f�jlt�pus As String = "")
'Open file ablakot nyit meg Felirat felirattal, s a kiv�lasztott �rt�ket a Sz�vegMez� beviteli mez�be teszi.
'Meg lehet adni kezd� mapp�t, vagy ak�r az alap�rtelmezetten megjelen� �llom�nyok neveit is helykit�lt�kkel (* �s ?)
'Meg lehet adni a f�jlt�pusok list�j�t, ha �res (vagy hi�nyzik) akkor *.xls �s *.* az alap�rtelmezett
'Ezt megh�vj�k az al�bbi elj�r�sok:
'   Havi_Click
'   Szervezeti_Click
'   Szem�lyt�rzs_Click

    Dim fDialog As Office.FileDialog
    Dim varFile As Variant
    Dim i, n As Integer
 
    Sz�vegMez�.Value = ""

    Set fDialog = Application.FileDialog(msoFileDialogFilePicker)
 
    With fDialog
 
      .AllowMultiSelect = False
             
      .Title = Felirat
 
      .Filters.Clear
      If f�jlt�pus = "" Then
        '.Filters.Add "MsExcel t�bla", "*.XLS*"
        '.Filters.Add "Minden fajta", "*.*"
        f�jlt�pus = "*.XSL*,*.*"
      End If
      n = StrCount(f�jlt�pus, ",") + 1
      For i = 1 To n
        .Filters.Add ffsplit(f�jlt�pus, i), ffsplit(f�jlt�pus, i)
      Next i
      If Right(Munkak�nyvt�r, 1) <> "\" Then
        Munkak�nyvt�r = Munkak�nyvt�r & "\"
      End If
      .InitialFileName = Munkak�nyvt�r & f�jln�v 'Hol ny�ljon meg
 
      If .Show = True Then
 
         For Each varFile In .SelectedItems
            Sz�vegMez�.Value = varFile
         Next
 
       End If
   End With
End Sub
Sub MappaV�laszt�(Sz�vegMez� As TextBox, Felirat As String, Optional Munkak�nyvt�r As String = "")
'Open k�nyvt�r ablakot nyit meg Felirat felirattal, s a kiv�lasztott �rt�ket a Sz�vegMez� beviteli mez�be teszi.
'Meg lehet adni kezd� mapp�t, vagy ak�r az alap�rtelmezetten megjelen� �llom�nyok neveit is helykit�lt�kkel (* �s ?)
'Ezt megh�vj�k az al�bbi elj�r�sok:
'   Kiemenet_Click()

    Dim fDialog As Office.FileDialog
    Dim varFile As Variant
 
    Sz�vegMez�.Value = ""

    Set fDialog = Application.FileDialog(msoFileDialogFolderPicker)
 
    With fDialog
 
      .AllowMultiSelect = False
             
      .Title = Felirat
 
      .Filters.Clear

      If Right(Munkak�nyvt�r, 1) <> "\" Then
        Munkak�nyvt�r = Munkak�nyvt�r & "\"
      End If
      .InitialFileName = Munkak�nyvt�r  'Hol ny�ljon meg
 
      If .Show = True Then
            For Each varFile In .SelectedItems
                Sz�vegMez�.Value = varFile
            Next
            If Sz�vegMez�.Value = "" Then
                Sz�vegMez�.Value = Munkak�nyvt�r
            End If
       End If
   End With
End Sub
Public Sub HaviT�blaImport(f�jln�v As String, �rlap As Object)
Dim a As Boolean
    �rlap.Folyamat.RowSource = ""
    a = fvHaviT�blaImport(f�jln�v, �rlap)
End Sub

Public Function fvHaviT�blaImport(ByVal f�jln�v As String, ByRef �rlap As Object) As Boolean
'Licencia: MIT Ol�h Zolt�n 2022 (c)
    'Az Excel megnyit�s�hoz
    Dim objExcel        As excel.Application
    Dim objBook         As excel.Workbook
    Dim objSheet        As excel.Worksheet
    Dim objRange        As excel.Range
    
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
    Dim strH�tt�rDb        As String     'Ez a h�tt�radatb�zis, ahol a t�bl�k laknak
    Dim rs              As DAO.Recordset    'A beolvasand� lapok �s ter�letek adatait tartalmaz� t�bl�nak
    Dim rsC�l           As DAO.Recordset    'Ahov� m�solunk
    Dim f�jl            As String
    
    Dim Eredm�ny        As Integer
    Dim t�bla           As String           'A t�bla : a t�bl�k jellemz�it t�rol� t�bla
    
    'A sz�veges kimenethez
    Dim �zenet As String
    
    'Sz�ml�l�shoz
    Dim sor, oszlop As Integer
    
    t�bla = "tImport�land�T�bl�k"
    strH�tt�rDb = "L:\Ugyintezok\Adatszolg�ltat�k\Adatb�zisok\H�tt�rt�rak\Ellen�rz�s_0.9.6_h�tt�r_.mdb.accdb"
    intV�gcella = 0
'On Error GoTo hiba
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    'Set h�tt�rdb =
    ' ha az �tvonal v�g�n nincs \, akkor hozz�f�zz�k, [de ha van, akkor meg nem :)]
    f�jl = f�jln�v
    ' megnyitjuk az Excel t�bl�t
    Set objBook = objExcel.Workbooks.Open(f�jl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)
    
    Set rs = db.OpenRecordset(t�bla)
    rs.MoveLast
    rs.MoveFirst

    
    Do Until rs.EOF
        Erase �rt�kek
        xlT�bla = rs("AccessN�v")
        xlT�blaEred = rs("EredetiN�v"): 'Debug.Print xlT�blaEred & " -- " & xlT�bla
        
        
        Set objSheet = objBook.Worksheets(xlT�blaEred)
        objSheet.Select ' R�ugrunk a lapra
        '### A Fedlap A2 cell�j�b�l a d�tumot (a t�bla hat�ly�t) be�rjuk a hat�lyt�bl�ba.
        If xlT�blaEred = "Fedlap" Then
            Dim qdfHJH As DAO.QueryDef
            Dim sql As String
            sql = "INSERT INTO tHaviJelent�sHat�lya ([hat�lya], [f�jln�v]) VALUES ([hat�ly],[f�jl]);"
            Set qdfHJH = db.CreateQueryDef("lkTmp01", sql)
            qdfHJH!hat�ly = objSheet.Range("a2").Value
            qdfHJH!f�jl = f�jl
            qdfHJH.Execute
            db.QueryDefs.Delete ("lktmp01")
            Set qdfHJH = Nothing
            sql = ""
        End If
        '### Hat�ly be�r�sa: v�ge
        If Nz(rs("V�gcella"), "") = "" Then
            xlHosszm�r� = rs("Hosszm�r�Cella")
            xlUtols�Oszlop = rs("Utols�Oszlop")
            intV�gcella = objSheet.Range(xlHosszm�r� & 1).Column
            xlV�gcella = objSheet.Cells(objSheet.Cells.Rows.count, intV�gcella).End(xlUp).row
            xlV�gcella = xlUtols�Oszlop & xlV�gcella
        Else
            xlV�gcella = rs("V�gcella")
        End If
        With objSheet
            .Range(.Range(rs("Kezd�Cella")), .Range(xlV�gcella)).Name = xlT�bla 'Elnevezz�k a ter�letet
            sFoly �rlap, xlT�bla & ":;" & .Range(xlT�bla).Rows.count
            'Debug.Print .Range(xlT�bla).Rows.Count
            
        End With
        
        
        If DCount("[Name]", "MSysObjects", "[Name] = '" & xlT�bla & "'") = 1 Then
            CurrentDb.Execute "Delete * From " & xlT�bla & ";", dbFailOnError
        Else
            CurrentDb.Execute "Delete * From " & xlT�bla & "_tart;", dbFailOnError
            DoCmd.CopyObject strH�tt�rDb, xlT�bla, acTable, xlT�bla & "_tart"
        End If


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
                If rsC�l.Fields.count < oszlop Then
                    Exit For
                End If
                intMez� = oszlop - 1

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
fvHaviT�blaImport = True
Exit Function


Hiba:
Debug.Print Err.Number, Err.Description
fvHaviT�blaImport = False

End Function
Sub Lek�rdez�s�r�()
'Licencia: MIT Ol�h Zolt�n 2022 (c)
    Dim rs As Recordset
    Dim rs2 As Recordset
    Dim sql As String
    Dim sql2 As String
    Dim kSQL As String
    Dim lek�rd As String
    Dim �jn�v As String
    Dim x As Integer
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
        'Debug.Print kSQL
        rs.MoveNext 'A k�vetkez� t�bl�ra ugrunk
    Loop 'rs

kij�rat:

End Sub


Public Function tT�blaImport(strF�jl As String, �rlap As Form, t�blan�v As String)
    'On Error GoTo ErrorHandler

    Dim importSpecName As String
'    Dim strXML As String
'    Dim strR�giF�jl As String
'    Dim str�jF�jl As String
'    Dim intKezdPoz As Integer
'    Dim intV�gPoz As Integer
    Dim �zenet As String
    Dim v�lasz As Boolean
    
    importSpecName = t�blan�v 'pl.:"tAdatv�ltoztat�siIg�nyek"

    If strF�jl <> "" Then

                                                   ' sFoly �rlap, importSpecName & ":; import�l�s �res oszlopok t�rl�se..."
       ' UresOszlopokTorlese strF�jl 'A megadott �llom�nyb�l t�r�lj�k az �res oszlopokat
'#           �t�rjuk az XML-t:
                                                    sFoly �rlap, importSpecName & ":; mentett import �talak�t�sa"
        v�lasz = XML�talak�t�(importSpecName, strF�jl)
        

                                                    sFoly �rlap, importSpecName & ":; import�l�s ind�t�sa"
'#           Az �t�rt XML-lel pedig futtatjuk a mentett importot
        DoCmd.RunSavedImportExport importSpecName
                                                    sFoly �rlap, importSpecName & ":; import�l�s v�get �rt"
                                                    sFoly �rlap, importSpecName & ":; " & DCount("*", t�blan�v) & " sor."
    End If
   tT�blaImport = True
    
Kil�p�s:
    Exit Function

ErrorHandler:
    ' Szabv�nyos hiba�zenet el��ll�t�sa
    If Err.Number = 3709 Then
        
        'Resume 0
    End If
    MsgBox "Error: " & Err.Number & " - " & Err.Description, vbExclamation + vbOKOnly, "Error"
    Debug.Print "Error: " & Err.Number & " - " & Err.Description
    tT�blaImport = False
    Resume Kil�p�s
End Function


Public Function SzervezetiT�blaImport(f�jln�v As String, �rlap As Object) As Boolean
    'MIT Ol�h Zolt�n 2022
    'Az Excel megnyit�s�hoz
    Dim objExcel       As excel.Application
    Dim objBook         As excel.Workbook
    Dim objSheet        As excel.Worksheet
    Dim objRange        As excel.Range
    Dim objRange2       As excel.Range
    
    Dim xlT�bla         As String
    Dim xlT�blaEred     As String
    Dim xlV�gcella      As String
    
    Dim xlUtols�Oszlop  As Integer
    Dim intV�gcella     As Integer
    Dim xlHosszm�r�     As Integer
    
    Dim �rt�kek()       As Variant
    Dim intMez�         As Integer
    
    'Az adatb�zis megnyit�s�hoz
    Dim db              As DAO.Database     'Ez lesz az adatb�zisunk
    Dim rs              As DAO.Recordset    'A beolvasand� lapok �s ter�letek adatait tartalmaz� t�bl�nak
    Dim rsC�l           As DAO.Recordset    'Ahov� m�solunk
    Dim f�jl            As String
    Dim archf�jl        As String           'A r�gi f�jl archiv�l�s ut�ni neve
    
    Dim Eredm�ny        As Integer
    Dim t�bla           As String           'A t�bla : a t�bl�k jellemz�it t�rol� t�bla
    
    'A sz�veges kimenethez
    Dim �zenet As String
    
    'Sz�ml�l�shoz
    Dim sor, oszlop     As Integer
    Dim ehj             As New ehjoszt
    Dim El�z�Szakasz    As Integer
    
    
'On Error GoTo Hiba
    xlT�bla = "tSzervezeti"
    xlT�blaEred = "Szervezeti alapriport"
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    ' ha az �tvonal v�g�n nincs \, akkor hozz�f�zz�k, [de ha van, akkor meg nem :)]
    f�jl = f�jln�v
    If Not (vane(f�jl)) Then 'Ha nincs ilyen f�jl, akkor kisz�llunk...
        SzervezetiT�blaImport = False
        sFoly �rlap, xlT�bla & ":;f�jl nem tal�lhat�, �tugorjuk"
        Exit Function
    End If
    ' megnyitjuk az Excel t�bl�t
    Set objBook = objExcel.Workbooks.Open(f�jl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)
    


    Set rsC�l = Nothing

'Az import�land� ter�letet az objRange-be tessz�k
    Set objSheet = objBook.Worksheets(xlT�blaEred)
    objSheet.Activate
    
    Set objRange = objSheet.Range("A2").CurrentRegion
        xlUtols�Oszlop = objRange.Columns.count
        xlHosszm�r� = objRange.Rows.count

    With objRange
        Set objRange2 = .Range(.Cells(2, 1), objRange.Cells(xlHosszm�r�, xlUtols�Oszlop + 0))  'leszedj�k az els� sort
    End With
    sFoly �rlap, xlT�bla & ":;" & xlHosszm�r�
                'Debug.Print "Sorok sz�ma:" & xlHosszm�r� & ", oszlopok sz�ma:" & xlUtols�Oszlop
   
    Erase �rt�kek

    If DCount("[Name]", "MSysObjects", "[Name] = '" & xlT�bla & "'") = 1 Then 'Ha van m�r xlT�bla nev� t�bla, akkor
        archf�jl = xlT�bla & RIC(Now())
        DoCmd.CopyObject , archf�jl, acTable, xlT�bla 'k�sz�t�nk egy tartal�k m�solatot
        db.Execute ("Delete * From [" & xlT�bla & "];") 'majd (az xlT�bla t�bl�t) ki�r�tj�k
        sFoly �rlap, xlT�bla & ":;Az el�z� t�bl�t " & archf�jl & " n�ven archiv�ltuk."
    End If
    
    ehj.Ini 100
    'Elkezdj�k az adatok bet�lt�s�t
    Set rsC�l = db.OpenRecordset(xlT�bla)
    �rt�kek = objRange2.Value
    'ehj.SzakaszSz�m = 5 '20%-konk�nt jelezz�k ki az �rt�ket
    ehj.oszlopszam = UBound(�rt�kek, 1) - (LBound(�rt�kek, 1) + 1) 'Itt az oszlopsz�m a sorokat jel�li :)
    For sor = LBound(�rt�kek, 1) + 1 To UBound(�rt�kek, 1)
        intMez� = 0
        '�j rekord hozz�ad�sa kezd�dik...
        rsC�l.AddNew
        For oszlop = LBound(�rt�kek, 2) - 1 To UBound(�rt�kek, 2)
            intMez� = oszlop
            If intMez� <> 0 Then
                rsC�l.Fields(intMez�) = konverter(rsC�l.Fields(intMez�), �rt�kek(sor, oszlop))
                'Debug.Print intMez�, rsC�l.Fields(intMez�).Name & ": " & �rt�kek(1, oszlop) & " - " & rsC�l.Fields(intMez�)
            End If
 
        Next oszlop
'        If ehj.JelenlegiSzakasz > El�z�Szakasz Then
'            sFoly �rlap, xlT�bla & ":;" & Round(ehj.JelenlegiSzakasz / ehj.SzakaszSz�m * 100, 0) & "% elk�sz�lt..."
'            El�z�Szakasz = ehj.JelenlegiSzakasz
'        End If
        rsC�l.Update
        '�j rekord hozz�ad�sa v�get �rt
        'Debug.Print (sor / xlHosszm�r�) * 100 & "%"
'        ehj.Novel
    Next sor
    SzervezetiT�blaImport = True 'Visszat�r�si �rt�ke Igaz, ha nincs hiba
Kil�p�s:
    
    rsC�l.Close
Exit Function

Hiba:
    
    MsgBox "Hiba!! " & Err.Number & ": " & Err.Description
    SzervezetiT�blaImport = False 'Visszat�r�si �rt�ke Hamis, ha hiba t�rt�nt.
    Resume Kil�p�s
End Function



Function ImportT�blaHibaJav�t�(ter�let As excel.Range) As Integer
    'A kapott t�bla (Excel.Range) fejl�c�ben megkeresi az azonos nev�eket, �s a m�sodikt�l kezdve az oszlop sz�m�t hozz�f�zi.
    'Mindek�zben a neveket trim-eli.
    'Ha hiba nem t�rt�nt:0 �rt�kkel t�r vissza, egy�bk�nt a hibak�ddal
    On Error GoTo Hiba
    Dim intOszlopok     As Integer  'Az oszlopok sz�ma
    Dim i, n            As Integer  'Sz�ml�l�
    Dim varOszlopNevek  As Variant   'Az oszlopok nevei
    Dim intOszlopSz�m   As Integer  'Az oszlopok sz�ma
    Dim gy�jt           As Collection
    Dim n�v             As Variant
    
    intOszlopSz�m = ter�let.Columns.count
    ReDim varOszlopNevek(1, intOszlopSz�m)
    
    Set gy�jt = New Collection
    
    varOszlopNevek = ter�let.Rows(1)
    
    For i = LBound(varOszlopNevek, 2) To UBound(varOszlopNevek, 2) 'V�gig l�pked�nk az �sszes elemen
        n�v = varOszlopNevek(1, i)
        gy�jt.Add n�v, n�v
        '�s megk�s�relj�k betenni egy sz�t�rba. Ha van azonos, akkor hib�ra fut, s a hibakeres� hozz�f�zi az i-t �s �jra megpr�b�lja.
        'Debug.Print i, n�v
    Next i
    
    For n = 1 To gy�jt.count
        ter�let.Cells(1, n) = Trim(gy�jt(n)) 'Visszatessz�k, de egy�ttal levessz�k a felesleges sz�k�z�ket.
    Next n
    
    ImportT�blaHibaJav�t� = 0
Exit Function
Hiba:
    If Err.Number = 457 Then
        gy�jt.Add n�v & i, n�v & i
        Debug.Print n�v; i
        Resume Next
    End If
    ImportT�blaHibaJav�t� = Err.Number
    
End Function
Public Sub t�blagy�rt�(Optional ByVal SzervezetiLek As String = "lk_�tvil�g�t�s_mind_02", Optional ByVal AdatLek As String = "lk__�tvil�g�t�shoz_Szem�lyt�rzs_02")
'Licencia: MIT Ol�h Zolt�n 2022 (c)
Dim db As Database
Dim rst As Recordset
Dim qdf As QueryDef
Dim sql As String
Dim �rt�k As Variant
Dim a As Integer
sql = "Select Distinct [Szervezeti egys�g] From  [" & SzervezetiLek & "] WHERE [Szervezeti egys�g] not like '' "
Set db = CurrentDb()
Set rst = qdf.OpenRecordset(sql)
rst.MoveLast
rst.MoveFirst
Do Until rst.EOF
    �rt�k = rst.Fields("Szervezeti egys�g").Value
    'Debug.Print �rt�k
    Call Kimutat�s("O:\�tvil�g�t�s\�tvil�g�t�s2" & �rt�k & ".xlsx", "SELECT * FROM [" & AdatLek & "] WHERE [Szervezeti egys�g] = '" & �rt�k & "';")
    'Debug.Print "O:\�tvil�g�t�s\�tvil�g�t�s2" & �rt�k & ".xlsx"
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
    'Debug.Print �rt�k
    Call Besz�mol�T�bla("O:\�tvil�g�t�s\�tvil�g�t�s2" & �rt�k & ".xlsx", "SELECT * FROM lk__�tvil�g�t�shoz_Szem�lyt�rzs_02 WHERE [Szervezeti egys�g] = '" & �rt�k & "';")
    'Debug.Print "O:\�tvil�g�t�s\�tvil�g�t�s2" & �rt�k & ".xlsx"
    rst.MoveNext
Loop
End Sub

Sub Besz�mol�T�bla(f�jl As String, lek�rdez�s As String)
'****** (c) Ol�h Zolt�n 2022 - MIT Licence ****************
 
 'Az adatb�zishoz
    Dim db          As Database
    Dim qdf         As QueryDef
    Dim rs          As DAO.Recordset
    Dim �rlapn�v    As String
    
    'Excelhez
    Dim sor, oszlop     As Long
    Dim oApp            As excel.Application
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
    Set rs = db.OpenRecordset(lek�rdez�s)
    
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
        maxoszlop = .Fields.count  'A leend� oszlopok sz�ma, ah�ny mez� van a lek�rdez�sben �s m�g egy a sorsz�m miatt
        maxsor = .recordCount
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
    oWb.SaveAs fileName:=f�jl, FileFormat:=xlOpenXMLWorkbook, AddToMru:=True, Local:=True
    oWb.Close
    'Debug.Print f�jl & " k�sz (" & sor & " sor) ."
    Set oWb = Nothing
'   Kill oWb
    
End Sub
Sub Kimutat�s(f�jl As String, lek�rdez�s As String)
'****** (c) Ol�h Zolt�n 2022 - MIT Licence ****************
 
 'Az adatb�zishoz
    Dim db          As Database
    Dim qdf         As QueryDef
    Dim rs          As DAO.Recordset
    Dim �rlapn�v    As String
    
    'Excelhez
    Dim sor, oszlop     As Long
    Dim oApp            As excel.Application
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
    Set rs = db.OpenRecordset(lek�rdez�s)
    
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
        maxoszlop = .Fields.count  'A leend� oszlopok sz�ma, ah�ny mez� van a lek�rdez�sben �s m�g egy a sorsz�m miatt
        maxsor = .recordCount
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
    oWb.SaveAs fileName:=f�jl, FileFormat:=xlOpenXMLWorkbook, AddToMru:=True, Local:=True
    oWb.Close
    'Debug.Print f�jl & " k�sz (" & sor & " sor) ."
    Set oWb = Nothing
'   Kill oWb
    
End Sub


Function �jOszlop(strOszlopN�v As String) As Integer
    Dim sz�veg As String
    Dim v�lasz As Variant
    Dim sz�m As Integer
On Error GoTo Hiba
Kezdet:
    sz�veg = strOszlopN�v & Chr(10) & "2 - Byte" & Chr(10) & "3 - Integer" & Chr(10) & "4 - Long" & Chr(10) & "5 - Currency" & Chr(10) & "6 - Single" & Chr(10) & "7 - Double" & Chr(10) & "8 - Date/Time" & Chr(10) & "10 - Text" & Chr(10) & "12 - Memo" & Chr(10) & "16 - Big Integer" & Chr(10) & "17 - VarBinary" & Chr(10) & "18 - Char" & Chr(10) & "19 - Numeric" & Chr(10) & "20 - Decimal" & Chr(10) & "21 - Float" & Chr(10) & "22 - Time" & Chr(10) & "23 - Time Stamp"
    v�lasz = InputBox(sz�veg, "�j oszlop", 10) 'Ha nem v�laszol, akkor 10 lesz az �rt�k.
    If StrPtr(v�lasz) = 0 Then 'M�gsem gombot nyomott
        Exit Function
    End If
    If Len(v�lasz) = 0 Then
        GoTo Kezdet
    End If
V�g:
    sz�m = CInt(v�lasz)
    MsgBox ("Eredm�ny:" & sz�m)
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
    
    
    sql = "SELECT Name FROM MSysObjects WHERE (Flags=0 AND Type = 1 AND Name not like '~*') OR (Type = 6 AND Name not like '~*')"
    
    Set db = CurrentDb()
    db.Execute ("Delete * from tT�blamez�k")
    Set tbla = db.OpenRecordset("select * from tT�blamez�k")
        
    Set rs = db.OpenRecordset(sql)
        rs.MoveLast
        rs.MoveFirst
    
    Do Until rs.EOF
        t�blan�v = rs.Fields("Name")
        sql2 = "SELECT TOP 1 * FROM [" & t�blan�v & "];"
        Set rs2 = db.OpenRecordset(sql2)
        'Debug.Print t�blan�v, rs2.Fields.Count
        For mez�sz�m = 0 To rs2.Fields.count - 1
            tbla.AddNew
            tbla.Fields("t�blan�v") = t�blan�v
            mez�n�v = rs2.Fields(mez�sz�m).Name
            tbla.Fields("mez�n�v") = mez�n�v
            tbla.Fields("sorsz�m") = mez�sz�m
            tbla.Fields("t�pusa") = rs2.Fields(mez�sz�m).Type
            If InStr(1, mez�n�v, "d�tum") Then
                'tbla.Fields = Date
            End If
            tbla.Update
            'Debug.Print mez�sz�m, rs2.Fields(mez�sz�m).Name
        Next mez�sz�m
        Set rs2 = Nothing
        rs.MoveNext
    Loop
    
End Sub




