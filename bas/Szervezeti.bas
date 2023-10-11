'E gy�tem�nyben, ha az MIT licencia eml�ttettik, (megjel�lve a szerz�t �s a m� sz�let�s�nek �v�t) azon az al�bbi felhaszn�l�si enged�lyt kell �rteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database

Function test()
    Debug.Print "teszt"
End Function
Sub caller(fvN�v)
fvN�v = RIC(fvN�v)
Dim fv As String
    If fvVane(fvN�v) Then
        Eval (fvN�v & "()")
    End If
End Sub
Function fvVane(ByVal fvN�v As String) As Boolean
    ' Check if a procedure with the given name exists in the current module
    
    For Each modul In Application.VBE.ActiveVBProject.VBComponents
        On Error Resume Next
            fvVane = Not IsNull(modul.CodeModule.ProcBodyLine(fvN�v, vbext_pk_Proc))
        On Error GoTo 0
    Next modul

End Function
