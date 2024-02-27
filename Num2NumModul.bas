

Option Compare Database

' Author: &#169;Copyright 2001 Pacific Database Pty Limited
' Graham R Seach gseach@pacificdb.com.au
' Phone: +61 2 9872 9594 Fax: +61 2 9872 9593
'
' You may freely use and distribute this code
' with any applications you may develop, on the
' condition that the copyright notice remains
' unchanged, and intact as part of the code. You
' may not sell or publish this code in any form
' without the express written permission of the
' copyright holder.
'
' Description: This function converts numbers from
' one base to another, including decimal, binary
' hex, octal and Roman
'
' Inputs: varNum: The number to be converted.
' From_Type: is the enum value representing the
' base the supplied number is to be converted from.
' To_Type: is the enum value representing the
' base the supplied number is to be converted to.
'
' Outputs: None.
'
Public Enum nnType
    nnBinary = 2
    nnOctal = 8
    nnDecimal = 10
    nnHex = 16
    nnRoman = 99
End Enum

Public Function Num2Num(varNum As Variant, From_Type As nnType, To_Type As nnType) As Variant
    'This module converts 16-bit numbers between decimal, binary, hex & octal.
    'The "Check..." functions verify that the numbers supplied are what they say they are.
    'The "...2..." functions do the conversions.
    
    Dim strType As String
    If From_Type = To_Type Then Num2Num = "": Exit Function
    varNum = Trim(varNum) '?gy t?nik a sz?k?z?k, gondot okoznak...
    strType = CStr(From_Type) & CStr(To_Type)
    Select Case strType
        Case "299" 'Bin2Roman
            CheckBin (varNum)
            Num2Num = Num2Roman(Bin2Dec(CStr(varNum)))
        Case "899 'Oct2Roman"
            CheckOct (varNum)
            Num2Num = Num2Roman(Oct2Dec(CStr(varNum)))
        Case "1099" 'Dec2Roman
            CheckDec (varNum)
            Num2Num = Num2Roman(varNum)
        Case "1699" 'Hex2Roman
            CheckHex (varNum)
            Num2Num = Num2Roman(Hex2Dec(CStr(varNum)))
        Case "992" 'Roman2Bin
            CheckRoman (varNum)
            Num2Num = Dec2Bin(Roman2Dec(varNum))
        Case "998" 'Roman2Oct
            CheckRoman (varNum)
            Num2Num = Dec2Oct(Roman2Dec(varNum))
        Case "9910" 'Roman2Dec
            CheckRoman (varNum)
            Num2Num = Roman2Dec(varNum)
        Case "9916" 'Roman2Hex
            CheckRoman (varNum)
            Num2Num = Dec2Hex(Roman2Dec(varNum))
        Case "28" 'Bin2Oct
            CheckBin (varNum)
            Num2Num = Bin2Oct(CStr(varNum))
        Case "210" 'Bin2Dec
            CheckBin (varNum)
            Num2Num = Bin2Dec(CStr(varNum))
        Case "216" 'Bin2Hex
            CheckBin (varNum)
            Num2Num = Bin2Hex(CStr(varNum))
        Case "82" 'Oct2Bin
            CheckOct (varNum)
            Num2Num = Oct2Bin(CStr(varNum))
        Case "810" 'Oct2Dec
            CheckOct (varNum)
            Num2Num = Oct2Dec(CStr(varNum))
        Case "816" 'Oct2Hex
            CheckOct (varNum)
            Num2Num = Oct2Hex(CStr(varNum))
        Case "102" 'Dec2Bin
            CheckDec (varNum)
            Num2Num = Dec2Bin(CLng(varNum))
        Case "108" 'Dec2Oct
            CheckDec (varNum)
            Num2Num = Dec2Oct(CLng(varNum))
        Case "1016" 'Dec2Hex
            CheckDec (varNum)
            Num2Num = Dec2Hex(CLng(varNum))
        Case "162" 'Hex2Bin
            CheckHex (varNum)
            Num2Num = Hex2Bin(CStr(varNum))
        Case "168" 'Hex2Oct
            CheckHex (varNum)
            Num2Num = Hex2Oct(CStr(varNum))
        Case "1610" 'Hex2Dec
            CheckHex (varNum)
            Num2Num = Hex2Dec(CStr(varNum))
        Case Else
            Num2Num = ""
    End Select
End Function

