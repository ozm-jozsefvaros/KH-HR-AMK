'E gy�tem�nyben, ha az MIT licencia eml�ttettik, (megjel�lve a szerz�t �s a m� sz�let�s�nek �v�t) azon az al�bbi felhaszn�l�si enged�lyt kell �rteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database

Public Function �nyrT�blaImport(f�jln�v As String, �rlap As Object) As Boolean
    'Az Excel megnyit�s�hoz
    Dim objExcel       As Excel.Application
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
    xlT�bla = "�ll�shelyek"
    Set rsC�l = Nothing

    xlUtols�Oszlop = "AB"
    
    Erase �rt�kek

    Set objSheet = objBook.Worksheets(1)
    objSheet.Select ' R�ugrunk a lapra

        xlV�gcella = objSheet.Cells(objSheet.Rows.Count, 1).End(xlUp).row
        xlV�gcella = xlUtols�Oszlop & xlV�gcella

    With objSheet
        .Range(.Range("A6"), .Range(xlV�gcella)).Name = xlT�bla 'Elnevezz�k a ter�letet
        �zenet = xlT�bla & ":;" & .Range(xlT�bla).Rows.Count
        Debug.Print "Sorok sz�ma:" & .Range(xlT�bla).Rows.Count & ", oszlopok sz�ma:" & .Range(xlT�bla).Columns.Count
        �rlap.Folyamat.AddItem Item:=�zenet
        
    End With

    
'    If DCount("[Name]", "MSysObjects", "[Name] = '" & xlT�bla & "'") = 1 Then
'        If SysCmd(acSysCmdGetObjectState, acTable, xlT�bla) <> 0 Then
'            db.OpenRecordset(xlT�bla).Close
'        End If

'        'DoCmd.Rename xlT�bla & RIC(Now()), acTable, xlT�bla
'    End If
    DoCmd.CopyObject , xlT�bla & RIC(Now()), acTable, xlT�bla '& "_tart"
    db.Execute ("Delete * From [" & xlT�bla & "];")
    'Elkezdj�k az adatok bet�lt�s�t
    Set rsC�l = db.OpenRecordset(xlT�bla)
    �rt�kek = objSheet.Range(xlT�bla).Value
    For sor = LBound(�rt�kek, 1) To UBound(�rt�kek, 1)
        intMez� = 0
        '�j rekord hozz�ad�sa kezd�dik...
        rsC�l.AddNew
        For oszlop = LBound(�rt�kek, 2) - 1 To UBound(�rt�kek, 2)
            intMez� = oszlop
            If intMez� <> 0 Then
                rsC�l.Fields(intMez�) = konverter(rsC�l.Fields(intMez�), �rt�kek(sor, oszlop))
                Debug.Print intMez�, rsC�l.Fields(intMez�).Name & ": " & �rt�kek(1, oszlop) & " - " & rsC�l.Fields(intMez�)
            End If
 
        Next oszlop
        rsC�l.Update
        '�j rekord hozz�ad�sa v�get �rt
    Next sor
    �nyrT�blaImport = True 'Visszat�r�si �rt�ke Igaz, ha nincs hiba
Kil�p�s:
    
    rsC�l.Close
Exit Function

Hiba:
    
    MsgBox "Hiba!! " & Err.Number & ": " & Err.Description
    �nyrT�blaImport = False 'Visszat�r�si �rt�ke Hamis, ha hiba t�rt�nt.
    Resume Kil�p�s
End Function

Function n�vel�(sz� As Variant) As String
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
