'E gy�tem�nyben, ha az MIT licencia eml�ttettik, (megjel�lve a szerz�t �s a m� sz�let�s�nek �v�t) azon az al�bbi felhaszn�l�si enged�lyt kell �rteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Function Els�dlegesKulcsMez�(ByVal t�blan�v As Variant, Optional adatb�zis As Variant = "", Optional o�rlap As Form) As String
'# Megkeresi, hogy az adott t�bl�ban van-e els�dleges mez�,
'# ha van, visszaadja a nev�t,
'# ha nincs, �res string-gel t�r vissza

    Dim db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim fld As DAO.Field
    Dim log As Boolean
    If Not IsNull(o�rlap) Then: log = True
    
    ' Ha nincs megadva t�blan�v, vbNullString-et adunk vissza
    If t�blan�v = "" Or IsNull(t�blan�v) Then
        Els�dlegesKulcsMez� = vbNullString
        Exit Function
    End If
    
    ' Ha nincs megadva adatb�zisn�v, haszn�ljuk a CurrentDb-t
    If dbName = "" Or IsNull(adatb�zis) Then
        Set db = CurrentDb
    Else
        ' Ellenkez� esetben megpr�b�ljuk megnyitni a megadott adatb�zist
        On Error Resume Next
        Set db = OpenDatabase(adatb�zis)
        On Error GoTo 0
        
        ' Ha nem siker�l megnyitni az adatb�zist, hib�t jelz�nk �s kil�p�nk
        If db Is Nothing Then
            If log Then: sFoly o�rlap, t�blan�v & ":; nincs adatb�zisn�v"
            Els�dlegesKulcsMez� = vbNullString
            Exit Function
        End If
    End If
    
    ' Megpr�b�ljuk megnyitni a t�bl�t
    On Error Resume Next
    Set tdf = db.TableDefs(t�blan�v)
    On Error GoTo 0
    
    ' Ha nem siker�l megnyitni a t�bl�t, hib�t jelz�nk, �s kil�p�nk
    If tdf Is Nothing Then
        If log Then: sFoly o�rlap, t�blan�v & "Nem siker�lt megnyitni a t�bl�t."
        Els�dlegesKulcsMez� = vbNullString
        Exit Function
    End If
    
    ' Keres�nk egy mez�t, amely els�dleges kulcsk�nt van meghat�rozva
    For Each fld In tdf.Fields
        If fld.Attributes And dbAutoIncrField Then
            Els�dlegesKulcsMez� = fld.Name
            Exit Function
        End If
    Next fld
    
    ' Ha nem tal�ltunk els�dleges kulcsot, vbNullString-et adunk vissza
    Els�dlegesKulcsMez� = vbNullString
End Function
Function Mez�Vane(ByVal mez�n�v As Variant, ByVal t�blan�v As Variant, Optional adatb�zis As Variant = "", Optional o�rlap As Form) As Boolean
'# Megkeresi, hogy az adott t�bl�ban van-e els�dleges mez�, ha van visszaadja a nev�t, ha nincs �res string-gel t�r vissza
    Dim log As Boolean
        If Not IsNull(o�rlap) Then: log = True
    Dim db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim fld As DAO.Field
    
    
    If IsNull(mez�n�v) Or mez�n�v = "" Then
        If log Then: sFoly o�rlap, t�blan�v & ":; nincs mez�n�v megadva"
        Exit Function
    End If
    
    
    ' Ha nincs megadva t�blan�v, vbNullString-et adunk vissza
    If t�blan�v = "" Or IsNull(t�blan�v) Then
        Mez�Vane = False
        Exit Function
    End If
    
    ' Ha nincs megadva adatb�zisn�v, haszn�ljuk a CurrentDb-t
    If dbName = "" Or IsNull(adatb�zis) Then
        Set db = CurrentDb
    Else
        ' Ellenkez� esetben megpr�b�ljuk megnyitni a megadott adatb�zist
        On Error Resume Next
        Set db = OpenDatabase(adatb�zis)
        On Error GoTo 0
        
        ' Ha nem siker�l megnyitni az adatb�zist, hib�t jelz�nk �s kil�p�nk
        If db Is Nothing Then
            If log Then: sFoly o�rlap, t�blan�v & ":; nincs adatb�zisn�v megadva"
            Mez�Vane = False
            Exit Function
        End If
    End If
    
    ' Megpr�b�ljuk megnyitni a t�bl�t
    On Error Resume Next
    Set tdf = db.TableDefs(t�blan�v)
    On Error GoTo 0
    
    ' Ha nem siker�l megnyitni a t�bl�t, hib�t jelz�nk �s kil�p�nk
    If tdf Is Nothing Then
        If log Then: sFoly o�rlap, t�blan�v & "Nem siker�lt megnyitni a t�bl�t."
        Mez�Vane = False
        Exit Function
    End If
    
    ' Keres�nk egy mez�t, amely els�dleges kulcsk�nt van meghat�rozva
    For Each fld In tdf.Fields
        If fld.Name = mez�n�v Then
            Mez�Vane = True
            Exit Function
        End If
    Next fld
    
    ' Ha nem tal�ltunk els�dleges kulcsot, vbNullString-et adunk vissza
    Mez�Vane = False
