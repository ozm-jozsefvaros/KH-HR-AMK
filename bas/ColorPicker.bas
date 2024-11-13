'Forrás:https://www.devhut.net/vba-choosecolor-api-x32-x64/
'All code samples, download samples, links, ... on this site are provided 'AS IS'.

'In no event will Devhut.net or CARDA Consultants Inc.
'be liable to the client/end-user or any third party for any damages,
'including any lost profits, lost savings or other incidental, consequential
'or special damages arising out of the operation of or inability to operate
'the software which CARDA Consultants Inc. has provided, even if CARDA
'Consultants Inc. has been advised of the possibility of such damages.
Option Compare Database

Private Type CHOOSECOLOR
    lStructSize               As Long
    hwndOwner                 As Long
    hInstance                 As Long
    rgbResult                 As Long
    lpCustColors              As Long
    flags                     As Long
    lCustData                 As Long
    lpfnHook                  As Long
    lpTemplateName            As String
End Type

Private Const CC_ANYCOLOR = &H100
'Private Const CC_ENABLEHOOK = &H10
'Private Const CC_ENABLETEMPLATE = &H20
'Private Const CC_ENABLETEMPLATEHANDLE = &H40
Private Const CC_FULLOPEN = &H2
Private Const CC_PREVENTFULLOPEN = &H4
Private Const CC_RGBINIT = &H1
Private Const CC_SHOWHELP = &H8
'Private Const CC_SOLIDCOLOR = &H80

Private Declare Function CHOOSECOLOR Lib "comdlg32.dll" Alias "ChooseColorA" (pChoosecolor As CHOOSECOLOR) As Long


Public Function DialogColor(Optional lDefaultColor As Variant) As Long
    Dim CC                    As CHOOSECOLOR
    Dim lRetVal               As Long
    Static CustomColors(16)   As Long

    'Some predefined color, there are 16 slots available for predefined colors
    'You don't have to defined any, if you don't want to!
    CustomColors(0) = RGB(255, 255, 255)    'White
    CustomColors(1) = RGB(0, 0, 0)          'Black
    CustomColors(2) = RGB(255, 0, 0)        'Red
    CustomColors(3) = RGB(0, 255, 0)        'Green
    CustomColors(4) = RGB(0, 0, 255)        'Blue

    With CC
        .lStructSize = LenB(CC)
        .hwndOwner = Application.hWndAccessApp
        .flags = CC_ANYCOLOR Or CC_FULLOPEN Or CC_PREVENTFULLOPEN Or CC_RGBINIT
        If IsNull(lDefaultColor) = False _
           And IsMissing(lDefaultColor) = False Then .rgbResult = lDefaultColor    'Set the initial color of the dialog
        .lpCustColors = VarPtr(CustomColors(0))
    End With
    lRetVal = CHOOSECOLOR(CC)
    If lRetVal = 0 Then
        'Cancelled by the user
        DialogColor = RGB(255, 255, 255)    ' White
    Else
        DialogColor = CC.rgbResult
    End If
End Function
