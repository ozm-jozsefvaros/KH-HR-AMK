'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Public adatbázis As Database
Public hierarchiaFájlSzáma As Integer
Sub lkInit()

    If adatbázis Is Nothing Then
        Set adatbázis = CurrentDb
    End If
    If hierarchiaFájlSzáma = 0 Then
        hierarchiaFájlSzáma = FreeFile
        Fájl = "L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Fájlok\hiereachia." & Format(Now(), "yyyy-mm-dd-hh-nn-ss") & ".txt"
        Open Fájl For Output As #hierarchiaFájlSzáma
    End If
        
End Sub
Sub lkClose()
    If Not adatbázis Is Nothing Then
        Set adatbázis = Nothing
    End If
    If hierarchiaFájlSzáma <> 0 Then
        Close #hierarchiaFájlSzáma
    End If
End Sub
Sub teljesLekérdezésHierarchia()
Dim gyökértáblák As Variant, _
    mindenlevél As Variant
Dim i As Integer

mindenlevél = levelek

lkInit
    gyökértáblák = gyökerek()
    For i = LBound(gyökértáblák) To UBound(gyökértáblák)
        Print #hierarchiaFájlSzáma, Num2Roman(i + 1) & ". " & gyökértáblák(i)
        lekérdezésGyemekKeresõ (gyökértáblák(i))
    Next i
lkClose
End Sub
Sub LekérdezésSzülõKeresõ(lekérdezésNév As String)
    LekérdezésHierarchiaKeresõ lekérdezésNév:=lekérdezésNév, _
                               gyökérfelé:=True, _
                               bek:=vbTab
End Sub
Sub lekérdezésGyemekKeresõ(lekérdezésNév As String)
    LekérdezésHierarchiaKeresõ lekérdezésNév:=lekérdezésNév, _
                                gyökérfelé:=False, _
                                bek:=vbTab
End Sub
 Sub LekérdezésHierarchiaKeresõ(lekérdezésNév As String, Optional bek As String = "", Optional mélység As Integer = 1, Optional ByVal gyökérfelé As Boolean = False)
Dim a As String, _
    név As String
Dim i As Integer, _
    j As Integer, _
    n As Integer
Dim qdfs As QueryDefs
Dim táblák() As Variant

    lkInit
    
    
    If mélység > 20 Then Exit Sub
    j = 1
    táblák = LekérdezésekTáblák(lekérdezésNév, gyökérfelé)
    For n = LBound(táblák) To UBound(táblák)
        név = táblák(n)
        If név <> "" Then
            Print #hierarchiaFájlSzáma, bek & j & "." & név
            LekérdezésHierarchiaKeresõ név, bek & vbTab, mélység + 1, gyökérfelé
        End If
        j = j + 1 '÷ j
        Debug.Print ".";
    Next n
    
'    If mélység = 1 Then
'        Close #hierarchiaFájlSzáma
'        hierarchiaFájlSzáma = 0
'    End If
End Sub


Function LekérdezésekTáblák(LekérdezésNeve As String, Optional ByVal gyökérfelé As Boolean = False) As Variant
    Dim adat As DAO.Recordset
    Dim lekérd As QueryDef
    Dim sqlString As String
    'Dim db As DAO.Database
    Dim Kimenet() As Variant
    Dim n As Integer
    
    ' inicializáljuk az adatbázis, ha kell
    If adatbázis Is Nothing Then
        Call lkInit
    End If
    
    If gyökérfelé Then
        sqlString = "SELECT DISTINCT MSysQueries.Name1 as Név " & _
                    "   FROM MSysQueries " & _
                    "       INNER JOIN MSysObjects ON MSysQueries.ObjectId = MSysObjects.Id " & _
                    "           WHERE MSysQueries.Name1 IS NOT NULL " & _
                    "               AND MSysQueries.Attribute = 5 " & _
                    "               AND MSysObjects.Name = [lekérdezésNév]"
    Else
        sqlString = "SELECT DISTINCT MSysObjects.Name as Név " & _
                    "   FROM MSysQueries INNER JOIN MSysObjects ON MSysQueries.ObjectId = MSysObjects.Id " & _
                    "       WHERE (((MSysObjects.Name) Is Not Null) AND ((MSysQueries.Attribute)=5) AND ((MSysQueries.Name1)=[lekérdezésNév]));"
    End If
    Set lekérd = adatbázis.CreateQueryDef("", sqlString)
    lekérd("lekérdezésNév") = LekérdezésNeve
    Set adat = lekérd.OpenRecordset(dbOpenSnapshot)
    
    If adat.RecordCount > 0 Then
        ReDim Kimenet(adat.RecordCount - 1)
    Else
        ReDim Kimenet(0)
    End If
    If Not adat.EOF Then
        n = 0
        Do While Not adat.EOF
            Kimenet(n) = Nz(adat!név, "")
            ÷ n
            adat.MoveNext
        Loop
    End If
    
    adat.Close
    Set adat = Nothing
    LekérdezésekTáblák = Kimenet
