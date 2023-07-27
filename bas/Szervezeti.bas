'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database

Public Function SzervezetiTáblaImport(fájlnév As String, Ûrlap As Object) As Boolean
    'MIT Oláh Zoltán 2022
    'Az Excel megnyitásához
    Dim objExcel       As Excel.Application
    Dim objBook         As Excel.Workbook
    Dim objSheet        As Excel.Worksheet
    Dim objRange        As Excel.Range
    Dim objRange2       As Excel.Range
    
    Dim xlTábla         As String
    Dim xlTáblaEred     As String
    Dim xlVégcella      As String
    
    Dim xlUtolsóOszlop  As Integer
    Dim intVégcella     As Integer
    Dim xlHosszmérõ     As Integer
    
    Dim Értékek()       As Variant
    Dim intMezõ         As Integer
    
    'Az adatbázis megnyitásához
    Dim db              As DAO.Database     'Ez lesz az adatbázisunk
    Dim rs              As DAO.Recordset    'A beolvasandó lapok és területek adatait tartalmazó táblának
    Dim rsCél           As DAO.Recordset    'Ahová másolunk
    Dim Fájl            As String
    
    Dim eredmény        As Integer
    Dim tábla           As String           'A tábla : a táblák jellemzõit tároló tábla
    
    'A szöveges kimenethez
    Dim üzenet As String
    
    'Számláláshoz
    Dim sor, oszlop As Integer
'On Error GoTo Hiba
    
    Set objExcel = CreateObject("Excel.Application")
    Set db = CurrentDb()
    ' ha az útvonal végén nincs \, akkor hozzáfûzzük, [de ha van, akkor meg nem :)]
    Fájl = fájlnév
    ' megnyitjuk az Excel táblát
    Set objBook = objExcel.Workbooks.Open(Fájl, ReadOnly:=True, IgnoreReadOnlyRecommended:=True, Editable:=False, Notify:=False)
    

    Ûrlap.Folyamat.RowSource = ""
    Ûrlap.Folyamat.AddItem Item:="Tábla neve;Beolvasott sorok száma"
    üzenet = ""
    xlTáblaEred = "Szervezeti alapriport"
    xlTábla = "tSzervezeti"
    Set rsCél = Nothing

'Az importálandó területet az objRange-be tesszük
    Set objSheet = objBook.Worksheets(xlTáblaEred)
    objSheet.Activate
    
    Set objRange = objSheet.Range("A2").CurrentRegion
        xlUtolsóOszlop = objRange.Columns.Count
        xlHosszmérõ = objRange.Rows.Count

    With objRange
        Set objRange2 = .Range(.Cells(2, 1), objRange.Cells(xlHosszmérõ, xlUtolsóOszlop + 0))  'leszedjük az elsõ sort
    End With
    üzenet = xlTábla & ":;" & xlHosszmérõ
                Debug.Print "Sorok száma:" & xlHosszmérõ & ", oszlopok száma:" & xlUtolsóOszlop
    Ûrlap.Folyamat.AddItem Item:=üzenet
    Erase Értékek

    If DCount("[Name]", "MSysObjects", "[Name] = '" & xlTábla & "'") = 1 Then 'Ha van már xlTábla nevû tábla, akkor
        DoCmd.CopyObject , xlTábla & RIC(Now()), acTable, xlTábla 'készítünk egy tartalék másolatot
        db.Execute ("Delete * From [" & xlTábla & "];") 'majd (az xlTábla táblát) kiürítjük
    Else
        
    End If
    'Elkezdjük az adatok betöltését
    Set rsCél = db.OpenRecordset(xlTábla)
    Értékek = objRange2.Value
    For sor = LBound(Értékek, 1) + 1 To UBound(Értékek, 1)
        intMezõ = 0
        'új rekord hozzáadása kezdõdik...
        rsCél.AddNew
        For oszlop = LBound(Értékek, 2) - 1 To UBound(Értékek, 2)
            intMezõ = oszlop
            If intMezõ <> 0 Then
                rsCél.Fields(intMezõ) = konverter(rsCél.Fields(intMezõ), Értékek(sor, oszlop))
                'Debug.Print intMezõ, rsCél.Fields(intMezõ).Name & ": " & Értékek(1, oszlop) & " - " & rsCél.Fields(intMezõ)
            End If
 
        Next oszlop
        rsCél.Update
        'új rekord hozzáadása véget ért
        Debug.Print (sor / xlHosszmérõ) * 100 & "%"
    Next sor
    SzervezetiTáblaImport = True 'Visszatérési értéke Igaz, ha nincs hiba
Kilépés:
    
    rsCél.Close
Exit Function

Hiba:
    
    MsgBox "Hiba!! " & Err.Number & ": " & Err.Description
    SzervezetiTáblaImport = False 'Visszatérési értéke Hamis, ha hiba történt.
    Resume Kilépés
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