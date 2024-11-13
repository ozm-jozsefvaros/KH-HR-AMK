Option Compare Database

Public Function TextToMD5Hex(szöveg As String) As String
'Forrás: https://stackoverflow.com/q/33704692
'Licence: https://creativecommons.org/licenses/by-sa/3.0/
'Nov 14, 2015 at 3:05 - user3791372
'Átírva: 2024
    Dim enc
    Dim bytes
    Dim bájtok() As Byte
    Dim outstr As String
    Dim pos As Integer
    Set enc = CreateObject("System.Security.Cryptography.MD5CryptoServiceProvider")
    'Átalakítjuk a szöveget bájtok láncolatává
    bájtok = szöveg
    bytes = bájtok
    'Ha
    If UBound(bytes) = 0 Or IsNull(bytes) Then
        FileToMD5Hex = vbNullString
        Exit Function
    End If
    bytes = enc.ComputeHash_2((bytes))
    'Convert the byte array to a hex string
    For pos = 1 To LenB(bytes)
        outstr = outstr & LCase(Right("0" & Hex(AscB(MidB(bytes, pos, 1))), 2))
    Next
    TextToMD5Hex = outstr
    Set enc = Nothing
    
End Function