End Function
Function RenameColumn(R�giMezoNev As Variant, UjMezoNev As Variant, Optional tablaNev As Variant = "", Optional adatbazisNev As Variant = "", Optional o�rlap As Form) As Boolean
   Dim log As Boolean
        If Not IsNull(o�rlap) Then: log = True
        RenameColumn = False
    Dim db As Database
    Dim tblDef As TableDef
    Dim fld As Field
    
    
    On Error Resume Next
    If IsNull(mezoNev) Then: Exit Function

    
    If adatbazisNev = "" Or IsNull(adatbazisNev) Then
        Set db = CurrentDb
    Else
        Set db = OpenDatabase(adatbazisNev)
    End If
    
    If tablaNev = "" Or IsNull(tablaNev) Then: Exit Function
    
    Set tblDef = db.TableDefs(tablaNev)
    
    ' Ellen�rizz�k, hogy l�tezik-e a megadott mez�n�v a t�bl�ban
    For Each fld In tblDef.Fields
        If fld.Name = mezoNev Then
            ' Megv�ltoztatjuk a mez� nev�t
            tblDef.Fields(mezoNev).Name = UjMezoNev
            
            ' Friss�tj�k a t�bladefin�ci�t
            db.TableDefs.Refresh
            
            ' Igaz �rt�kkel t�r vissza
            RenameColumn = True
            Exit Function
        End If
    Next fld
    
    ' Ha a mez� n�v nem tal�lhat� a t�bl�ban
    RenameColumn = False
    
    ' Bez�rja az adatb�zis kapcsolat�t
    db.Close
End Function

