SELECT Switch(Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])>=0 AND Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])<=20,"20 �v alatt:",
Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])>=21 AND Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])<=25,"21-25 �vek k�z�tt:",
Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])>=26 AND Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])<=30,"26-30 �vek k�z�tt:",
Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])>=31 AND Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])<=35,"31-35 �vek k�z�tt:",
Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])>=36 AND Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])<=40,"36-40 �vek k�z�tt:",
Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])>=41 AND Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])<=45,"41-45 �vek k�z�tt:",
Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])>=46 AND Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])<=50,"46-50 �vek k�z�tt:",
Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])>=51 AND Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])<=55,"51-55 �vek k�z�tt:",
Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])>=56 AND Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])<=60,"56-60 �vek k�z�tt:",
Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])>=61 AND Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])<=65,"61-65 �vek k�z�tt:",
Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])>=66 AND Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])<=70,"66-70 �vek k�z�tt:",
Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])>=71 AND Year(Now())-Year([lkSzem�lyek].[Sz�let�si id�])<=200,"70 �v f�l�tt:",
) AS Korcsoport, lkSzem�lyek.Ad�jel AS ad�, IIf(lkSzem�lyek.Neme="f�rfi",-1,0) AS F�rfi, IIf(lkSzem�lyek.Neme<>"f�rfi",1,0) AS N�
FROM lkSzem�lyek
WHERE tSzem�lyek.[St�tusz neve]="�ll�shely";
