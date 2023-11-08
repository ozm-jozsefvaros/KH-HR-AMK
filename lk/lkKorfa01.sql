SELECT Switch(Year(Now())-Year([lkSzemélyek].[Születési idő])>=0 AND Year(Now())-Year([lkSzemélyek].[Születési idő])<=20,"20 év alatt:",
Year(Now())-Year([lkSzemélyek].[Születési idő])>=21 AND Year(Now())-Year([lkSzemélyek].[Születési idő])<=25,"21-25 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idő])>=26 AND Year(Now())-Year([lkSzemélyek].[Születési idő])<=30,"26-30 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idő])>=31 AND Year(Now())-Year([lkSzemélyek].[Születési idő])<=35,"31-35 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idő])>=36 AND Year(Now())-Year([lkSzemélyek].[Születési idő])<=40,"36-40 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idő])>=41 AND Year(Now())-Year([lkSzemélyek].[Születési idő])<=45,"41-45 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idő])>=46 AND Year(Now())-Year([lkSzemélyek].[Születési idő])<=50,"46-50 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idő])>=51 AND Year(Now())-Year([lkSzemélyek].[Születési idő])<=55,"51-55 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idő])>=56 AND Year(Now())-Year([lkSzemélyek].[Születési idő])<=60,"56-60 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idő])>=61 AND Year(Now())-Year([lkSzemélyek].[Születési idő])<=65,"61-65 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idő])>=66 AND Year(Now())-Year([lkSzemélyek].[Születési idő])<=70,"66-70 évek között:",
Year(Now())-Year([lkSzemélyek].[Születési idő])>=71 AND Year(Now())-Year([lkSzemélyek].[Születési idő])<=200,"70 év fölött:",
) AS Korcsoport, lkSzemélyek.Adójel AS adó,switch(lkSzemélyek.Neme="férfi",-1,1) as to, lkSzemélyek.Neme
FROM lkSzemélyek
WHERE tSzemélyek.[Státusz neve]="Álláshely";
