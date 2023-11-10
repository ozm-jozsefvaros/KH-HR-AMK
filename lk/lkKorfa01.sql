SELECT Switch(Year(Now())-Year([lkSzemélyek].[Születési idõ])>=0 AND Year(Now())-Year([lkSzemélyek].[Születési idõ])<=20,"20 év alatt:",
Year(Now())-Year([lkSzemélyek].[Születési idõ])>=21 AND Year(Now())-Year([lkSzemélyek].[Születési idõ])<=25,"21-25 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idõ])>=26 AND Year(Now())-Year([lkSzemélyek].[Születési idõ])<=30,"26-30 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idõ])>=31 AND Year(Now())-Year([lkSzemélyek].[Születési idõ])<=35,"31-35 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idõ])>=36 AND Year(Now())-Year([lkSzemélyek].[Születési idõ])<=40,"36-40 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idõ])>=41 AND Year(Now())-Year([lkSzemélyek].[Születési idõ])<=45,"41-45 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idõ])>=46 AND Year(Now())-Year([lkSzemélyek].[Születési idõ])<=50,"46-50 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idõ])>=51 AND Year(Now())-Year([lkSzemélyek].[Születési idõ])<=55,"51-55 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idõ])>=56 AND Year(Now())-Year([lkSzemélyek].[Születési idõ])<=60,"56-60 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idõ])>=61 AND Year(Now())-Year([lkSzemélyek].[Születési idõ])<=65,"61-65 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idõ])>=66 AND Year(Now())-Year([lkSzemélyek].[Születési idõ])<=70,"66-70 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idõ])>=71 AND Year(Now())-Year([lkSzemélyek].[Születési idõ])<=200,"70 év fölött:",
) AS Korcsoport, lkSzemélyek.Adójel AS adó, IIf(lkSzemélyek.Neme="férfi",-1,0) AS Férfi, IIf(lkSzemélyek.Neme<>"férfi",1,0) AS Nõ
FROM lkSzemélyek
WHERE tSzemélyek.[Státusz neve]="Álláshely";
