'E gy�tem�nyben, ha az MIT licencia eml�ttettik, (megjel�lve a szerz�t �s a m� sz�let�s�nek �v�t) azon az al�bbi felhaszn�l�si enged�lyt kell �rteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database
Sub sFoly(�rlap As Form, �zenet As String, Optional id�tis As Boolean = True)
'#MIT Ol�h Zolt�n (2023)

    Dim a As Boolean
    a = Foly(�rlap, �zenet, id�tis)
    'MsgBox "sFoly Sub!"
End Sub
Function Foly(�rlap As Form, �zenet As String, Optional id�tis As Boolean = True) As Boolean
'#MIT Ol�h Zolt�n (2023)
    If id�tis Then
        If StrCount(�zenet, ";") = 1 And �rlap.Folyamat.ListCount = 0 Then
            �zenet = �zenet & "; Id�pont"
        Else
            If StrCount(�zenet, ";") = 1 Then
                �zenet = �zenet & "; " & Now()
            End If
        End If
    End If
    �rlap.Folyamat.AddItem Item:=�zenet
    �rlap.Repaint
    �rlap.Folyamat.Selected(�rlap.Folyamat.ListCount - 1) = True
    �rlap.Folyamat.Requery
End Function