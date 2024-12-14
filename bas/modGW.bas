Option Compare Database
Private Const címzett = 0 'egwTo
Private Const másolat = 1 'egwCC
Private Const titkos = 2 'egwBC


Function Groupwise_Mail(ByRef myRecipients() As String, ByRef myAttachments() As String, ByVal mySubject As String, ByVal myBodytext As String)
'Forrás: https://www.access-programmers.co.uk/forums/threads/create-groupwise-email-with-access.64031/post-413157
'Szerzõ: reclusivemonkey;  Registered User. · From West Yorkshire, U.K.
'Publikálta: 2005. aug. 19.
'###
fvbe ("Groupwise_Mail")
    ' Declare the objects
    Dim objGroupWise As Object
    Dim objAccount As Object
    Dim objMessages As Object
    Dim objMessage As Object
    Dim objMailBox As Object
    Dim objRecipients As Object
    Dim objRecipient As Object
    Dim Recipient As Variant
    Dim objAttachment As Object
    Dim objAttachments As Object
    Dim Attachment As Variant
    Dim objMessageSent As Variant

    On Error GoTo Errorhandling

    ' Now build the GroupWise message object
    Set objGroupWise = CreateObject("NovellGroupWareSession")
    Set objAccount = objGroupWise.Login
    Set objMailBox = objAccount.MailBox
    Set objMessages = objMailBox.messages
    Set objMessage = objMessages.Add("GW.MESSAGE.MAIL", "Draft")

    ' Add each of the Recipients
    Set objRecipients = objMessage.Recipients
    For Each Recipient In myRecipients
        If Recipient <> vbNullString Then _
            Set objRecipient = objRecipients.Add(Recipient, , 1) 'Ha üres lenne a feladónév
    Next Recipient

    ' Add each of the attachments
    Set objAttachments = objMessage.Attachments
    For Each Attachment In myAttachments
        If Attachment <> vbNullString Then _
            Set objAttachment = objAttachments.Add(Attachment) 'Ha üres lenne a csatolmány (például hibás indexelés miatt: 0-tól indul!), nem akad meg...
    Next Attachment

    ' Add the Subject/Body Text
    With objMessage
        .Subject = mySubject
        .BodyText = myBodytext
    End With

    ' Send it
    Set objMessageSent = objMessage.Send

ExitHere:
    Set objGroupWise = Nothing
    Set objAccount = Nothing
    Set objMailBox = Nothing
    Set objMessages = Nothing
    Set objMessage = Nothing
    Set objRecipients = Nothing
    Set objAttachments = Nothing
    Set objRecipient = Nothing
    Set objAttachment = Nothing
fvki
    Exit Function

Errorhandling:
    MsgBox Err.Description & " " & Err.Number
    Resume ExitHere

End Function
Sub TestEmailFunc()
    ReDim TestEmails(0) As String

    TestEmails(0) = "olah.zoltan3@bfkh.gov.hu"

    ReDim TestAttachments(0) As String

    TestAttachments(0) = "L:\Ugyintezok\Adatszolgáltatók\HRELL\Ellenõrzés.html"

    Dim TestSubject As String
    TestSubject = "Test Email Function"

    Dim TestBody As String
    TestBody = "Hey, its all working now Me!"

    Call Groupwise_Mail(TestEmails(), TestAttachments(), TestSubject, TestBody)

End Sub
Function GroupwiseRead() As Integer

fvbe ("GroupwiseRead")
    'GW Objektumok:
    Dim objGroupWise As Object, _
        objAccount As Object, _
        objMailBox As Object, _
        objMailBoxCél As Object, _
        objMessages As Object, _
        objMessage As Object
    Dim db As DAO.Database
    Dim üzenetaz As Long
    Dim strÜzenet As String, _
        strSor As String, _
        mappaNév As String, _
        célmappaNév As String
    Dim Dátum As Date
    Dim üzenetTábla As DAO.Recordset, _
        visszajelzésTábla As DAO.Recordset
    
    'Elõrehaladás-jelzõhöz
    Dim sor             As Integer, _
        oszlop          As Integer, _
        elõzõszakasz    As Integer, _
        SzakaszSzám     As Integer
    Dim ehj             As New ehjoszt
    
    'Számláló
    Dim n As Integer
    Dim i As Long, _
        j As Long

    'On Error GoTo Hiba
    mappaNév = "Visszajelzés"
    célmappaNév = "Beolvasott visszajelzés"
    'A Groupwise megnyitása
                                                logba , "Bejelentkezés a GroupWise-ba", 2
    Set objGroupWise = CreateObject("NovellGroupWareSession")
    Set objAccount = objGroupWise.Login
                                                logba , "A mappa keresése megkezdve...", 2
'    For Each elem In objAccount.AllFolders
'        If elem.Name = mappaNév Then
'            Set objMailBox = elem
'                                                logba , "A keresett mappát megtaláltuk!", 2
'            Exit For
'        End If
'    Next
    Set objMailBox = GWMappa(mappaNév, objAccount)
    Set objMailBoxCél = GWMappa(célmappaNév, objAccount)
    
    If objMailBox Is Nothing Then
                                                logba , "Nem találtuk " & névelõvel(mappaNév) & " mappát!", 0
       GoTo ExitHere
       Exit Function
    End If
    'Set objMailBox = objAccount.MailBox
    Set objMessages = objMailBox.messages
