'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database

Public Function ÁnyrTáblaImport(fájlnév As String, Ûrlap As Object) As Boolean
    'Az Excel megnyitásához
    Dim objExcel       As Excel.Application
    Dim objBook         As Excel.Workbook
    Dim objSheet        As Excel.Worksheet
    Dim objRange        As Excel.Range
    
    Dim xlTábla         As String
    Dim xlTáblaEred     As String
    Dim xlVégcella      As String
    
    Dim xlUtolsóOszlop  As String
    Dim intVégcella     As Integer
    Dim xlHosszmérõ     As String
    
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
    xlTábla = "Álláshelyek"
    Set rsCél = Nothing

    xlUtolsóOszlop = "AB"
    
    Erase Értékek

    Set objSheet = objBook.Worksheets(1)
    objSheet.Select ' Ráugrunk a lapra

        xlVégcella = objSheet.Cells(objSheet.Rows.Count, 1).End(xlUp).row
        xlVégcella = xlUtolsóOszlop & xlVégcella

    With objSheet
        .Range(.Range("A6"), .Range(xlVégcella)).Name = xlTábla 'Elnevezzük a területet
        üzenet = xlTábla & ":;" & .Range(xlTábla).Rows.Count
        Debug.Print "Sorok száma:" & .Range(xlTábla).Rows.Count & ", oszlopok száma:" & .Range(xlTábla).Columns.Count
        Ûrlap.Folyamat.AddItem Item:=üzenet
        
    End With

    
'    If DCount("[Name]", "MSysObjects", "[Name] = '" & xlTábla & "'") = 1 Then
'        If SysCmd(acSysCmdGetObjectState, acTable, xlTábla) <> 0 Then
'            db.OpenRecordset(xlTábla).Close
'        End If

'        'DoCmd.Rename xlTábla & RIC(Now()), acTable, xlTábla
'    End If
    DoCmd.CopyObject , xlTábla & RIC(Now()), acTable, xlTábla '& "_tart"
    db.Execute ("Delete * From [" & xlTábla & "];")
    'Elkezdjük az adatok betöltését
    Set rsCél = db.OpenRecordset(xlTábla)
    Értékek = objSheet.Range(xlTábla).Value
    For sor = LBound(Értékek, 1) To UBound(Értékek, 1)
        intMezõ = 0
        'új rekord hozzáadása kezdõdik...
        rsCél.AddNew
        For oszlop = LBound(Értékek, 2) - 1 To UBound(Értékek, 2)
            intMezõ = oszlop
            If intMezõ <> 0 Then
                rsCél.Fields(intMezõ) = konverter(rsCél.Fields(intMezõ), Értékek(sor, oszlop))
                Debug.Print intMezõ, rsCél.Fields(intMezõ).Name & ": " & Értékek(1, oszlop) & " - " & rsCél.Fields(intMezõ)
            End If
 
        Next oszlop
        rsCél.Update
        'új rekord hozzáadása véget ért
    Next sor
    ÁnyrTáblaImport = True 'Visszatérési értéke Igaz, ha nincs hiba
Kilépés:
    
    rsCél.Close
Exit Function

Hiba:
    
    MsgBox "Hiba!! " & Err.Number & ": " & Err.Description
    ÁnyrTáblaImport = False 'Visszatérési értéke Hamis, ha hiba történt.
    Resume Kilépés
End Function

Function névelõ(szó As Variant) As String
    'A névelõ második betûjét z-re állítja, vagy semmire
    Dim magánhangzók As String
    Dim Keresett As String
    
    magánhangzók = "aáeéiíoóöõuúüûAÁEÉIÍOÓÖÕUÚÜÛ"
    Keresett = Left(szó, 1)
    Select Case Keresett
        Case 0 To 9
            Select Case Keresett
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