End Function
Function levelek() As Variant
fvbe ("levelek")
Dim db As Database
Dim qdKk As QueryDefs
Dim qdK As QueryDef, _
    qdB As QueryDef
Dim névK As String
Dim Kimenet() As Variant, _
    táblák() As Variant
Dim n As Long
Dim levél As Boolean

Set db = CurrentDb
Set qdKk = db.QueryDefs

For Each qdK In qdKk

    levél = True
    névK = qdK.Name
    If Left(névK, 1) <> "~" Then 'ideiglenes lekérdezésekre nem futtatjuk, mert azokhoz nincs hozzáférésünk.
        táblák = LekérdezésekTáblák(qdK.Name)
        If UBound(táblák) - LBound(táblák) = 0 Then 'Ha nincs gyermeke, akkor levél
            ReDim Preserve Kimenet(n) 'megnöveljük a tömböt
            Kimenet(n) = névK 'és beleírjuk a talált nevet
            ÷ n
        End If
    End If
    ¤ ".", Null
Next qdK
levelek = Kimenet
logba , Str(n - 1), 4
End Function
Function nSelect(strLekérdNeve As String) As Integer
'#MIT Oláh Zoltán (c) 2023
'Megszámolja, hogy egy lekérdezésben hány Select utasítás van.
'TODO: az idézõjelben lévõ Select karaktersorozatok kiszûrése: csak az ffsplit-tel kimetszett páratlan sorszámú részekben keresni
    nSelect = StrCount(CurrentDb.QueryDefs(strLekérdNeve).sql, "SELECT")
End Function
Function LekSQL(leknév As String) As String
'#MIT Oláh Zoltán (c) 2023
    Dim dbLekSTR As DAO.Database
    
    Set dbLekSTR = CurrentDb
    LekSQL = dbLekSTR.QueryDefs(leknév).sql
    Set dbLekSTR = Nothing
    
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
Function gyökerek() As Variant
Dim db As Database
Dim qdKk As QueryDefs
Dim qdK As QueryDef, qdB As QueryDef
Dim névK As String
Dim qdKSQL As String
Dim névB As String
Dim Kimenet() As Variant
Dim n As Long
Dim bRoot As Boolean

Set db = CurrentDb
Set qdKk = db.QueryDefs
For Each qdK In qdKk
    névK = qdK.Name
    If Not Left(névK, 4) = "~sq_" Then
        qdKSQL = qdK.sql
        bRoot = True
        For Each qdB In qdKk
            névB = qdB.Name
            If InStr(1, qdKSQL, névB) Then 'Ha a vizsgált lekérdezés neve szerepel a külsõ SQL-jében,
                bRoot = False 'akkor a külsõ már biztosan nem gyökér
                Exit For ' és akkor már tovább keresgélni sem érdemes
            End If
        Next qdB
        If bRoot Then 'Ha egyik lekérdezésnek a neve sem szerepel a külsõ lekérdezésben,
            
            ReDim Preserve Kimenet(n)
            Kimenet(n) = névK 'akkor a külsõ lekérdezés egy gyökér.
            ÷ n ' = n + 1
            logba , névK, 3
        End If
    End If
Next qdK
logba , Str(n), 4
gyökerek = Kimenet
End Function

Function fvCaseSelect(ByVal vizsgálandó, _
                        ByVal elsõEset, _
                        ByVal elsõEredmény, _
                        Optional ByVal másodEset = "else", _
                        Optional ByVal másodEredmény = "", _
                        Optional ByVal harmadEset = "else", _
                        Optional ByVal harmadEredmény = "", _
                        Optional ByVal negyedEset = "else", _
                        Optional ByVal negyedEredmény = "")
Dim Kimenet

    If IsNull(másodEset) _
    Then másodEset = "else"
    
    If IsNull(harmadEset) _
    Then harmadEset = "else"
    
    If IsNull(vizsgálandó) _
        Or IsNull(elsõEset) _
        Or IsNull(elsõEredmény) _
        Or IsNull(másodEredmény) _
        Or IsNull(harmadEredmény) _
    Then
        Exit Function
    End If
    
    If másodEset = "else" Then
        Select Case vizsgálandó
            Case elsõEset
                Kimenet = elsõEredmény
            Case Else
                Kimenet = másodEredmény
        End Select
    ElseIf harmadEset = "else" Then
        Select Case vizsgálandó
            Case elsõEset
                Kimenet = elsõEredmény
            Case másodEset
                Kimenet = másodEredmény
            Case Else
                Kimenet = harmadEredmény
        End Select
    Else
        Select Case vizsgálandó
            Case elsõEset
                Kimenet = elsõEredmény
            Case másodEset
                Kimenet = másodEredmény
            Case harmadEset
                Kimenet = harmadEredmény
            Case Else
                Kimenet = negyedEredmény
        End Select
    End If
    fvCaseSelect = Kimenet
