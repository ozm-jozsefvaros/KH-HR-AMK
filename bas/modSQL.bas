'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database

Function nSelect(strLekérdNeve As String) As Integer
'#MIT Oláh Zoltán (c) 2023
'Megszámolja, hogy egy lekérdezésben hány Select utasítás van.
'TODO: az idézõjelben lévõ Select karaktersorozatok kiszûrése: csak az ffsplit-tel kimetszett páratlan sorszámú részekben keresni
    nSelect = StrCount(CurrentDb.QueryDefs(strLekérdNeve).sql, "SELECT")
End Function
Function LekSQL(lekNév As String) As String
'#MIT Oláh Zoltán (c) 2023
    Dim dbLekSTR As DAO.Database
    
    Set dbLekSTR = CurrentDb
    LekSQL = dbLekSTR.QueryDefs(lekNév).sql
    
End Function
Function SQLSzépítõ(sql As String) As String
'#MIT Oláh Zoltán (c) 2023
    Dim kódszók As Variant
    Dim bek As Integer
    Dim strbek As String
    Dim zrjl As Integer ' zárójelszint
    Dim ijl As Integer ' idézõjel szint
    Dim i As Integer
    Dim ker As String
    strbek = "     "
    kódszók = "SELECT;FROM;WHERE;GROUP BY;ORDER BY;"

    For i = 1 To StrCount(kódszók, ";") + 1
        ker = ffsplit(kódszók, ";", i)

        sql = Replace(sql, ker, vbNewLine & szövegFûzõ(strbek, bek) & ker)
        If ker = "SELECT" Then
            bek = bek + 1
        End If

    Next i
    sql = Replace(sql, vbNewLine & vbNewLine, vbNewLine)
    SQLSzépítõ = sql
End Function