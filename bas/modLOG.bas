'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Sub sFoly(Ûrlap As Form, Üzenet As String, Optional idõtis As Boolean = True)
'#MIT Oláh Zoltán (2023)

    Dim a As Boolean
    a = Foly(Ûrlap, Üzenet, idõtis)
    'MsgBox "sFoly Sub!"
End Sub
Function Foly(Ûrlap As Form, Üzenet As String, Optional idõtis As Boolean = True) As Boolean
'#MIT Oláh Zoltán (2023)
    If idõtis Then
        If StrCount(Üzenet, ";") = 1 And Ûrlap.Folyamat.ListCount = 0 Then
            Üzenet = Üzenet & "; Idõpont"
        Else
            If StrCount(Üzenet, ";") = 1 Then
                Üzenet = Üzenet & "; " & Now()
            End If
        End If
    End If
    Ûrlap.Folyamat.AddItem Item:=Üzenet
    Ûrlap.Repaint
    Ûrlap.Folyamat.Selected(Ûrlap.Folyamat.ListCount - 1) = True
    Ûrlap.Folyamat.Requery
End Function