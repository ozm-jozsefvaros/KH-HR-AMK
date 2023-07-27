'E gy�tem�nyben, ha az MIT licencia eml�ttettik, (megjel�lve a szerz�t �s a m� sz�let�s�nek �v�t) azon az al�bbi felhaszn�l�si enged�lyt kell �rteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database

Public Function SzervezetiT�blaImport(f�jln�v As String, �rlap As Object) As Boolean
    'MIT Ol�h Zolt�n 2022
    'Az Excel megnyit�s�hoz
    Dim objExcel       As Excel.Application
    Dim objBook         As Excel.Workbook
    Dim objSheet        As Excel.Worksheet
    Dim objRange        As Excel.Range
    Dim objRange2       As Excel.Range
    
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
    Dim F�jl            As String
    
    Dim eredm�ny        As Integer
    Dim t�bla           As String           'A t�bla : a t�bl�k jellemz�it t�rol� t�bla
    
    'A sz�veges kimenethez
    Dim �zenet As String
    
    'Sz�ml�l�shoz
    Dim sor, oszlop As Integer
'On Error GoTo Hiba
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    ' ha az �tvonal v�g�n nincs \, akkor hozz�f�zz�k, [de ha van, akkor meg nem :)]
    F�jl = f�jln�v
    ' megnyitjuk az Excel t�bl�t
    Set objBook = objExcel.Workbooks.Open(F�jl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)
    

    �rlap.Folyamat.RowSource = ""
    �rlap.Folyamat.AddItem Item:="T�bla neve;Beolvasott sorok sz�ma"
    �zenet = ""
    xlT�blaEred = "Szervezeti alapriport"
    xlT�bla = "tSzervezeti"
    Set rsC�l = Nothing

'Az import�land� ter�letet az objRange-be tessz�k
    Set objSheet = objBook.Worksheets(xlT�blaEred)
    objSheet.Activate
    
    Set objRange = objSheet.Range("A2").CurrentRegion
        xlUtols�Oszlop = objRange.Columns.Count
        xlHosszm�r� = objRange.Rows.Count

    With objRange
        Set objRange2 = .Range(.Cells(2, 1), objRange.Cells(xlHosszm�r�, xlUtols�Oszlop + 0))  'leszedj�k az els� sort
    End With
    �zenet = xlT�bla & ":;" & xlHosszm�r�
                Debug.Print "Sorok sz�ma:" & xlHosszm�r� & ", oszlopok sz�ma:" & xlUtols�Oszlop
    �rlap.Folyamat.AddItem Item:=�zenet
    Erase �rt�kek

    If DCount("[Name]", "MSysObjects", "[Name] = '" & xlT�bla & "'") = 1 Then 'Ha van m�r xlT�bla nev� t�bla, akkor
        DoCmd.CopyObject , xlT�bla & RIC(Now()), acTable, xlT�bla 'k�sz�t�nk egy tartal�k m�solatot
        db.Execute ("Delete * From [" & xlT�bla & "];") 'majd (az xlT�bla t�bl�t) ki�r�tj�k
    Else
        
    End If
    'Elkezdj�k az adatok bet�lt�s�t
    Set rsC�l = db.OpenRecordset(xlT�bla)
    �rt�kek = objRange2.Value
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
        rsC�l.Update
        '�j rekord hozz�ad�sa v�get �rt
        Debug.Print (sor / xlHosszm�r�) * 100 & "%"
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
Sub sqlLista()
Dim i, a As Integer
Dim db As Database
a = CurrentDb().QueryDefs.Count
For i = 0 To a - 1
    Debug.Print CurrentDb().QueryDefs(i).Name
    Debug.Print CurrentDb().QueryDefs(i).sql
Next i

End Sub