Function vFldT�pus(sql As String) As Variant
'#MIT Ol�h Zolt�n (c) 2023
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
        ReDim vFieldTypes(1 To rs1.recordCount, 1 To 2)
        
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
Sub mez�T�pusok(lek As String, hfN�v As String)
'Licencia: MIT Ol�h Zolt�n 2022 (c)
' A lek nev� lek�rdez�sben felsorolt lek�rdez�seket sorra megnyitja,
' s a lek�rdez�s nev�t, tov�bb� a mez� nev�t �s t�pus�t egy hfN�v nev� csv t�bl�ba �rja.
' mez�T�pusok "lkEllen�rz�Lek�rdez�sek2","C:\Users\olahzolt\Desktop\F�jlok\mezo.csv"

    Dim db As DAO.Database
    Dim rk As Recordset
    'Dim hfn�v As String
    Dim hf As Object
    
    Set hf = CreateObject("Scripting.FileSystemObject").CreateTextFile(hfN�v, True)

    Set db = CurrentDb
    Set rk = db.OpenRecordset(lek)
    rk.MoveFirst
    hf.writeline "Lek�rdez�sNeve;Mez�Neve;Mez�T�nylegesT�pusa"
    
    Do Until rk.EOF
        Dim rklek As Recordset
        Set rklek = db.OpenRecordset(rk("Ellen�rz�Lek�rdez�s"))
        Debug.Print rklek.Name
        For Each mez� In rklek.Fields
            hf.writeline rklek.Name & ";" & mez�.Name & ";" & mez�.Type
            'Debug.Print rklek.Name; ";"; mez�.Name; ";"; mez�.Type
        Next mez�
        rk.MoveNext
        Set rklek = Nothing
    Loop
    hf.Close
    Set hf = Nothing
    Debug.Print "----------------"
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
                MsgBox "Nem lehet konvert�lni a" & n�vel�(�rt�k) & " " & �rt�k & " �rt�ket a" & n�vel�(fMez�.Type) & " " & fMez�.Name & " " & fMez�.Type & "t�pus�ba!"
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
Function ListTdfFields(t�blan�v As Variant) As Variant
'#################################################
'#
'# Ol�h Zolt�n (c) 2024 MIT
'#
'# Egy t�mb�t ad vissza, amelyiknek a
'# 0. dimenzi�ja tartalmazza a mez� nev�t,
'# 1. dimenzi�ja pedig a mez� t�pus�t
'# a t�blan�v nev� t�bl�ra �rtend�.
'#
'#################################################
If IsNull(t�blan�v) Then Exit Function
    Dim db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim fld As DAO.Field
    Dim t�mb() As Variant
    Dim i As Long
    i = 0
    
    Set db = CurrentDb

    Set tdf = db.TableDefs(t�blan�v)
    ReDim t�mb(tdf.Fields.count, 1)

    For Each fld In tdf.Fields
        t�mb(i, 0) = fld.Name
        t�mb(i, 1) = fld.Type
        i = i + 1
    Next fld
    
    ListTdfFields = t�mb()
    
    Set tdf = Nothing
    Set db = Nothing
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
    For rsSorSz�m = 0 To rsMez�k.recordCount - 1
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

'Debug.Print ".";
        strMez�N�v = Clean_NPC(sqlTgy)
        If Len(strMez�N�v) > 60 Then
            strMez�N�v = Left(strMez�N�v, 60) & rsSorSz�m
        End If
        db.Execute (strMez�N�v)
'Debug.Print ".";
        rsMez�k.MoveNext
'Debug.Print "."
'Debug.Print rsSorSz�m, Len(rsMez�k.Fields("Mez�n�v")), strMez�N�v;
    Next rsSorSz�m
'Debug.Print "!";
MsgBox ("!")
Exit Sub
Hiba:
    MsgBox (Err.Number & ": " & Err.Description & " - " & Err.Source)
    Exit Sub
End Sub
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
        szRek = rekordok.recordCount
    End If

    Set rekordok = Nothing
Exit Function
 
ErrorHandler:
   MsgBox "Error #: " & Err.Number & vbCrLf & vbCrLf & Err.Description
    
End Function

Public Function tSzem�lyekImport02(strF�jl As String, �rlap As Form)
    'On Error GoTo ErrorHandler

    Dim importSpecName As String
    Dim db As DAO.Database
    Set db = CurrentDb
    Dim �zenet As String
    Dim v�lasz As Boolean
    Dim Hiba As Boolean
    Hiba = False
    
    importSpecName = "tSzem�lyek_import"

    If strF�jl <> "" Then

                                                    sFoly �rlap, importSpecName & ":; import�l�s �res oszlopok t�rl�se..."
        UresOszlopokTorlese strF�jl 'A megadott �llom�nyb�l t�r�lj�k az �res oszlopokat
                                                    sFoly �rlap, importSpecName & ":; import�l�s �res oszlopok t�rl�se k�sz!"

                                                    sFoly �rlap, importSpecName & ":; import�l�s ind�t�sa"
'#           Kit�r�lj�k a kor�bbi f�jlhoz l�trehozott kapcsolatot, ha van ilyen
        If Len(CurrentDb.TableDefs(importSpecName).Connect) > 0 Then
            DoCmd.DeleteObject acTable, importSpecName
                                                    sFoly �rlap, importSpecName & ":; a kor�bbi kapcsolat t�r�lve"
        End If
