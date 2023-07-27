Option Compare Database

Private Sub Form_Open(Cancel As Integer)
    Me.Folyamat.RowSource = ""
End Sub

Private Sub OK_gomb_Click()
Dim a As Boolean
a = True
    'Beolvas
    Select Case Me.OK_gomb.Caption
        Case "&Beolvasás"
            a = ÁnyrTáblaImport(Me.File.Value, Me)
            If a Then
                Me.OK_gomb.Caption = "&Tovább..."
            Else
                Me.OK_gomb.Caption = "&Bezár"
            End If
        Case "&Tovább..."
            Me.OK_gomb.Caption = "&Bezár"
'            DoCmd.OpenQuery "Elõirányzat_összesítõ"
'            DoCmd.OpenQuery "Személyi_juttatások_összesítõ_2"
        Case Else
            Me.OK_gomb.Caption = "&Beolvasás"
            DoCmd.Close
    End Select
End Sub
Private Sub FájlVálasztó_Click()
   
  
   ' Requires reference to Microsoft Office 11.0 Object Library.
 
   Dim fDialog As Office.FileDialog
   Dim varFile As Variant
 
   ' Clear listbox contents.
   Me.File.Value = ""
 
   ' Set up the File Dialog.
   Set fDialog = Application.FileDialog(msoFileDialogFilePicker)
 
   With fDialog
 
      ' Allow user to make multiple selections in dialog box
      .AllowMultiSelect = False
             
      ' Set the title of the dialog box.
      .Title = "Please select one or more files"
 
      ' Clear out the current filters, and add our own.
      .Filters.Clear
      .Filters.Add "MsExcel tábla", "*.XLS*"
      '.Filters.Add "Access Projects", "*.XLSM"
      .Filters.Add "Minden fajta", "*.*"
 
      ' Show the dialog box. If the .Show method returns True, the
      ' user picked at least one file. If the .Show method returns
      ' False, the user clicked Cancel.
      If .Show = True Then
 
         'Loop through each file selected and add it to our list box.
         For Each varFile In .SelectedItems
            Me.File.Value = varFile
         Next
 
      Else
         MsgBox "You clicked Cancel in the file dialog box."
      End If
   End With
End Sub