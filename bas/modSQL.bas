'E gy�tem�nyben, ha az MIT licencia eml�ttettik, (megjel�lve a szerz�t �s a m� sz�let�s�nek �v�t) azon az al�bbi felhaszn�l�si enged�lyt kell �rteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database

Function nSelect(strLek�rdNeve As String) As Integer
'#MIT Ol�h Zolt�n (c) 2023
'Megsz�molja, hogy egy lek�rdez�sben h�ny Select utas�t�s van.
'TODO: az id�z�jelben l�v� Select karaktersorozatok kisz�r�se: csak az ffsplit-tel kimetszett p�ratlan sorsz�m� r�szekben keresni
    nSelect = StrCount(CurrentDb.QueryDefs(strLek�rdNeve).sql, "SELECT")
End Function
Function LekSQL(lekN�v As String) As String
'#MIT Ol�h Zolt�n (c) 2023
    Dim dbLekSTR As DAO.Database
    
    Set dbLekSTR = CurrentDb
    LekSQL = dbLekSTR.QueryDefs(lekN�v).sql
    
End Function
Function SQLSz�p�t�(sql As String) As String
'#MIT Ol�h Zolt�n (c) 2023
    Dim k�dsz�k As Variant
    Dim bek As Integer
    Dim strbek As String
    Dim zrjl As Integer ' z�r�jelszint
    Dim ijl As Integer ' id�z�jel szint
    Dim i As Integer
    Dim ker As String
    strbek = "     "
    k�dsz�k = "SELECT;FROM;WHERE;GROUP BY;ORDER BY;"

    For i = 1 To StrCount(k�dsz�k, ";") + 1
        ker = ffsplit(k�dsz�k, ";", i)

        sql = Replace(sql, ker, vbNewLine & sz�vegF�z�(strbek, bek) & ker)
        If ker = "SELECT" Then
            bek = bek + 1
        End If

    Next i
    sql = Replace(sql, vbNewLine & vbNewLine, vbNewLine)
    SQLSz�p�t� = sql
End Function