'#          Majd l�trehozunk ugyanezen a n�ven egy �j kapcsolatot az �j f�jllal
        DoCmd.TransferSpreadsheet acLink, 10, importSpecName, strF�jl, True, "tSzem�lyek" 'TODO : �j param�ter az UresOszlopokTorlese-hez: ter�letn�v
        '#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                                                    sFoly �rlap, importSpecName & ":; t�bla csatol�sa k�sz"
        db.Execute ("lkh�tt�rt�r_tSzem�lyek_t�rl�") ' t�r�lj�k a m�r megl�v� adatokat
                                                    sFoly �rlap, importSpecName & ":; kor�bbi adatok t�rl�se k�sz"
                                                    sFoly �rlap, importSpecName & ":; adatok �tt�lt�se h�tt�rt�rba indul..."
        db.Execute ("lkh�tt�rt�r_tSzem�lyek_�tt�lt�s") '�tt�ltj�k az adatokat a h�tt�rt�rba
                                                    sFoly �rlap, importSpecName & ":; import�l�s v�get �rt"
                                                    sFoly �rlap, importSpecName & ":; " & DCount("*", "tSzem�lyek") & " sor."
    End If
    tSzem�lyekImport02 = True
    
Kil�p�s:
    Exit Function

ErrorHandler:
    ' Szabv�nyos hiba�zenet el��ll�t�sa
    If Err.Number = 3709 Then
        sFoly �rlap, importSpecName & ":;az import�l�s hib�ra futott, megpr�b�ljuk jav�tani..."
        Hiba = True
        Resume 0
    End If
    MsgBox "Error: " & Err.Number & " - " & Err.Description, vbExclamation + vbOKOnly, "Error"
    Debug.Print "Error: " & Err.Number & " - " & Err.Description
    tSzem�lyekImport02 = False
    Resume Kil�p�s
End Function
Function vMez�kT�pusaImporthoz(eRng As excel.Range) As Variant
'# Ol�h Zolt�n (c)2024 MIT
'# A tartom�ny c�msor�t v�gign�zz�k, s egy t�mbbe �sszegy�jtj�k az al�bbi adatokat:
    '# - oszlopsz�m
    '# - a mez�Neve <- a lkMez�k�sT�pusuk lek�rdez�sb�l
    '# - a mez�T�pusa <- lkMez�k�sT�pusuk lek�rdez�sb�l
    '# - skip (�t kell-e ugrani) <- lkMez�k�sT�pusuk lek�rdez�sb�l
    '# Az lkMez�k�sT�pusuk egy lek�rdez�s, ami az al�bbi mez�ket adja vissza:
    '# oszlopn�v - az excel tartom�ny (eRng) c�msor�ban szerepl� lehets�ges sz�vegek, oszlopnevek
    '# mez�n�v - az adatt�bla mez�nevei,
    '# T�pus - egy eg�sz sz�m
    '# Skip - Boolean �rt�k
    '# DbType - a JetSQL szerinti mez�t�pus
    Dim i As Integer
    Dim arr() As Variant
    Dim oszlopszam As Integer
    Dim Mez�Neve As String
    Dim Mez�T�pusa As String
    Dim skip As Boolean
    Dim rs As DAO.Recordset
    
    ' Initialize the array
    ReDim arr(1 To eRng.Columns.count, 1 To 5)
    
    ' Open the query
    Set rs = CurrentDb.OpenRecordset("lkMez�k�sT�pusuk")
    
    ' Loop through each column in the range
    For i = 1 To eRng.Columns.count
        ' Get the column number
        oszlopszam = i
        
        ' Find the corresponding record in the query
        rs.FindFirst "[oszlopn�v] = '" & eRng.Cells(1, i).Value & "'"
        
        If Not rs.NoMatch Then
            ' Get the field name, field type, and whether to skip from the query
            Mez�Neve = rs!mez�n�v
            Mez�T�pusa = rs!T�pus
            skip = rs!skip
        Else
            ' If no matching record is found, use default values
            Mez�Neve = ""
            Mez�T�pusa = ""
            skip = True
        End If
        
        ' Store the information in the array
        arr(i, 1) = oszlopszam
        arr(i, 2) = Mez�Neve
        arr(i, 3) = Mez�T�pusa
        arr(i, 4) = skip
        arr(i, 5) = rs!DbType
    Next i
    
    ' Close the recordset
    rs.Close
    Set rs = Nothing
    
    ' Return the array
    vMez�kT�pusaImporthoz = arr
End Function