ehj.Ini 100
SzakaszSzám = 8
ehj.oszlopszam = objMessages.count
    Set üzenetTábla = CurrentDb.OpenRecordset("tBejövõÜzenetek", dbOpenDynaset)
    Set visszajelzésTábla = CurrentDb.OpenRecordset("tBejövõVisszajelzések", dbOpenDynaset)
i = 1
    Do Until i > objMessages.count
        üzenetaz = 0
        Set objMessage = objMessages.item(i)
        With objMessage
            If InStr(1, .Subject.PlainText, "###Adatszolg visszajelzes###") > 0 Then
                üzenetaz = BejövõÜzenetekTáblába(.CommonMessageId, .Sender.EmailAddress, .DeliveredDate, üzenetTábla)
                If üzenetaz Then
                    strÜzenet = ffsplit(.BodyText.PlainText, "#$", 2) 'A két #$ közötti részt keressük a szövegtörzsben.
                    For j = 1 To StrCount(strÜzenet, vbNewLine) + 1
                        strSor = ffsplit(strÜzenet, vbNewLine, j) 'Vesszük a következõ sort
                        If strSor <> "" Then
                            If StrCount(strSor, ":") > 1 Then
                                    Dátum = ffsplit(strSor, ":", 3)
                            End If
                            BejövõVisszajelzésekTáblába _
                                üzenetaz:=üzenetaz, _
                                HASH:=ffsplit(strSor, ":", 1), _
                                VisszajelzésKód:=ffsplit(strSor, ":", 2), _
                                Hatály:=dtÁtal(Dátum), _
                                visszajelzésTábla:=visszajelzésTábla ' Ha a sor nem üres, beírjuk a visszajelzések táblába
                               
                            ÷ n 'Megszámoljuk a beírt sorokat
                            Dátum = 0
                        End If
                    Next j
                End If
                'Aztán a naplóba is beírjuk...
                logba , .CommonMessageId & vbNewLine & _
                        .BodyText.PlainText & vbNewLine & _
                        .Sender.EmailAddress & vbNewLine & _
                        .DeliveredDate, 4
                'Áthelyezzük a Beolvasott visszajelzések mappába
                objMessages.Move i, objMailBoxCél.messages
            Else
                ÷ i
            End If
        End With
        ehj.Novel
        If Int(ehj.Value / ehj.oszlopszam * SzakaszSzám) > elõzõszakasz Then
            logba , accTábla & ":;" & Int(ehj.Value / ehj.oszlopszam * 100) & "% elkészült...", 1
            elõzõszakasz = Int(ehj.Value / ehj.oszlopszam * SzakaszSzám)
        End If
    Loop 'i
ehj.Torol
ExitHere:

    Set objGroupWise = Nothing
    Set objAccount = Nothing
    Set objMailBox = Nothing
    Set objMessages = Nothing
    Set objMessage = Nothing
'return:
    GroupwiseRead = n
fvki
    Exit Function

Hiba:
    MsgBox Hiba(Err)
    Resume ExitHere

End Function
Private Function GWMappa(ByVal mappaNév As String, ByRef GWAccount As Object) As Object
Dim elem As Object
        For Each elem In GWAccount.AllFolders
        If elem.Name = mappaNév Then
            Set GWMappa = elem
                                                logba , "A keresett mappát (" & mappaNév & ") megtaláltuk!", 2
            Exit For
        End If
    Next
End Function
Private Function BejövõÜzenetekTáblába(CommonMessageId As String, SenderEmailAddress As String, DeliveredDate As Date, üzenetTábla As DAO.Recordset) As Long
fvbe ("BejövõÜzenetekTáblába")
    'On Error GoTo ErrorHandler
    Dim vissza
    'Dim üzenetTábla As DAO.Recordset
    Dim recordExists As Boolean

    'Set üzenetTábla = CurrentDb.OpenRecordset("tBejövõÜzenetek", dbOpenDynaset)
    vissza = 0
        With üzenetTábla
            .AddNew
            ![CommonMessageId] = CommonMessageId
            ![SenderEmailAddress] = SenderEmailAddress
            ![DeliveredDate] = DeliveredDate
            On Error GoTo ErrorHandler
            .Update
            On Error GoTo 0
            .Bookmark = .LastModified
            vissza = ![azÜzenet]
        End With

ki:
    'üzenetTábla.Close
    'Set üzenetTábla = Nothing
    BejövõÜzenetekTáblába = vissza
    fvki
Exit Function

ErrorHandler:
    If Err.Number = 3022 Then
        üzenetTábla.CancelUpdate
    Else
        MsgBox Hiba(Err)
        Resume ki
    End If
    GoTo ki
End Function
Sub BejövõVisszajelzésekTáblába(üzenetaz As Long, HASH As String, VisszajelzésKód As Integer, Hatály As Date, ByRef visszajelzésTábla As DAO.Recordset)
    'Dim tabla As Recordset
    Dim azVisszajelzés As Integer
    'Set tabla = CurrentDb.OpenRecordset("tBejövõVisszajelzések", dbOpenDynaset)
    With visszajelzésTábla
        .AddNew
        ![azÜzenet] = üzenetaz
        ![HASH] = HASH
        ![VisszajelzésKód] = VisszajelzésKód
        ![Hatály] = Hatály
        azVisszajelzés = .AbsolutePosition
        Debug.Print (azVisszajelzés)
        .Update
        '.Close
    End With
    'Set tabla = Nothing
End Sub