Private Function Dec2Bin(lngDec As Long) As String
    Dim lngCtr As Integer
    
    Do
        If (lngDec And 2 ^ lngCtr) = 2 ^ lngCtr Then
            Dec2Bin = "1" & Dec2Bin
        Else
            Dec2Bin = "0" & Dec2Bin
        End If
        lngCtr = lngCtr + 1
    Loop Until CLng(2 ^ lngCtr) > lngDec
End Function

Private Function Dec2Hex(lngDec As Long) As String
    Dec2Hex = Hex(lngDec)
End Function

Private Function Dec2Oct(lngDec As Long) As String
    Dec2Oct = Oct(lngDec)
End Function

Private Function Hex2Dec(ByVal strHex As String) As Long
    ' Check to see if string already begins with &H.
    If Left(strHex, 2) <> "&H" Then strHex = "&H" & strHex

    ' Check to see if string contains Decimals and strip them out.
    If InStr(1, strHex, ".") Then strHex = Left(strHex, (InStr(1, strHex, ".") - 1))

    Hex2Dec = CLng(strHex)
End Function

Private Function Hex2Bin(ByVal strHex As String) As String
    Dim intCtr As Integer
    For intCtr = 1 To Len(strHex)
        Hex2Bin = Hex2Bin & CStr(Dec2Bin(Hex2Dec(Mid(strHex, intCtr, 1))))
    Next intCtr
End Function
Private Function Hex2Oct(ByVal strHex As String) As String
    Hex2Oct = Dec2Oct(CLng(Hex2Dec(strHex)))
End Function

Private Function Bin2Dec(ByVal strBin As String) As Long
    Dim intCtr As Integer, intPower As Integer
    Bin2Dec = 0
    intPower = 0
    For intCtr = Len(strBin) To 1 Step -1
        Bin2Dec = Bin2Dec + CLng(Mid(strBin, intCtr, 1) * (2 ^ intPower))
        intPower = intPower + 1
    Next intCtr
End Function

Private Function Bin2Hex(ByVal strBin As String) As String
    Bin2Hex = Dec2Hex(Bin2Dec(strBin))
End Function

Private Function Bin2Oct(ByVal strBin As String) As String
    Bin2Oct = Dec2Oct(Bin2Dec(strBin))
End Function

Private Function Oct2Dec(ByVal strOct As String) As Long
    ' Check to see if string already begins with &O
    If Left(strOct, 2) <> "&O" Then strOct = "&O" & strOct
    
    ' Check to see if string contains Decimals and strip them out
    If InStr(1, strOct, ".") Then strOct = Left(strOct, (InStr(1, strOct, ".") - 1))

    Oct2Dec = CLng(strOct)
End Function

Private Function Oct2Bin(ByVal strOct As String) As String
    Oct2Bin = Dec2Bin(Oct2Dec(strOct))
End Function

Private Function Oct2Hex(ByVal strOct As String) As String
    Oct2Hex = Dec2Hex(Oct2Dec(strOct))
End Function

Public Function Num2Roman(ByVal lngNum As Variant) As String
    Const Digits = "IVXLCDM"
    Dim ctr As Integer, intDigit As Integer, strTmp As String
    
    ctr = 1
    strTmp = ""
    Do While lngNum > 0
        intDigit = lngNum Mod 10
        lngNum = lngNum \ 10
        
        Select Case intDigit
            Case 1: strTmp = Mid(Digits, ctr, 1) & strTmp
            Case 2: strTmp = Mid(Digits, ctr, 1) & Mid(Digits, ctr, 1) & strTmp
            Case 3: strTmp = Mid(Digits, ctr, 1) & Mid(Digits, ctr, 1) & Mid(Digits, ctr, 1) & strTmp
            Case 4: strTmp = Mid(Digits, ctr, 2) & strTmp
            Case 5: strTmp = Mid(Digits, ctr + 1, 1) & strTmp
            Case 6: strTmp = Mid(Digits, ctr + 1, 1) & Mid(Digits, ctr, 1) & strTmp
            Case 7: strTmp = Mid(Digits, ctr + 1, 1) & Mid(Digits, ctr, 1) & Mid(Digits, ctr, 1) & strTmp
            Case 8: strTmp = Mid(Digits, ctr + 1, 1) & Mid(Digits, ctr, 1) & Mid(Digits, ctr, 1) & Mid(Digits, ctr, 1) & strTmp
            Case 9: strTmp = Mid(Digits, ctr, 1) & Mid(Digits, ctr + 2, 1) & strTmp
        End Select
        ctr = ctr + 2
    Loop
    
    Num2Roman = strTmp
End Function