End Function
Function sTrim(szöveg As String, Optional elválasztó As String = ",")
Dim elvhossz As Integer

elvhossz = Len(elválasztó)
    If Right(szöveg, elvhossz) = elválasztó Then
        szöveg = Left(szöveg, Len(szöveg) - elvhossz)
        szöveg = sTrim(szöveg, elválasztó)
    End If
    sTrim = szöveg
End Function
Function sBuborék(strHash As String, db As Database) As String
    Dim lek As QueryDef
    Dim rekordok As Recordset
    Dim sor As Record
    Dim sorszám As Long
    Dim Kimenet As String
    
    Set lek = db.CreateQueryDef("", "SELECT lkÜzenetekVisszajelzések01.Hash, lkÜzenetekVisszajelzések01.SenderEmailAddress, lkÜzenetekVisszajelzések01.DeliveredDate, tVisszajelzésTípusok.VisszajelzésKód, tVisszajelzésTípusok.VisszajelzésSzövege, lkÜzenetekVisszajelzések01.Hatály FROM lkÜzenetekVisszajelzések01 WHERE (((lkÜzenetekVisszajelzések01.HASH) = [AzonosítóHASH])) ORDER BY lkÜzenetekVisszajelzések01.Hash, lkÜzenetekVisszajelzések01.DeliveredDate;")
    lek("AzonosítóHASH") = strHash
    Set rekordok = lek.OpenRecordset(dbOpenSnapshot)
    
        Kimenet = "<table class=""buborektabla"">" & vbNewLine & _
                  "     <thead>" & vbNewLine & _
                  "         <tr class=""buborekfejsor""><th class=""buborekcella"">Visszajelzés idõpontja</th><th class=""buborekcella"">Visszajelzõ</th><th class=""buborekcella"">Állapot</th><th class=""buborekcella"">Hatálya</th></tr>" & vbNewLine & _
                  "     </thead>" & vbNewLine & _
                  "     <tbody>" & vbNewLine
        
        If rekordok.RecordCount Then
            rekordok.MoveFirst
        Else
            Kimenet = Kimenet & "         <tr class=""buboreksor""><td class=""buborekcella"" colspan=""4"">Még nincs történet...</td></tr>"
        End If
        Do While Not rekordok.EOF
            Kimenet = Kimenet & "         <tr class=""buboreksor"">" & vbNewLine
                Kimenet = Kimenet & "           <td class=""buborekcella"">" & rekordok("delivereddate") & "</td><td class=""buborekcella"">" & rekordok("SenderEmailAddress") & "</td><td class=""buborekcella"">" & rekordok("VisszajelzésSzövege") & "</td><td class=""buborekcella"">" & rekordok("hatály") & "</td>" & vbNewLine
            Kimenet = Kimenet & "         </tr>" & vbNewLine
            rekordok.MoveNext
        Loop
        
        Kimenet = Kimenet & "     </tbody>" & vbNewLine & "</table>"
    sBuborék = Kimenet
End Function
Sub tegnapiLek()
Dim a As Date
    For i = 0 To CurrentDb.QueryDefs.count - 9
        a = CurrentDb.QueryDefs(i).DateCreated
        If a > Date - 2 Then
            Debug.Print a, CurrentDb.QueryDefs(i).Name
        End If
    Next
    ¤ "---"
End Sub

Sub lekérdezésekbenCserélõ(keresendõSzöveg As String, Optional ByVal csereSzöveg As String = "-")
Dim a As String
Dim i As Integer, _
    j As Integer

    For i = 0 To CurrentDb.QueryDefs.count - 1
        a = CurrentDb.QueryDefs(i).sql
        If InStr(1, a, keresendõSzöveg) > 0 Then
            ÷ j
            If csereSzöveg <> "-" Then
                'CurrentDb.QueryDefs(i).sql = Replace(a, keresendõSzöveg, csereSzöveg)
            End If
            Debug.Print j & ";" & CurrentDb.QueryDefs(i).Name '& vbNewLine
        Else
            'Debug.Print ".";
        End If
    Next
End Sub
