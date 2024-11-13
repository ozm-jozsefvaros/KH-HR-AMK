Option Compare Database

'#Forrás: https://www.msaccessgurus.com/VBA/Code/Fx_GetDistance.htm
'*************** Code Start *****************************************************
' Purpose  : Get distance between 2 points of Latitude and Longitude
' Author   : crystal (strive4peace)
' Return   : Double
' License  : below code
' Code List: www.MsAccessGurus.com/code.htm
'-------------------------------------------------------------------------------
'                              GetDistance
'-------------------------------------------------------------------------------
'
Public Function GetDistance( _
   pLat1 As Double _
   , pLng1 As Double _
   , pLat2 As Double _
   , pLng2 As Double _
   , Optional pWhich As Integer = 2 _
   ) As Double 'Az alapértelmezés a kilométer


   On Error Resume Next
   Dim x As Double

   Dim EarthRadius As Double
   
   Select Case pWhich
   Case 2:
      EarthRadius = 6378.7 'kilometers
   Case 3:
      EarthRadius = 3437.74677 'nautical miles
   Case Else
      EarthRadius = 3963 'statute miles
   End Select
   
    x = (Sin(pLat1 / 57.2958) * Sin(pLat2 / 57.2958)) _
      + (Cos(pLat1 / 57.2958) * Cos(pLat2 / 57.2958) * Cos(pLng2 / 57.2958 - pLng1 / 57.2958))

   GetDistance = Abs(EarthRadius * Atn(Sqr(1 - x ^ 2) / x))
  
End Function
'
' LICENSE
'   You may freely use and share this code
'     provided this license notice and comment lines are not changed;
'     code may be modified provided you clearly note your changes.
'   You may not sell this code alone, or as part of a collection,
'     without my handwritten permission.
'   All ownership rights reserved. Use at your own risk.
'   ~ crystal (strive4peace)  www.MsAccessGurus.com
'*************** Code End *******************************************************