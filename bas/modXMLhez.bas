'E gyûteményben, ha az MIT licencia említtettik, (megjelölve a szerzõt és a mû születésének évét) azon az alábbi felhasználási engedélyt kell érteni:

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
'and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
'WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Option Compare Database

Function XMLátalakító(strXMLneve As String, újPath As String) As Boolean
    Dim strXML As String
    Dim strRégiFájl As String
    Dim strÚjFájl As String
    Dim intKezdPoz As Integer
    Dim intVégPoz As Integer
'on error goto hiba


'#           Az egész tag-et (záradékot?) cseréljük az XML-ben
        strÚjFájl = " Path=""" & újPath & """"
'           Debug.Print "1. Új fájl:" & strÚjFájl & "##" '1
        strXML = xmltisztító(XMLszöveg(strXMLneve, False)) 'itt megszerezzük és megtisztítjuk

        intKezdPoz = InStr(1, strXML, "Path=") 'majd megnézzük, hol kezdõdik az útvonal
        intVégPoz = InStr(intKezdPoz + 7, strXML, """") ' és hogy hol a vége
'          Debug.Print "2. Régi XML:##" & Mid(strXML, intKezdPoz, intVégPoz) & "##" '2
        strRégiFájl = Mid(strXML, intKezdPoz, intVégPoz - intKezdPoz + 1) 'a két pont közötti részt kiemeljük
'           Debug.Print "3. Régi fájl:" & strRégiFájl
        strXML = Replace(strXML, strRégiFájl, strÚjFájl) 'no itt meg kicseréljük a régi fájlnevet, az újra
'           Debug.Print "4. Új XML:##" & Mid(strXML, intKezdPoz - 10, Len(strÚjFájl) + 16) & "##"
        CurrentProject.ImportExportSpecifications.item(strXMLneve).XML = strXML 'és végül visszatöltjük a rendszerbe
XMLátalakító = True
Exit Function
Hiba:

End Function

Public Function xmltisztító(ByVal szöveg As String) As String
    Dim vMirõlMire(2, 1) As Variant
    Dim n As Integer
    
    vMirõlMire(0, 0) = " =": vMirõlMire(0, 1) = "="
    vMirõlMire(1, 0) = "= ": vMirõlMire(1, 1) = "="
    For i = LBound(vMirõlMire, 1) To UBound(vMirõlMire, 1)
        n = 0
        If vMirõlMire(i, 0) <> "" Then
            Do While InStr(1, szöveg, vMirõlMire(i, 0))
                szöveg = Replace(szöveg, vMirõlMire(i, 0), vMirõlMire(i, 1))
                n = n + 1
                If n > 100 Then Exit Do
            Loop
        End If
    Next i
    Do While InStr(1, szöveg, "  path") > 0
        szöveg = Replace(szöveg, "  Path", " Path")
    Loop
    
    xmltisztító = szöveg
End Function
Function XMLszöveg(strXMLneve As String, Optional elejét As Boolean = True, Optional mennyit As Long = 2000) As String
On Error GoTo Hiba:
    If elejét Then
        XMLszöveg = Left(CurrentProject.ImportExportSpecifications.item(strXMLneve).XML, mennyit)
    Else
        XMLszöveg = CurrentProject.ImportExportSpecifications.item(strXMLneve).XML
    End If
Exit Function
Hiba:
    If Err.Number = 31602 Then
        XMLszöveg = vbNullString
        Exit Function
    End If
    Resume Next
End Function