Private Function Roman2Dec(strNum As Variant) As Double
    Const Digits = "IVXLCDM"
    
    Dim ctr As Integer, num As Double, intLen As Integer
    Dim strTmp As String, prevStr As String
    
    intLen = Len(strNum)
    
    For ctr = 1 To intLen
        strTmp = UCase(Mid(strNum, ctr, 1))
        
        Select Case strTmp
            Case "I" '1
                If ctr < intLen Then
                    If InStr(1, Digits, Mid(strNum, ctr + 1, 1)) > InStr(1, Digits, strTmp) Then
                        num = num - 1
                    Else
                        num = num + 1
                    End If
                Else
                    num = num + 1
                End If
            Case "V" '5
                If ctr < intLen Then
                    If InStr(1, Digits, Mid(strNum, ctr + 1, 1)) > InStr(1, Digits, strTmp) Then
                        num = num - 5
                    Else
                        num = num + 5
                    End If
                Else
                    num = num + 5
                End If
            Case "X" '10
                If ctr < intLen Then
                    If InStr(1, Digits, Mid(strNum, ctr + 1, 1)) > InStr(1, Digits, strTmp) Then
                        num = num - 10
                    Else
                        num = num + 10
                    End If
                Else
                    num = num + 10
                End If
            Case "L" '50
                If ctr < intLen Then
                    If InStr(1, Digits, Mid(strNum, ctr + 1, 1)) > InStr(1, Digits, strTmp) Then
                        num = num - 50
                    Else
                        num = num + 50
                    End If
                Else
                    num = num + 50
                End If
            Case "C" '100
                If ctr < intLen Then
                    If InStr(1, Digits, Mid(strNum, ctr + 1, 1)) > InStr(1, Digits, strTmp) Then
                        num = num - 100
                    Else
                        num = num + 100
                    End If
                Else
                    num = num + 100
                End If
            Case "D" '500
                If ctr < intLen Then
                    If InStr(1, Digits, Mid(strNum, ctr + 1, 1)) > InStr(1, Digits, strTmp) Then
                        num = num - 500
                    Else
                        num = num + 500
                    End If
                Else
                    num = num + 500
                End If
            Case "M" '1000
                If ctr < intLen Then
                    If InStr(1, Digits, Mid(strNum, ctr + 1, 1)) > InStr(1, Digits, strTmp) Then
                        num = num - 1000
                    Else
                        num = num + 1000
                    End If
                Else
                    num = num + 1000
                End If
        End Select
    Next ctr
    
    Roman2Dec = num
End Function

Private Sub CheckDec(varDec As Variant)
    'Check for numeric value
    If Not (IsNumeric(varDec)) Then Err.Raise 13
    
    'Check for maximum allowable value < 4294967295
    If varDec > 65535 Or varDec < 0 Then Err.Raise 6
End Sub

Private Sub CheckOct(varOct As Variant)
    Dim intCtr As Integer
    'Check for numeric value
    If Not (IsNumeric(varOct)) Then Err.Raise 13
    
    'Check for valid octal range
    For intCtr = 1 To Len(varOct)
        If Mid(varOct, intCtr, 1) > 7 Then Err.Raise 6
    Next intCtr
    
    'Check for maximum allowable value < 177777
    If varOct > 177777 Then Err.Raise 6
End Sub

Private Sub CheckBin(varBin As Variant)
    Dim intCtr As Integer
    'Check for numeric value
    If Not (IsNumeric(varBin)) Then Err.Raise 13

    'Check for valid binary range
    For intCtr = 1 To Len(varBin)
        If Mid(varBin, intCtr, 1) > 1 Then Err.Raise 6
    Next intCtr
    
    'Check for maximum allowable value < 1111111111111111
    If Len(varBin) > 16 Then Err.Raise 6
End Sub

Private Sub CheckHex(varHex As Variant)
    Dim intCtr As Integer, intAsc As Integer
    'Check for valid hex range
    
    For intCtr = 1 To Len(varHex)
        intAsc = Asc(UCase(Mid(varHex, intCtr, 1)))
        If (intAsc < 48 Or intAsc > 57) And (intAsc < 65 Or intAsc > 70) Then Err.Raise 13
    Next intCtr
    
    'Check for maximum allowable value
    If Len(varHex) > 6 Then Err.Raise 6
End Sub

Private Sub CheckRoman(varRoman As Variant)
    Dim intCtr As Integer, char As String
    
    For intCtr = 1 To Len(varRoman)
        char = UCase(Mid(varRoman, intCtr, 1))
        Select Case char
            Case "I", "V", "X", "L", "C", "D", "M"
            Case Else: Err.Raise 6
        End Select
    Next intCtr
End Sub