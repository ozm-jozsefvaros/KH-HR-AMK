#/#/#/
20241001OrvosiAlkalmassági1
#/#/
SELECT [20241001OrvosiAlkalmassági].Fõosztály, [20241001OrvosiAlkalmassági].Osztály, [20241001OrvosiAlkalmassági].[TAJ szám], IIf([Orvosi vizsgálat idõpontja]<>dtÁtal([Dátum]) And Not IsNull([Dátum]),dtÁtal([Dátum]),[20241001OrvosiAlkalmassági].[Orvosi vizsgálat következõ idõpontja]) AS Következõ, IIf(IsNull([Következõ]),"2501",IIf(Right(0 & Year([Következõ]),2) & Right(0 & Month([Következõ]),2)<"2411","25" & Right(0 & Month([Következõ]),2),Right(0 & Year([Következõ]),2) & Right(0 & Month([Következõ]),2))) AS ÉvHó_
FROM [tOrvosiAlkalmasságiVizsgálatok202310-202408Összefûzött] RIGHT JOIN 20241001OrvosiAlkalmassági ON [tOrvosiAlkalmasságiVizsgálatok202310-202408Összefûzött].TAJ = [20241001OrvosiAlkalmassági].[TAJ szám]
WHERE ((([20241001OrvosiAlkalmassági].[TAJ szám]) Is Not Null));

#/#/#/
20241001OrvosiAlkalmassági2a
#/#/
SELECT [20241001OrvosiAlkalmassági1].Fõosztály, [20241001OrvosiAlkalmassági1].Osztály, [20241001OrvosiAlkalmassági1].[TAJ szám], [20241001OrvosiAlkalmassági1].évhó_ AS ÉvHó
FROM 20241001OrvosiAlkalmassági1
WHERE ((([20241001OrvosiAlkalmassági1].évhó_) Between "2411" And "2602"));

#/#/#/
20241001OrvosiAlkalmassági2b
#/#/
SELECT [20241001OrvosiAlkalmassági1].Fõosztály, [20241001OrvosiAlkalmassági1].Osztály, [20241001OrvosiAlkalmassági1].[TAJ szám], ([ÉVHÓ_]*1+100) & "" AS ÉvHó
FROM 20241001OrvosiAlkalmassági1;

#/#/#/
20241001OrvosiAlkalmassági3
#/#/
TRANSFORM Count([24_26].TAJ) AS [SumOfTAJ szám]
SELECT 1 AS Sor, [24_26].Szervezet
FROM (SELECT [Fõosztály] &" "& [Osztály] AS Szervezet, ([TAJ szám]) as Taj, ÉvHó
FROM 20241001OrvosiAlkalmassági2b

UNION SELECT [Fõosztály] &" "& [Osztály] AS Szervezet, ([TAJ szám]) as Taj, ÉvHó
FROM 20241001OrvosiAlkalmassági2a
)  AS 24_26
WHERE ((([24_26].ÉvHó) Between "2411" And "2602"))
GROUP BY 1, [24_26].Szervezet
PIVOT [24_26].ÉvHó;

#/#/#/
20241001OrvosiAlkalmassági3Mindösszesen
#/#/
SELECT Count([24_26].[TAJ szám]) AS [CountOfTAJ szám]
FROM (SELECT [Fõosztály] & [Osztály] AS Szervezet, [TAJ szám], ÉvHó
FROM 20241001OrvosiAlkalmassági2b
UNION SELECT [Fõosztály] & [Osztály] AS Szervezet, [TAJ szám], ÉvHó
FROM 20241001OrvosiAlkalmassági2a)  AS 24_26
WHERE ((([24_26].ÉvHó) Between "2411" And "2602"))
GROUP BY 2;

#/#/#/
20241001OrvosiAlkalmassági3ÖsszegOszlop
#/#/
TRANSFORM Count([24_26].[TAJ szám]) AS [CountOfTAJ szám]
SELECT [24_26].Szervezet
FROM (SELECT [Fõosztály] &" " & [Osztály] AS Szervezet, [TAJ szám], ÉvHó
FROM 20241001OrvosiAlkalmassági2b
UNION SELECT [Fõosztály] & " " & [Osztály] AS Szervezet, [TAJ szám], ÉvHó
FROM 20241001OrvosiAlkalmassági2a)  AS 24_26
WHERE ((([24_26].ÉvHó) Between "2411" And "2602"))
GROUP BY 1, [24_26].Szervezet
PIVOT "Összesen";

#/#/#/
20241001OrvosiAlkalmassági3Összegoszloppal
#/#/
SELECT [20241001OrvosiAlkalmassági3].Sor, [20241001OrvosiAlkalmassági3].Szervezet, [20241001OrvosiAlkalmassági3].[2411] AS 2411, [20241001OrvosiAlkalmassági3].[2412] AS 2412, [20241001OrvosiAlkalmassági3].[2501] AS 2501, [20241001OrvosiAlkalmassági3].[2502] AS 2502, [20241001OrvosiAlkalmassági3].[2503] AS 2503, [20241001OrvosiAlkalmassági3].[2504] AS 2504, [20241001OrvosiAlkalmassági3].[2505] AS 2505, [20241001OrvosiAlkalmassági3].[2506] AS 2506, [20241001OrvosiAlkalmassági3].[2507] AS 2507, [20241001OrvosiAlkalmassági3].[2508] AS 2508, [20241001OrvosiAlkalmassági3].[2509] AS 2509, [20241001OrvosiAlkalmassági3].[2510] AS 2510, [20241001OrvosiAlkalmassági3].[2511] AS 2511, [20241001OrvosiAlkalmassági3].[2512] AS 2512, [20241001OrvosiAlkalmassági3].[2601] AS 2601, [20241001OrvosiAlkalmassági3].[2602] AS 2602, [20241001OrvosiAlkalmassági3ÖsszegOszlop].Összesen AS Összesen
FROM 20241001OrvosiAlkalmassági3 INNER JOIN 20241001OrvosiAlkalmassági3ÖsszegOszlop ON [20241001OrvosiAlkalmassági3].Szervezet = [20241001OrvosiAlkalmassági3ÖsszegOszlop].Szervezet;

#/#/#/
20241001OrvosiAlkalmassági3összegsor
#/#/
TRANSFORM Count([24_26].[TAJ szám]) AS [CountOfTAJ szám]
SELECT 2 AS Sor, "Hivatal összesen:" AS Szervezet
FROM (SELECT [Fõosztály] & [Osztály] AS Szervezet, [TAJ szám], ÉvHó
FROM 20241001OrvosiAlkalmassági2b
UNION SELECT [Fõosztály] & [Osztály] AS Szervezet, [TAJ szám], ÉvHó
FROM 20241001OrvosiAlkalmassági2a)  AS 24_26
WHERE ((([24_26].ÉvHó) Between "2411" And "2602"))
GROUP BY 2, "Hivatal összesen:"
PIVOT [24_26].ÉvHó;

#/#/#/
20241001OrvosiAlkalmassági3összegsorMindösszesennel
#/#/
SELECT [20241001OrvosiAlkalmassági3összegsor].*, [20241001OrvosiAlkalmassági3Mindösszesen].[CountOfTAJ szám]
FROM 20241001OrvosiAlkalmassági3összegsor, 20241001OrvosiAlkalmassági3Mindösszesen;

#/#/#/
20241001OrvosiAlkalmassági4
#/#/
SELECT [20241001OrvosiAlkalmassági3Összegoszloppal].*
FROM  20241001OrvosiAlkalmassági3Összegoszloppal
UNION SELECT  [20241001OrvosiAlkalmassági3összegsorMindösszesennel].*
FROM 20241001OrvosiAlkalmassági3összegsorMindösszesennel;

#/#/#/
25_életévüket_betöltõk
#/#/
SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Születési idõ], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Kerekített 100 %-os illetmény (eltérítés nélküli)] AS Illetmény, lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS [Belépés dátuma]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Születési idõ]) Between #1/1/1999# And #12/31/1999#) AND ((lkSzemélyek.[Státusz neve])="álláshely"));

#/#/#/
aaaExcelbe
#/#/
SELECT lkSzemélyek.*
FROM lkSzemélyek;

#/#/#/
alkSzemélyek_csak_az_utolsó_elõfordulások
#/#/
SELECT lkSzemélyek.Adójel, Max(lkSzemélyek.[Jogviszony sorszáma]) AS [MaxOfJogviszony sorszáma], Max(lkSzemélyek.[Jogviszony kezdete (belépés dátuma)]) AS [MaxOfJogviszony kezdete (belépés dátuma)], First(lkSzemélyek.Azonosító) AS azSzemély
FROM lkSzemélyek
GROUP BY lkSzemélyek.Adójel
ORDER BY lkSzemélyek.Adójel, Max(lkSzemélyek.[Jogviszony sorszáma]) DESC , Max(lkSzemélyek.[Jogviszony kezdete (belépés dátuma)]) DESC;

#/#/#/
Álláshely_Jel
#/#/
SELECT lkÁlláshelyek.[Álláshely azonosító], lkÁlláshelyek.jel
FROM lkÁlláshelyek;

#/#/#/
Címek_összevetése
#/#/
SELECT tTelephelyek.Mezõ1 AS Fõosztály, tTelephelyek.[Szervezeti egység], lkSzemélyek.[Szint 5 szervezeti egység név], lkSzemélyek.[Dolgozó teljes neve], tTelephelyek.Cím, lkSzemélyek.[Munkavégzés helye - cím], Left([Cím],4) AS Kif1, Left([Munkavégzés helye - cím],4) AS Kif1
FROM lkSzemélyek LEFT JOIN tTelephelyek ON lkSzemélyek.[Szervezeti egység kódja] = tTelephelyek.SzervezetKód
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null))
ORDER BY tTelephelyek.[Szervezeti egység];

#/#/#/
Elköltöztetve az orvosi adatbázisba
#/#/
SELECT "Elköltöztetve az orvosi adatbázisba!!!" AS Figyelem;

#/#/#/
ideigllkMobilModulKieg
#/#/
SELECT ideiglMobilModulKieg.[Dolgozó teljes neve], ideiglMobilModulKieg.[Hivatali email], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, kt_azNexon_Adójel02.azNexon
FROM kt_azNexon_Adójel02 RIGHT JOIN (lkSzemélyek RIGHT JOIN ideiglMobilModulKieg ON lkSzemélyek.[Hivatali email] = ideiglMobilModulKieg.[Hivatali email] OR ideiglMobilModulKieg.[Dolgozó teljes neve]=lkSzemélyek.[Dolgozó teljes neve]) ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel;

#/#/#/
kt_azNexon_Adójel
#/#/
SELECT tNexonAzonosítók.Azonosító, tNexonAzonosítók.Név, tNexonAzonosítók.[Személy azonosító] AS azNexon, [tnexonazonosítók].[Adóazonosító jel]*1 AS Adójel, "<a href=""https://nexonport.kh.gov.hu/menu/hrmapp/szemelytorzs/szemelyikarton?szemelyAzonosito=" & [azNexon] & "&r=13"" target=""_blank"">" & [Dolgozó teljes neve] & "</a>" AS NLink, (SELECT COUNT(tnexonazonosítók.Azonosító) 
        FROM tNexonAzonosítók AS Tmp 
        Where (Tmp.Kezdete >= tNexonAzonosítók.Kezdete
        AND Tmp.[Személy azonosító] = tNexonAzonosítók.[Személy azonosító]) AND  Tmp.[Azonosító] > tNexonAzonosítók.[Azonosító]
)+1 AS Sorszám
FROM tNexonAzonosítók INNER JOIN lkSzemélyek ON tNexonAzonosítók.[Adóazonosító jel] = lkSzemélyek.[Adóazonosító jel]
ORDER BY tNexonAzonosítók.Név;

#/#/#/
kt_azNexon_Adójel_ - azonosak keresése
#/#/
SELECT First(kt_azNexon_Adójel.[azNexon]) AS [azNexon Mezõ], First(kt_azNexon_Adójel.[Adójel]) AS [Adójel Mezõ], Count(kt_azNexon_Adójel.[azNexon]) AS AzonosakSzáma
FROM kt_azNexon_Adójel
GROUP BY kt_azNexon_Adójel.[azNexon], kt_azNexon_Adójel.[Adójel]
HAVING (((Count([kt_azNexon_Adójel].[azNexon]))>1) AND ((Count([kt_azNexon_Adójel].[Adójel]))>1));

#/#/#/
kt_azNexon_Adójel02
#/#/
SELECT kt_azNexon_Adójel.Azonosító, kt_azNexon_Adójel.Név, kt_azNexon_Adójel.azNexon, kt_azNexon_Adójel.Adójel, kt_azNexon_Adójel.NLink, kt_azNexon_Adójel.Sorszám
FROM kt_azNexon_Adójel
WHERE (((kt_azNexon_Adójel.Sorszám)=1));

#/#/#/
Lekérdezés1
#/#/
SELECT DISTINCT [Álláshely azonosító]
FROM lkÜresÁlláshelyek001
UNION Select DISTINCT lkÜresÁlláshelyek002.[Álláshely azonosító]
FROM lkÜresÁlláshelyek002;

#/#/#/
Lekérdezés2
#/#/
SELECT lkSzervezetenkéntiLétszámadatok03.*
FROM lkSzervezetenkéntiLétszámadatok03;

#/#/#/
Lekérdezés3
#/#/
SELECT lk_Garantált_bérminimum_Illetmények.[Dolgozó teljes neve], lk_Garantált_bérminimum_Illetmények.[Álláshely azonosító], lkSzemélyek.[Besorolási  fokozat (KT)]
FROM lkSzemélyek INNER JOIN lk_Garantált_bérminimum_Illetmények ON lkSzemélyek.tSzemélyek.Adójel = lk_Garantált_bérminimum_Illetmények.Adójel
WHERE (((lk_Garantált_bérminimum_Illetmények.[Álláshely azonosító]) In (SELECT lk_Garantált_bérminimum_Illetmények.[Álláshely azonosító] FROM lk_Garantált_bérminimum_Illetmények LEFT JOIN lkSzemélyek ON lk_Garantált_bérminimum_Illetmények.[Álláshely azonosító] = lkSzemélyek.[Státusz kódja] GROUP BY lk_Garantált_bérminimum_Illetmények.[Álláshely azonosító] HAVING (((Count(lkSzemélyek.[Státusz kódja]))>1)))));

#/#/#/
Lekérdezés4
#/#/
SELECT tIntézkedésFajták.IntézkedésFajta, tRégiHibák.[Elsõ mezõ], ktRégiHibákIntézkedések.azIntézkedések, tRégiHibák.[Második mezõ]
FROM tRégiHibák INNER JOIN (tIntézkedésFajták INNER JOIN (tIntézkedések INNER JOIN ktRégiHibákIntézkedések ON tIntézkedések.azIntézkedések = ktRégiHibákIntézkedések.azIntézkedések) ON tIntézkedésFajták.azIntFajta = tIntézkedések.azIntFajta) ON tRégiHibák.[Elsõ mezõ] = ktRégiHibákIntézkedések.HASH;

#/#/#/
Lekérdezés5
#/#/
SELECT tBejövõVisszajelzések.Hash, Min(DateDiff("d",[tRégiHibák].[Elsõ Idõpont],[tBejövõÜzenetek].[DeliveredDate])) AS Kif1
FROM tRégiHibák LEFT JOIN (tBejövõÜzenetek RIGHT JOIN tBejövõVisszajelzések ON tBejövõÜzenetek.azÜzenet = tBejövõVisszajelzések.azÜzenet) ON tRégiHibák.[Elsõ mezõ] = tBejövõVisszajelzések.Hash
WHERE (((tBejövõVisszajelzések.azVisszajelzés) Is Not Null))
GROUP BY tBejövõVisszajelzések.Hash;

#/#/#/
Lekérdezés6
#/#/
SELECT tRégiHibák.lekérdezésNeve, Count(tRégiHibák.[Elsõ mezõ]) AS Hibák, Count(lkktRégiHibákIntézkedésekLegutolsóIntézkedés.azIntézkedések) AS CountOfazIntézkedések
FROM tRégiHibák LEFT JOIN lkktRégiHibákIntézkedésekLegutolsóIntézkedés ON tRégiHibák.[Elsõ mezõ] = lkktRégiHibákIntézkedésekLegutolsóIntézkedés.HASH
WHERE (((tRégiHibák.[Utolsó Idõpont])=(select max([utolsó idõpont]) from tRégiHibák )))
GROUP BY tRégiHibák.lekérdezésNeve
HAVING (((tRégiHibák.lekérdezésNeve)<>"lkLejártAlkalmasságiÉrvényesség"));

#/#/#/
Lekérdezés7
#/#/
SELECT tmpÁNYRekHavihoz.ÁNYR, lkSzemélyek.[Státusz kódja], lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Adóazonosító jel], Year([Születési idõ]) AS [Születési év], IIf([neme]="Férfi",1,2) AS Kif1, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.[Szerzõdés/kinevezés verzió_érvényesség kezdete], "SZ" AS F, "T" AS T, 40 AS Óra, 1 AS Arány, tBesorolásÁtalakítóEltérõBesoroláshoz.jel
FROM (lkSzemélyek LEFT JOIN tmpÁNYRekHavihoz ON lkSzemélyek.[Státusz kódja] = tmpÁNYRekHavihoz.ÁNYR) LEFT JOIN tBesorolásÁtalakítóEltérõBesoroláshoz ON lkSzemélyek.[Besorolási  fokozat (KT)] = tBesorolásÁtalakítóEltérõBesoroláshoz.[Besorolási  fokozat (KT)]
WHERE (((tmpÁNYRekHavihoz.ÁNYR) Is Null) AND ((lkSzemélyek.[Státusz neve])="álláshely"));

#/#/#/
Lekérdezés8
#/#/
SELECT tFõosztályokOsztályokSorszámmal.Fõosztály, lkOrvosiAlkalmasságiTeljesítésÖsszesítés01.Osztály, lkOrvosiAlkalmasságiTeljesítésÖsszesítés01.AlkalmasságiOsztály, lkOrvosiAlkalmasságiTeljesítésÖsszesítés01.[Alk# tipus], lkOrvosiAlkalmasságiTeljesítésÖsszesítés01.Egységár, IIf(IsNull([lkOrvosiAlkalmasságiTeljesítésÖsszesítés01].[Fõosztály]),0,1) AS Mennyiség, lkOrvosiAlkalmasságiTeljesítésÖsszesítés01.Egységár AS [Összes nettó]
FROM tFõosztályokOsztályokSorszámmal LEFT JOIN lkOrvosiAlkalmasságiTeljesítésÖsszesítés01 ON tFõosztályokOsztályokSorszámmal.Fõosztály = lkOrvosiAlkalmasságiTeljesítésÖsszesítés01.Fõosztály
WHERE (((tFõosztályokOsztályokSorszámmal.Fõosztály) Is Not Null) AND ((lkOrvosiAlkalmasságiTeljesítésÖsszesítés01.Osztály) Is Null));

#/#/#/
Lekérdezés9
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], EsetiÁNYRszámok.StátuszKód, lkSzemélyek.[Státusz neve]
FROM lkSzemélyek LEFT JOIN EsetiÁNYRszámok ON lkSzemélyek.[Státusz kódja] = EsetiÁNYRszámok.StátuszKód
WHERE (((EsetiÁNYRszámok.StátuszKód) Is Null) AND ((lkSzemélyek.[Státusz neve])="álláshely"));

#/#/#/
lk__BesorolásokHavi_vs_Ányr01
#/#/
SELECT lk__BesorolásokHaviból.BFKH, lkÁlláshelyek.[FõosztályÁlláshely], lkÁlláshelyek.[5 szint] AS Szervezet, lk__BesorolásokHaviból.[Álláshely azonosító], lkÁlláshelyek.[Álláshely besorolási kategóriája] AS ÁNYR, Nz([lkBesorolásVáltoztatások].[ÚjBesorolás],[tBesorolás_átalakító].[Besorolási_fokozat]) AS NexonHavi, lk__BesorolásokHaviból.[Besorolási fokozat kód:]
FROM lkBesorolásVáltoztatások RIGHT JOIN (lkÁlláshelyek RIGHT JOIN (tBesorolás_átalakító RIGHT JOIN lk__BesorolásokHaviból ON (tBesorolás_átalakító.[Az álláshely megynevezése] = lk__BesorolásokHaviból.[Besorolási fokozat megnevezése:]) AND (tBesorolás_átalakító.[Az álláshely jelölése] = lk__BesorolásokHaviból.[Besorolási fokozat kód:])) ON lkÁlláshelyek.[Álláshely azonosító] = lk__BesorolásokHaviból.[Álláshely azonosító]) ON lkBesorolásVáltoztatások.ÁlláshelyAzonosító = lk__BesorolásokHaviból.[Álláshely azonosító]
WHERE (((Nz([lkBesorolásVáltoztatások].[ÚjBesorolás],[tBesorolás_átalakító].[Besorolási_fokozat]))<>[Álláshely besorolási kategóriája]));

#/#/#/
lk__BesorolásokHavi_vs_Ányr02
#/#/
SELECT lk__BesorolásokHavi_vs_Ányr01.FõosztályÁlláshely AS Fõosztály, lk__BesorolásokHavi_vs_Ányr01.Szervezet AS Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lk__BesorolásokHavi_vs_Ányr01.[Álláshely azonosító] AS [Státusz kód], lk__BesorolásokHavi_vs_Ányr01.NexonHavi AS [Nexon havi], lk__BesorolásokHavi_vs_Ányr01.ÁNYR AS ÁNYR, lk__BesorolásokHavi_vs_Ányr01.[Besorolási fokozat kód:] AS [Besorolás kód], kt_azNexon_Adójel02.NLink AS NLink
FROM (lkSzemélyek RIGHT JOIN lk__BesorolásokHavi_vs_Ányr01 ON lkSzemélyek.[Státusz kódja] = lk__BesorolásokHavi_vs_Ányr01.[Álláshely azonosító]) LEFT JOIN kt_azNexon_Adójel02 ON lkSzemélyek.Adójel = kt_azNexon_Adójel02.Adójel
ORDER BY lk__BesorolásokHavi_vs_Ányr01.BFKH;

#/#/#/
lk__BesorolásokHaviból
#/#/
SELECT HavibólBesorolások.Zóna, HavibólBesorolások.[Álláshely azonosító], HavibólBesorolások.[Besorolási fokozat kód:], HavibólBesorolások.[Besorolási fokozat megnevezése:], Replace(Replace([Besorolási fokozat kód:],"Mt.",""),"ÜÁ.","") AS Jel, Nz([Adóazonosító],0)*1 AS Adójel, bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS BFKH
FROM (SELECT Járási_állomány.[Álláshely azonosító]
, Járási_állomány.[Besorolási fokozat megnevezése:]
, [Besorolási fokozat kód:]
, "Alaplétszám" as Zóna
, Adóazonosító
, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM  lkJárási_állomány
UNION
SELECT  Kormányhivatali_állomány.[Álláshely azonosító]
, Kormányhivatali_állomány.[Besorolási fokozat megnevezése:]
, [Besorolási fokozat kód:]
, "Alaplétszám" as Zóna
, Adóazonosító
, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM  lkKormányhivatali_állomány
UNION
SELECT Központosítottak.[Álláshely azonosító]
, Központosítottak.[Besorolási fokozat megnevezése:]
, [Besorolási fokozat kód:]
, "Központosított" as Zóna
, Adóazonosító
, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM lkKözpontosítottak
)  AS HavibólBesorolások;

#/#/#/
lk__Eltérõ_Szevezetnevek
#/#/
SELECT lkÁlláshelyek.FõosztályÁlláshely AS [Fõosztály (ÁNYR)], lkÁlláshelyek.[5 szint] AS [Osztály (ÁNYR)], lkSzemélyek.Fõosztály AS [Fõosztály (Nexon Személyi karton)], lkSzemélyek.osztály AS [Osztály (Nexon Személyi karton)], lkSzemélyek.[Dolgozó teljes neve] AS Név, lkÁlláshelyek.[Álláshely azonosító] AS [Státusz kód], kt_azNexon_Adójel02.NLink AS NLink
FROM (lkÁlláshelyek INNER JOIN (lkSzemélyek LEFT JOIN tSzervezet ON lkSzemélyek.[Státusz kódja] = tSzervezet.[Szervezetmenedzsment kód]) ON lkÁlláshelyek.[Álláshely azonosító] = lkSzemélyek.[Státusz kódja]) LEFT JOIN kt_azNexon_Adójel02 ON lkSzemélyek.Adójel = kt_azNexon_Adójel02.Adójel
WHERE (((lkÁlláshelyek.[5 szint])<>[Szint 7 szervezeti egység név] And (lkÁlláshelyek.[5 szint])<>"") AND ((bfkh([Szervezeti egység kódja])) Is Not Null)) OR (((lkSzemélyek.Fõosztály)<>[lkÁlláshelyek].[FõosztályÁlláshely]) AND ((bfkh([Szervezeti egység kódja])) Is Not Null))
ORDER BY bfkh([Szervezeti egység kódja]);

#/#/#/
lk__EltérõBesorolások
#/#/
SELECT DISTINCT lkSzervezetÁlláshelyek.SzervezetKód, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Tartós távollét típusa], lkSzemélyek.[Helyettesített dolgozó neve], Replace([lkSzemélyek].[Fõosztály],"Budapest Fõváros Kormányhivatala ","BFKH ") AS Fõosztály, lkSzervezetÁlláshelyek.Álláshely AS Álláshely, Álláshelyek.[Álláshely besorolási kategóriája] AS ÁNYR, lkSzemélyek.Besorolás AS [Személyi karton], lkSzervezetÁlláshelyek.[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] AS [Szervezeti struktúra], "https://nexonport.kh.gov.hu/menu/hrm/szemelyiKarton/index?szemelyAzonosito=" & [azNexon] & "&r=13" AS Link, IIf(UCase$(Nz([Álláshely besorolási kategóriája],""))=UCase$(Nz([Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés],"")),True,False) AS Ányr_vs_Szervezeti, IIf(Nz([Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés],"")=Nz([lkSzemélyek].[Besorolás],""),True,False) AS Szervezeti_vs_Személyi, IIf(UCase$(Nz([Álláshely besorolási kategóriája],""))=UCase$(Nz([lkSzemélyek].[Besorolás],"")),True,False) AS Ány_vs_Személyi, lkSzervezetÁlláshelyek.Betöltött, kt_azNexon_Adójel.azNexon, lkSzemélyek.adójel
FROM (kt_azNexon_Adójel RIGHT JOIN (lkSzervezetÁlláshelyek LEFT JOIN lkSzemélyek ON lkSzervezetÁlláshelyek.Álláshely = lkSzemélyek.[Státusz kódja]) ON kt_azNexon_Adójel.Adójel = lkSzemélyek.Adójel) LEFT JOIN Álláshelyek ON lkSzervezetÁlláshelyek.Álláshely = Álláshelyek.[Álláshely azonosító]
WHERE (((IIf(UCase$(Nz([Álláshely besorolási kategóriája],""))=UCase$(Nz([Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés],"")),True,False))=False) And ((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Like "Munka*")) Or (((IIf(Nz([Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés],"")=Nz(lkSzemélyek.Besorolás,""),True,False))=False) And ((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Not Like "Munka*")) Or (((IIf(UCase$(Nz([Álláshely besorolási kategóriája],""))=UCase$(Nz([Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés],"")),True,False))=False) And ((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Not Like "Munka*")) Or (((IIf(UCase$(Nz([Álláshely besorolási kategóriája],""))=UCase$(Nz(lkSzemélyek.Besorolás,"")),True,False))=False) And ((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Not Like "Munka*")) Or (((IIf(UCase$(Nz([Álláshely besorolási kategóriája],""))=UCase$(Nz([Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés],"")),True,False))=False) And ((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Is Null))
ORDER BY lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lk__EltérõBesorolások_Ányr_vs_Szervezeti
#/#/
SELECT lk__EltérõBesorolások.SzervezetKód, lk__EltérõBesorolások.Fõosztály, lk__EltérõBesorolások.Álláshely, lk__EltérõBesorolások.[Személyi karton], lk__EltérõBesorolások.[Szervezeti struktúra], lk__EltérõBesorolások.[Dolgozó teljes neve], lk__EltérõBesorolások.[Tartós távollét típusa], lk__EltérõBesorolások.[Helyettesített dolgozó neve], lk__EltérõBesorolások.Link, lk__EltérõBesorolások.Ányr_vs_Szervezeti, lk__EltérõBesorolások.Szervezeti_vs_Személyi, lk__EltérõBesorolások.Ány_vs_Személyi, *
FROM lk__EltérõBesorolások
WHERE (((lk__EltérõBesorolások.Ányr_vs_Szervezeti)=False) AND ((lk__EltérõBesorolások.Ány_vs_Személyi)=True))
ORDER BY lk__EltérõBesorolások.SzervezetKód, lk__EltérõBesorolások.[Dolgozó teljes neve];

#/#/#/
lk__EltérõBesorolások_Ányr_vs_Szervezeti_Címzettek
#/#/
SELECT DISTINCT lk__EltérõBesorolások_Ányr_vs_Szervezeti.Címzett
FROM lk__EltérõBesorolások_Ányr_vs_Szervezeti
GROUP BY lk__EltérõBesorolások_Ányr_vs_Szervezeti.Címzett, lk__EltérõBesorolások_Ányr_vs_Szervezeti.Fõosztály;

#/#/#/
lk__EltérõBesorolások_Ányr_vs_Szervezeti_felelõsök
#/#/
SELECT lk__EltérõBesorolások_Ányr_vs_Szervezeti.Fõosztály, tReferensek.[Dolgozó teljes neve] AS Felelõs, Count(lk__EltérõBesorolások_Ányr_vs_Szervezeti.Álláshely) AS [Javítandó adatok száma], lk__EltérõBesorolások_Ányr_vs_Szervezeti.[Dolgozó teljes neve]
FROM (ktReferens_SzervezetiEgység RIGHT JOIN lk__EltérõBesorolások_Ányr_vs_Szervezeti ON ktReferens_SzervezetiEgység.azSzervezet=lk__EltérõBesorolások_Ányr_vs_Szervezeti.azSzervezet) LEFT JOIN tReferensek ON ktReferens_SzervezetiEgység.azRef=tReferensek.azRef
GROUP BY lk__EltérõBesorolások_Ányr_vs_Szervezeti.Fõosztály, tReferensek.[Dolgozó teljes neve], lk__EltérõBesorolások_Ányr_vs_Szervezeti.[Dolgozó teljes neve]
HAVING (((tReferensek.[Dolgozó teljes neve]) Like "Sz*"))
ORDER BY lk__EltérõBesorolások_Ányr_vs_Szervezeti.Fõosztály, Count(lk__EltérõBesorolások_Ányr_vs_Szervezeti.Álláshely) DESC;

#/#/#/
lk__EltérõBesorolások_Ányr_vs_Szervezeti_szervezetek
#/#/
SELECT DISTINCT lk__EltérõBesorolások_Ányr_vs_Szervezeti.Fõosztály, Count(lk__EltérõBesorolások_Ányr_vs_Szervezeti.Álláshely) AS [Javítandó adatok száma]
FROM lk__EltérõBesorolások_Ányr_vs_Szervezeti
GROUP BY lk__EltérõBesorolások_Ányr_vs_Szervezeti.Fõosztály
ORDER BY Count(lk__EltérõBesorolások_Ányr_vs_Szervezeti.Álláshely) DESC;

#/#/#/
lk__EltérõBesorolások_Szervezet_vs_Személy
#/#/
SELECT lk__EltérõBesorolások.SzervezetKód, lk__EltérõBesorolások.Fõosztály, lk__EltérõBesorolások.Álláshely, lk__EltérõBesorolások.[Személyi karton], lk__EltérõBesorolások.[Szervezeti struktúra], lk__EltérõBesorolások.[Dolgozó teljes neve], lk__EltérõBesorolások.[Tartós távollét típusa], lk__EltérõBesorolások.[Helyettesített dolgozó neve], lk__EltérõBesorolások.Link
FROM lk__EltérõBesorolások
WHERE (((lk__EltérõBesorolások.[Személyi karton])<>[Szervezeti struktúra]) AND ((lk__EltérõBesorolások.Betöltött)=True) AND ((lk__EltérõBesorolások.Szervezeti_vs_Személyi)=False))
ORDER BY lk__EltérõBesorolások.SzervezetKód, lk__EltérõBesorolások.[Dolgozó teljes neve];

#/#/#/
lk__Mintalekérdezés
#/#/
SELECT 'Járási_állomány' AS Tábla, "Ellátott feladat" AS [Hiányzó érték], Járási_állomány.Adóazonosító, Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM Járási_állomány
WHERE (((Járási_állomány.Mezõ9) Is Null Or (Járási_állomány.Mezõ9)="") AND ((Járási_állomány.Mezõ4)<>"üres állás"));

#/#/#/
lk__osztályvezetõ_halmozó_szervezeti_egységek
#/#/
SELECT Álláshelyek.[3 szint], Álláshelyek.[4 szint], Álláshelyek.[5 szint], Count(Álláshelyek.[Álláshely azonosító]) AS [CountOfÁlláshely azonosító], 2 AS Sor
FROM Álláshelyek
WHERE (((Álláshelyek.[Álláshely besorolási kategóriája])="osztályvezetõ"))
GROUP BY Álláshelyek.[3 szint], Álláshelyek.[4 szint], Álláshelyek.[5 szint], 2
HAVING (((Count(Álláshelyek.[Álláshely azonosító]))>1));

#/#/#/
lk__osztályvezetõ_halmozó_szervezeti_egységek_összefoglaló
#/#/
SELECT Összevont.[3 szint], Összevont.[4 szint], Összevont.[5 szint], IIf(Left([Összevont].[Álláshely azonosító],1)="S",[Összevont].[Álláshely azonosító],"Összesen: " & [Összevont].[Álláshely azonosító] & " db.") AS Álláshely, Álláshelyek.[Álláshely státusza], lkSzemélyek.[Dolgozó teljes neve]
FROM lkSzemélyek RIGHT JOIN (Álláshelyek RIGHT JOIN (SELECT lk__osztályvezetõ_halmozó_szervezeti_egységek_részletezõ.* FROM lk__osztályvezetõ_halmozó_szervezeti_egységek_részletezõ UNION SELECT  lk__osztályvezetõ_halmozó_szervezeti_egységek.* FROM lk__osztályvezetõ_halmozó_szervezeti_egységek )  AS Összevont ON Álláshelyek.[Álláshely azonosító] = Összevont.[Álláshely azonosító]) ON lkSzemélyek.[Státusz kódja] = Álláshelyek.[Álláshely azonosító]
ORDER BY Összevont.[3 szint], Összevont.[4 szint], Összevont.[5 szint], Összevont.sor;

#/#/#/
lk__osztályvezetõ_halmozó_szervezeti_egységek_részletezõ
#/#/
SELECT lk__osztályvezetõ_halmozó_szervezeti_egységek.[3 szint], lk__osztályvezetõ_halmozó_szervezeti_egységek.[4 szint], lk__osztályvezetõ_halmozó_szervezeti_egységek.[5 szint], Álláshelyek.[Álláshely azonosító], 1 AS sor
FROM Álláshelyek RIGHT JOIN lk__osztályvezetõ_halmozó_szervezeti_egységek ON (Álláshelyek.[3 szint] = lk__osztályvezetõ_halmozó_szervezeti_egységek.[3 szint]) AND (Álláshelyek.[4 szint] = lk__osztályvezetõ_halmozó_szervezeti_egységek.[4 szint]) AND (Álláshelyek.[5 szint] = lk__osztályvezetõ_halmozó_szervezeti_egységek.[5 szint])
WHERE (((Álláshelyek.[Álláshely besorolási kategóriája])="osztályvezetõ"));

#/#/#/
lk__osztályvezetõ_nélküli_szervezetei_egységek
#/#/
SELECT MindenSzervezetiEgység.Szervezet, SzervezetekOsztályvezetõvel.Szervezet, *
FROM (SELECT DISTINCT IIf([4 szint]="" Or [4 szint] Is Null,[3 szint],[4 szint]) & " - " & [5 szint] AS Szervezet FROM Álláshelyek WHERE [5 szint]<>"")  AS MindenSzervezetiEgység LEFT JOIN (SELECT DISTINCT IIf([4 szint]="" Or [4 szint] Is Null,[3 szint],[4 szint]) & " - " & [5 szint] AS Szervezet FROM Álláshelyek WHERE Álláshelyek.[Álláshely besorolási kategóriája]="osztályvezetõ")  AS SzervezetekOsztályvezetõvel ON MindenSzervezetiEgység.Szervezet=SzervezetekOsztályvezetõvel.Szervezet
WHERE (((SzervezetekOsztályvezetõvel.Szervezet) Is Null));

#/#/#/
lk_Állománytáblákból_Illetmények
#/#/
SELECT Unió.Adóazonosító, Unió.Illetmény, Unió.[Heti munkaórák száma], Unió.[Álláshely azonosító], Unió.Név, Unió.Fõosztály, Unió.Osztály, [Adóazonosító]*1 AS Adójel, Unió.TávollétJogcíme, Unió.Szervezetkód, Unió.BesorolásHavi
FROM (SELECT Járási_állomány.Adóazonosító, 
        Járási_állomány.Mezõ18 AS Illetmény, 
        [Heti munkaórák száma], 
        [Álláshely azonosító], 
        Név, 
        Replace([Járási hivatal],"Budapest Fõváros Kormányhivatala ","BFKH ") as Fõosztály,
        Mezõ7 as Osztály,
        [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] as TávollétJogcíme, 
        [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] as Szervezetkód,
        [Besorolási fokozat kód:] as BesorolásHavi
    FROM Járási_állomány
    WHERE Adóazonosító  not like ""

    UNION SELECT Kormányhivatali_állomány.Adóazonosító, 
        Kormányhivatali_állomány.Mezõ18, 
        [Heti munkaórák száma], 
        [Álláshely azonosító], 
        Név, 
        Mezõ6, 
        Mezõ7, 
        [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], 
        [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ],
        [Besorolási fokozat kód:]
    FROM  Kormányhivatali_állomány
    WHERE Adóazonosító  not  like ""
    
    UNION SELECT Központosítottak.Adóazonosító, Központosítottak.Mezõ17, lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS [Heti munkaórák száma], Központosítottak.[Álláshely azonosító], Központosítottak.Név, Központosítottak.Mezõ7, Központosítottak.[Projekt megnevezése], Központosítottak.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító], Központosítottak.[Besorolási fokozat kód:]
FROM lkSzemélyek RIGHT JOIN Központosítottak ON lkSzemélyek.[Adóazonosító jel] = Központosítottak.Adóazonosító
WHERE (Központosítottak.[Adóazonosító]) Not Like ""
)  AS Unió;

#/#/#/
lk_CSED-en lévõk
#/#/
SELECT [Adóazonosító]*1 AS Adójel, [lk_TT-sek].Név, [lk_TT-sek].[Járási Hivatal], [lk_TT-sek].Osztály, [lk_TT-sek].Jogcíme
FROM [lk_TT-sek];

#/#/#/
lk_Ellenõrzés_01
#/#/
SELECT 'Járási_állomány' AS Tábla, 'Kinevezés dátuma
Álláshely megüresedésének dátuma
(most ellátott feladat)
év,hó,nap' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány] 
WHERE ([Járási_állomány].[Mezõ10] Is Null )  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Járási_állomány' AS Tábla, 'Ellátott feladatok megjelölése
a fõvárosi és megyei kormányhivatalok szervezeti és mûködési szabályzatáról szóló 3/2020. (II. 28.) MvM utasítás alapján' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány] 
WHERE ([Járási_állomány].[Mezõ9] Is Null OR [Járási_állomány].[Mezõ9]='')  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Járási_állomány' AS Tábla, 'ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány] 
WHERE ([Járási_állomány].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] Is Null OR [Járási_állomány].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]='')  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Járási_állomány' AS Tábla, 'Szervezeti egység
Osztály megnevezése' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány] 
WHERE ([Járási_állomány].[Mezõ7] Is Null OR [Járási_állomány].[Mezõ7]='')  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Járási_állomány' AS Tábla, 'Járási Hivatal' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány] 
WHERE ([Járási_állomány].[Járási Hivatal] Is Null OR [Járási_állomány].[Járási Hivatal]='')  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Járási_állomány' AS Tábla, 'Dolgozó neme
1 férfi
2 nõ' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány] 
WHERE ([Járási_állomány].[Mezõ5] Is Null OR [Járási_állomány].[Mezõ5]='')  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Járási_állomány' AS Tábla, 'Születési év/ Üres állás
/ Üres állás' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány] 
WHERE ([Járási_állomány].[Mezõ4] Is Null OR [Járási_állomány].[Mezõ4]='')  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Járási_állomány' AS Tábla, 'Adóazonosító' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány] 
WHERE ([Járási_állomány].[Adóazonosító] Is Null )  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Járási_állomány' AS Tábla, 'Név' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány] 
WHERE ([Járási_állomány].[Név] Is Null OR [Járási_állomány].[Név]='')  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null ) 
UNION SELECT 'Járási_állomány' AS Tábla, 'Legmagasabb iskolai végzettség 1=8. osztály; 2=érettségi; 3=fõiskolai végzettség; 4=egyetemi végzettség; 5=technikus; 6= KAB vizsga' AS Hiányzó_érték, Járási_állomány.Adóazonosító, Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM lkVégzettségek RIGHT JOIN Járási_állomány ON lkVégzettségek.[Dolgozó azonosító] = Járási_állomány.Adóazonosító
WHERE (((Járási_állomány.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis]) Like "") AND ((Járási_állomány.Mezõ4)<>'üres állás' Or (Járási_állomány.Mezõ4) Is Null) AND ((lkVégzettségek.[Végzettség típusa])="Iskolai végzettség"))
UNION SELECT 'Járási_állomány' AS Tábla, 'Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány]  WHERE ([Járási_állomány].[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] Is Null OR [Járási_állomány].[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)]='')  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null )
UNION SELECT 'Járási_állomány' AS Tábla, 'Havi illetmény teljes összege (kerekítve) (FT)' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány]  WHERE ([Járási_állomány].[Mezõ18] Is Null )  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null )
UNION SELECT 'Járási_állomány' AS Tábla, 'Álláshely azonosító' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány]  WHERE ([Járási_állomány].[Álláshely azonosító] Is Null OR [Járási_állomány].[Álláshely azonosító]='')  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null )
UNION SELECT 'Járási_állomány' AS Tábla, 'Besorolási fokozat megnevezése:' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány]  WHERE ([Járási_állomány].[Besorolási fokozat megnevezése:] Is Null OR [Járási_állomány].[Besorolási fokozat megnevezése:]='')  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null )
UNION SELECT 'Járási_állomány' AS Tábla, 'Besorolási fokozat kód:' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány]  WHERE ([Járási_állomány].[Besorolási fokozat kód:] Is Null OR [Járási_állomány].[Besorolási fokozat kód:]='')  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null )
UNION SELECT 'Járási_állomány' AS Tábla, 'Álláshely betöltésének aránya és Üres álláshely betöltés aránya' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány]  WHERE ([Járási_állomány].[Mezõ14] Is Null )  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null )   UNION SELECT 'Járási_állomány' AS Tábla, 'Heti munkaórák száma' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány]  WHERE ([Járási_állomány].[Heti munkaórák száma] Is Null )  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null )   UNION SELECT 'Járási_állomány' AS Tábla, 'Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas teljes (NYT), részmunkaidõs (NYR)' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány]  WHERE ([Járási_állomány].[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] Is Null OR [Járási_állomány].[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]='')  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null )   UNION SELECT 'Járási_állomány' AS Tábla, 'Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás; KAB szakmai (KAB/SZ) / KAB funkcionális (KAB/F) feladatellátás;' AS Hiányzó_érték, Járási_állomány.Adóazonosító, Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM Járási_állomány
WHERE (((Járási_állomány.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;]) Is Null Or (Járási_állomány.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;])='') AND ((Járási_állomány.Mezõ4)<>'üres állás' Or (Járási_állomány.Mezõ4) Is Null))
UNION
SELECT 'Kormányhivatali_állomány' AS Tábla, 'Kinevezés dátuma
Álláshely megüresedésének dátuma
(most ellátott feladat)
év,hó,nap' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Mezõ10] Is Null )  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Ellátott feladatok megjelölése
a fõvárosi és megyei kormányhivatalok szervezeti és mûködési szabályzatáról szóló 3/2020. (II. 28.) MvM utasítás alapján' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Mezõ9] Is Null OR [Kormányhivatali_állomány].[Mezõ9]='')  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] Is Null OR [Kormányhivatali_állomány].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]='')  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Szervezeti egység
Osztály megnevezése' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Mezõ7] Is Null OR [Kormányhivatali_állomány].[Mezõ7]='')  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Szervezeti egység
Fõosztály megnevezése' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Mezõ6] Is Null OR [Kormányhivatali_állomány].[Mezõ6]='')  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Dolgozó neme
1 férfi
2 nõ' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Mezõ5] Is Null OR [Kormányhivatali_állomány].[Mezõ5]='')  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Születési év/ Üres állás' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Mezõ4] Is Null OR [Kormányhivatali_állomány].[Mezõ4]='')  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Adóazonosító' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Adóazonosító] Is Null )  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Név' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Név] Is Null OR [Kormányhivatali_állomány].[Név]='')  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Járási_állomány' AS Tábla, 'Képesítést adó végzettség megnevezése.
(az az egy ami a feladat betöltéséhez szükséges)' AS Hiányzó_érték, Járási_állomány.[Adóazonosító], Járási_állomány.[Álláshely azonosító], Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Járási_állomány] 
WHERE ([Járási_állomány].[Mezõ26] Is Null OR [Járási_állomány].[Mezõ26]='')  AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null ) 

union
SELECT 'Kormányhivatali_állomány' AS Tábla, 'Képesítést adó végzettség megnevezése.
(az az egy ami a feladat betöltéséhez szükséges)' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Mezõ26] Is Null OR [Kormányhivatali_állomány].[Mezõ26]='')  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Legmagasabb iskolai végzettség 1=8. osztály; 2=érettségi; 3=fõiskolai végzettség; 4=egyetemi végzettség; 5=technikus; 6= KAB vizsga' AS Hiányzó_érték, Kormányhivatali_állomány.Adóazonosító, Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM lkVégzettségek RIGHT JOIN Kormányhivatali_állomány ON lkVégzettségek.[Dolgozó azonosító] = Kormányhivatali_állomány.Adóazonosító
WHERE (((Kormányhivatali_állomány.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis]) Like "") AND ((Kormányhivatali_állomány.Mezõ4)<>'üres állás' Or (Kormányhivatali_állomány.Mezõ4) Is Null) AND ((lkVégzettségek.[Végzettség típusa])="Iskolai végzettség"))
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] Is Null OR [Kormányhivatali_állomány].[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)]='')  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Havi illetmény teljes összege (kerekítve)
(FT)' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Mezõ18] Is Null )  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Álláshely azonosító' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Álláshely azonosító] Is Null OR [Kormányhivatali_állomány].[Álláshely azonosító]='')  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Besorolási fokozat megnevezése:' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Besorolási fokozat megnevezése:] Is Null OR [Kormányhivatali_állomány].[Besorolási fokozat megnevezése:]='')  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Álláshely betöltésének aránya és
Üres álláshely betöltés aránya' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Mezõ14] Is Null )  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Heti munkaórák száma' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Heti munkaórák száma] Is Null )  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas teljes (NYT), részmunkaidõs (NYR)' AS Hiányzó_érték, Kormányhivatali_állomány.[Adóazonosító], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kormányhivatali_állomány] 
WHERE ([Kormányhivatali_állomány].[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] Is Null OR [Kormányhivatali_állomány].[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]='')  AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null ) 
 UNION SELECT 'Kormányhivatali_állomány' AS Tábla, 'Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás; KAB szakmai (KAB/SZ) / KAB funkcionális (KAB/F) feladatellátás;' AS Hiányzó_érték, Kormányhivatali_állomány.Adóazonosító, Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM Kormányhivatali_állomány
WHERE (((Kormányhivatali_állomány.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;]) Is Null Or (Kormányhivatali_állomány.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;])='') AND ((Kormányhivatali_állomány.Mezõ4)<>'üres állás' Or (Kormányhivatali_állomány.Mezõ4) Is Null))


union
SELECT 'Központosítottak' AS Tábla, 'Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas teljes (NYT), részmunkaidõs (NYR)' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak] 
WHERE ([Központosítottak].[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] Is Null OR [Központosítottak].[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null ) 
 UNION SELECT 'Központosítottak' AS Tábla, 'Kinevezés dátuma
Álláshely megüresedésének dátuma
(most ellátott feladat)
év,hó,nap' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak] 
WHERE ([Központosítottak].[Mezõ11] Is Null )  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null ) 
 UNION SELECT 'Központosítottak' AS Tábla, 'Ellátott feladatok megjelölése
a fõvárosi és megyei kormányhivatalok szervezeti és mûködési szabályzatáról szóló 3/2020. (II. 28.) MvM utasítás alapján' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak] 
WHERE ([Központosítottak].[Mezõ10] Is Null OR [Központosítottak].[Mezõ10]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null ) 
 UNION SELECT 'Központosítottak' AS Tábla, 'Nexon szótárelemnek megfelelõ szervezeti egység azonosító' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak] 
WHERE ([Központosítottak].[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] Is Null OR [Központosítottak].[Nexon szótárelemnek megfelelõ szervezeti egység azonosító]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null ) 
 UNION SELECT 'Központosítottak' AS Tábla, 'Szervezeti egység
Osztály megnevezése' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak] 
WHERE ([Központosítottak].[Mezõ7] Is Null OR [Központosítottak].[Mezõ7]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null ) 
 UNION SELECT 'Központosítottak' AS Tábla, 'Szervezeti egység
Fõosztály megnevezése' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak] 
WHERE ([Központosítottak].[Mezõ6] Is Null OR [Központosítottak].[Mezõ6]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null ) 
 UNION SELECT 'Központosítottak' AS Tábla, 'Megyei szint VAGY Járási Hivatal' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak] 
WHERE ([Központosítottak].[Megyei szint VAGY Járási Hivatal] Is Null OR [Központosítottak].[Megyei szint VAGY Járási Hivatal]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null ) 
 UNION SELECT 'Központosítottak' AS Tábla, 'Születési év/ Üres állás' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak] 
WHERE ([Központosítottak].[Mezõ4] Is Null OR [Központosítottak].[Mezõ4]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null ) 
 UNION SELECT 'Központosítottak' AS Tábla, 'Adóazonosító' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak] 
WHERE ([Központosítottak].[Adóazonosító] Is Null )  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null ) 
 UNION SELECT 'Központosítottak' AS Tábla, 'Név' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak] 
WHERE ([Központosítottak].[Név] Is Null OR [Központosítottak].[Név]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null );

#/#/#/
lk_Ellenõrzés_01a
#/#/
SELECT [01a].Tábla, [01a].Hiányzó_érték, [01a].Adóazonosító, [01a].[Álláshely azonosító], [01a].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Adóazonosító]*1 AS adójel
FROM (SELECT 'lkKilépõk' AS Tábla, 'Jogviszony megszûnésének, megszüntetésének idõpontja' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Jogviszony megszûnésének, megszüntetésének idõpontja] Is Null ) 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Jogviszony kezdõ dátuma' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Jogviszony kezdõ dátuma] Is Null ) 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hivatkozás száma (§, bek., pontja)' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva] Is Null OR [lkKilépõk].[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Álláshely azonosító' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Álláshely azonosító] Is Null OR [lkKilépõk].[Álláshely azonosító]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Ellátott feladatok megjelölése
a fõvárosi és megyei kormányhivatalok szervezeti és mûködési szabályzatáról szóló 3/2020. (II. 28.) MvM utasítás alapján' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Mezõ8] Is Null OR [lkKilépõk].[Mezõ8]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] Is Null OR [lkKilépõk].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Szervezeti egység
Osztály megnevezése' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Mezõ6] Is Null OR [lkKilépõk].[Mezõ6]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Szervezeti egység
Fõosztály megnevezése' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Mezõ5] Is Null OR [lkKilépõk].[Mezõ5]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Megyei szint VAGY Járási Hivatal' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Megyei szint VAGY Járási Hivatal] Is Null OR [lkKilépõk].[Megyei szint VAGY Járási Hivatal]='') 
 UNION SELECT 'lkKilépõk' AS Tábla, 'Adóazonosító' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Adóazonosító] Is Null )
)  AS 01a;

#/#/#/
lk_Ellenõrzés_01b
#/#/
SELECT [01b].Tábla, [01b].Hiányzó_érték, [01b].Adóazonosító, [01b].[Álláshely azonosító], [01b].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Adóazonosító]*1 AS Adójel
FROM (SELECT 'lkBelépõk' AS Tábla, 'Adóazonosító' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk]  WHERE ([lkBelépõk].[Adóazonosító] Is Null )   

UNION SELECT 'lkBelépõk' AS Tábla, 'Név' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk]  WHERE ([lkBelépõk].[Név] Is Null OR [lkBelépõk].[Név]='')   

UNION SELECT 'Központosítottak' AS Tábla, 'Legmagasabb iskolai végzettség 1=8. osztály; 2=érettségi; 3=fõiskolai végzettség; 4=egyetemi végzettség; 5=technikus; 6= KAB vizsga' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] Is Null )  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )   

UNION SELECT 'Központosítottak' AS Tábla, 'Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] Is Null OR [Központosítottak].[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )   



  UNION SELECT 'Központosítottak' AS Tábla, 'Havi illetmény teljes összege (kerekítve) (FT)' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Mezõ17] Is Null )  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )  

 UNION SELECT 'Központosítottak' AS Tábla, 'Álláshely azonosító' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Álláshely azonosító] Is Null OR [Központosítottak].[Álláshely azonosító]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )

   UNION SELECT 'Központosítottak' AS Tábla, 'Besorolási fokozat megnevezése:' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Besorolási fokozat megnevezése:] Is Null OR [Központosítottak].[Besorolási fokozat megnevezése:]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )  

 UNION SELECT 'Központosítottak' AS Tábla, 'Besorolási fokozat kód:' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Besorolási fokozat kód:] Is Null OR [Központosítottak].[Besorolási fokozat kód:]='')  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )   

UNION SELECT 'Központosítottak' AS Tábla, 'Álláshely betöltésének aránya és Üres álláshely betöltés aránya' AS Hiányzó_érték, Központosítottak.[Adóazonosító], Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] FROM [Központosítottak]  WHERE ([Központosítottak].[Mezõ13] Is Null )  AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )
)  AS 01b;

#/#/#/
lk_Ellenõrzés_01c
#/#/
SELECT [01c].Tábla, [01c].Hiányzó_érték, [01c].Adóazonosító, [01c].[Álláshely azonosító], [01c].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Adóazonosító]*1 AS Adójel
FROM (SELECT 'lkKilépõk' AS Tábla, 'Név' AS Hiányzó_érték, lkKilépõk.[Adóazonosító], lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkKilépõk] 
WHERE ([lkKilépõk].[Név] Is Null OR [lkKilépõk].[Név]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Illetmény (Ft/hó)' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Illetmény (Ft/hó)] Is Null ) 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)] Is Null OR [lkBelépõk].[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Jogviszony kezdõ dátuma' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Jogviszony kezdõ dátuma] Is Null ) 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Álláshely azonosító' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Álláshely azonosító] Is Null OR [lkBelépõk].[Álláshely azonosító]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Ellátott feladatok megjelölése
a fõvárosi és megyei kormányhivatalok szervezeti és mûködési szabályzatáról szóló 3/2020. (II. 28.) MvM utasítás alapján' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Mezõ8] Is Null OR [lkBelépõk].[Mezõ8]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] Is Null OR [lkBelépõk].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Szervezeti egység
Osztály megnevezése' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Mezõ6] Is Null OR [lkBelépõk].[Mezõ6]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Szervezeti egység
Fõosztály megnevezése' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Mezõ5] Is Null OR [lkBelépõk].[Mezõ5]='') 
 UNION SELECT 'lkBelépõk' AS Tábla, 'Megyei szint VAGY Járási Hivatal' AS Hiányzó_érték, lkBelépõk.[Adóazonosító], lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [lkBelépõk] 
WHERE ([lkBelépõk].[Megyei szint VAGY Járási Hivatal] Is Null OR [lkBelépõk].[Megyei szint VAGY Járási Hivatal]='')
)  AS 01c;

#/#/#/
lk_Ellenõrzés_01d_Illetmény_nulla
#/#/
SELECT [01D].Tábla, [01D].Hiányzó_érték, [01D].Adójel AS Adóazonosító, [01D].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Álláshely azonosító]
FROM (SELECT 'Járási_állomány' as Tábla, 'Illetmény' As [Hiányzó_érték], [Adóazonosító] As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]  , [Álláshely azonosító]
 FROM [Járási_állomány] WHERE [Mezõ18]=0 AND ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null )  
UNION 
SELECT 'Kormányhivatali_állomány' as Tábla, 'Illetmény' As [Hiányzó érték], [Adóazonosító] As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] As SzervezetKód , [Álláshely azonosító]
 FROM [Kormányhivatali_állomány] WHERE [Mezõ18]=0 AND ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás' OR [Kormányhivatali_állomány].[Mezõ4] is null )  
UNION 
SELECT 'Központosítottak' as Tábla, 'Illetmény' As [Hiányzó érték], [Adóazonosító] As Adójel, [Nexon szótárelemnek megfelelõ szervezeti egység azonosító] As SzervezetKód , [Álláshely azonosító]
 FROM [Központosítottak] WHERE [Mezõ17]=0 AND ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null )  
UNION 
SELECT 'lkBelépõk' as Tábla, 'Illetmény' As [Hiányzó érték], [Adóazonosító] As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] As SzervezetKód , [Álláshely azonosító]
FROM [lkBelépõk] WHERE [Illetmény (Ft/hó)]=0 AND ([lkBelépõk].[Üres]<> 'üres állás' OR [lkBelépõk].[Üres] is null )  
UNION 
SELECT 'lkKilépõk' as Tábla, 'Illetmény' As [Hiányzó érték], [Adóazonosító] As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] As SzervezetKód , [Álláshely azonosító]
FROM [lkKilépõk] WHERE [Illetmény (Ft/hó)]=0 AND ([lkKilépõk].[Üres]<> 'üres állás' OR [lkKilépõk].[Üres] is null )  
UNION 
SELECT 'lkHatározottak_TT' as Tábla, 'Illetmény' As [Hiányzó érték], [Adóazonosító] As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] As SzervezetKód, [Álláshely azonosító]
 FROM [lkHatározottak_TT] WHERE [Tartósan távollévõ illetményének teljes összege]=0 AND ([lkHatározottak_TT].[Üres]<> 'üres állás' OR [lkHatározottak_TT].[Üres] is null )  
UNION 
SELECT 'lkHatározottak_TTH' as Tábla, 'Illetmény' As [Hiányzó érték], [Mezõ17] As Adójel, [Mezõ25] As SzervezetKód , [Mezõ25]
FROM [lkHatározottak_TTH] WHERE [Tartós távollévõ státuszán foglalkoztatott illetményének teljes ]=0 AND ([lkHatározottak_TTH].[Üres]<> 'üres állás' OR [lkHatározottak_TTH].[Üres] is null )
)  AS 01D;

#/#/#/
lk_Ellenõrzés_01e_Részmunkaidõ_Munkaidõ_eltérések_Személy-ben
#/#/
SELECT "Személytörzs" AS Tábla, IIf(IIf([elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]=40,"T","R")="T" And Switch([Foglalkozási viszony statisztikai besorolása] Like "*teljes*","T",[Foglalkozási viszony statisztikai besorolása] Like "*részmunkaidõs*","R",[Foglalkozási viszony statisztikai besorolása] Not Like "*teljes*" And [Foglalkozási viszony statisztikai besorolása] Not Like "*részmunkaidõs*","-")="R","Részmunkaidõsnek van jelölve, de teljes munkaidõben dolgozik.","Teljes munkaidõsnek van jelölve, de részmunkaidõben dolgozik.") AS [Hiányzó érték], lkSzemélyek.[Adóazonosító jel] AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz kódja]) Like "S-*") AND ((lkSzemélyek.[Foglalkozási viszony statisztikai besorolása]) Not Like "Á*") AND ((IIf([elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]=40,"T","R")<>Switch([Foglalkozási viszony statisztikai besorolása] Like "*teljes*","T",[Foglalkozási viszony statisztikai besorolása] Like "*részmunkaidõs*","R",[Foglalkozási viszony statisztikai besorolása] Not Like "*teljes*" And [Foglalkozási viszony statisztikai besorolása] Not Like "*részmunkaidõs*","-"))=True));

#/#/#/
lk_Ellenõrzés_01e_Részmunkaidõ_Munkaidõ_eltérések_táblákban
#/#/
SELECT DISTINCT "Személy és Havi" AS Tábla, UnióUnió.Hiányzó_érték, UnióUnió.Adóazonosító, UnióUnió.[Álláshely azonosító], UnióUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], UnióUnió.Adójel
FROM (SELECT DISTINCT Tábla, RészmunkaidõsUnió.Hiányzó_érték, RészmunkaidõsUnió.Adóazonosító, RészmunkaidõsUnió.[Álláshely azonosító], RészmunkaidõsUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Adóazonosító]*1 AS Adójel
FROM (SELECT "Kormányhivatali_állomány" AS Tábla
, "Részmunkaidõsnek van jelölve, de teljes munkaidõben dolgozik." AS [Hiányzó_érték]
, Kormányhivatali_állomány.Adóazonosító, Kormányhivatali_állomány.[Álláshely azonosító]
, Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
, Kormányhivatali_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]
, Kormányhivatali_állomány.[Heti munkaórák száma]
, IIf(Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="R" And [Heti munkaórák száma]=40,True,False) AS Hibás
FROM Kormányhivatali_állomány
WHERE (((
IIf
             (Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="R" 
     And [Heti munkaórák száma]=40
   ,True
   ,False))
=-1))
UNION
SELECT "Járási_állomány" AS Tábla
, "Részmunkaidõsnek van jelölve, de teljes munkaidõben dolgozik." AS [Hibás érték]
, Járási_állomány.Adóazonosító
, Járási_állomány.[Álláshely azonosító]
, Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
, Járási_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]
, Járási_állomány.[Heti munkaórák száma]
, IIf(Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="R" And [Heti munkaórák száma]=40,True,False) AS Hibás
FROM Járási_állomány
WHERE (((
IIf
             (Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="R" 
     And [Heti munkaórák száma]=40
   ,True
   ,False))
=-1))
UNION
SELECT "Kormányhivatali_állomány" AS Tábla
, "Teljes munkaidõsnek van jelölve, de részmunkaidõben dolgozik." AS [Hibás érték]
, Kormányhivatali_állomány.Adóazonosító, Kormányhivatali_állomány.[Álláshely azonosító]
, Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
, Kormányhivatali_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]
, Kormányhivatali_állomány.[Heti munkaórák száma]
, IIf(Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="T" And [Heti munkaórák száma]<>40,True,False) AS Hibás
FROM Kormányhivatali_állomány
WHERE (((
IIf
             (Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="T" 
     And [Heti munkaórák száma]<>40
   ,True
   ,False))
=-1))
UNION SELECT "Járási_állomány" AS Tábla
, "Teljes munkaidõsnek van jelölve, de részmunkaidõben dolgozik." AS [Hibás érték]
, Járási_állomány.Adóazonosító
, Járási_állomány.[Álláshely azonosító]
, Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
, Járási_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]
, Járási_állomány.[Heti munkaórák száma]
, IIf(Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="T" And [Heti munkaórák száma]<>40,True,False) AS Hibás
FROM Járási_állomány
WHERE (((
IIf
             (Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1)="T" 
     And [Heti munkaórák száma]<>40
   ,True
   ,False))
=-1))
)  AS RészmunkaidõsUnió
UNION SELECT *
FROM [lk_Ellenõrzés_01e_Részmunkaidõ_Munkaidõ_eltérések_Személy-ben])  AS UnióUnió;

#/#/#/
lk_Ellenõrzés_01f_hiányzó_besorolás_megnevezés
#/#/
SELECT Unió5tábla.Tábla, Unió5tábla.Hiányzó_érték, Unió5tábla.Adóazonosító, Unió5tábla.[Álláshely azonosító], Unió5tábla.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Adóazonosító]*1 AS Adójel
FROM (SELECT Kormányhivatali_állomány.Adóazonosító, Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], "Kormányhivatali_állomány" AS Tábla, "Besorolási fokozat megnevezése:" AS Hiányzó_érték, Kormányhivatali_állomány.[Besorolási fokozat megnevezése:]
FROM Kormányhivatali_állomány LEFT JOIN lkSzemélyek ON Kormányhivatali_állomány.Adóazonosító = lkSzemélyek.[Adóazonosító jel]
WHERE (((lkSzemélyek.[Jogviszony típusa / jogviszony típus])<>"hivatásos állományú"))

UNION
SELECT Kormányhivatali_állomány.Adóazonosító, Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], "Kormányhivatali_állomány" AS Tábla, "Besorolási fokozat megnevezése:" AS Hiányzó_érték, Kormányhivatali_állomány.[Besorolási fokozat megnevezése:]
FROM Kormányhivatali_állomány LEFT JOIN lkSzemélyek ON Kormányhivatali_állomány.Adóazonosító = lkSzemélyek.[Adóazonosító jel]
WHERE (((lkSzemélyek.[Jogviszony típusa / jogviszony típus])<>"hivatásos állományú"))

UNION
SELECT Központosítottak.Adóazonosító, Központosítottak.[Álláshely azonosító], Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító], "Központosítottak" as Tábla, "Besorolási fokozat megnevezése:" as Hiányzó_érték,  [Besorolási fokozat megnevezése:]
FROM   Központosítottak
WHERE '///--- Töröltem, mert a ki- és belépõk táblákból a jogviszony nem állapítható meg, de a munkaviszonyosokra nem jön le adat
UNION
SELECT lkBelépõk.Adóazonosító, lkBelépõk.[Álláshely azonosító], lkBelépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], "lkBelépõk" as Tábla, "Besorolási fokozat megnevezése:" as Hiányzó_érték, [Besorolási fokozat megnevezése:]
FROM lkBelépõk

UNION
SELECT lkKilépõk.Adóazonosító, lkKilépõk.[Álláshely azonosító], lkKilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], "lkKilépõk" as Tábla, "Besorolási fokozat megnevezése:" as Hiányzó_érték, [Besorolási fokozat megnevezése:]
FROM lkKilépõk
---///'

)  AS Unió5tábla
WHERE (((Unió5tábla.[Besorolási fokozat megnevezése:]) Is Null Or (Unió5tábla.[Besorolási fokozat megnevezése:])="Error 2042"));

#/#/#/
lk_Ellenõrzés_01f2_hiányzó_besorolás_megnevezésSzemély
#/#/
SELECT "Személytörzs alapriport" AS Tábla, "Besorolási fokozat (Személytörzs)" AS Hiányzó_érték, lkSzemélyek.[Adóazonosító jel] AS Adóazonosító, lkSzemélyek.[státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Besorolási  fokozat (KT)]) Is Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus])<>"Hivatásos állományú" And (lkSzemélyek.[Jogviszony típusa / jogviszony típus])<>"Munkaviszony"));

#/#/#/
lk_Ellenõrzés_01g_MunkahelyCímHiánya
#/#/
SELECT "tSzemélyek" AS Tábla, "Munkavégzés helye - cím" AS Hiányzó_érték, lkSzemélyek.Adójel AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Munkavégzés helye - cím]) Is Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null));

#/#/#/
lk_Ellenõrzés_01h_HivataliEmailHiánya
#/#/
SELECT lk_Ellenõrzés_01h_HivataliEmailHiánya00.Tábla, lk_Ellenõrzés_01h_HivataliEmailHiánya00.Hiányzó_érték, lk_Ellenõrzés_01h_HivataliEmailHiánya00.Adóazonosító, lk_Ellenõrzés_01h_HivataliEmailHiánya00.[Álláshely azonosító], lk_Ellenõrzés_01h_HivataliEmailHiánya00.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lk_Ellenõrzés_01h_HivataliEmailHiánya00.Adójel
FROM lk_Ellenõrzés_01h_HivataliEmailHiánya00
GROUP BY lk_Ellenõrzés_01h_HivataliEmailHiánya00.Tábla, lk_Ellenõrzés_01h_HivataliEmailHiánya00.Hiányzó_érték, lk_Ellenõrzés_01h_HivataliEmailHiánya00.Adóazonosító, lk_Ellenõrzés_01h_HivataliEmailHiánya00.[Álláshely azonosító], lk_Ellenõrzés_01h_HivataliEmailHiánya00.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lk_Ellenõrzés_01h_HivataliEmailHiánya00.Adójel;

#/#/#/
lk_Ellenõrzés_01h_HivataliEmailHiánya00
#/#/
SELECT "Személytörzs" AS Tábla, "Hivatali email" AS Hiányzó_érték, tSzemélyek.[Adóazonosító jel] AS Adóazonosító, tSzemélyek.[Státusz kódja] AS [Álláshely azonosító], tSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], tSzemélyek.Adójel, tSzemélyek.[Jogviszony sorszáma]
FROM tSzemélyek
WHERE (((tSzemélyek.[Státusz neve])="Álláshely") AND ((Len(Nz([Hivatali email]," ")))<4) AND ((tSzemélyek.[Tartós távollét típusa]) Is Null))
ORDER BY tSzemélyek.Adójel, tSzemélyek.[Jogviszony sorszáma] DESC;

#/#/#/
lk_Ellenõrzés_01i_FeladatkörNélküliek
#/#/
SELECT DISTINCT "Személytörzs" AS Tábla, "KIRA feladatkör" AS Hiányzó_érték, lkSzemélyek.[Adóazonosító jel] AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[KIRA feladat megnevezés]) Is Null Or (lkSzemélyek.[KIRA feladat megnevezés])="") AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY "KIRA feladatkör";

#/#/#/
lk_Ellenõrzés_01j_NemInaktívTT_s
#/#/
SELECT "Személyek vs. Szervezeti" AS Tábla, "A 'tartós távollét típusa': <üres>, ugyanakkor a 'Státuszbetöltés típusa': ""Inaktív""" AS Hiányzó_érték, lkSzemélyek.[Adóazonosító jel] AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM lk_InaktívBetöltõkÉsÁlláshelyük RIGHT JOIN lkSzemélyek ON lk_InaktívBetöltõkÉsÁlláshelyük.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lk_InaktívBetöltõkÉsÁlláshelyük.Adójel) Is Not Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
AND "####Az inaktív betöltõk között keresi meg azokat, akiknek a tartós távollét típusa mezõ a személytörzsben Null. #####";

#/#/#/
lk_Ellenõrzés_01jj_InaktívNemTT_s
#/#/
SELECT "Személyek vs. Szervezeti" AS Tábla, "A 'tartós távollét típusa': """ & [Tartós távollét típusa] & """, ugyanakkor a 'Státuszbetöltés típusa': nem ""Inaktív""" AS Hiányzó_érték, lkSzemélyek.[Adóazonosító jel] AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM lk_InaktívBetöltõkÉsÁlláshelyük LEFT JOIN lkSzemélyek ON lk_InaktívBetöltõkÉsÁlláshelyük.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Tartós távollét típusa]) Is Not Null) AND ((lk_InaktívBetöltõkÉsÁlláshelyük.Adójel) Is Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND (("##### Azokat keresi a személytörzsben, akiknek a tartós távollét típusa nem Null, de az inaktív betöltõk lekérdezésben nem szerepelnek. ####")<>""));

#/#/#/
lk_Ellenõrzés_01k_UtalásiCímHiánya
#/#/
SELECT "tSzemélyek" AS Tábla, "Utalási - cím" AS Hiányzó_érték, lkSzemélyek.Adójel AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((ffsplit([Utalási cím],"|",3))="") AND ((lkSzemélyek.[Státusz típusa]) Is Not Null));

#/#/#/
lk_Ellenõrzés_01L_IskolaiVégzettségFoka
#/#/
SELECT "tSzemélyek" AS Tábla, "A legmagasabb iskolai végzettség foka" AS Hiányzó_érték, lkSzemélyek.Adójel AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Iskolai végzettség foka]) Is Null) AND ((lkSzemélyek.[Státusz típusa]) Is Not Null));

#/#/#/
lk_Ellenõrzés_01m_AlapvizsgaHiánya
#/#/
SELECT "tSzemélyek" AS Tábla, "Letelt a próbaidõ, de nincs alapvizsga határidõ kitûzve" AS Hiányzó_érték, lkSzemélyek.Adójel AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel, lkSzemélyek.[Alapvizsga letétel tényleges határideje] AS AlapHatáridõ, lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége] AS PróbaidõVége, lkSzemélyek.[Alapvizsga mentesség], lkSzemélyek.[Státusz neve]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Alapvizsga letétel tényleges határideje]) Is Null) AND ((lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége])<Date()) AND ((lkSzemélyek.[Alapvizsga mentesség])<>True) AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Státusz típusa]) Is Not Null));

#/#/#/
lk_Ellenõrzés_01m_EskületételIdõpontHiány
#/#/
SELECT "tEsküLejártIdõpontok" AS Tábla, "Eskületétel idõpontja" AS Hiányzó_érték, lkSzemélyek.[Adóazonosító jel] AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM lkSzemélyek LEFT JOIN lkLejáróHatáridõk ON lkSzemélyek.[Adóazonosító jel] = lkLejáróHatáridõk.[Adóazonosító jel]
WHERE (((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)]) Between DateSerial(Year(Now()),Month(Now())-2,1) And DateSerial(Year(Now()),Month(Now())-1,1)) AND ((lkLejáróHatáridõk.[Figyelendõ dátum])=0) AND ((lkSzemélyek.[Státusz neve])="álláshely") AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus])="Kormányzati szolgálati jogviszony" Or (lkSzemélyek.[Jogviszony típusa / jogviszony típus])="Politikai szolgálati jogviszony"));

#/#/#/
lk_Ellenõrzés_01n_KözpontosítottKöltséghelyNélkül
#/#/
SELECT DISTINCT "tSzemélyek" AS Tábla, "Központosított álláshelyhez nincs megjelölve költséghely vagy költséghely-kód (projekt)." AS Hiányzó_érték, lkSzemélyek.Adójel AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND (([lkSzemélyek].[Státusz költséghelyének neve]) Is Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Státusz típusa])="Központosított állomány")) OR (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Státusz típusa])="Központosított állomány") AND ((lkSzemélyek.[Státusz költséghelyének kódja]) Is Null));

#/#/#/
lk_Ellenõrzés_01n_KözpontosítottKöltséghelyNélkülDolgozó
#/#/
SELECT DISTINCT "tSzemélyek" AS Tábla, "Központosított álláshelyhez nincs megjelölve költséghely vagy költséghely-kód (projekt)." AS Hiányzó_érték, lkSzemélyek.Adójel AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Dolgozó költséghelyének kódja]) Is Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Státusz típusa])="Központosított állomány")) OR (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Státusz típusa])="Központosított állomány") AND ((lkSzemélyek.[Dolgozó költséghelyének neve]) Is Null));

#/#/#/
lk_Ellenõrzés_02
#/#/
INSERT INTO t__Ellenõrzés_02 ( Tábla, Hiányzó_érték, Adóazonosító, [Álláshely azonosító], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Adójel )
SELECT lk_Ellenõrzés_01.Tábla, lk_Ellenõrzés_01.Hiányzó_érték, lk_Ellenõrzés_01.Adóazonosító, lk_Ellenõrzés_01.[Álláshely azonosító], lk_Ellenõrzés_01.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Adóazonosító]*1 AS Adójel
FROM lk_Ellenõrzés_01;

#/#/#/
lk_Ellenõrzés_02_táblába_adójelKonverzió
#/#/
UPDATE t__Ellenõrzés_02 SET t__Ellenõrzés_02.Adójel = CDbl([Adóazonosító]);

#/#/#/
lk_Ellenõrzés_02a
#/#/
INSERT INTO t__Ellenõrzés_02
SELECT lk_Ellenõrzés_01a.*
FROM lk_Ellenõrzés_01a;

#/#/#/
lk_Ellenõrzés_02b
#/#/
INSERT INTO t__Ellenõrzés_02
SELECT lk_Ellenõrzés_01b.*
FROM lk_Ellenõrzés_01b;

#/#/#/
lk_Ellenõrzés_02c
#/#/
INSERT INTO t__Ellenõrzés_02
SELECT lk_Ellenõrzés_01c.*
FROM lk_Ellenõrzés_01c;

#/#/#/
lk_Ellenõrzés_02d_Illetmény_nulla
#/#/
INSERT INTO t__Ellenõrzés_02 ( Tábla, Hiányzó_érték, Adóazonosító, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] )
SELECT lk_Ellenõrzés_01d_Illetmény_nulla.Tábla, lk_Ellenõrzés_01d_Illetmény_nulla.Hiányzó_érték, lk_Ellenõrzés_01d_Illetmény_nulla.Adójel AS Adóazonosító, lk_Ellenõrzés_01d_Illetmény_nulla.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM lk_Ellenõrzés_01d_Illetmény_nulla;

#/#/#/
lk_Ellenõrzés_02f_hiányzó_besorolás_megnevezés
#/#/
INSERT INTO t__Ellenõrzés_02 ( Tábla, Hiányzó_érték, Adóazonosító, [Álláshely azonosító], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] )
SELECT lk_Ellenõrzés_01f_hiányzó_besorolás_megnevezés.Tábla, lk_Ellenõrzés_01f_hiányzó_besorolás_megnevezés.Hiányzó_érték, lk_Ellenõrzés_01f_hiányzó_besorolás_megnevezés.Adóazonosító, lk_Ellenõrzés_01f_hiányzó_besorolás_megnevezés.[Álláshely azonosító], lk_Ellenõrzés_01f_hiányzó_besorolás_megnevezés.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM lk_Ellenõrzés_01f_hiányzó_besorolás_megnevezés;

#/#/#/
lk_Ellenõrzés_02g_MunkahelyCímHiánya
#/#/
INSERT INTO t__Ellenõrzés_02 ( Tábla, Adóazonosító, [Álláshely azonosító], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Adójel )
SELECT lk_Ellenõrzés_01g_MunkahelyCímHiánya.Tábla, lk_Ellenõrzés_01g_MunkahelyCímHiánya.Adóazonosító, lk_Ellenõrzés_01g_MunkahelyCímHiánya.[Álláshely azonosító], lk_Ellenõrzés_01g_MunkahelyCímHiánya.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lk_Ellenõrzés_01g_MunkahelyCímHiánya.Adójel
FROM lk_Ellenõrzés_01g_MunkahelyCímHiánya;

#/#/#/
lk_Ellenõrzés_02h_HivataliEmailHiánya
#/#/
INSERT INTO t__Ellenõrzés_02 ( Tábla, Hiányzó_érték, Adóazonosító, [Álláshely azonosító], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Adójel )
SELECT lk_Ellenõrzés_01h_HivataliEmailHiánya.Tábla, lk_Ellenõrzés_01h_HivataliEmailHiánya.Hiányzó_érték, [Adójel] & "" AS Adóazonosító, lk_Ellenõrzés_01h_HivataliEmailHiánya.[Státusz kódja] AS Kif1, lk_Ellenõrzés_01h_HivataliEmailHiánya.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lk_Ellenõrzés_01h_HivataliEmailHiánya.Adójel
FROM lk_Ellenõrzés_01h_HivataliEmailHiánya;

#/#/#/
lk_Ellenõrzés_03
#/#/
SELECT DISTINCT IIf([lkSzemélyek].[Fõosztály]="",IIf([lkSzemélyek_1].[Fõosztály]="",IIf([lkSzemélyek_2].[Fõosztály]="","-",[lkSzemélyek_2].[Fõosztály]),[lkSzemélyek_1].[Fõosztály]),[lkSzemélyek].[Fõosztály]) AS Fõosztály, IIf([lkSzemélyek].[osztály]="",IIf([lkSzemélyek_1].[osztály]="",IIf([lkSzemélyek_2].[osztály]="","-",[lkSzemélyek_2].[osztály]),[lkSzemélyek_1].[osztály]),[lkSzemélyek].[osztály]) AS Osztály, kt_azNexon_Adójel02.Név AS Név, t__Ellenõrzés_02.Hiányzó_érték AS [Hiányzó érték], t__Ellenõrzés_02.[Álláshely azonosító] AS [Státusz kód], kt_azNexon_Adójel02.NLink AS NLink, tNexonMezõk.Megjegyzés
FROM tNexonMezõk RIGHT JOIN ((lkSzemélyek AS lkSzemélyek_2 RIGHT JOIN (tJav_mezõk RIGHT JOIN (lkSzemélyek AS lkSzemélyek_1 RIGHT JOIN (lkSzemélyek RIGHT JOIN t__Ellenõrzés_02 ON lkSzemélyek.Adójel = t__Ellenõrzés_02.Adójel) ON lkSzemélyek_1.[Státusz kódja] = t__Ellenõrzés_02.[Álláshely azonosító]) ON tJav_mezõk.Eredeti = t__Ellenõrzés_02.Hiányzó_érték) ON lkSzemélyek_2.[Szervezeti egység kódja] = t__Ellenõrzés_02.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) LEFT JOIN kt_azNexon_Adójel02 ON t__Ellenõrzés_02.Adójel = kt_azNexon_Adójel02.Adójel) ON tNexonMezõk.azNexonMezõ = tJav_mezõk.azNexonMezõk
GROUP BY IIf([lkSzemélyek].[Fõosztály]="",IIf([lkSzemélyek_1].[Fõosztály]="",IIf([lkSzemélyek_2].[Fõosztály]="","-",[lkSzemélyek_2].[Fõosztály]),[lkSzemélyek_1].[Fõosztály]),[lkSzemélyek].[Fõosztály]), IIf([lkSzemélyek].[osztály]="",IIf([lkSzemélyek_1].[osztály]="",IIf([lkSzemélyek_2].[osztály]="","-",[lkSzemélyek_2].[osztály]),[lkSzemélyek_1].[osztály]),[lkSzemélyek].[osztály]), kt_azNexon_Adójel02.Név, t__Ellenõrzés_02.Hiányzó_érték, t__Ellenõrzés_02.[Álláshely azonosító], kt_azNexon_Adójel02.NLink, tNexonMezõk.Megjegyzés, t__Ellenõrzés_02.Adójel;

#/#/#/
lk_Ellenõrzés_aHavibólHiányzók
#/#/
SELECT lkSzemélyek.[Státusz kódja], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve]
FROM lkSzemélyek LEFT JOIN (SELECT Kormányhivatali_állomány.[Álláshely azonosító] FROM Kormányhivatali_állomány UNION SELECT Járási_állomány.[Álláshely azonosító] FROM Járási_állomány UNION SELECT Központosítottak.[Álláshely azonosító] FROM Központosítottak)  AS HaviÁlláshelyAz ON lkSzemélyek.[Státusz kódja] = HaviÁlláshelyAz.[Álláshely azonosító]
WHERE (((lkSzemélyek.[státusz neve])="Álláshely") AND ((HaviÁlláshelyAz.[Álláshely azonosító]) Is Null))
ORDER BY lkSzemélyek.BFKH, lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lk_Ellenõrzés_ÁlláshelyStátusza_StátuszbetöltésTípusa
#/#/
SELECT DISTINCT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, Álláshelyek.[Álláshely azonosító], Álláshelyek.[Álláshely státusza], lkSzemélyek.[Helyettesített dolgozó neve], tSzervezet.[Státuszbetöltés típusa]
FROM (Álláshelyek LEFT JOIN lkSzemélyek ON Álláshelyek.[Álláshely azonosító] = lkSzemélyek.[Státusz kódja]) LEFT JOIN tSzervezet ON lkSzemélyek.[Adóazonosító jel] = tSzervezet.[Szervezetmenedzsment kód]
WHERE (((Álláshelyek.[Álláshely státusza]) Like "betöltött *"));

#/#/#/
lk_Ellenõrzés_FEOR_kira
#/#/
SELECT bfkh([lkszemélyek].[Szervezeti egység kódja]) AS BFKH, lkJogviszonyok.Adójel, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.FEOR AS [NEXON FEOR], lkJogviszonyok.FEOR AS [KIRA FEOR], kt_azNexon_Adójel02.NLink
FROM (lkJogviszonyok LEFT JOIN lkSzemélyek ON lkJogviszonyok.Adójel=lkSzemélyek.Adójel) LEFT JOIN kt_azNexon_Adójel02 ON lkJogviszonyok.Adójel=kt_azNexon_Adójel02.Adójel
WHERE (((lkSzemélyek.FEOR) Not Like [lkJogviszonyok].[FEOR] & "*"));

#/#/#/
lk_Ellenõrzés_foglalkoztatás_01
#/#/
SELECT lk_Ellenõrzés_foglalkoztatás_havi.Adójel, lk_Ellenõrzés_foglalkoztatás_havi.Név, lk_Ellenõrzés_foglalkoztatás_személyek.Fõosztály, lk_Ellenõrzés_foglalkoztatás_személyek.Osztály, lk_Ellenõrzés_foglalkoztatás_havi.[Státusz típusa], lk_Ellenõrzés_foglalkoztatás_havi.Foglalkoztatás AS A, lk_Ellenõrzés_foglalkoztatás_személyek.Foglalkoztatás AS B, lk_Ellenõrzés_foglalkoztatás_havi.[Heti munkaórák száma] AS C, lk_Ellenõrzés_foglalkoztatás_személyek.[Heti óraszám] AS D, lk_Ellenõrzés_foglalkoztatás_havi.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] AS SzervezetAz
FROM lk_Ellenõrzés_foglalkoztatás_havi RIGHT JOIN lk_Ellenõrzés_foglalkoztatás_személyek ON lk_Ellenõrzés_foglalkoztatás_havi.Adójel = lk_Ellenõrzés_foglalkoztatás_személyek.Adójel
WHERE (((lk_Ellenõrzés_foglalkoztatás_havi.Név) Like "kovács*") AND ((lk_Ellenõrzés_foglalkoztatás_havi.[Státusz típusa])<>""));

#/#/#/
lk_Ellenõrzés_foglalkoztatás_02a_b
#/#/
SELECT lk_Ellenõrzés_foglalkoztatás_01.Adójel, lk_Ellenõrzés_foglalkoztatás_01.Név, lk_Ellenõrzés_foglalkoztatás_01.SzervezetAz, lk_Ellenõrzés_foglalkoztatás_01.Fõosztály, lk_Ellenõrzés_foglalkoztatás_01.Osztály, lk_Ellenõrzés_foglalkoztatás_01.[Státusz típusa], IIf([A]=[B],"-","Nexon/Foglalkozás/Foglalkozási viszony mezõ és a Nexon/Betöltött státuszok/Óraszám mezõk értékei nincsenek összhangban!") AS A_B, lk_Ellenõrzés_foglalkoztatás_01.A, lk_Ellenõrzés_foglalkoztatás_01.B, lk_Ellenõrzés_foglalkoztatás_01.C, lk_Ellenõrzés_foglalkoztatás_01.D
FROM lk_Ellenõrzés_foglalkoztatás_01
WHERE (((IIf([A]=[B],"-","Nexon/Foglalkozás/Foglalkozási viszony mezõ és a Nexon/Betöltött státuszok/Óraszám mezõk értékei nincsenek összhangban!"))<>"-"));

#/#/#/
lk_Ellenõrzés_foglalkoztatás_02c_a
#/#/
SELECT lk_Ellenõrzés_foglalkoztatás_01.Adójel, lk_Ellenõrzés_foglalkoztatás_01.Név, lk_Ellenõrzés_foglalkoztatás_01.SzervezetAz, lk_Ellenõrzés_foglalkoztatás_01.Fõosztály, lk_Ellenõrzés_foglalkoztatás_01.Osztály, lk_Ellenõrzés_foglalkoztatás_01.[Státusz típusa], IIf(IIf([C]=40,"T","R")=[A],"-","A Nexon/Foglalkozási/Foglalkozási viszony és a Szerzõdések/SZERZÕDÉS/KINEVEZÉS VERZIÓ ADATOK SZERKESZTÉSE\Elméleti ledolgozandó napi órakeret  mezõk értékei nincsenek összhangban!") AS C_D, lk_Ellenõrzés_foglalkoztatás_01.A, lk_Ellenõrzés_foglalkoztatás_01.B, lk_Ellenõrzés_foglalkoztatás_01.C, lk_Ellenõrzés_foglalkoztatás_01.D
FROM lk_Ellenõrzés_foglalkoztatás_01
WHERE (((lk_Ellenõrzés_foglalkoztatás_01.[Státusz típusa]) Not Like "Közpon*") AND ((IIf(IIf([C]=40,"T","R")=[A],"-","A Nexon/Foglalkozási/Foglalkozási viszony és a Szerzõdések/SZERZÕDÉS/KINEVEZÉS VERZIÓ ADATOK SZERKESZTÉSE\Elméleti ledolgozandó napi órakeret  mezõk értékei nincsenek összhangban!"))<>"-"));

#/#/#/
lk_Ellenõrzés_foglalkoztatás_02d_c
#/#/
SELECT lk_Ellenõrzés_foglalkoztatás_01.Adójel, lk_Ellenõrzés_foglalkoztatás_01.Név, lk_Ellenõrzés_foglalkoztatás_01.SzervezetAz, lk_Ellenõrzés_foglalkoztatás_01.Fõosztály, lk_Ellenõrzés_foglalkoztatás_01.Osztály, lk_Ellenõrzés_foglalkoztatás_01.[Státusz típusa], IIf([C]=[D],"-","Szerzõdések/SZERZÕDÉS/KINEVEZÉS VERZIÓ ADATOK SZERKESZTÉSE\Elméleti ledolgozandó napi órakeret és a  Nexon/Betöltött státuszok/Óraszám mezõk értékei nincsenek összhangban!") AS C_D, lk_Ellenõrzés_foglalkoztatás_01.A, lk_Ellenõrzés_foglalkoztatás_01.B, lk_Ellenõrzés_foglalkoztatás_01.C, lk_Ellenõrzés_foglalkoztatás_01.D
FROM lk_Ellenõrzés_foglalkoztatás_01
WHERE (((lk_Ellenõrzés_foglalkoztatás_01.[Státusz típusa]) Not Like "Közpon*") AND ((IIf([C]=[D],"-","Szerzõdések/SZERZÕDÉS/KINEVEZÉS VERZIÓ ADATOK SZERKESZTÉSE\Elméleti ledolgozandó napi órakeret és a  Nexon/Betöltött státuszok/Óraszám mezõk értékei nincsenek összhangban!"))<>"-"));

#/#/#/
lk_Ellenõrzés_foglalkoztatás_03
#/#/
SELECT Ellenõrzés.Fõosztály, Ellenõrzés.Osztály, Ellenõrzés.A_B AS [Hiba leírása], Ellenõrzés.Adójel, Ellenõrzés.Név, "" AS [Álláshely azonosító], kt_azNexon_Adójel.NLINK AS Link, "" AS Megjegyzés
FROM kt_azNexon_Adójel RIGHT JOIN (SELECT * FROM lk_Ellenõrzés_foglalkoztatás_02a_b  UNION ALL SELECT * FROM lk_Ellenõrzés_foglalkoztatás_02c_a  UNION ALL  SELECT * FROM lk_Ellenõrzés_foglalkoztatás_02d_c )  AS Ellenõrzés ON kt_azNexon_Adójel.Adójel = Ellenõrzés.Adójel
ORDER BY Ellenõrzés.Fõosztály;

#/#/#/
lk_Ellenõrzés_foglalkoztatás_emailcímek
#/#/
SELECT DISTINCT lk_Ellenõrzés_foglalkoztatás_03.TO AS Kif1
FROM lk_Ellenõrzés_foglalkoztatás_03;

#/#/#/
lk_Ellenõrzés_foglalkoztatás_havi
#/#/
SELECT Unió.Adójel, Unió.Név, Unió.[Járási Hivatal] AS Fõosztály, Unió.Mezõ7 AS Osztály, Unió.Foglalkoztatás, Unió.[Heti munkaórák száma], Unió.[Státusz típusa], Unió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Unió.Mezõ4 AS [Születési év], [Mezõ10] AS Belépés, *
FROM (SELECT Járási_állomány.Adóazonosító * 1 AS Adójel, Járási_állomány.Név, Járási_állomány.[Járási Hivatal], Járási_állomány.Mezõ7, right(Járási_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1) AS Foglalkoztatás, Járási_állomány.[Heti munkaórák száma], "Szervezeti alaplétszám" As [Státusz típusa], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Mezõ4, mezõ10
FROM Járási_állomány
WHERE Járási_állomány.Adóazonosító  <>""
UNION
SELECT Kormányhivatali_állomány.Adóazonosító * 1 AS Adójel, Kormányhivatali_állomány.Név, Kormányhivatali_állomány.Mezõ6, Kormányhivatali_állomány.Mezõ7, right(Kormányhivatali_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1),Kormányhivatali_állomány.[Heti munkaórák száma], "Szervezeti alaplétszám" As [Státusz típusa], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Mezõ4, Mezõ10
FROM  Kormányhivatali_állomány
WHERE Kormányhivatali_állomány.Adóazonosító  <>""
UNION SELECT Központosítottak.Adóazonosító * 1 AS Adójel, Központosítottak.Név, Központosítottak.Mezõ6, Központosítottak.Mezõ7, right(Központosítottak.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ],1), 0 As [Heti munkaórák száma],"Központosított állomány" As [Státusz típusa], [Nexon szótárelemnek megfelelõ szervezeti egység azonosító], Mezõ4, Mezõ11
FROM   Központosítottak
WHERE  Központosítottak.Adóazonosító <>"")  AS Unió;

#/#/#/
lk_Ellenõrzés_foglalkoztatás_személyek
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS [Heti óraszám], IIf([Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]=40,"T","R") AS Foglalkoztatás, lkSzemélyek.[Státusz típusa], lkSzemélyek.[Szervezeti egység kódja]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz típusa]) Is Not Null) AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null))
ORDER BY lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lk_Ellenõrzés_határozottak
#/#/
SELECT lkSzervezetSzemélyek.[Státuszbetöltés típusa], lkSzemélyek.[Szerzõdés/Kinevezés típusa], lkSzervezetSzemélyek.[Érvényesség kezdete], lkSzervezetSzemélyek.[Érvényesség vége], lkSzemélyek.[Dolgozó teljes neve], lkSzervezetSzemélyek.[Státuszának kódja], lkSzemélyek.[Státusz kódja], lkSzemélyek.[Helyettesített dolgozó neve], lkSzemélyek.[Státusz neve], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], lkSzemélyek.[Jogviszony vége (kilépés dátuma)]
FROM lkSzervezetSzemélyek LEFT JOIN lkSzemélyek ON lkSzervezetSzemélyek.Adójel=lkSzemélyek.Adójel
WHERE (((lkSzervezetSzemélyek.[Státuszbetöltés típusa])="Helyettes") AND ((lkSzervezetSzemélyek.[Érvényesség kezdete])<=Date()) AND ((lkSzervezetSzemélyek.[Érvényesség vége])>=Date() Or (lkSzervezetSzemélyek.[Érvényesség vége]) Is Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkSzervezetSzemélyek.[Státuszbetöltés típusa])="Általános") AND ((lkSzemélyek.[Szerzõdés/Kinevezés típusa])="határozott") AND ((lkSzervezetSzemélyek.[Érvényesség kezdete])<=Date()) AND ((lkSzervezetSzemélyek.[Érvényesség vége])>=Date() Or (lkSzervezetSzemélyek.[Érvényesség vége]) Is Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lk_Ellenõrzés_HiányzóÁlláshelyek
#/#/
SELECT Álláshelyek.[Álláshely azonosító], Álláshelyek.[Álláshely besorolási kategóriája], Álláshelyek.[Álláshely típusa]
FROM lkÁlláshelyAzonosítókHaviból LEFT JOIN Álláshelyek ON lkÁlláshelyAzonosítókHaviból.Álláshely = Álláshelyek.[Álláshely azonosító]
WHERE (((Álláshelyek.[Álláshely azonosító]) Is Null));

#/#/#/
lk_Ellenõrzés_hozzátartozó_hiány01
#/#/
SELECT Nz([lkHozzátartozók].[Szervezeti egység kódja],[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS SzervezetKód, lkHozzátartozók.[Dolgozó neve], lkHozzátartozók.Adójel AS [Dolgozó adóazonosító jele], lkHozzátartozók.[Hozzátartozó neve], lkHozzátartozók.[Hozzátartozó adóazonosító jele], lkHozzátartozók.[Születési hely], Trim([Anyja családi neve] & " " & [Anyja utóneve]) AS [Anyja neve], lkHozzátartozók.[Születési idõ], Trim(Replace(Nz([lkHozzátartozók].[Állandó lakcím],""),"Magyarország","")) AS GyermekÁllandó, Trim(Replace(Nz([lkHozzátartozók].[Tartózkodási lakcím],""),"Magyarország","")) AS GyermekTartózkodási, Replace(Nz([lkSzemélyek].[Állandó lakcím],""),"Magyarország, ","") AS SzülõÁllandó, Replace(Nz([lkszemélyek].[Tartózkodási lakcím],""),"Magyarország, ","") AS SzülõTartózkodási, lkKilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja], lkHozzátartozók.[Hozzátartozó TAJ száma]
FROM (lkHozzátartozók LEFT JOIN lkSzemélyek ON lkHozzátartozók.Adójel = lkSzemélyek.Adójel) LEFT JOIN lkKilépõk ON lkHozzátartozók.Adójel = lkKilépõk.Adójel
WHERE (((lkHozzátartozók.[Hozzátartozó neve]) Not Like "*elhalt*" And (lkHozzátartozók.[Hozzátartozó neve]) Not Like "*elhunyt*") AND ((lkHozzátartozók.[Születési idõ])>DateSerial(Year(Date())-18,1,1)) AND ((lkKilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja])>DateSerial(Year(Date()),1,1) Or (lkKilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja]) Is Null) AND ((lkHozzátartozók.[Otthoni e-mail cím]) Not Like "elhunyt*") AND ((Nz([tHozzátartozók].[Szervezeti egység kódja],[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ])) Is Not Null) AND ((lkSzemélyek.[Státusz típusa]) Like "Központosított állomány" Or (lkSzemélyek.[Státusz típusa]) Like "Szervezeti*") AND ((lkHozzátartozók.[Kapcsolat jellege])="Gyermek") AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkHozzátartozók.[Hozzátartozó neve]) Not Like "*elhalt*" And (lkHozzátartozók.[Hozzátartozó neve]) Not Like "*elhunyt*") AND ((lkHozzátartozók.[Születési idõ])>DateSerial(Year(Date())-18,1,1)) AND ((lkKilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja])>DateSerial(Year(Date()),1,1) Or (lkKilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja]) Is Null) AND ((lkHozzátartozók.[Otthoni e-mail cím]) Is Null) AND ((Nz([tHozzátartozók].[Szervezeti egység kódja],[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ])) Is Not Null) AND ((lkSzemélyek.[Státusz típusa]) Like "Központosított állomány" Or (lkSzemélyek.[Státusz típusa]) Like "Szervezeti*") AND ((lkHozzátartozók.[Kapcsolat jellege])="Gyermek") AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkHozzátartozók.[Hozzátartozó neve]) Not Like "*elhalt*" And (lkHozzátartozók.[Hozzátartozó neve]) Not Like "*elhunyt*") AND ((lkHozzátartozók.[Születési idõ])>DateSerial(Year(Date())-18,1,1)) AND ((lkKilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja])>DateSerial(Year(Date()),1,1) Or (lkKilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja]) Is Null) AND ((lkHozzátartozók.[Otthoni e-mail cím]) Not Like "elhunyt*") AND ((Nz([tHozzátartozók].[Szervezeti egység kódja],[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ])) Is Not Null) AND ((lkSzemélyek.[Státusz típusa]) Is Null) AND ((lkHozzátartozók.[Kapcsolat jellege])="Gyermek") AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkHozzátartozók.[Hozzátartozó neve]) Not Like "*elhalt*" And (lkHozzátartozók.[Hozzátartozó neve]) Not Like "*elhunyt*") AND ((lkHozzátartozók.[Születési idõ])>DateSerial(Year(Date())-18,1,1)) AND ((lkKilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja])>DateSerial(Year(Date()),1,1) Or (lkKilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja]) Is Null) AND ((lkHozzátartozók.[Otthoni e-mail cím]) Is Null) AND ((Nz([tHozzátartozók].[Szervezeti egység kódja],[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ])) Is Not Null) AND ((lkSzemélyek.[Státusz típusa]) Is Null) AND ((lkHozzátartozók.[Kapcsolat jellege])="Gyermek") AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkHozzátartozók.[Születési idõ];

#/#/#/
lk_Ellenõrzés_hozzátartozó_hiány02
#/#/
SELECT lk_Fõosztály_Osztály_lkSzemélyek.Fõosztály AS Fõosztály, lk_Fõosztály_Osztály_lkSzemélyek.Osztály AS Osztály, Unió.[Dolgozó neve] AS Név, Unió.[Hozzátartozó neve] AS [A hozzátartozó neve], Unió.[Születési idõ] AS [A születés ideje], Unió.HiányzóAdat AS [A hiányzó adat], kt_azNexon_Adójel02.NLink AS NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN (lk_Fõosztály_Osztály_lkSzemélyek RIGHT JOIN (SELECT lk_Ellenõrzés_hozzátartozó_hiány01.[SzervezetKód], lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó neve] ,          lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó adóazonosító jele]*1 as Adójel ,          tHozzátartozók.[Hozzátartozó neve] ,          tHozzátartozók.[Születési idõ] ,         "Hozzátartozó neve" as HiányzóAdat                FROM lk_Ellenõrzés_hozzátartozó_hiány01                WHERE lk_Ellenõrzés_hozzátartozó_hiány01.[Hozzátartozó neve] is null       UNION       SELECT lk_Ellenõrzés_hozzátartozó_hiány01.[SzervezetKód] ,          lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó neve] ,          lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó adóazonosító jele] ,          tHozzátartozók.[Hozzátartozó neve] ,          tHozzátartozók.[Születési idõ] ,         "Hozzátartozó adóazonosító jele" as HiányzóAdat              FROM lk_Ellenõrzés_hozzátartozó_hiány01                  WHERE lk_Ellenõrzés_hozzátartozó_hiány01.[Hozzátartozó adóazonosító jele] is null       UNION       SELECT lk_Ellenõrzés_hozzátartozó_hiány01.[SzervezetKód] ,          lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó neve] ,          lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó adóazonosító jele]*1 as Adójel ,          tHozzátartozók.[Hozzátartozó neve] ,          tHozzátartozók.[Születési idõ] ,          "Születési hely" as HiányzóAdat                 FROM lk_Ellenõrzés_hozzátartozó_hiány01                  WHERE lk_Ellenõrzés_hozzátartozó_hiány01.[Születési hely] is null        UNION       SELECT lk_Ellenõrzés_hozzátartozó_hiány01.[SzervezetKód] ,          lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó neve] ,          lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó adóazonosító jele]*1 as Adójel ,          tHozzátartozók.[Hozzátartozó neve] ,          tHozzátartozók.[Születési idõ] ,          "Anyja neve" as HiányzóAdat                 FROM lk_Ellenõrzés_hozzátartozó_hiány01                  WHERE lk_Ellenõrzés_hozzátartozó_hiány01.[Anyja neve] is null  OR trim(lk_Ellenõrzés_hozzátartozó_hiány01.[Anyja neve])=""       UNION       SELECT lk_Ellenõrzés_hozzátartozó_hiány01.[SzervezetKód] ,          lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó neve] ,          lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó adóazonosító jele]*1 as Adójel ,          tHozzátartozók.[Hozzátartozó neve] ,          tHozzátartozók.[Születési idõ] ,          "Születési idõ" as HiányzóAdat                 FROM lk_Ellenõrzés_hozzátartozó_hiány01                 WHERE lk_Ellenõrzés_hozzátartozó_hiány01.[Születési idõ] is null       UNION       SELECT lk_Ellenõrzés_hozzátartozó_hiány01.[SzervezetKód] ,           lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó neve] ,           lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó adóazonosító jele]*1 as Adójel ,           lk_Ellenõrzés_hozzátartozó_hiány01.[Hozzátartozó neve] ,           tHozzátartozók.[Születési idõ] ,           "Hozzátartozó állandó lakcíme" AS [Hiányzó adat]                  FROM lk_Ellenõrzés_hozzátartozó_hiány01                  WHERE lk_Ellenõrzés_hozzátartozó_hiány01.[GyermekÁllandó] Is Null Or lk_Ellenõrzés_hozzátartozó_hiány01.[GyermekÁllandó]=""       UNION       SELECT lk_Ellenõrzés_hozzátartozó_hiány01.[SzervezetKód] ,           lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó neve] ,           lk_Ellenõrzés_hozzátartozó_hiány01.[Dolgozó adóazonosító jele]*1 as Adójel ,           lk_Ellenõrzés_hozzátartozó_hiány01.[Hozzátartozó neve] ,           tHozzátartozók.[Születési idõ] ,           "Hozzátartozó TAJ" AS [Hiányzó adat]                  FROM lk_Ellenõrzés_hozzátartozó_hiány01                  WHERE lk_Ellenõrzés_hozzátartozó_hiány01.[Hozzátartozó TAJ száma] Is Null Or lk_Ellenõrzés_hozzátartozó_hiány01.[Hozzátartozó TAJ száma]=""        )  AS Unió ON lk_Fõosztály_Osztály_lkSzemélyek.[Szervezeti egység kódja] = Unió.SzervezetKód) ON kt_azNexon_Adójel02.Adójel = Unió.Adójel;

#/#/#/
lk_Ellenõrzés_kirahibák01
#/#/
SELECT lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkKiraHiba.Adójel, lkKiraHiba.Név, lkKiraHiba.Hiba, tKiraHibaüzenetek.Magyarázat
FROM (lkKiraHiba INNER JOIN lkSzemélyek ON lkKiraHiba.Adójel = lkSzemélyek.Adójel) LEFT JOIN tKiraHibaüzenetek ON lkKiraHiba.Hiba = tKiraHibaüzenetek.Hibaüzenet
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH, lkKiraHiba.Név;

#/#/#/
lk_Ellenõrzés_kirahibák02
#/#/
SELECT lk_Ellenõrzés_kirahibák01.BFKH, lk_Ellenõrzés_kirahibák01.Fõosztály, lk_Ellenõrzés_kirahibák01.Osztály, lk_Ellenõrzés_kirahibák01.Adójel, lk_Ellenõrzés_kirahibák01.Név, lk_Ellenõrzés_kirahibák01.Hiba, lk_Ellenõrzés_kirahibák01.Magyarázat, kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN lk_Ellenõrzés_kirahibák01 ON kt_azNexon_Adójel02.Adójel = lk_Ellenõrzés_kirahibák01.Adójel;

#/#/#/
lk_Ellenõrzés_munkakör_kira01
#/#/
SELECT bfkh(Nz([lkszemélyek].[Szervezeti egység kódja],"")) AS BFKH, IIf(Nz([Fõosztály],"")="","_Kilépett",[Fõosztály]) AS Fõoszt, lkSzemélyek.Osztály, lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Dolgozó szerzõdéses/kinevezéses munkaköre / kinevezési okmányban] AS [Nexon munkakör], lkJogviszonyok.[Munkakör megnevezése] AS [Kira munkakör], kt_azNexon_Adójel02.NLink
FROM lkJogviszonyok RIGHT JOIN (kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel) ON lkJogviszonyok.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely" Or (lkSzemélyek.[Státusz neve]) Is Null) AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus])="Munkaviszony"))
ORDER BY bfkh(Nz([lkszemélyek].[Szervezeti egység kódja],"")), IIf(Nz([Fõosztály],"")="","_Kilépett",[Fõosztály]), lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lk_Ellenõrzés_születésihely_kira_Statisztika
#/#/
SELECT Összesített.Fõoszt, Összesített.[Hibák száma], Összesített.Összlétszám, [Hibák száma]/[Összlétszám] AS Arány
FROM (SELECT Unió.Fõoszt, Sum(Unió.Hibás) AS [Hibák száma], Sum(Unió.Létszám) AS Összlétszám
FROM (SELECT lk_Ellenõrzés_születésihely_kira02.Fõoszt, Count(lk_Ellenõrzés_születésihely_kira02.Adójel) AS Hibás, 0 AS Létszám
FROM lk_Ellenõrzés_születésihely_kira02
GROUP BY lk_Ellenõrzés_születésihely_kira02.Fõoszt, 0
UNION
SELECT lkSzemélyek.Fõosztály, 0 AS Hibás, Count(lkSzemélyek.Adójel) AS CountOfAdójel
FROM lkSzemélyek
GROUP BY lkSzemélyek.Fõosztály, 0, lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely"))
)  AS Unió
GROUP BY Unió.Fõoszt
)  AS Összesített
GROUP BY Összesített.Fõoszt, Összesített.[Hibák száma], Összesített.Összlétszám, [Hibák száma]/[Összlétszám];

#/#/#/
lk_Ellenõrzés_születésihely_kira01
#/#/
SELECT bfkh(Nz([Szervezeti egység kódja],0)) AS bfkh, IIf(Nz([Fõosztály],"")="","_Kilépett",[Fõosztály]) AS Fõoszt, lkSzemélyek.Osztály, lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], Switch(Nz([Születési hely],"") Not Like "Budapest ##*","A születési hely nem a KIRA szabványos cím, azaz: 'Budapest' + szóköz + két számjegy a kerületnek :(",Len(Nz([Születési hely],""))<2,"Születési hely hiányzik") AS Hiba, Nz([Születési hely],"") AS [Születés helye], "Budapest " & Right("0" & num2num(Replace(Replace(Trim(Replace([Születési hely],"Budapest","")),"ker",""),".",""),99,10),2) AS Javasolt, kt_azNexon_Adójel02.NLink
FROM lkSzemélyek LEFT JOIN kt_azNexon_Adójel02 ON lkSzemélyek.Adójel = kt_azNexon_Adójel02.Adójel
WHERE (((Nz([Születési hely],"")) Not Like "Budapest ##*") AND ((lkSzemélyek.[Születési hely]) Like "*Budapest*") AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY bfkh(Nz([Szervezeti egység kódja],0)), IIf(Nz([Fõosztály],"")="","_Kilépett",[Fõosztály]), lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lk_Ellenõrzés_születésihely_kira01_hiány
#/#/
SELECT bfkh(Nz([Szervezeti egység kódja],0)) AS bfkh, IIf(Nz([Fõosztály],"")="","_Kilépett",[Fõosztály]) AS Fõoszt, lkSzemélyek.Osztály, lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], "A születési hely nincs kitöltve" AS Hiba, "" AS [Születési helye], "" AS Javasolt, kt_azNexon_Adójel02.NLink
FROM lkSzemélyek LEFT JOIN kt_azNexon_Adójel02 ON lkSzemélyek.Adójel = kt_azNexon_Adójel02.Adójel
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((Len(Nz([Születési hely],"")))<2))
ORDER BY bfkh(Nz([Szervezeti egység kódja],0)), IIf(Nz([Fõosztály],"")="","_Kilépett",[Fõosztály]), lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lk_Ellenõrzés_születésihely_kira02
#/#/
SELECT BudapestRomaiEsHiany.Fõosztály, BudapestRomaiEsHiany.Osztály, BudapestRomaiEsHiany.Név, BudapestRomaiEsHiany.Hiba, BudapestRomaiEsHiany.[Születési hely], BudapestRomaiEsHiany.Javaslat, BudapestRomaiEsHiany.NLink
FROM (SELECT
  lk_Ellenõrzés_születésihely_kira01.bfkh
, lk_Ellenõrzés_születésihely_kira01.Fõoszt AS Fõosztály
, lk_Ellenõrzés_születésihely_kira01.Osztály AS Osztály
, lk_Ellenõrzés_születésihely_kira01.[Dolgozó teljes neve] AS Név
, lk_Ellenõrzés_születésihely_kira01.Hiba
, lk_Ellenõrzés_születésihely_kira01.[Születés helye] AS [Születési hely]
, IIf([Javasolt] Like "*00*","-- nincs javaslat --",[Javasolt]) AS Javaslat
, lk_Ellenõrzés_születésihely_kira01.NLink AS NLink 
FROM lk_Ellenõrzés_születésihely_kira01
UNION
SELECT
  lk_Ellenõrzés_születésihely_kira01_hiány.bfkh
, lk_Ellenõrzés_születésihely_kira01_hiány.Fõoszt
, lk_Ellenõrzés_születésihely_kira01_hiány.Osztály
, lk_Ellenõrzés_születésihely_kira01_hiány.[Dolgozó teljes neve] as Név
, lk_Ellenõrzés_születésihely_kira01_hiány.Hiba
, lk_Ellenõrzés_születésihely_kira01_hiány.[Születési helye]
, "-- nincs javaslat --" as Javaslat
, lk_Ellenõrzés_születésihely_kira01_hiány.NLink
FROM lk_Ellenõrzés_születésihely_kira01_hiány
)  AS BudapestRomaiEsHiany
ORDER BY BudapestRomaiEsHiany.bfkh, BudapestRomaiEsHiany.Osztály, BudapestRomaiEsHiany.Név;

#/#/#/
lk_Fesz_03
#/#/
SELECT Unió01b_02.Azonosító, Unió01b_02.Fõosztály, Unió01b_02.Osztály, Unió01b_02.Név, Unió01b_02.TAJ, Unió01b_02.Szül, Unió01b_02.EüOsztály, Unió01b_02.[FEOR megnevezés], Unió01b_02.[Alk tipus], Unió01b_02.ADátum, Unió01b_02.Érvény, Unió01b_02.Korlátozás, Unió01b_02.[Orvosi vizsgálat idõpontja], Unió01b_02.[Orvosi vizsgálat típusa], Unió01b_02.[Orvosi vizsgálat eredménye], Unió01b_02.[Orvosi vizsgálat észrevételek], Unió01b_02.[Orvosi vizsgálat következõ idõpontja]
FROM (SELECT DISTINCT lkFesz_01b.*
FROM  lkFesz_01b
UNION
SELECT lkFesz_02.*
FROM lkFesz_02)  AS Unió01b_02;

#/#/#/
lk_Fõosztály_Osztály
#/#/
SELECT DISTINCT lkSzemélyek.[Szervezeti egység kódja] AS BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály
FROM lkSzemélyek;

#/#/#/
lk_Fõosztály_Osztály_lkSzemélyek
#/#/
SELECT DISTINCT lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, IIf(Nz([Osztály],"")="",0,IIf(utolsó([BFKH],".")="",0,utolsó([BFKH],"."))*1)+1 AS Sorszám
FROM lkSzemélyek;

#/#/#/
lk_Fõosztály_Osztály_tSzervezet
#/#/
SELECT bfkh(Nz([tSzervezet].[Szervezetmenedzsment kód],"")) AS bfkhkód, tSzervezet.[Szervezetmenedzsment kód], IIf(Nz([tSzervezet].[Szint],1)>6,Nz([tSzervezet_1].[Név],""),Nz([tSzervezet].[Név],"")) AS Fõosztály, IIf([tSzervezet].[Szint]>6,[tSzervezet].[Név],"") AS Osztály, Replace(IIf([tSzervezet].[Szint]>6,[tSzervezet_1].[Név],[tSzervezet].[Név]),"Budapest Fõváros Kormányhivatala","BFKH") AS Fõoszt
FROM tSzervezet AS tSzervezet_1 RIGHT JOIN tSzervezet ON tSzervezet_1.[Szervezetmenedzsment kód] = tSzervezet.[Szülõ szervezeti egységének kódja]
WHERE (((tSzervezet.OSZLOPOK)="szervezeti egység"))
ORDER BY bfkh(Nz([tSzervezet].[Szervezetmenedzsment kód],""));

#/#/#/
lk_Fõosztályonkénti_átlagilletmény01
#/#/
SELECT bfkh([FõosztályKód]) AS FK, lkSzemélyek.Fõosztály, Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40) AS Illetmény
FROM lkSzemélyek
GROUP BY bfkh([FõosztályKód]), lkSzemélyek.Fõosztály, lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lk_Fõosztályonkénti_átlagilletmény01_vezetõknélkül
#/#/
SELECT bfkh([FõosztályKód]) AS FK, lkSzemélyek.Fõosztály, Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40) AS Illetmény
FROM tBesorolás_átalakító INNER JOIN lkSzemélyek ON tBesorolás_átalakító.Besorolási_fokozat = lkSzemélyek.[Besorolási  fokozat (KT)]
WHERE (((tBesorolás_átalakító.Vezetõ)=No))
GROUP BY bfkh([FõosztályKód]), lkSzemélyek.Fõosztály, lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lk_Fõosztályonkénti_átlagilletmény02
#/#/
SELECT lk_Fõosztályonkénti_átlagilletmény01.Fõosztály AS Fõosztály, Round([Illetmény]/100,0)*100 AS Átlagilletmény
FROM lk_Fõosztályonkénti_átlagilletmény01
ORDER BY lk_Fõosztályonkénti_átlagilletmény01.[FK];

#/#/#/
lk_Fõosztályonkénti_átlagilletmény02_vezetõknélkül
#/#/
SELECT lk_Fõosztályonkénti_átlagilletmény01_vezetõknélkül.Fõosztály AS Fõosztály, Round([Illetmény]/100,0)*100 AS Átlagilletmény
FROM lk_Fõosztályonkénti_átlagilletmény01_vezetõknélkül
ORDER BY lk_Fõosztályonkénti_átlagilletmény01_vezetõknélkül.FK;

#/#/#/
lk_Garantált_bérminimum_alatti_02
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.[Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)] AS Illetmény, lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS [Heti munkaórák száma], lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], Nz([Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)],0)/IIf(Nz([Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker],0)=0,0.00001,[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker])*40 AS Bruttó_bér, IIf([Bruttó_bér]<326000,Yes,No) AS Garantált_min_alatt
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lk_Garantált_bérminimum_alatti_állománytáblából
#/#/
SELECT [Adóazonosító]*1 AS Adójel, lk_Állománytáblákból_Illetmények.Illetmény, lk_Állománytáblákból_Illetmények.[Heti munkaórák száma], lk_Állománytáblákból_Illetmények.[Álláshely azonosító], [Illetmény]/IIf(Nz([Heti munkaórák száma],0)=0,0.00001,[Heti munkaórák száma])*40 AS Bruttó_bér, IIf([Bruttó_bér]<326000,Yes,No) AS Garantált_min_alatt
FROM lk_Állománytáblákból_Illetmények;

#/#/#/
lk_Garantált_bérminimum_Illetmények
#/#/
SELECT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lk_Garantált_bérminimum_alatti_02.[Álláshely azonosító] AS [Státusz kód], lk_Garantált_bérminimum_alatti_02.Illetmény AS Illetmény, lk_Garantált_bérminimum_alatti_02.[Heti munkaórák száma] AS [Heti munkaórák száma], lk_Garantált_bérminimum_alatti_02.Bruttó_bér AS [Bruttó illetmény], lkSzemélyek.[KIRA jogviszony jelleg], lkSzemélyek.[Iskolai végzettség foka], lkSzemélyek.[Iskolai végzettség neve], kt_azNexon_Adójel02.NLink AS NLink, lkSzemélyek.[Tartós távollét típusa]
FROM (kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel) RIGHT JOIN lk_Garantált_bérminimum_alatti_02 ON lkSzemélyek.Adójel = lk_Garantált_bérminimum_alatti_02.Adójel
WHERE (((lk_Garantált_bérminimum_alatti_02.Garantált_min_alatt)=Yes))
ORDER BY lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lk_HavibólÁlláshelyek
#/#/
SELECT FedlaprólÁlláshelyekUnió.Tábla, FedlaprólÁlláshelyekUnió.Azonosító, FedlaprólÁlláshelyekUnió.[Az álláshely megynevezése], FedlaprólÁlláshelyekUnió.[Álláshely száma], *
FROM (SELECT *, "Alaplétszám" as Tábla
FROM FedlaprólLétszámtábla
UNION
SELECT *, "Központosított" as Tábla
FROM FedlaprólLétszámtábla2
)  AS FedlaprólÁlláshelyekUnió
ORDER BY FedlaprólÁlláshelyekUnió.Tábla, FedlaprólÁlláshelyekUnió.Azonosító;

#/#/#/
lk_Illetménysávok_és_illetmények_havi_alapján_01
#/#/
SELECT Bfkh([Szervezetkód]) AS BFKH, lk_Állománytáblákból_Illetmények.Szervezetkód, lk_Állománytáblákból_Illetmények.Adójel, tSzervezet.[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] AS besorolás, lk_Állománytáblákból_Illetmények.[Álláshely azonosító], tBesorolás_átalakító_1.[alsó határ], tBesorolás_átalakító_1.[felsõ határ], lk_Állománytáblákból_Illetmények.Illetmény, lk_Állománytáblákból_Illetmények.[Heti munkaórák száma], [Illetmény]/IIf([Heti munkaórák száma]=0,0.0001,[Heti munkaórák száma])*40 AS [40 órás illetmény], tBesorolás_átalakító_1.[Jogviszony típusa], lk_Állománytáblákból_Illetmények.Név, lk_Állománytáblákból_Illetmények.Fõosztály, lk_Állománytáblákból_Illetmények.Osztály, lk_Állománytáblákból_Illetmények.Adójel, lk_Állománytáblákból_Illetmények.BesorolásHavi
FROM tBesorolás_átalakító AS tBesorolás_átalakító_1 RIGHT JOIN (lk_Állománytáblákból_Illetmények RIGHT JOIN tSzervezet ON lk_Állománytáblákból_Illetmények.[Álláshely azonosító] = tSzervezet.[Szervezetmenedzsment kód]) ON tBesorolás_átalakító_1.[Az álláshely jelölése] = lk_Állománytáblákból_Illetmények.BesorolásHavi
WHERE ((([Illetmény]/IIf([Heti munkaórák száma]=0,0.0001,[Heti munkaórák száma])*40) Not Between [alsó határ] And [felsõ határ]));

#/#/#/
lk_Illetménysávok_és_illetmények_havi_alapján_02
#/#/
SELECT lk_Illetménysávok_és_illetmények_havi_alapján_01.Szervezetkód, lk_Illetménysávok_és_illetmények_havi_alapján_01.Fõosztály, lk_Illetménysávok_és_illetmények_havi_alapján_01.Név, lk_Illetménysávok_és_illetmények_havi_alapján_01.Adójel, lk_Illetménysávok_és_illetmények_havi_alapján_01.besorolás, lk_Illetménysávok_és_illetmények_havi_alapján_01.[alsó határ], lk_Illetménysávok_és_illetmények_havi_alapján_01.[felsõ határ], lk_Illetménysávok_és_illetmények_havi_alapján_01.Illetmény, lk_Illetménysávok_és_illetmények_havi_alapján_01.[Heti munkaórák száma], lk_Illetménysávok_és_illetmények_havi_alapján_01.[40 órás illetmény], lk_Illetménysávok_és_illetmények_havi_alapján_01.[Jogviszony típusa], kt_azNexon_Adójel02.Nlink AS Hivatkozás
FROM lk_Illetménysávok_és_illetmények_havi_alapján_01 LEFT JOIN kt_azNexon_Adójel02 ON lk_Illetménysávok_és_illetmények_havi_alapján_01.Adójel = kt_azNexon_Adójel02.Adójel
ORDER BY lk_Illetménysávok_és_illetmények_havi_alapján_01.BFKH;

#/#/#/
lk_Illetménysávok_és_illetmények_havi_alapján_03
#/#/
SELECT DISTINCT lk_Illetménysávok_és_illetmények_havi_alapján_02.Fõosztály, lk_Illetménysávok_és_illetmények_havi_alapján_02.Név, lk_Illetménysávok_és_illetmények_havi_alapján_02.besorolás, lk_Illetménysávok_és_illetmények_havi_alapján_02.[alsó határ], lk_Illetménysávok_és_illetmények_havi_alapján_02.[felsõ határ], lk_Illetménysávok_és_illetmények_havi_alapján_02.Illetmény, lk_Illetménysávok_és_illetmények_havi_alapján_02.[Heti munkaórák száma], lk_Illetménysávok_és_illetmények_havi_alapján_02.[40 órás illetmény], lk_Illetménysávok_és_illetmények_havi_alapján_02.[Jogviszony típusa], lk_Illetménysávok_és_illetmények_havi_alapján_02.Hivatkozás
FROM lk_Illetménysávok_és_illetmények_havi_alapján_02;

#/#/#/
lk_Illetménysávok_és_illetmények_összevontan
#/#/
SELECT  *
FROM lk_Illetménysávok_és_illetmények_havi_alapján_03
UNION SELECT *
FROM  lk_Illetménysávok_és_illetmények_személytörzs_alapján02;

#/#/#/
lk_Illetménysávok_és_illetmények_személytörzs_alapján
#/#/
SELECT lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.Fõosztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Adójel, lkSzemélyek.[Besorolási  fokozat (KT)], tBesorolás_átalakító.[alsó határ], tBesorolás_átalakító.[felsõ határ], lkSzemélyek.[Illetmény összesen kerekítés nélkül (eltérített)], lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS [Heti óraszám], [Illetmény összesen kerekítés nélkül (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40 AS [40 órás illetmény], tBesorolás_átalakító.[Jogviszony típusa], kt_azNexon_Adójel.NLink AS Hivatkozás
FROM (lkSzemélyek INNER JOIN tBesorolás_átalakító ON (lkSzemélyek.[Jogviszony típusa / jogviszony típus] = tBesorolás_átalakító.[Jogviszony típusa]) AND (lkSzemélyek.[Besorolási  fokozat (KT)] = tBesorolás_átalakító.Besorolási_fokozat)) LEFT JOIN kt_azNexon_Adójel ON lkSzemélyek.Adójel = kt_azNexon_Adójel.Adójel
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND (([Illetmény összesen kerekítés nélkül (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40) Not Between [alsó határ] And [felsõ határ]) AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Null Or (lkSzemélyek.[Jogviszony vége (kilépés dátuma)])>Date()))
ORDER BY lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lk_Illetménysávok_és_illetmények_személytörzs_alapján02
#/#/
SELECT lk_Illetménysávok_és_illetmények_személytörzs_alapján.Fõosztály, lk_Illetménysávok_és_illetmények_személytörzs_alapján.[Dolgozó teljes neve], lk_Illetménysávok_és_illetmények_személytörzs_alapján.[Besorolási  fokozat (KT)], lk_Illetménysávok_és_illetmények_személytörzs_alapján.[alsó határ], lk_Illetménysávok_és_illetmények_személytörzs_alapján.[felsõ határ], lk_Illetménysávok_és_illetmények_személytörzs_alapján.[Illetmény összesen kerekítés nélkül (eltérített)], lk_Illetménysávok_és_illetmények_személytörzs_alapján.[Heti óraszám], lk_Illetménysávok_és_illetmények_személytörzs_alapján.[40 órás illetmény], lk_Illetménysávok_és_illetmények_személytörzs_alapján.[Jogviszony típusa], lk_Illetménysávok_és_illetmények_személytörzs_alapján.Hivatkozás
FROM lk_Illetménysávok_és_illetmények_személytörzs_alapján LEFT JOIN lk_Illetménysávok_és_illetmények_havi_alapján_02 ON lk_Illetménysávok_és_illetmények_személytörzs_alapján.adójel = lk_Illetménysávok_és_illetmények_havi_alapján_02.adójel
WHERE (((lk_Illetménysávok_és_illetmények_havi_alapján_02.adójel) Is Null));

#/#/#/
lk_InaktívBetöltõkÉsÁlláshelyük
#/#/
SELECT [Szervezetmenedzsment kód]*1 AS Adójel, tSzervezeti.[Státuszának kódja], tSzervezeti.[Érvényesség kezdete], tSzervezeti.[Érvényesség vége]
FROM tSzervezeti
WHERE (((tSzervezeti.[Érvényesség kezdete])<(SELECT TOP 1 tHaviJelentésHatálya.hatálya
FROM tHaviJelentésHatálya
GROUP BY tHaviJelentésHatálya.hatálya
ORDER BY First(tHaviJelentésHatálya.[rögzítés]) DESC)) AND ((tSzervezeti.[Érvényesség vége])>(SELECT TOP 1 tHaviJelentésHatálya.hatálya
FROM tHaviJelentésHatálya
GROUP BY tHaviJelentésHatálya.hatálya
ORDER BY First(tHaviJelentésHatálya.[rögzítés]) DESC)) AND ((tSzervezeti.OSZLOPOK)="Státusz betöltés") AND ((tSzervezeti.[Státuszbetöltés típusa])="Inaktív"))
AND "######Azok számítanak inaktívnak, akik a Szervezeti alapriportban olyan sorral rendelkeznek, amelyikben a státuszbetöltés inaktív, és az érvényesség a havi létszámjelentés dátuma elõtt kezdõdött és azt követõen ér véget.#####"<>"";

#/#/#/
lk_IskolaiVégzettségMegoszlása_Fõosztályonként
#/#/
TRANSFORM Count(lkSzemélyek.azonosító) AS CountOfadójel
SELECT lkSzemélyek.FõosztályKód, lkSzemélyek.Fõosztály AS [Fõosztály ill hivatal]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Státusz típusa]) Is Not Null))
GROUP BY lkSzemélyek.FõosztályKód, lkSzemélyek.Fõosztály
ORDER BY lkSzemélyek.Fõosztály
PIVOT lkSzemélyek.[Iskolai végzettség foka] In ("","Általános iskola 8 osztály","Egyetemi /felsõfokú (MA/MsC) vagy osztatlan képz.","Éretts.biz.szakképes-vel,képesítõ biz.","Éretts.biz.Szakkép-vel,éretts.ép. iskr-ben szakkép","Érettségi biz. szakképesítés nélk (pl: gimn.ér.)","Felsõokt-i (felsõfokú) szakképzésben szerzett biz.","Fõiskolai vagy felsõfokú alapképzés (BA/BsC)okl.","Gimnázium","Szakiskola","Szakképzettség érettségi bizonyítvány nélkül","Szakközépiskola","Szakmunkásképzõ iskola","Technikum");

#/#/#/
lk_IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesen
#/#/
TRANSFORM Count(lkSzemélyek.azonosító) AS CountOfadójel
SELECT "BFKH.1" AS Kif1, "Összesen:" AS [Fõosztály ill hivatal]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Státusz típusa]) Is Not Null))
GROUP BY "Összesen:"
PIVOT lkSzemélyek.[Iskolai végzettség foka] In ("","Általános iskola 8 osztály","Egyetemi /felsõfokú (MA/MsC) vagy osztatlan képz.","Éretts.biz.szakképes-vel,képesítõ biz.","Éretts.biz.Szakkép-vel,éretts.ép. iskr-ben szakkép","Érettségi biz. szakképesítés nélk (pl: gimn.ér.)","Felsõokt-i (felsõfokú) szakképzésben szerzett biz.","Fõiskolai vagy felsõfokú alapképzés (BA/BsC)okl.","Gimnázium","Szakiskola","Szakképzettség érettségi bizonyítvány nélkül","Szakközépiskola","Szakmunkásképzõ iskola","Technikum");

#/#/#/
lk_IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel
#/#/
SELECT IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.[Fõosztály ill hivatal], IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.[<>], IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.[Általános iskola 8 osztály], IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.[Egyetemi /felsõfokú (MA/MsC) vagy osztatlan képz_], IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.[Éretts_biz_szakképes-vel,képesítõ biz_], IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.[Éretts_biz_Szakkép-vel,éretts_ép_ iskr-ben szakkép], IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.[Érettségi biz_ szakképesítés nélk (pl: gimn_ér_)], IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.[Felsõokt-i (felsõfokú) szakképzésben szerzett biz_], IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.[Fõiskolai vagy felsõfokú alapképzés (BA/BsC)okl_], IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.Gimnázium, IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.Szakiskola, IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.[Szakképzettség érettségi bizonyítvány nélkül], IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.Szakközépiskola, IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.[Szakmunkásképzõ iskola], IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.Technikum
FROM (SELECT * ,0 as sor
FROM  lk_IskolaiVégzettségMegoszlása_Fõosztályonként
UNION

SELECT *, 1 as sor
FROM lk_IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesen
)  AS IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel
ORDER BY IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.sor, IskolaiVégzettségMegoszlása_FõosztályonkéntÖsszesennel.FõosztályKód;

#/#/#/
lk_jogász_átlagilletmény
#/#/
SELECT DISTINCT lkSzemélyek.Fõosztály, Round(Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS Illetmény
FROM lkSzemélyek INNER JOIN tBesorolás_átalakító ON lkSzemélyek.[Besorolási  fokozat (KT)] = tBesorolás_átalakító.Besorolási_fokozat
WHERE (((lkSzemélyek.[Iskolai végzettség neve]) Like "*jog*") AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((tBesorolás_átalakító.Vezetõ)=No) AND ((lkSzemélyek.fõosztály) Like "*kerület*"))
GROUP BY lkSzemélyek.Fõosztály;

#/#/#/
lk_Jogviszony_jellege_01
#/#/
SELECT lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], Nz([Személytörzs],[KIRA jogviszony jelleg]) AS KIRA_, lkSzemélyek.[Jogviszony típusa / jogviszony típus] AS Nexon, IIf([KIRA_]<>[NEXON] Or [KIRA_] Is Null,1,0) AS hiba, kt_azNexon_Adójel02.NLink
FROM (kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel) LEFT JOIN tJogviszonyKonverzió ON lkSzemélyek.[KIRA jogviszony jelleg] = tJogviszonyKonverzió.KIRA
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lk_jogviszony_jellege_02
#/#/
SELECT lk_Jogviszony_jellege_01.Fõosztály, lk_Jogviszony_jellege_01.Osztály, lk_Jogviszony_jellege_01.[Dolgozó teljes neve], lk_Jogviszony_jellege_01.KIRA_ AS KIRA, lk_Jogviszony_jellege_01.Nexon, lk_Jogviszony_jellege_01.NLink
FROM lk_Jogviszony_jellege_01
WHERE (((lk_Jogviszony_jellege_01.hiba)=1))
ORDER BY lk_Jogviszony_jellege_01.BFKH;

#/#/#/
lk_jogviszony_jellege_02_régi
#/#/
SELECT lk_Jogviszony_jellege_01.BFKH, lk_Jogviszony_jellege_01.[Dolgozó teljes neve] AS Név, lk_Jogviszony_jellege_01.Fõosztály, lk_Jogviszony_jellege_01.Osztály, lk_Jogviszony_jellege_01.Kira, lk_Jogviszony_jellege_01.Nexon, lk_Jogviszony_jellege_01.NLink
FROM lk_Jogviszony_jellege_01
WHERE (((lk_Jogviszony_jellege_01.Nexon)<>[Kira]));

#/#/#/
lk_KiraHiba
#/#/
SELECT tKiraHiba.Azonosító, lkSzemélyek.[Szervezeti egység kódja], tSzervezetiEgységek.Fõosztály, tSzervezetiEgységek.Osztály, tKiraHiba.Adóazonosító, tKiraHiba.Név, tKiraHiba.Hiba
FROM (tKiraHiba LEFT JOIN lkSzemélyek ON tKiraHiba.Adóazonosító = lkSzemélyek.Adójel) LEFT JOIN tSzervezetiEgységek ON lkSzemélyek.[Szervezeti egység kódja] = tSzervezetiEgységek.[Szervezeti egység kódja]
WHERE (((tKiraHiba.Hiba) Like "*kitöltve*" Or (tKiraHiba.Hiba) Like "*kötelezõ*" Or (tKiraHiba.Hiba) Like "*nincs*") AND ((lkSzemélyek.[Státusz neve])="álláshely"))
ORDER BY bfkh(Nz([lkSzemélyek].[Szervezeti egység kódja],0)), tKiraHiba.Név;

#/#/#/
lk_KiraHiba_01
#/#/
SELECT bfkh([Szervezeti egység kódja]) AS BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, tKiraHiba.Adóazonosító, tKiraHiba.Név, lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.[Státusz kódja], tKiraHiba.Hiba
FROM tKiraHiba LEFT JOIN lkSzemélyek ON tKiraHiba.Adóazonosító = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Státusz kódja]) Like "S-*") AND ((tKiraHiba.Hiba) Not Like "A dolgozo*" And (tKiraHiba.Hiba) Not Like "2-es*" And (tKiraHiba.Hiba) Not Like "*AHELISMD*" And (tKiraHiba.Hiba) Not Like "A dolgozó új belépõként lett*"))
ORDER BY bfkh([Szervezeti egység kódja]);

#/#/#/
lk_KiraHiba_01_címzettek
#/#/
SELECT DISTINCT lk_KiraHiba_01.TO, Count(lk_KiraHiba_01.Adóazonosító) AS CountOfAdóazonosító
FROM lk_KiraHiba_01
GROUP BY lk_KiraHiba_01.TO;

#/#/#/
lk_Lekérdezésíró__Illetmény_nulla_01
#/#/
SELECT tJavítandóMezõnevek.azJavítandó, tNexonMezõk.[Nexon mezõ megnevezése], tJavítandóMezõnevek.Tábla, tJavítandóMezõnevek.Ellenõrzéshez, tJavítandóMezõnevek.Import, "AND ([" & [Ellenõrzéshez] & "].[" & [ÜresÁlláshelyMezõk] & "]<> 'üres állás' OR [" & [Ellenõrzéshez] & "].[" & [ÜresÁlláshelyMezõk] & "] is null ) " AS Üres, "SELECT '" & [Ellenõrzéshez] & "' as Tábla, 'Illetmény' As [Hiányzó érték], [" & [Adó] & "] As Adójel, [" & [SzervezetKód_mezõ] & "] As SzervezetKód FROM [" & [Ellenõrzéshez] & "] WHERE [" & [Import] & "]=0 " & [üres] AS [SQL], (Select import From tJavítandóMezõnevek as Belsõ where Belsõ.azNexonMezõk = 7 and Belsõ.Ellenõrzéshez = tJavítandóMezõnevek.Ellenõrzéshez) AS Adó
FROM tNexonMezõk RIGHT JOIN tJavítandóMezõnevek ON tNexonMezõk.azNexonMezõ = tJavítandóMezõnevek.azNexonMezõk
WHERE (((tNexonMezõk.[Nexon mezõ megnevezése])="Illetmény"));

#/#/#/
lk_Lekérdezésíró__Illetmény_nulla_02
#/#/
SELECT (Select count(azJavítandó) From lk_Lekérdezésíró__Illetmény_nulla_01 as Tmp where Tmp.azJavítandó <= külsõ.azJavítandó) AS Sorszám, külsõ.azJavítandó, külsõ.[Nexon mezõ megnevezése], külsõ.Tábla, külsõ.Ellenõrzéshez, külsõ.Import, külsõ.SQL, külsõ.Adó
FROM lk_Lekérdezésíró__Illetmény_nulla_01 AS külsõ;

#/#/#/
lk_Lekérdezésíró__Illetmény_nulla_03
#/#/
SELECT lk_Lekérdezésíró__Illetmény_nulla_02.Sorszám, lk_Lekérdezésíró__Illetmény_nulla_02.azJavítandó, lk_Lekérdezésíró__Illetmény_nulla_02.[Nexon mezõ megnevezése], lk_Lekérdezésíró__Illetmény_nulla_02.Tábla, lk_Lekérdezésíró__Illetmény_nulla_02.Ellenõrzéshez, lk_Lekérdezésíró__Illetmény_nulla_02.Import, [SQL] & IIf([Sorszám]<>(Select Max(Sorszám) From lk_Lekérdezésíró__Illetmény_nulla_02)," UNION ","") AS SQL1
FROM lk_Lekérdezésíró__Illetmény_nulla_02;

#/#/#/
lk_mérnök_átlagilletmény
#/#/
SELECT DISTINCT lkSzemélyek.Fõosztály, Round(Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS Illetmény
FROM lkSzemélyek INNER JOIN tBesorolás_átalakító ON lkSzemélyek.[Besorolási  fokozat (KT)] = tBesorolás_átalakító.Besorolási_fokozat
WHERE (((lkSzemélyek.[Iskolai végzettség neve]) Like "*mérnök*") AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((tBesorolás_átalakító.Vezetõ)=No) AND ((lkSzemélyek.fõosztály) Like "*kerület*"))
GROUP BY lkSzemélyek.Fõosztály;

#/#/#/
lk_Népegészségügy_átlagilletmény
#/#/
SELECT bfkh([Szervezeti egység kódja]) AS bfkh, lkSzemélyek.Fõosztály, IIf([KIRA feladat megnevezés]="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos","Tisztifõorvos",IIf([FEOR]="2225 - Védõnõ","Védõnõ","Egyéb")) AS Feladatkörök, Round(Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS Illetmény
FROM lkSzemélyek INNER JOIN tBesorolás_átalakító ON lkSzemélyek.[Besorolási  fokozat (KT)] = tBesorolás_átalakító.Besorolási_fokozat
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.Osztály)="Népegészségügyi Osztály") AND ((tBesorolás_átalakító.Vezetõ)=No))
GROUP BY bfkh([Szervezeti egység kódja]), lkSzemélyek.Fõosztály, IIf([KIRA feladat megnevezés]="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos","Tisztifõorvos",IIf([FEOR]="2225 - Védõnõ","Védõnõ","Egyéb"))
ORDER BY bfkh([Szervezeti egység kódja]);

#/#/#/
lk_Népegészségügy_átlagilletmény_tisztifõorvos
#/#/
SELECT DISTINCT lkSzemélyek.Adójel, lkSzemélyek.Fõosztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Anyja neve], Round([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40/100,0)*100 AS Illetmény
FROM lkSzemélyek INNER JOIN tBesorolás_átalakító ON lkSzemélyek.[Besorolási  fokozat (KT)] = tBesorolás_átalakító.Besorolási_fokozat
WHERE (((lkSzemélyek.[KIRA feladat megnevezés])="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos") AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.Osztály)="Népegészségügyi Osztály") AND ((tBesorolás_átalakító.Vezetõ)=No));

#/#/#/
lk_Népegészségügy_átlagilletményFeladatonként
#/#/
SELECT IIf([KIRA feladat megnevezés]="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos","Tisztifõorvos",IIf([FEOR]="2225 - Védõnõ","Védõnõ",IIf([Iskolai végzettség neve] Like "*járványügyi felügyelõ*","Járványügyi felügyelõ","Egyéb"))) AS Feladatkörök, Round(Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS Illetmény
FROM lkSzemélyek INNER JOIN tBesorolás_átalakító ON lkSzemélyek.[Besorolási  fokozat (KT)] = tBesorolás_átalakító.Besorolási_fokozat
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.Osztály)="Népegészségügyi Osztály") AND ((tBesorolás_átalakító.Vezetõ)=No))
GROUP BY IIf([KIRA feladat megnevezés]="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos","Tisztifõorvos",IIf([FEOR]="2225 - Védõnõ","Védõnõ",IIf([Iskolai végzettség neve] Like "*járványügyi felügyelõ*","Járványügyi felügyelõ","Egyéb")));

#/#/#/
lk_Népegészségügy_átlagilletményHivatalonként
#/#/
SELECT bfkh([Szervezeti egység kódja]) AS bfkh, lkSzemélyek.Fõosztály, Round(Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS Illetmény
FROM lkSzemélyek INNER JOIN tBesorolás_átalakító ON lkSzemélyek.[Besorolási  fokozat (KT)] = tBesorolás_átalakító.Besorolási_fokozat
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.Osztály)="Népegészségügyi Osztály") AND ((tBesorolás_átalakító.Vezetõ)=No))
GROUP BY bfkh([Szervezeti egység kódja]), lkSzemélyek.Fõosztály
ORDER BY bfkh([Szervezeti egység kódja]);

#/#/#/
lk_Osztályonkénti_átlagilletmény_hatóság, gyámügy
#/#/
SELECT bfkh([Szervezeti egység kódja]) AS bfkh, lkSzemélyek.Fõosztály, Round(Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS Illetmény, IIf([KIRA feladat megnevezés]="Szociális és gyámügyi feladatok","Gyámügyi feladatok","Hatósági feladatok") AS Feladatkör
FROM lkSzemélyek INNER JOIN tBesorolás_átalakító ON lkSzemélyek.[Besorolási  fokozat (KT)] = tBesorolás_átalakító.Besorolási_fokozat
WHERE (((lkSzemélyek.Osztály)="Hatósági és Gyámügyi Osztály") AND ((tBesorolás_átalakító.Vezetõ)=No) AND ((lkSzemélyek.[Elsõdleges feladatkör]) Not Like "15-Titkársági és igazgatási feladatok"))
GROUP BY bfkh([Szervezeti egység kódja]), lkSzemélyek.Fõosztály, IIf([KIRA feladat megnevezés]="Szociális és gyámügyi feladatok","Gyámügyi feladatok","Hatósági feladatok"), lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY bfkh([Szervezeti egység kódja]);

#/#/#/
lk_Osztályonkénti_átlagilletmény01
#/#/
SELECT bfkh([Szervezeti egység kódja]) AS bfkh, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40) AS Illetmény
FROM lkSzemélyek INNER JOIN tBesorolás_átalakító ON lkSzemélyek.[Besorolási  fokozat (KT)] = tBesorolás_átalakító.Besorolási_fokozat
WHERE (((tBesorolás_átalakító.Vezetõ)=No))
GROUP BY bfkh([Szervezeti egység kódja]), lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY bfkh([Szervezeti egység kódja]);

#/#/#/
lk_Osztályonkénti_átlagilletmény01_kerületiek
#/#/
SELECT bfkh([Szervezeti egység kódja]) AS bfkh, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40) AS Illetmény, lkSzemélyek.[Elsõdleges feladatkör] AS Feladatköre, Count(lkSzemélyek.[Adóazonosító jel]) AS Fõ
FROM lkSzemélyek INNER JOIN tBesorolás_átalakító ON lkSzemélyek.jel2 = tBesorolás_átalakító.[Az álláshely jelölése]
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((tBesorolás_átalakító.Vezetõ)=No))
GROUP BY bfkh([Szervezeti egység kódja]), lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Elsõdleges feladatkör]
HAVING (((lkSzemélyek.[Elsõdleges feladatkör]) Not Like "15-Titkársági és igazgatási feladatok"))
ORDER BY bfkh([Szervezeti egység kódja]);

#/#/#/
lk_Osztályonkénti_átlagilletmény02
#/#/
SELECT lk_Osztályonkénti_átlagilletmény01.Fõosztály, lk_Osztályonkénti_átlagilletmény01.Osztály, Round([Illetmény]/100,0)*100 AS Átlagilletmény
FROM lk_Osztályonkénti_átlagilletmény01;

#/#/#/
lk_Osztályonkénti_átlagilletmény02_kerületiek
#/#/
SELECT lk_Osztályonkénti_átlagilletmény01_kerületiek.bfkh, lk_Osztályonkénti_átlagilletmény01_kerületiek.Fõosztály, Left([Osztály],15) AS Osztályok, Round([Illetmény]/100,0)*100 AS Átlagilletmény, lk_Osztályonkénti_átlagilletmény01_kerületiek.Fõ
FROM lk_Osztályonkénti_átlagilletmény01_kerületiek
WHERE (((lk_Osztályonkénti_átlagilletmény01_kerületiek.Fõosztály) Like "bfkh*"));

#/#/#/
lk_Osztályonkénti_átlagilletmény03_kerületiek
#/#/
SELECT lk_Osztályonkénti_átlagilletmény02_kerületiek.Fõosztály, IIf([Osztályok]="Kormányablak Os","Kormányablak Osztály",IIf([Osztályok]="Foglalkoztatási","Foglalkoztatási Osztály",IIf([Osztályok]="Gyámügyi Osztál","Gyámügyi Osztály",IIf([Osztályok]="Hatósági és Gyá","Hatósági és Gyámügyi Osztály",IIf([Osztályok]="Hatósági Osztál","Hatósági Osztály",IIf([Osztályok]="Népegészségügyi","Népegészségügyi Osztály","")))))) AS Osztály, Round(Sum([Átlagilletmény]*[Fõ])/Sum([Fõ])/100,0)*100 AS Átlagilletmények
FROM lk_Osztályonkénti_átlagilletmény02_kerületiek
GROUP BY lk_Osztályonkénti_átlagilletmény02_kerületiek.Fõosztály, IIf([Osztályok]="Kormányablak Os","Kormányablak Osztály",IIf([Osztályok]="Foglalkoztatási","Foglalkoztatási Osztály",IIf([Osztályok]="Gyámügyi Osztál","Gyámügyi Osztály",IIf([Osztályok]="Hatósági és Gyá","Hatósági és Gyámügyi Osztály",IIf([Osztályok]="Hatósági Osztál","Hatósági Osztály",IIf([Osztályok]="Népegészségügyi","Népegészségügyi Osztály",""))))));

#/#/#/
lk_RefEmail_01
#/#/
SELECT tSzervezetiEgységek.azSzervezet, tSzervezetiEgységek.[Szervezeti egység kódja], tReferensek.azRef AS azRef, tReferensek.[Hivatali email], tSzervezetiEgységek.Fõosztály, tSzervezetiEgységek.Osztály
FROM (tSzervezetiEgységek LEFT JOIN ktReferens_SzervezetiEgység ON tSzervezetiEgységek.azSzervezet=ktReferens_SzervezetiEgység.azSzervezet) LEFT JOIN tReferensek ON ktReferens_SzervezetiEgység.azRef=tReferensek.azRef;

#/#/#/
lk_RefEmail_02
#/#/
SELECT lk_RefEmail_01.azSzervezet, lk_RefEmail_01.[Szervezeti egység kódja], lk_RefEmail_01.azRef, lk_RefEmail_01.[Hivatali email], (Select Count(Tmp.AzSzervezet)
    From lk_RefEmail_01 As Tmp
    Where Tmp.azRef <= lk_RefEmail_01.azRef
      AND Tmp.[Szervezeti egység kódja] =lk_RefEmail_01.[Szervezeti egység kódja]
   ) AS Sorszám, lk_RefEmail_01.Fõosztály, lk_RefEmail_01.Osztály
FROM lk_RefEmail_01;

#/#/#/
lk_RefEmail_03
#/#/
PARAMETERS Üssél_egy_entert Long;
TRANSFORM First(lk_RefEmail_02.[Hivatali email]) AS [FirstOfHivatali email]
SELECT lk_RefEmail_02.azSzervezet, lk_RefEmail_02.[Szervezeti egység kódja], lk_RefEmail_02.Fõosztály, lk_RefEmail_02.Osztály
FROM lk_RefEmail_02
GROUP BY lk_RefEmail_02.azSzervezet, lk_RefEmail_02.[Szervezeti egység kódja], lk_RefEmail_02.Fõosztály, lk_RefEmail_02.Osztály
PIVOT lk_RefEmail_02.Sorszám In (1,2,3,4,5,6);

#/#/#/
lk_RefEmail_04
#/#/
SELECT lk_RefEmail_03.azSzervezet, lk_RefEmail_03.[Szervezeti egység kódja], lk_RefEmail_03.Fõosztály, lk_RefEmail_03.Osztály, lk_RefEmail_03.[1], lk_RefEmail_03.[2], lk_RefEmail_03.[3], lk_RefEmail_03.[4], lk_RefEmail_03.[5], lk_RefEmail_03.[6], [1] & IIf(Nz([2],"")="","","; " & [2]) & IIf(Nz([3],"")="","","; " & [3]) & IIf(Nz([4],"")="","","; " & [4]) & IIf(Nz([5],"")="","","; " & [5]) & IIf(Nz([6],"")="","","; " & [6]) AS [TO]
FROM lk_RefEmail_03;

#/#/#/
lk_Szervezet_Referensei
#/#/
SELECT tSzervezetiEgységek.azSzervezet, tSzervezetiEgységek.Fõosztály, tSzervezetiEgységek.Osztály, tSzervezetiEgységek.[Szervezeti egység kódja], ktReferens_SzervezetiEgység.azRef
FROM ktReferens_SzervezetiEgység RIGHT JOIN tSzervezetiEgységek ON ktReferens_SzervezetiEgység.azSzervezet=tSzervezetiEgységek.azSzervezet;

#/#/#/
lk_TT_TTH_ellenõrzés_01
#/#/
SELECT Adóazonosító, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] AS SzervezetKód, [Álláshely azonosító], [Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Név
FROM Járási_állomány
WHERE  [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] <>""
UNION
SELECT Adóazonosító, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] AS SzervezetKód, [Álláshely azonosító], [Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Név
FROM Kormányhivatali_állomány
WHERE  [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] <>""
UNION SELECT Adóazonosító, [Nexon szótárelemnek megfelelõ szervezeti egység azonosító] AS SzervezetKód, [Álláshely azonosító], [Tartós távollévõ nincs helyettese (TT)/ tartós távollévõnek van ], [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Név
FROM Központosítottak
WHERE  [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] <>"";

#/#/#/
lk_TT_TTH_ellenõrzés_02a
#/#/
SELECT lk_TT_TTH_ellenõrzés_01.Név, [Adóazonosító]*1 AS Adójel, lk_TT_TTH_ellenõrzés_01.SzervezetKód, lk_TT_TTH_ellenõrzés_01.[Álláshely azonosító], lk_TT_TTH_ellenõrzés_01.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], lk_TT_TTH_ellenõrzés_01.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], IIf(InStr(1,[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h],"TTH"),1,0) AS TTH, IIf(InStr(1,[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h],"TTH"),0,1) AS TT
FROM lk_TT_TTH_ellenõrzés_01
WHERE (((IIf(InStr(1,[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h],"TTH"),1,0))=1));

#/#/#/
lk_TT_TTH_ellenõrzés_02b
#/#/
SELECT lkSzemélyek_1.[Dolgozó teljes neve] AS [Helyettesített neve], lkSzemélyek_1.Adójel AS [Helyettesített adójele], "A" AS Alaplétszám, Replace(Replace(IIf(InStr(1,[lkSzemélyek_1].[Szint 6 szervezeti egység név],"Budapest"),[lkSzemélyek_1].[Szint 6 szervezeti egység név],"Megyei"),"Budapest Fõváros Kormányhivatala","BFKH"),"  ","") AS Megyei_TT, Replace(Replace(IIf(InStr(1,[lkSzemélyek_1].[Szint 6 szervezeti egység név],"Budapest"),[lkSzemélyek_1].[Szint 6 szervezeti egység név],[lkSzemélyek_1].[Szint 6 szervezeti egység név]),"Budapest Fõváros Kormányhivatala","BFKH"),"  ","") AS Fõoszt_TT, lkSzemélyek_1.[Szint 6 szervezeti egység név], lkSzemélyek_1.[Szervezeti egység kódja] AS [Helyettesített szervezete], lkSzemélyek_1.[KIRA feladat megnevezés], lkSzemélyek_1.[Státusz kódja] AS [Helyettesített álláshelye], lkSzemélyek_1.[Tartós távollét típusa], lkSzemélyek_1.[Tartós távollét kezdete], lkSzemélyek_1.[Tartós távollét vége], lkSzemélyek_1.[Tartós távollét tervezett vége], lkSzemélyek.[Dolgozó teljes neve] AS [Helyettes neve], lkSzemélyek.Adójel AS [Helyettes adójele], "A" AS [Helyettes alaplétszám], lkSzemélyek.[Szervezeti egység kódja] AS [Helyettes szervezete], lkSzemélyek.[Státusz kódja] AS [Helyettes álláshelye], Replace(Replace(IIf(InStr(1,[lkSzemélyek].[Szint 6 szervezeti egység név],"Budapest"),[lkSzemélyek].[Szint 6 szervezeti egység név],"Megyei"),"Budapest Fõváros Kormányhivatala","BFKH"),"  ","") AS Megyei_TTH, Replace(Replace(IIf(InStr(1,[lkSzemélyek].[Szint 6 szervezeti egység név],"Budapest"),[lkSzemélyek].[Szint 6 szervezeti egység név],[lkSzemélyek].[Szint 6 szervezeti egység név]),"Budapest Fõváros Kormányhivatala","BFKH"),"  ","") AS Fõoszt_TTH, lkSzemélyek.[Szint 6 szervezeti egység név], lkSzemélyek.[Szervezeti egység kódja] AS [Helyettesítõ szervezete], lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.[Státusz kódja] AS Álláshely_TTH, lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], lkSzemélyek.[Jogviszony vége (kilépés dátuma)], lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)] AS Illetmény_TTH
FROM lkSzemélyek RIGHT JOIN lkSzemélyek AS lkSzemélyek_1 ON lkSzemélyek.[Helyettesített dolgozó neve] = lkSzemélyek_1.[Dolgozó teljes neve]
WHERE (((lkSzemélyek_1.[Tartós távollét típusa]) Is Not Null) And ((IIf(lkSzemélyek.[Helyettesített dolgozó neve]<>"",1,0))=1)) Or (((lkSzemélyek_1.[Tartós távollét típusa]) Not Like "") And ((IIf(lkSzemélyek.[Helyettesített dolgozó neve]<>"",1,0))=1));

#/#/#/
lk_TT_TTH_ellenõrzés_03
#/#/
SELECT tSzervezetiEgységek.Fõosztály, tSzervezetiEgységek.Osztály, lk_TT_TTH_ellenõrzés_02a.Név, lk_TT_TTH_ellenõrzés_02a.[Álláshely azonosító], lk_TT_TTH_ellenõrzés_02a.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], lk_TT_TTH_ellenõrzés_02a.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], lk_TT_TTH_ellenõrzés_02a.Adójel AS Adójel, kt_azNexon_Adójel.NLink AS Nlink
FROM (kt_azNexon_Adójel RIGHT JOIN (lk_TT_TTH_ellenõrzés_02a LEFT JOIN lk_TT_TTH_ellenõrzés_02b ON lk_TT_TTH_ellenõrzés_02a.Adójel = lk_TT_TTH_ellenõrzés_02b.[Helyettesített adójele]) ON kt_azNexon_Adójel.Adójel = lk_TT_TTH_ellenõrzés_02a.Adójel) INNER JOIN tSzervezetiEgységek ON lk_TT_TTH_ellenõrzés_02a.SzervezetKód = tSzervezetiEgységek.[Szervezeti egység kódja]
WHERE (((lk_TT_TTH_ellenõrzés_02b.[Helyettesített adójele]) Is Null) AND ((lk_TT_TTH_ellenõrzés_02a.TTH)=1));

#/#/#/
lk_TTösszevetéseSzemély_Havi
#/#/
SELECT Havi.Bfkh AS bfkh, Havi.Adójel, Havi.Név, Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS [Szervezeti egység], Havi.Osztály, Havi.Jogcíme AS [Inaktív állományba kerülés oka], Személyek.[Tartós távollét típusa], kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN ((SELECT [Adóazonosító]*1 AS Adójel, [lk_TT-sek].Név, [lk_TT-sek].[Járási Hivatal], [lk_TT-sek].Osztály, [lk_TT-sek].Jogcíme, BFKH FROM [lk_TT-sek])  AS Havi LEFT JOIN (SELECT lkSzemélyek.Adójel, lkSzemélyek.[Tartós távollét típusa] FROM lkSzemélyek)  AS Személyek ON Havi.Adójel = Személyek.Adójel) ON kt_azNexon_Adójel02.Adójel = Havi.Adójel
WHERE (((Személyek.[Tartós távollét típusa])<>[Jogcíme]))
ORDER BY Havi.Bfkh, Havi.Név;

#/#/#/
lk_TTösszevetéseSzemély_Havi_Statisztika
#/#/
SELECT bfkh([Szervezeti egység kódja]) AS BFKH, lk_TTösszevetéseSzemély_Havi.[Szervezeti egység], Count(lk_TTösszevetéseSzemély_Havi.Adójel) AS CountOfAdójel
FROM lkFõosztályok INNER JOIN lk_TTösszevetéseSzemély_Havi ON lkFõosztályok.Fõosztály=lk_TTösszevetéseSzemély_Havi.[Szervezeti egység]
GROUP BY bfkh([Szervezeti egység kódja]), lk_TTösszevetéseSzemély_Havi.[Szervezeti egység];

#/#/#/
lk_TT-sek
#/#/
SELECT Unió.Adóazonosító, Unió.Név, Unió.[Járási Hivatal], Unió.Osztály, Unió.Jogcíme, Unió.Kinevezés, bfkh([BFKHkód]) AS bfkh
FROM (SELECT Járási_állomány.Adóazonosító, Járási_állomány.Név, Járási_állomány.[Járási Hivatal], Járási_állomány.Mezõ7 as Osztály, Járási_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] as Jogcíme, Mezõ10 as Kinevezés,[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] as BFKHkód
FROM Járási_állomány
WHERE ((Len(Járási_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp])>"0"))
UNION
SELECT Kormányhivatali_állomány.Adóazonosító, Kormányhivatali_állomány.Név, Kormányhivatali_állomány.Mezõ6, Kormányhivatali_állomány.Mezõ7, Kormányhivatali_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Mezõ10, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM  Kormányhivatali_állomány
WHERE ((Len(Kormányhivatali_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp])>"0"))
UNION 
SELECT Központosítottak.Adóazonosító, Központosítottak.Név, Központosítottak.Mezõ6, Központosítottak.Mezõ7, Központosítottak.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp],Mezõ11, [Nexon szótárelemnek megfelelõ szervezeti egység azonosító]
FROM   Központosítottak
WHERE ((Len(Központosítottak.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp])>"0"))
)  AS Unió;

#/#/#/
lk_TT-sekFõosztályonként
#/#/
SELECT UnióÖsszeggel.Fõosztály AS Fõosztály, UnióÖsszeggel.[Tartósan távollévõk] AS [Tartósan távollévõk]
FROM (SELECT "1." as sor, Replace([lk_TT-sek].[Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS Fõosztály, Count([lk_TT-sek].Adóazonosító) AS [Tartósan távollévõk],  IIf(Left(Replace([bfkh],"BFKH.01.",""),2)="02",Left(Replace([bfkh],"BFKH.01.",""),5),Left(Replace([bfkh],"BFKH.01.",""),2)) as SzSz
FROM [lk_TT-sek]
WHERE ((([lk_TT-sek].Jogcíme)<>"Mentesítés munkáltató engedélye alapján"))
GROUP BY [lk_TT-sek].[Járási Hivatal], IIf(Left(Replace([bfkh],"BFKH.01.",""),2)="02",Left(Replace([bfkh],"BFKH.01.",""),5),Left(Replace([bfkh],"BFKH.01.",""),2))

UNION SELECT "2." as sor, "Összesen:" AS Fõosztály, Count([lk_TT-sek].Adóazonosító) AS [Tartósan távollévõk], "999" as SzSz
FROM [lk_TT-sek]
WHERE ((([lk_TT-sek].Jogcíme)<>"Mentesítés munkáltató engedélye alapján"))
GROUP BY "Összesen:")  AS UnióÖsszeggel
GROUP BY UnióÖsszeggel.Fõosztály, UnióÖsszeggel.[Tartósan távollévõk], UnióÖsszeggel.SzSz, UnióÖsszeggel.sor, UnióÖsszeggel.SzSz
ORDER BY UnióÖsszeggel.sor, UnióÖsszeggel.SzSz;

#/#/#/
lk_TT-TTH_ellenõrzés_02bb
#/#/
SELECT lk_TT_TTH_ellenõrzés_02b.[Helyettesített adójele] As Adójel, "TT" As Állapot
FROM lk_TT_TTH_ellenõrzés_02b
UNION select
lk_TT_TTH_ellenõrzés_02b_1.[Helyettes adójele], "TTH" As Állapot
FROM  lk_TT_TTH_ellenõrzés_02b AS lk_TT_TTH_ellenõrzés_02b_1;

#/#/#/
lk_végzettségenkénti_átlagilletmény00
#/#/
SELECT lkSzemélyek.[Iskolai végzettség neve] AS Végzettség, Round(Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS Illetmény
FROM lkSzemélyek
GROUP BY lkSzemélyek.[Iskolai végzettség neve], lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lk_végzettségenkénti_átlagilletmény01
#/#/
SELECT IIf([Iskolai végzettség neve] Like "*jog*","Jogász",IIf([Iskolai végzettség neve] Like "*informatik*","Informatikus",IIf([Iskolai végzettség neve] Like "*mérnök*","Mérnök",IIf([Iskolai végzettség neve] Like "*orvos*","Orvos",IIf([Iskolai végzettség neve] Like "*közgazd*","Közgazdász",[Iskolai végzettség neve]))))) AS Végzettség, Round(Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)\100,0)*100 AS Illetmény
FROM lkSzemélyek
GROUP BY IIf([Iskolai végzettség neve] Like "*jog*","Jogász",IIf([Iskolai végzettség neve] Like "*informatik*","Informatikus",IIf([Iskolai végzettség neve] Like "*mérnök*","Mérnök",IIf([Iskolai végzettség neve] Like "*orvos*","Orvos",IIf([Iskolai végzettség neve] Like "*közgazd*","Közgazdász",[Iskolai végzettség neve]))))), lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lk2019ótaAGyámraBelépettek
#/#/
SELECT lkBelépõkUnió.Adójel, lkBelépõkUnió.Név, IIf(Len([lkszemélyek].[Fõosztály])<1,"--",[lkszemélyek].[Fõosztály]) AS [Jelenlegi fõosztálya], ([lkszemélyek].[Osztály]) AS [Jelenlegi osztálya], lkKilépõUnió.Fõosztály, lkKilépõUnió.Osztály, lkBelépõkUnió.[Jogviszony kezdõ dátuma] AS Belépés, lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja] AS Kilépés
FROM lkSzemélyek RIGHT JOIN (lkBelépõkUnió LEFT JOIN lkKilépõUnió ON lkBelépõkUnió.Adójel = lkKilépõUnió.Adójel) ON lkSzemélyek.Adójel = lkBelépõkUnió.Adójel
WHERE (((lkBelépõkUnió.Fõosztály) Like "Gyám*") AND ((lkBelépõkUnió.Osztály) Like "gyám*") AND ((lkBelépõkUnió.[Jogviszony kezdõ dátuma])>#1/1/2019#) AND ((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja])>[lkBelépõkUnió].[Jogviszony kezdõ dátuma] Or (lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja]) Is Null));

#/#/#/
lk2019ótaAGyámügyrõlKilépettek
#/#/
SELECT DISTINCT lkKilépõUnió.Adójel, lkKilépõUnió.Név, "--" AS [Jelenlegi fõosztálya], "" AS [Jelenlegi osztálya], lkKilépõUnió.Fõosztály, lkKilépõUnió.Osztály, lkKilépõUnió.[Jogviszony kezdõ dátuma] AS Belépés, lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja] AS Kilépés
FROM lkKilépõUnió
WHERE (((lkKilépõUnió.Fõosztály) Like "Gyám*") AND ((lkKilépõUnió.Osztály) Like "*gyám*") AND ((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja])>#1/1/2019#))
ORDER BY lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja] DESC;

#/#/#/
lk25ÉletévüketBeNemTöltöttekLétszáma
#/#/
SELECT 5 AS Sor, "25 évnél fiatalabbak létszáma:" AS Adat, Sum([25Max].fõ) AS Érték, Sum([25Max].TTnélkül) AS nemTT
FROM (SELECT DISTINCT lkSzemélyek.Adójel, 1 AS Fõ, Abs([Tartós távollét típusa] Is Null) AS TTnélkül FROM lkSzemélyek WHERE lkSzemélyek.[Születési idõ]>DateSerial(Year(Now())-25,Month(Now()),Day(Now())) AND lkSzemélyek.[Státusz neve]="Álláshely")  AS 25Max
GROUP BY 5, "25 évnél fiatalabbak létszáma:";

#/#/#/
lk25ÉvnélIdõsebbGyermekHozzátartozók
#/#/
SELECT lkHozzátartozók.[Szervezeti egység neve], lkHozzátartozók.[Dolgozó neve], lkHozzátartozók.[Dolgozó adóazonosító jele], lkHozzátartozók.[Kapcsolat jellege], lkHozzátartozók.[Hozzátartozó neve], lkHozzátartozók.[Születési idõ]
FROM lkHozzátartozók
WHERE (((lkHozzátartozók.[Kapcsolat jellege])<>"házastárs" And (lkHozzátartozók.[Kapcsolat jellege])<>"nagykorú hozzátartozó") AND ((lkHozzátartozók.[Születési idõ])<DateAdd("yyyy",-25,Date())));

#/#/#/
lk4Talapján
#/#/
SELECT lkMentességek.Azonosító, lkMentességek.[Szervezet név], lkMentességek.[Szervezet telephely sorszám], lkMentességek.[Név elõtag], lkMentességek.Családnév, lkMentességek.Utónév, lkMentességek.[Név utótag], lkMentességek.[Email cím], lkMentességek.[Születési név], lkSzemélyek.[Dolgozó születési neve], lkMentességek.[Születési hely], lkSzemélyek.[Születési hely], lkMentességek.[Születési idõ], lkSzemélyek.[Születési idõ], lkMentességek.[Anyja neve], lkSzemélyek.[Anyja neve], lkMentességek.Mentesség, lkMentességek.[Jogviszony idõszak kezdete], lkMentességek.[Jogviszony idõszak vége], lkMentességek.Név, lkMentességek.SzülHely, lkSzemélyek.[Besorolási  fokozat (KT)]
FROM lkMentességek LEFT JOIN lkSzemélyek ON (lkMentességek.[Születési név] like "*" & lkSzemélyek.[Dolgozó születési neve] & "*") AND (lkSzemélyek.[Születési hely] LIKE "*" & lkMentességek.[SzülHely]  &"*") AND (lkMentességek.[Születési idõ] = lkSzemélyek.[Születési idõ]) AND (lkMentességek.[Anyja neve] like "*" & lkSzemélyek.[Anyja neve] & "*")
WHERE IIf([Válaszolj "i"-t, ha csak a vezetõket szeretnéd]="i",[Besorolási  fokozat (KT)]="osztályvezetõ" Or [Besorolási  fokozat (KT)] Like "kerületi*" Or [Besorolási  fokozat (KT)] Like "*igazgató*" Or [Besorolási  fokozat (KT)] Like "fõosztály*" Or [Besorolási  fokozat (KT)]="fõispán",[Besorolási  fokozat (KT)] Like "*")
ORDER BY LCase(Replace(Nz([Besorolási  fokozat (KT)],""),"Járási / ","")) & IIf(Nz([Tartós távollét típusa],"")<>""," (TT)","");

#/#/#/
lk55ÉletévüketBetöltöttekLétszáma
#/#/
SELECT 6 AS Sor, "55 évnél idõsebbek létszáma:" AS Adat, Sum(MIN56.Fõ) AS Érték, Sum(MIN56.TTnélkül) AS nemTT
FROM (SELECT DISTINCT lkSzemélyek.Adójel, 1 AS Fõ, Abs([Tartós távollét típusa] Is Null) AS TTnélkül FROM lkSzemélyek WHERE (((lkSzemélyek.[Születési idõ])<DateSerial(Year(Now())-55,Month(Now()),Day(Now()))) AND ((lkSzemélyek.[Státusz neve])="Álláshely")))  AS MIN56
GROUP BY "55 évnél idõsebbek létszáma:";

#/#/#/
lkAdatváltozásiIgényekElbírálatlanok
#/#/
SELECT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkAdatváltoztatásiIgények.[Dolgozó neve] AS Név, lkAdatváltoztatásiIgények.Állapot AS Állapot, lkAdatváltoztatásiIgények.Adatkör, dtátal([Igény dátuma]) AS [Igény kelte], kt_azNexon_Adójel02.NLink AS NLink
FROM (lkAdatváltoztatásiIgények LEFT JOIN lkSzemélyek ON lkAdatváltoztatásiIgények.Adójel = lkSzemélyek.Adójel) LEFT JOIN kt_azNexon_Adójel02 ON lkAdatváltoztatásiIgények.Adójel = kt_azNexon_Adójel02.Adójel
WHERE (((lkAdatváltoztatásiIgények.Állapot)="Elbírálatlan"))
ORDER BY lkSzemélyek.BFKH, lkAdatváltoztatásiIgények.[Dolgozó neve], lkSzemélyek.[Státusz kódja];

#/#/#/
lkAdatváltozásiIgényekElbírálatlanokUNIXtime
#/#/
SELECT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkAdatváltoztatásiIgények.[Dolgozó neve] AS Név, lkAdatváltoztatásiIgények.Állapot AS Állapot, lkAdatváltoztatásiIgények.Adatkör, Format(DateAdd("s",[Igény dátuma]/1000,#1/1/1970#),"yyyy/mm/dd") AS [Igény kelte], kt_azNexon_Adójel02.NLink AS NLink
FROM (lkAdatváltoztatásiIgények LEFT JOIN lkSzemélyek ON lkAdatváltoztatásiIgények.Adójel = lkSzemélyek.Adójel) LEFT JOIN kt_azNexon_Adójel02 ON lkAdatváltoztatásiIgények.Adójel = kt_azNexon_Adójel02.Adójel
WHERE (((lkAdatváltoztatásiIgények.Állapot)="Elbírálatlan"))
ORDER BY lkSzemélyek.BFKH, lkAdatváltoztatásiIgények.[Dolgozó neve], lkSzemélyek.[Státusz kódja];

#/#/#/
lkAdatváltoztatásiIgények
#/#/
SELECT tAdatváltoztatásiIgények.Azonosító, tAdatváltoztatásiIgények.[Dolgozó neve], tAdatváltoztatásiIgények.[Adóazonosító jel], tAdatváltoztatásiIgények.Adatkör, tAdatváltoztatásiIgények.[Igény dátuma], tAdatváltoztatásiIgények.Állapot, tAdatváltoztatásiIgények.[Elbírálás dátuma], tAdatváltoztatásiIgények.Elbíráló, [Adóazonosító jel]*1 AS Adójel
FROM tAdatváltoztatásiIgények;

#/#/#/
lkAdHocKerületek01
#/#/
SELECT DISTINCT Switch([Végzettség neve] Like "*tiszti*orvos*","tisztiorvos",[Végzettség neve] Like "*védõnõ*","védõnõ",[Végzettség neve] Like "*járványügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*közegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*népegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*egészségnevelõ*","egészségnevelõ",[KIRA feladat megnevezés]="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos","tisztiorvos") AS Csoport, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[KIRA feladat megnevezés], Replace([Végzettségei],"nem ismert, ","") AS Végzettsége, [Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40 AS Illetmény
FROM lkDolgozókVégzettségeiFelsorolás04 RIGHT JOIN (lkVégzettségek RIGHT JOIN lkSzemélyek ON lkVégzettségek.Adójel = lkSzemélyek.Adójel) ON lkDolgozókVégzettségeiFelsorolás04.Adójel = lkSzemélyek.Adójel
WHERE (((Switch([Végzettség neve] Like "*tiszti*orvos*","tisztiorvos",[Végzettség neve] Like "*védõnõ*","védõnõ",[Végzettség neve] Like "*járványügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*közegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*népegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*egészségnevelõ*","egészségnevelõ",[KIRA feladat megnevezés]="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos","tisztiorvos")) Is Not Null) AND ((lkSzemélyek.Fõosztály) Like "* II.*")) OR (((Switch([Végzettség neve] Like "*tiszti*orvos*","tisztiorvos",[Végzettség neve] Like "*védõnõ*","védõnõ",[Végzettség neve] Like "*járványügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*közegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*népegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*egészségnevelõ*","egészségnevelõ",[KIRA feladat megnevezés]="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos","tisztiorvos")) Is Not Null) AND ((lkSzemélyek.Fõosztály) Like "* V.*")) OR (((Switch([Végzettség neve] Like "*tiszti*orvos*","tisztiorvos",[Végzettség neve] Like "*védõnõ*","védõnõ",[Végzettség neve] Like "*járványügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*közegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*népegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*egészségnevelõ*","egészségnevelõ",[KIRA feladat megnevezés]="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos","tisztiorvos")) Is Not Null) AND ((lkSzemélyek.Fõosztály) Like "* VI.*")) OR (((Switch([Végzettség neve] Like "*tiszti*orvos*","tisztiorvos",[Végzettség neve] Like "*védõnõ*","védõnõ",[Végzettség neve] Like "*járványügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*közegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*népegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*egészségnevelõ*","egészségnevelõ",[KIRA feladat megnevezés]="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos","tisztiorvos")) Is Not Null) AND ((lkSzemélyek.Fõosztály) Like "* X.*")) OR (((Switch([Végzettség neve] Like "*tiszti*orvos*","tisztiorvos",[Végzettség neve] Like "*védõnõ*","védõnõ",[Végzettség neve] Like "*járványügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*közegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*népegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*egészségnevelõ*","egészségnevelõ",[KIRA feladat megnevezés]="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos","tisztiorvos")) Is Not Null) AND ((lkSzemélyek.Fõosztály) Like "* XI.*")) OR (((Switch([Végzettség neve] Like "*tiszti*orvos*","tisztiorvos",[Végzettség neve] Like "*védõnõ*","védõnõ",[Végzettség neve] Like "*járványügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*közegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*népegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*egészségnevelõ*","egészségnevelõ",[KIRA feladat megnevezés]="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos","tisztiorvos")) Is Not Null) AND ((lkSzemélyek.Fõosztály) Like "* XIV.*")) OR (((Switch([Végzettség neve] Like "*tiszti*orvos*","tisztiorvos",[Végzettség neve] Like "*védõnõ*","védõnõ",[Végzettség neve] Like "*járványügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*közegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*népegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*egészségnevelõ*","egészségnevelõ",[KIRA feladat megnevezés]="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos","tisztiorvos")) Is Not Null) AND ((lkSzemélyek.Fõosztály) Like "* XXI.*")) OR (((lkSzemélyek.Fõosztály) Like "* II.*") AND ((lkSzemélyek.[KIRA feladat megnevezés]) Like "*tiszti*orvos*" And (lkSzemélyek.[KIRA feladat megnevezés])<>"Fõosztályvezetõi feladatok (több szakmai területet magában foglaló szervezeti egységeknél, ha nem fõállatorvos vagy tisztifõorvos)")) OR (((lkSzemélyek.Fõosztály) Like "* V.*") AND ((lkSzemélyek.[KIRA feladat megnevezés]) Like "*tiszti*orvos*" And (lkSzemélyek.[KIRA feladat megnevezés])<>"Fõosztályvezetõi feladatok (több szakmai területet magában foglaló szervezeti egységeknél, ha nem fõállatorvos vagy tisztifõorvos)")) OR (((lkSzemélyek.Fõosztály) Like "* VI.*") AND ((lkSzemélyek.[KIRA feladat megnevezés]) Like "*tiszti*orvos*" And (lkSzemélyek.[KIRA feladat megnevezés])<>"Fõosztályvezetõi feladatok (több szakmai területet magában foglaló szervezeti egységeknél, ha nem fõállatorvos vagy tisztifõorvos)")) OR (((lkSzemélyek.Fõosztály) Like "* X.*") AND ((lkSzemélyek.[KIRA feladat megnevezés]) Like "*tiszti*orvos*" And (lkSzemélyek.[KIRA feladat megnevezés])<>"Fõosztályvezetõi feladatok (több szakmai területet magában foglaló szervezeti egységeknél, ha nem fõállatorvos vagy tisztifõorvos)")) OR (((lkSzemélyek.Fõosztály) Like "* XI.*") AND ((lkSzemélyek.[KIRA feladat megnevezés]) Like "*tiszti*orvos*" And (lkSzemélyek.[KIRA feladat megnevezés])<>"Fõosztályvezetõi feladatok (több szakmai területet magában foglaló szervezeti egységeknél, ha nem fõállatorvos vagy tisztifõorvos)")) OR (((lkSzemélyek.Fõosztály) Like "* XIV.*") AND ((lkSzemélyek.[KIRA feladat megnevezés]) Like "*tiszti*orvos*" And (lkSzemélyek.[KIRA feladat megnevezés])<>"Fõosztályvezetõi feladatok (több szakmai területet magában foglaló szervezeti egységeknél, ha nem fõállatorvos vagy tisztifõorvos)")) OR (((lkSzemélyek.Fõosztály) Like "* XXI.*") AND ((lkSzemélyek.[KIRA feladat megnevezés]) Like "*tiszti*orvos*" And (lkSzemélyek.[KIRA feladat megnevezés])<>"Fõosztályvezetõi feladatok (több szakmai területet magában foglaló szervezeti egységeknél, ha nem fõállatorvos vagy tisztifõorvos)"))
ORDER BY Switch([Végzettség neve] Like "*tiszti*orvos*","tisztiorvos",[Végzettség neve] Like "*védõnõ*","védõnõ",[Végzettség neve] Like "*járványügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*közegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*népegészségügyi*","járványügyifelügyelõ",[Végzettség neve] Like "*egészségnevelõ*","egészségnevelõ",[KIRA feladat megnevezés]="Népegészségügyi feladatok, tisztifõorvos, tisztiorvos","tisztiorvos");

#/#/#/
lkAdHocKerületek02
#/#/
SELECT DISTINCT lkAdHocKerületek01.Adójel, lkAdHocKerületek01.Név, lkAdHocKerületek01.[KIRA feladat megnevezés], lkAdHocKerületek01.Fõosztály, lkAdHocKerületek01.Csoport
FROM lkAdHocKerületek01
ORDER BY lkAdHocKerületek01.Név;

#/#/#/
lkAGyámonJelenlegDolgozók
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály AS [Jelenlegi fõosztálya], lkSzemélyek.Osztály AS [Jelenlegi osztálya], BelépõkUnió.Fõosztály, BelépõkUnió.Osztály, BelépõkUnió.[Jogviszony kezdõ dátuma] AS Belépés, lkSzemélyek.[Jogviszony vége (kilépés dátuma)] AS Kilépés
FROM (Select * FROM lkBelépõkUnió 
UNION SELECT Belépõk.*, IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, Belépõk.Mezõ6 AS Osztály, [adóazonosító]*1 AS Adójel
FROM Belépõk
)  AS BelépõkUnió RIGHT JOIN lkSzemélyek ON BelépõkUnió.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.Fõosztály) Like "Gyám*") AND ((lkSzemélyek.Osztály) Like "*gyám*") AND ((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)])>#1/1/2019#));

#/#/#/
lkAIKiosk01
#/#/
SELECT tAIKiosk02.Azonosító, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Adójel, lkSzemélyek.[Szervezeti egység kódja], tAIKiosk02.Fõosztály
FROM lkSzemélyek, tAIKiosk02
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) And ((Trim(Replace([Dolgozó teljes neve],"dr.",""))) Like "*" & Trim(Replace([Név],"dr.","")) & "*") And ((tAIKiosk02.Fõosztály)=lkSzemélyek.Fõosztály))
ORDER BY tAIKiosk02.Azonosító;

#/#/#/
lkAIKiosk01b
#/#/
SELECT lkAIKiosk01.Azonosító, Count(lkAIKiosk01.Azonosító) AS db
FROM lkAIKiosk01
GROUP BY lkAIKiosk01.Azonosító;

#/#/#/
lkAIKiosk02
#/#/
SELECT DISTINCT tAIKiosk02.Fõosztály, tAIKiosk02.Osztály, tAIKiosk02.Név, IIf(Nz([db],0)<>1,"Ez az adat nem azonosítható egyértelmûen, " & Nz([db],0) & " azonos eredmény található.","Bizonytalanság foka (L.táv.):" & Ls([Név],[lkSzemélyek].[Dolgozó teljes neve])) AS Megjegyzés, IIf(Nz([db],0)=1,[lkSzemélyek].[Dolgozó teljes neve],"") AS Neve, IIf(Nz([db],0)=1,[lkSzemélyek].[Dolgozó születési neve],"") AS [Születési név], IIf(Nz([db],0)=1,[Születési hely] & ", " & [Születési idõ],"") AS [Születési hely \ idõ], IIf(Nz([db],0)=1,[Anyja neve],"") AS Anyja_neve, IIf(Nz([db],0)=1,[lkSzemélyek].[Adójel],0) AS Adó, IIf(Nz([db],0)=1,[TAJ szám],"") AS TAJ, IIf(Nz([db],0)=1,[Állandó lakcím],"") AS Lakcím, lkSzemélyek.[Státusz kódja], lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)]
FROM lkSzemélyek RIGHT JOIN ((lkAIKiosk01 RIGHT JOIN tAIKiosk02 ON lkAIKiosk01.Azonosító = tAIKiosk02.Azonosító) LEFT JOIN lkAIKiosk01b ON tAIKiosk02.Azonosító = lkAIKiosk01b.Azonosító) ON lkSzemélyek.Adójel = lkAIKiosk01.Adójel
WHERE (((tAIKiosk02.Fõosztály)=[lkSzemélyek].[Fõosztály]))
ORDER BY tAIKiosk02.Osztály;

#/#/#/
lkAlapadatok
#/#/
SELECT tAlapadatok.azAlapadat, tAlapadatok.TulajdonságNeve, tAlapadatok.TulajdonságÉrték, tAlapadatok.Objektum, tAlapadatok.ObjektumTípus
FROM tAlapadatok
WHERE (((tAlapadatok.TulajdonságNeve) Like "*" & [TempVars]![TulNeve] & "*") AND ((tAlapadatok.Objektum) Like "*" & [TempVars]![Obj] & "*") AND ((tAlapadatok.ObjektumTípus) Like "*" & [TempVars]![ObjTip] & "*"));

#/#/#/
lkAlaplétszámIlletmények
#/#/
SELECT Alaplétszám.[járási hivatal] AS [Fõosztály\hivatal], Alaplétszám.Adóazonosító, Alaplétszám.Név, Alaplétszám.[Álláshely azonosító], Alaplétszám.[Besorolási fokozat megnevezése:], Alaplétszám.[Heti munkaórák száma], Alaplétszám.Mezõ18, Round([Mezõ18]/[Heti munkaórák száma]*40,0) AS [40 órára vetített illetmény], IIf(InStr(1,[Besorolási fokozat kód:],"Mt."),"Mt.","Kit.") AS [Folgalkoztatás jellege], Alaplétszám.mezõ4 AS Betöltés
FROM (SELECT [járási hivatal], Járási_állomány.Adóazonosító, Név, Járási_állomány.[Álláshely azonosító], [Besorolási fokozat megnevezése:], Járási_állomány.[Heti munkaórák száma], Járási_állomány.Mezõ18, [Besorolási fokozat kód:], mezõ4
FROM Járási_állomány
UNION
SELECT Mezõ6,Kormányhivatali_állomány.Adóazonosító, Név, [Álláshely azonosító], Kormányhivatali_állomány.[Besorolási fokozat megnevezése:], Kormányhivatali_állomány.[Heti munkaórák száma], Kormányhivatali_állomány.Mezõ18, [Besorolási fokozat kód:], mezõ4
FROM Kormányhivatali_állomány

)  AS Alaplétszám
WHERE (((Alaplétszám.[Besorolási fokozat megnevezése:]) Like "*hivatali tanácsos*"));

#/#/#/
lkAlapvizsgaSzakvizsga
#/#/
SELECT tSzemélyek.[Dolgozó teljes neve], Replace(IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység név]),[tSzemélyek].[Szint 3 szervezeti egység név] & "",[tSzemélyek].[Szint 4 szervezeti egység név] & ""),"Budapest Fõváros Kormányhivatala ","BFKH ") AS Fõosztály, tSzemélyek.[Szervezeti egység neve], tSzemélyek.[Alapvizsga kötelezés dátuma], tSzemélyek.[Alapvizsga letétel tényleges határideje], tSzemélyek.[Alapvizsga mentesség], tSzemélyek.[Alapvizsga mentesség oka], tSzemélyek.[Szakvizsga kötelezés dátuma], tSzemélyek.[Szakvizsga letétel tényleges határideje], tSzemélyek.[Szakvizsga mentesség]
FROM tSzemélyek;

#/#/#/
lkÁlláshelyAzonosítókHaviból
#/#/
SELECT Járási_állomány.[Álláshely azonosító] As Álláshely FROM Járási_állomány UNION 
SELECT Kormányhivatali_állomány.[Álláshely azonosító] As Álláshely FROM Kormányhivatali_állomány UNION SELECT Központosítottak.[Álláshely azonosító] As Álláshely  FROM Központosítottak;

#/#/#/
lkÁlláshelyBesorolásEltérés
#/#/
SELECT DISTINCT Unió.név, Unió.Álláshely, Álláshelyek.[Álláshely besorolási kategóriája] AS ÁNYR, tBesorolás_átalakító.Besorolás, tBesorolás_átalakító.Besorolási_fokozat, Unió.Tábla
FROM Álláshelyek RIGHT JOIN ((SELECT Járási_állomány.Név, Járási_állomány.[Álláshely azonosító] As Álláshely, [Besorolási fokozat kód:] as besorolás, "Járási" as Tábla FROM Járási_állomány UNION SELECT Kormányhivatali_állomány.Név, Kormányhivatali_állomány.[Álláshely azonosító] As Álláshely, [Besorolási fokozat kód:] as besorolás, "Kormányhivatali" as Tábla FROM Kormányhivatali_állomány UNION SELECT Központosítottak.Név, Központosítottak.[Álláshely azonosító] As Álláshely, [Besorolási fokozat kód:] as besorolás, "Központosítottak" as Tábla FROM Központosítottak )  AS Unió LEFT JOIN tBesorolás_átalakító ON Unió.besorolás = tBesorolás_átalakító.[Az álláshely jelölése]) ON Álláshelyek.[Álláshely azonosító] = Unió.Álláshely
WHERE (((Álláshelyek.[Álláshely besorolási kategóriája]) Not Like [tBesorolás_átalakító].[Besorolási_fokozat]));

#/#/#/
lkÁlláshelyek
#/#/
SELECT Replace(IIf([4 szint]="",IIf([3 szint]="",IIf([2 szint]="",[1 szint],[2 szint]),[3 szint]),[4 szint]),"Budapest Fõváros Kormányhivatala ","BFKH ") AS FõosztályÁlláshely, Álláshelyek.[5 szint] AS Osztály, Nz(Switch([FõosztályÁlláshely]="Védelmi bizottság titkársága","Fõispán",[FõosztályÁlláshely]="Fõigazgatói titkárság","Fõigazgató",[FõosztályÁlláshely]="Belsõ Ellenõrzési Osztály","Fõispán"),[FõosztályÁlláshely]) AS Fõoszt, Nz(Switch([FõosztályÁlláshely]="Védelmi bizottság titkársága",[FõosztályÁlláshely],[FõosztályÁlláshely]="Fõigazgatói titkárság",[FõosztályÁlláshely],[FõosztályÁlláshely]="Belsõ Ellenõrzési Osztály",[FõosztályÁlláshely]),[Osztály]) AS Oszt, Álláshelyek.*, tBesorolásÁtalakítóEltérõBesoroláshoz.[Besorolási  fokozat (KT)], tBesorolásÁtalakítóEltérõBesoroláshoz.rang, tBesorolásÁtalakítóEltérõBesoroláshoz.jel, IIf([Álláshely státusza]="betöltetlen","ÜÁ." & [jel],IIf([Álláshelyen fennálló jogviszony] Like "Munka*","Mt." & [jel],[jel])) AS jel2
FROM tBesorolásÁtalakítóEltérõBesoroláshoz RIGHT JOIN Álláshelyek ON tBesorolásÁtalakítóEltérõBesoroláshoz.[Álláshely besorolási kategóriája] = Álláshelyek.[Álláshely besorolási kategóriája];

#/#/#/
lkÁlláshelyek(havi)
#/#/
SELECT Unió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Unió.Fõosztály, Unió.Osztály, Unió.[Álláshely azonosító], Unió.Állapot, Unió.mezõ9 AS Feladatkör
FROM (SELECT [Álláshely azonosító], Mezõ4, [Besorolási fokozat megnevezése:], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], IIf(Instr(1,[Besorolási fokozat kód:],"ÜÁ"),"üres","betöltött") as Állapot, mezõ9    , [Járási Hivatal] as Fõosztály, Mezõ7 as Osztály                                           FROM Járási_állomány              UNION SELECT [Álláshely azonosító], Mezõ4, [Besorolási fokozat megnevezése:], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], IIf(Instr(1,[Besorolási fokozat kód:],"ÜÁ"),"üres","betöltött") as Állapot, mezõ9 , mezõ6 as Fõosztály, Mezõ7 as Osztály FROM Kormányhivatali_állomány            UNION SELECT [Álláshely azonosító], Mezõ4, [Besorolási fokozat megnevezése:], [Nexon szótárelemnek megfelelõ szervezeti egység azonosító], IIf(Instr(1,[Besorolási fokozat kód:],"ÜÁ"),"üres","betöltött") as Állapot, Mezõ10,  Replace(     IIf(         [Megyei szint VAGY Járási Hivatal]="Megyei szint",         [Mezõ6],         [Megyei szint VAGY Járási Hivatal]         ),     "Budapest Fõváros Kormányhivatala ",     "BFKH "     ) AS Fõoszt, mezõ7 as Osztály FROM Központosítottak                                              )  AS Unió
ORDER BY Bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]);

#/#/#/
lkÁlláshelyek_Alaplétszám
#/#/
SELECT Unió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Szint5 - leírás] & [Szint6 - leírás] AS [Fõosztály\Hivatal], Unió.[Álláshely azonosító], Unió.Állapot
FROM tSzervezeti RIGHT JOIN (SELECT [Álláshely azonosító], Mezõ4, [Besorolási fokozat megnevezése:], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], IIf(Instr(1,[Besorolási fokozat kód:],"ÜÁ"),"üres","betöltött") as Állapot                        FROM Járási_állomány             UNION SELECT [Álláshely azonosító], Mezõ4, [Besorolási fokozat megnevezése:], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], IIf(Instr(1,[Besorolási fokozat kód:],"ÜÁ"),"üres","betöltött") as Állapot                        FROM Kormányhivatali_állomány      )  AS Unió ON tSzervezeti.[Szervezetmenedzsment kód]=Unió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
ORDER BY Bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]);

#/#/#/
lkÁlláshelyekÁllapotánakÖsszevetése_Havi_Ányr01
#/#/
SELECT Álláshelyek.[Álláshely azonosító], Álláshelyek.[Álláshely típusa], IIf([Álláshely státusza] Like "*tartósan távollévõ*","betöltött",[Álláshely státusza]) AS Ányr, IIf([Állapot]="üres","betöltetlen",[Állapot]) AS Nexon, lkÁlláshelyek_Alaplétszám.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] AS BFKHkód
FROM lkÁlláshelyek_Alaplétszám RIGHT JOIN Álláshelyek ON lkÁlláshelyek_Alaplétszám.[Álláshely azonosító]=Álláshelyek.[Álláshely azonosító];

#/#/#/
lkÁlláshelyekÁllapotánakÖsszevetése_Havi_Ányr02
#/#/
SELECT lk_Fõosztály_Osztály_tSzervezet.Fõosztály AS Fõosztály, lk_Fõosztály_Osztály_tSzervezet.Osztály AS Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkÁlláshelyekÁllapotánakÖsszevetése_Havi_Ányr01.[Álláshely azonosító] AS [Státusz kód], lkÁlláshelyekÁllapotánakÖsszevetése_Havi_Ányr01.Ányr AS Ányr, lkÁlláshelyekÁllapotánakÖsszevetése_Havi_Ányr01.Nexon AS Nexon, kt_azNexon_Adójel02.NLink AS NLink
FROM (lk_Fõosztály_Osztály_tSzervezet RIGHT JOIN (lkSzemélyek RIGHT JOIN lkÁlláshelyekÁllapotánakÖsszevetése_Havi_Ányr01 ON lkSzemélyek.[Státusz kódja] = lkÁlláshelyekÁllapotánakÖsszevetése_Havi_Ányr01.[Álláshely azonosító]) ON lk_Fõosztály_Osztály_tSzervezet.[Szervezetmenedzsment kód] = lkÁlláshelyekÁllapotánakÖsszevetése_Havi_Ányr01.BFKHkód) LEFT JOIN kt_azNexon_Adójel02 ON lkSzemélyek.Adójel = kt_azNexon_Adójel02.Adójel
WHERE (((IIf([Ányr]<>[Nexon],1,0))<>0))
ORDER BY lk_Fõosztály_Osztály_tSzervezet.bfkhkód, lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkÁlláshelyekBelsõElosztásaFõosztályOsztály
#/#/
SELECT tÁlláshelyekBelsõElosztásaFõosztályOsztály.azElosztás, Replace([Fõosztály],"Budapest Fõváros Kormányhivatala","BFKH") AS Fõoszt, tÁlláshelyekBelsõElosztásaFõosztályOsztály.Osztály, tÁlláshelyekBelsõElosztásaFõosztályOsztály.[Álláshely azonosító], tÁlláshelyekBelsõElosztásaFõosztályOsztály.Hatály
FROM tÁlláshelyekBelsõElosztásaFõosztályOsztály
WHERE (((tÁlláshelyekBelsõElosztásaFõosztályOsztály.azElosztás)=(Select Top 1 azElosztás from [tÁlláshelyekBelsõElosztásaFõosztályOsztály] as tmp Where tmp.[Álláshely azonosító]=[tÁlláshelyekBelsõElosztásaFõosztályOsztály].[Álláshely azonosító] Order By  tmp.hatály Desc)));

#/#/#/
lkÁlláshelyekBesorolásiJeleHavihoz
#/#/
SELECT lkÁlláshelyek.[Álláshely azonosító], lkÁlláshelyek.jel, lkÁlláshelyek.jel2
FROM lkÁlláshelyek;

#/#/#/
lkÁlláshelyekHaviból
#/#/
SELECT Unió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Szint5 - leírás] & [Szint6 - leírás] AS [Fõosztály\Hivatal], Unió.[Álláshely azonosító], Unió.[Besorolási fokozat megnevezése:], Unió.Jelleg, Unió.Mezõ4, Unió.[Besorolási fokozat kód:], Unió.Kinevezés AS [BetöltésMegüresedés dátuma], Unió.TT, Replace([Szint5 - leírás] & [Szint6 - leírás], "Budapest Fõváros Kormányhivatala", "BFKH") AS Fõoszt, Osztály
FROM tSzervezeti RIGHT JOIN (SELECT [Álláshely azonosító]
		, Mezõ4
		, [Besorolási fokozat megnevezése:]
		, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
		, [Besorolási fokozat kód:]
		, "A" AS Jelleg
		, Mezõ10 AS Kinevezés
		, [Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h] AS TT
, Mezõ7 as Osztály
	FROM Járási_állomány
	
	UNION
	
	SELECT [Álláshely azonosító]
		, Mezõ4
		, [Besorolási fokozat megnevezése:]
		, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
		, [Besorolási fokozat kód:]
		, "A" AS Jelleg
		, Mezõ10
		, [Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h] AS TT
, Mezõ7 as Osztály
	FROM Kormányhivatali_állomány
	
	UNION
	
	SELECT [Álláshely azonosító]
		, Mezõ4
		, [Besorolási fokozat megnevezése:]
		, [Nexon szótárelemnek megfelelõ szervezeti egység azonosító]
		, [Besorolási fokozat kód:]
		, "K" AS Jelleg
		, Mezõ11
		, "" AS TT
, Mezõ7 as Osztály
	FROM Központosítottak
	)  AS Unió ON tSzervezeti.[Szervezetmenedzsment kód] = Unió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
ORDER BY Bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]);

#/#/#/
lkÁlláshelyStátuszÖsszevetéseNexonÁnyr
#/#/
SELECT lkÁlláshelyek.FõosztályÁlláshely, lkÁlláshelyek.[Álláshely státusza] AS [Állapot ÁNYR], tBesorolás_átalakító.Üres, lkÁlláshelyek.[Álláshely azonosító]
FROM (lkÁlláshelyek LEFT JOIN lkÁlláshelyekHaviból ON lkÁlláshelyek.[Álláshely azonosító] = lkÁlláshelyekHaviból.[Álláshely azonosító]) LEFT JOIN tBesorolás_átalakító ON lkÁlláshelyekHaviból.[Besorolási fokozat kód:] = tBesorolás_átalakító.[Az álláshely jelölése];

#/#/#/
lkÁlláshelyTábla_HaviLétszámjelentéshez
#/#/
SELECT DISTINCT lkÁlláshelyek.[Álláshely azonosító], lkÁlláshelyek.[Álláshely besorolási kategóriája], lkÁlláshelyek.jel2
FROM lkÁlláshelyek;

#/#/#/
lkÁllományEgyIdõszakban_Kilépettek
#/#/
SELECT lkKilépõUnió.Adóazonosító AS Adójel, lkSzemélyekMind.[Dolgozó teljes neve], Nz([lkKilépõUnió].[Fõosztály],[lkSzemélyekMind].[Fõosztály]) AS Fõoszt, Nz([lkKilépõUnió].[Osztály],[lkSzemélyekMind].[Osztály]) AS Oszt, ffsplit([Feladatkör],"-",2) AS [Ellátandó feladat], lkSzemélyekMind.[Jogviszony kezdete (belépés dátuma)] AS Belépés, lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)] AS Kilépés
FROM lkKilépõUnió INNER JOIN lkSzemélyekMind ON (lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja] = lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)]) AND (lkKilépõUnió.Adójel = lkSzemélyekMind.Adójel) AND (lkSzemélyekMind.[Jogviszony kezdete (belépés dátuma)] = lkKilépõUnió.[Jogviszony kezdõ dátuma])
WHERE (((Nz(lkKilépõUnió.Fõosztály,lkSzemélyekMind.Fõosztály)) Like "Humán*") And ((ffsplit([Feladatkör],"-",2))<>"") And ((lkSzemélyekMind.[Jogviszony kezdete (belépés dátuma)])<=[Az idõszak vége]) And ((lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)])>=[Az idõszak kezdete]));

#/#/#/
lkÁllománytáblaEgyIdõszakban_Belépettek
#/#/
SELECT lkBelépõkUnió.Adóazonosító AS Adójel, lkSzemélyekMind.[Dolgozó teljes neve], lkBelépõkUnió.Fõosztály, lkBelépõkUnió.Osztály, ffsplit([Feladatkör],"-",2) AS [Ellátandó feladat], lkSzemélyekMind.[Jogviszony kezdete (belépés dátuma)] AS Belépés, lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)] AS Kilépés
FROM lkSzemélyekMind INNER JOIN lkBelépõkUnió ON (lkSzemélyekMind.[Jogviszony kezdete (belépés dátuma)] = lkBelépõkUnió.[Jogviszony kezdõ dátuma]) AND (lkSzemélyekMind.Adójel = lkBelépõkUnió.Adójel)
WHERE (((lkBelépõkUnió.Fõosztály) Like "*" & [Az érintett fõosztály] & "*") AND ((lkBelépõkUnió.Osztály) Like "*" & [Az érintett osztály] & "*") AND ((ffsplit([Feladatkör],"-",2))<>"") AND ((lkSzemélyekMind.[Jogviszony kezdete (belépés dátuma)])<=[Az idõszak vége]) AND ((lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)])>=[Az idõszak kezdete]));

#/#/#/
lkÁllománytáblákTörténetiUniója
#/#/
SELECT Unió.Sorszám, Unió.Név, Unió.Adóazonosító, Unió.[Születési év \ üres állás], Unió.[Nem], Unió.Fõoszt, Unió.Osztály, Unió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Unió.[Ellátott feladat], Unió.Kinevezés, Unió.[Feladat jellege], Unió.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], Unió.[Heti munkaórák száma], Unió.[Betöltés aránya], Unió.[Besorolási fokozat kód:], Unió.[Besorolási fokozat megnevezése:], Unió.[Álláshely azonosító], Unió.[Havi illetmény], Unió.[Eu finanszírozott], Unió.[Illetmény forrása], Unió.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], Unió.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Unió.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], Unió.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], Unió.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], Unió.[Képesítést adó végzettség], Unió.KAB, Unió.[KAB 001-3** Branch ID], Unió.hatályaID
FROM (SELECT lktKözpontosítottak.*
FROM  lktKözpontosítottak
UNION
SELECT lktKormányhivatali_állomány.*
FROM lktKormányhivatali_állomány
UNION
SELECT lktJárási_állomány.*
FROM  lktJárási_állomány)  AS Unió;

#/#/#/
lkÁllományUnió20230102_készítõ
#/#/
SELECT lkJárásiKormányKözpontosítottUnió.* INTO tÁllományUnió20230102
FROM lkJárásiKormányKözpontosítottUnió;

#/#/#/
lkÁllományUnió20231231_készítõ
#/#/
SELECT lkJárásiKormányKözpontosítottUnió.* INTO tÁllományUnió20231231
FROM lkJárásiKormányKözpontosítottUnió;

#/#/#/
lkÁNYR
#/#/
SELECT Álláshelyek.*
FROM Álláshelyek;

#/#/#/
lkAPróbaidõKözelgõLejárata
#/#/
SELECT DISTINCT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Hivatali email] AS [Hivatali email], lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége] AS [Próbaidõ vége], kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége]) Between DateSerial(Year(Date()),Month(Date()),1) And DateSerial(Year(Date()),Month(Date())+1,1)-1) AND ((lkSzemélyek.[Státusz neve]) Like "Álláshely"))
ORDER BY lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége];

#/#/#/
lkAPróbaidõKözelgõLejárata03
#/#/
SELECT DISTINCT lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Születési idõ], lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkSzemélyek.[Hivatali email] AS [Hivatali email], lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége] AS [Próbaidõ vége], IIf(Nz([KIRA feladat megnevezés],"") Like "Ügykezelõi*","igen","nem") AS Ügykezelõe, lkKözigazgatásiVizsga.[Vizsga típusa] AS Vizsga, lkKözigazgatásiVizsga.[Vizsga letétel terv határideje], lkKözigazgatásiVizsga.[Oklevél dátuma], IIf([Mentesség]=0,"HAMIS","IGAZ") AS Mentes, IIf([Jogviszony vége (kilépés dátuma)]=0,"",[Jogviszony vége (kilépés dátuma)]) AS [Jogviszony vége], kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN (lkSzemélyek LEFT JOIN lkKözigazgatásiVizsga ON lkSzemélyek.Adójel = lkKözigazgatásiVizsga.Adójel) ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége]) Between DateSerial(Year(Date()),Month(Date())-1,1) And DateSerial(Year(Date()),Month(Date())+1,1)-1) AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus])="Hivatásos állományú" Or (lkSzemélyek.[Jogviszony típusa / jogviszony típus])="Munkaviszony" Or (lkSzemélyek.[Jogviszony típusa / jogviszony típus])="Kormányzati szolgálati jogviszony"))
ORDER BY lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége];

#/#/#/
lkÁtlagéletkor
#/#/
SELECT Eredm.[Kif1] AS Kif2, #1/1/1867# AS Kif3, DateDiff("yyyy",[Kif2]+[Kif3],Now()) AS Átlagéletkor
FROM (SELECT Avg(Mid([Adójel],2,5)) AS Kif1, lkSzemélyek.[Státusz neve]
FROM lkSzemélyek
GROUP BY lkSzemélyek.[Státusz neve]
HAVING (((lkSzemélyek.[Státusz neve])="Álláshely")))  AS Eredm;

#/#/#/
lkÁtlagilletmény_vezetõknélkül
#/#/
SELECT IIf([Jogviszony típusa / jogviszony típus]="Munkaviszony","Munkaviszony",[Besorolási  fokozat (KT)]) AS Besorolás, Sum([Illetmény összesen kerekítés nélkül (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40) AS Összilletmény, Count(lkIlletményhezÁtlag_vezetõknélkül.[Adóazonosító jel]) AS Fõ, Round(Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS Átlag, Round(StDev([Illetmény összesen kerekítés nélkül (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS [Átlagtól való eltérés (StDev)]
FROM lkIlletményhezÁtlag_vezetõknélkül RIGHT JOIN Álláshelyek ON lkIlletményhezÁtlag_vezetõknélkül.[Státusz kódja] = Álláshelyek.[Álláshely azonosító]
WHERE (((lkIlletményhezÁtlag_vezetõknélkül.[Szervezeti egység kódja]) Is Not Null) AND ((lkIlletményhezÁtlag_vezetõknélkül.[Státusz neve])="Álláshely"))
GROUP BY IIf([Jogviszony típusa / jogviszony típus]="Munkaviszony","Munkaviszony",[Besorolási  fokozat (KT)]);

#/#/#/
lkÁtlagilletmény_vezetõknélkül_Eredmény
#/#/
SELECT "Összesen: " AS Besorolás, Round(Sum([lkÁtlagilletmény_vezetõknélkül].[Összilletmény])/100,0)*100 AS Mindösszesen, Sum(lkÁtlagilletmény_vezetõknélkül.Fõ) AS Összlétszám, Round(Sum([Összilletmény])/Sum([Fõ])/100,0)*100 AS Átlag, (SELECT Round(StDev([Illetmény összesen kerekítés nélkül (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS [Átlagtól való eltérés]
FROM lkSzemélyek LEFT JOIN Álláshelyek ON lkSzemélyek.[Státusz kódja] = Álláshelyek.[Álláshely azonosító]
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))) AS [Átlagtól való eltérés]
FROM lkÁtlagilletmény_vezetõknélkül
GROUP BY "Összesen: ";

#/#/#/
lkÁtlagosHibajavításiIdõk
#/#/
SELECT Replace(ffsplit([Második mezõ],"|",1),"Budapest Fõváros Kormányhivatala","BFKH") AS Fõosztály, Avg(DateDiff("d",[elsõ idõpont],[utolsó idõpont])) AS [Átlagos javításiidõ], Count(tRégiHibák.[Elsõ mezõ]) AS Hibaszám
FROM tRégiHibák
WHERE (((tRégiHibák.lekérdezésNeve)<>"lkAPróbaidõKözelgõLejárata" And (tRégiHibák.lekérdezésNeve)<>"lkElvégzendõBesoroltatások02_régi" And (tRégiHibák.lekérdezésNeve)<>"lk_jogviszony_jellege_02_régi" And (tRégiHibák.lekérdezésNeve)<>"lkLejártAlkalmasságiÉrvényesség" And (tRégiHibák.lekérdezésNeve)<>"lkÜresÁlláshelyekÁllapotfelmérõ") AND ((tRégiHibák.[Elsõ Idõpont])<>[Utolsó Idõpont]))
GROUP BY Replace(ffsplit([Második mezõ],"|",1),"Budapest Fõváros Kormányhivatala","BFKH")
HAVING (((Replace(ffsplit([Második mezõ],"|",1),"Budapest Fõváros Kormányhivatala","BFKH"))<>"S-049058" And (Replace(ffsplit([Második mezõ],"|",1),"Budapest Fõváros Kormányhivatala","BFKH"))<>"" And (Replace(ffsplit([Második mezõ],"|",1),"Budapest Fõváros Kormányhivatala","BFKH"))<>"-" And (Replace(ffsplit([Második mezõ],"|",1),"Budapest Fõváros Kormányhivatala","BFKH"))<>"S-045728" And (Replace(ffsplit([Második mezõ],"|",1),"Budapest Fõváros Kormányhivatala","BFKH"))<>"Néráth Andrea Dr.") AND (("Utolsó Idõpont")<>(select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve <>"lkÜresÁlláshelyekÁllapotfelmérõ" And lekérdezésneve <>"lkFontosHiányzóAdatok02")))
ORDER BY Avg(DateDiff("d",[elsõ idõpont],[utolsó idõpont])) DESC;

#/#/#/
lkAzElmúltTízNap
#/#/
SELECT DateSerial(Year(Now()),Month(Now()),Day(Now())-([Sorszám]-1)) AS Dátum
FROM lkSorszámok
WHERE (((lkSorszámok.Sorszám)<10));

#/#/#/
lkBeKilépõk01
#/#/
SELECT BeKilépõk.KilépésÉve AS Év, BeKilépõk.KilépésHava AS Hó, Sum(BeKilépõk.Belépõk) AS SumOfBelépõk, Sum(BeKilépõk.Kilépõk) AS SumOfKilépõk
FROM (SELECT Adóazonosító, lkKilépõk_Személyek01.KilépésÉve, lkKilépõk_Személyek01.KilépésHava, 0 As Belépõk, lkKilépõk_Személyek01.Létszám AS Kilépõk 
FROM lkKilépõk_Személyek01

UNION
SELECT Adóazonosító, lkBelépõk_Személyek01.BelépésÉve, lkBelépõk_Személyek01.BelépésHava, lkBelépõk_Személyek01.Létszám AS Belépõk, 0 as Kilépõk
FROM lkBelépõk_Személyek01

)  AS BeKilépõk
GROUP BY BeKilépõk.KilépésÉve, BeKilépõk.KilépésHava
HAVING ((([BeKilépõk].[KilépésÉve])>2018));

#/#/#/
lkBeKilépõk02
#/#/
TRANSFORM Sum([SumOfBelépõk]+[SumOfKilépõk]) AS Összeg
SELECT lkBeKilépõk01.Hó
FROM lkBeKilépõk01
GROUP BY lkBeKilépõk01.Hó
PIVOT lkBeKilépõk01.Év;

#/#/#/
lkBeKilépõkAKövetkezõHónapban
#/#/
SELECT KiBelépõk.Dátum, Sum(KiBelépõk.[Belépõk száma]) AS [Belépõk száma], Sum(KiBelépõk.[Kilépõk száma]) AS [Kilépõk száma], [Belépõk száma]-[Kilépõk száma] AS Mozgás
FROM (SELECT 
lkBelépõkSzáma.Dátum, lkBelépõkSzáma.[Belépõk száma], lkBelépõkSzáma.[Kilépõk száma]
FROM lkBelépõkSzáma
UNION SELECT
lkKilépõkSzáma.Dátum, lkKilépõkSzáma.[Belépõk száma], lkKilépõkSzáma.[Kilépõk száma]
FROM  lkKilépõkSzáma
)  AS KiBelépõk
GROUP BY KiBelépõk.Dátum;

#/#/#/
lkBelépésDátumaAdójel
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.[Jogviszony kezdete (belépés dátuma)]
FROM lkSzemélyek;

#/#/#/
lkBelépõk
#/#/
SELECT Belépõk.Sorszám, Belépõk.Név, Belépõk.Adóazonosító, Belépõk.Alaplétszám, Belépõk.[Megyei szint VAGY Járási Hivatal], Belépõk.Mezõ5, Belépõk.Mezõ6, Belépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Belépõk.Mezõ8, Belépõk.[Besorolási fokozat kód:], Belépõk.[Besorolási fokozat megnevezése:], Belépõk.[Álláshely azonosító], Belépõk.[Jogviszony kezdõ dátuma], Belépõk.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], Belépõk.[Illetmény (Ft/hó)], IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, Mezõ6 AS Osztály, [adóazonosító]*1 AS Adójel, "-" AS Üres
FROM Belépõk;

#/#/#/
lkBelépõk_Személyek01
#/#/
SELECT tSzemélyek.[Dolgozó teljes neve] AS Név, Year([Jogviszony kezdete (belépés dátuma)]) AS BelépésÉve, Month([Jogviszony kezdete (belépés dátuma)]) AS BelépésHava, [tSzemélyek].[Adójel]*1 AS Adóazonosító, tSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés, tSzemélyek.[Szervezeti egység kódja], 1 AS Létszám
FROM tSzemélyek
WHERE (((tSzemélyek.[Jogviszony kezdete (belépés dátuma)]) Is Not Null) AND ((tSzemélyek.[Szervezeti egység kódja]) Not Like "BFKH-MEGB")) OR (((tSzemélyek.[Jogviszony kezdete (belépés dátuma)]) Is Not Null) AND ((tSzemélyek.[Szervezeti egység kódja])="")) OR (((tSzemélyek.[Jogviszony kezdete (belépés dátuma)]) Is Not Null) AND ((tSzemélyek.[Szervezeti egység kódja]) Is Null));

#/#/#/
lkBelépõk_Személyek02
#/#/
TRANSFORM Sum(lkBelépõk_Személyek01.Létszám) AS SumOfLétszám
SELECT lkBelépõk_Személyek01.BelépésHava
FROM lkBelépõk_Személyek01
WHERE (((lkBelépõk_Személyek01.BelépésÉve)>2018))
GROUP BY lkBelépõk_Személyek01.BelépésHava
PIVOT lkBelépõk_Személyek01.BelépésÉve;

#/#/#/
lkBelépõk2019Jelenig
#/#/
PARAMETERS [Kezdõ dátum] DateTime;
SELECT UnióUnió.BFKH, UnióUnió.Fõosztály, UnióUnió.Osztály, UnióUnió.[Belépés éve hava], Sum(UnióUnió.Fõ) AS SumOfFõ
FROM (SELECT bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS BFKH, IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, tBelépõkUnió.Mezõ6 AS Osztály, Year([Jogviszony kezdõ dátuma]) & IIf(Len(Month([Jogviszony kezdõ dátuma]))=1,"0","") & Month([Jogviszony kezdõ dátuma]) AS [Belépés éve hava], 1 AS Fõ
FROM tBelépõkUnió
WHERE (((tBelépõkUnió.[Jogviszony kezdõ dátuma])>[Kezdõ dátum]))
Union SELECT bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS BFKH, IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, lkBelépõk.Mezõ6 AS Osztály, Year([Jogviszony kezdõ dátuma]) & IIf(Len(Month([Jogviszony kezdõ dátuma]))=1,"0","") & Month([Jogviszony kezdõ dátuma]) AS [Belépés éve hava], 1 AS Fõ
FROM lkBelépõk)  AS UnióUnió
GROUP BY UnióUnió.BFKH, UnióUnió.Fõosztály, UnióUnió.Osztály, UnióUnió.[Belépés éve hava]
ORDER BY UnióUnió.[Belépés éve hava];

#/#/#/
lkBelépõkEgyAdottFõosztályra2023ban
#/#/
SELECT lkBelépõkUnió.Név, lkBelépõkUnió.Fõosztály, lkBelépõkUnió.Osztály, ffsplit([Feladatkör],"-",2) AS [Ellátandó feladat], lkBelépõkUnió.[Jogviszony kezdõ dátuma]
FROM lkBelépõkUnió RIGHT JOIN tSzemélyek ON (lkBelépõkUnió.[Jogviszony kezdõ dátuma] = tSzemélyek.[Jogviszony kezdete (belépés dátuma)]) AND (lkBelépõkUnió.Adóazonosító = tSzemélyek.[Adóazonosító jel])
WHERE (((lkBelépõkUnió.Fõosztály) Like [Szervezeti egység] & "*") AND ((lkBelépõkUnió.[Jogviszony kezdõ dátuma]) Between #1/1/2023# And #12/31/2023#));

#/#/#/
lkBelépõkSzáma
#/#/
SELECT dtÁtal([Jogviszony kezdete (belépés dátuma)]) AS Dátum, Count(lkSzemélyek.Adójel) AS [Belépõk száma], 0 AS [Kilépõk száma]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Like "munka*" Or (lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Like "korm*"))
GROUP BY dtÁtal([Jogviszony kezdete (belépés dátuma)]), 0
HAVING (((dtÁtal([Jogviszony kezdete (belépés dátuma)])) Between Now() And DateSerial(Year(Now()),Month(Now())+1,Day(Now()))));

#/#/#/
lkBelépõkSzámaÉvente2b
#/#/
SELECT lkBelépõkSzámaÉventeHavonta.Év, Sum(lkBelépõkSzámaÉventeHavonta.[Belépõk száma]) AS Belépõk
FROM lkBelépõkSzámaÉventeHavonta
GROUP BY lkBelépõkSzámaÉventeHavonta.Év
HAVING (((lkBelépõkSzámaÉventeHavonta.Év)>=2019));

#/#/#/
lkBelépõkSzámaÉventeFélévente01a
#/#/
TRANSFORM Count(tSzemélyek.Azonosító) AS [Belépõk száma]
SELECT 1 AS Sorszám, tSzemélyek.[KIRA jogviszony jelleg], Year([Jogviszony kezdete (belépés dátuma)]) AS Év
FROM tSzemélyek
WHERE (((tSzemélyek.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (tSzemélyek.[KIRA jogviszony jelleg])="Munkaviszony") AND ((Year([Jogviszony kezdete (belépés dátuma)]))>=2019 And (Year([Jogviszony kezdete (belépés dátuma)]))<=Year(Now())+1) AND ((tSzemélyek.[Jogviszony kezdete (belépés dátuma)]) Is Not Null Or (tSzemélyek.[Jogviszony kezdete (belépés dátuma)])<>""))
GROUP BY 1, tSzemélyek.[KIRA jogviszony jelleg], Year([Jogviszony kezdete (belépés dátuma)])
PIVOT IIf(Month([Jogviszony kezdete (belépés dátuma)])<7,1,2);

#/#/#/
lkBelépõkSzámaÉventeFélévente01b
#/#/
TRANSFORM Count(tSzemélyek.Azonosító) AS [Belépõk száma]
SELECT 2 AS Sorszám, "Kit. és Mt. együtt:" AS [KIRA jogviszony jelleg], Year([Jogviszony kezdete (belépés dátuma)]) AS Év
FROM tSzemélyek
WHERE (((Year([Jogviszony kezdete (belépés dátuma)]))>=2019 And (Year([Jogviszony kezdete (belépés dátuma)]))<=Year(Now())+1) AND ((tSzemélyek.[Jogviszony kezdete (belépés dátuma)]) Is Not Null Or (tSzemélyek.[Jogviszony kezdete (belépés dátuma)])<>"") AND ((tSzemélyek.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (tSzemélyek.[KIRA jogviszony jelleg])="Munkaviszony"))
GROUP BY 2, "Kit. és Mt. együtt:", Year([Jogviszony kezdete (belépés dátuma)])
PIVOT IIf(Month([Jogviszony kezdete (belépés dátuma)])<7,1,2);

#/#/#/
lkBelépõkSzámaÉventeFélévente02
#/#/
SELECT lkBelépõkSzámaÉventeFélévente01a.Sorszám, lkBelépõkSzámaÉventeFélévente01a.[KIRA jogviszony jelleg], lkBelépõkSzámaÉventeFélévente01a.Év, lkBelépõkSzámaÉventeFélévente01a.[1], lkBelépõkSzámaÉventeFélévente01a.[2]
FROM lkBelépõkSzámaÉventeFélévente01a
UNION SELECT lkBelépõkSzámaÉventeFélévente01b.Sorszám, lkBelépõkSzámaÉventeFélévente01b.[KIRA jogviszony jelleg], lkBelépõkSzámaÉventeFélévente01b.Év, lkBelépõkSzámaÉventeFélévente01b.[1], lkBelépõkSzámaÉventeFélévente01b.[2]
FROM  lkBelépõkSzámaÉventeFélévente01b;

#/#/#/
lkBelépõkSzámaÉventeHavonta
#/#/
SELECT Year([Jogviszony kezdete (belépés dátuma)]) AS Év, Month([Jogviszony kezdete (belépés dátuma)]) AS Hó, Count(tSzemélyek.Azonosító) AS [Belépõk száma]
FROM tSzemélyek
WHERE (((tSzemélyek.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (tSzemélyek.[KIRA jogviszony jelleg])="Munkaviszony") AND ((tSzemélyek.[Jogviszony kezdete (belépés dátuma)]) Is Not Null Or (tSzemélyek.[Jogviszony kezdete (belépés dátuma)])<>""))
GROUP BY Year([Jogviszony kezdete (belépés dátuma)]), Month([Jogviszony kezdete (belépés dátuma)])
HAVING (((Year([Jogviszony kezdete (belépés dátuma)]))>=2019 And (Year([Jogviszony kezdete (belépés dátuma)]))<=Year(Now())+1))
ORDER BY Year([Jogviszony kezdete (belépés dátuma)]), Month([Jogviszony kezdete (belépés dátuma)]);

#/#/#/
lkBelépõkSzámaÉventeHavonta2
#/#/
SELECT lkBelépõkSzámaÉventeHavonta.Év, IIf([Hó]=1,[Belépõk száma],0) AS 1, IIf([Hó]=2,[Belépõk száma],0) AS 2, IIf([Hó]=3,[Belépõk száma],0) AS 3, IIf([Hó]=4,[Belépõk száma],0) AS 4, IIf([Hó]=5,[Belépõk száma],0) AS 5, IIf([Hó]=6,[Belépõk száma],0) AS 6, IIf([Hó]=7,[Belépõk száma],0) AS 7, IIf([Hó]=8,[Belépõk száma],0) AS 8, IIf([Hó]=9,[Belépõk száma],0) AS 9, IIf([Hó]=10,[Belépõk száma],0) AS 10, IIf([Hó]=11,[Belépõk száma],0) AS 11, IIf([Hó]=12,[Belépõk száma],0) AS 12
FROM lkBelépõkSzámaÉventeHavonta;

#/#/#/
lkBelépõkSzámaÉventeHavonta2Akkumulálva
#/#/
SELECT lkBelépõkSzámaÉventeHavonta.Év, IIf([Hó]<=1,[Belépõk száma],0) AS 1, IIf([Hó]<=2,[Belépõk száma],0) AS 2, IIf([Hó]<=3,[Belépõk száma],0) AS 3, IIf([Hó]<=4,[Belépõk száma],0) AS 4, IIf([Hó]<=5,[Belépõk száma],0) AS 5, IIf([Hó]<=6,[Belépõk száma],0) AS 6, IIf([Hó]<=7,[Belépõk száma],0) AS 7, IIf([Hó]<=8,[Belépõk száma],0) AS 8, IIf([Hó]<=9,[Belépõk száma],0) AS 9, IIf([Hó]<=10,[Belépõk száma],0) AS 10, IIf([Hó]<=11,[Belépõk száma],0) AS 11, IIf([Hó]<=12,[Belépõk száma],0) AS 12
FROM lkBelépõkSzámaÉventeHavonta;

#/#/#/
lkBelépõkSzámaÉventeHavonta3
#/#/
SELECT lkBelépõkSzámaÉventeHavonta2.Év, Sum(lkBelépõkSzámaÉventeHavonta2.[1]) AS 01, Sum(lkBelépõkSzámaÉventeHavonta2.[2]) AS 02, Sum(lkBelépõkSzámaÉventeHavonta2.[3]) AS 03, Sum(lkBelépõkSzámaÉventeHavonta2.[4]) AS 04, Sum(lkBelépõkSzámaÉventeHavonta2.[5]) AS 05, Sum(lkBelépõkSzámaÉventeHavonta2.[6]) AS 06, Sum(lkBelépõkSzámaÉventeHavonta2.[7]) AS 07, Sum(lkBelépõkSzámaÉventeHavonta2.[8]) AS 08, Sum(lkBelépõkSzámaÉventeHavonta2.[9]) AS 09, Sum(lkBelépõkSzámaÉventeHavonta2.[10]) AS 10, Sum(lkBelépõkSzámaÉventeHavonta2.[11]) AS 11, Sum(lkBelépõkSzámaÉventeHavonta2.[12]) AS 12, lkBelépõkSzámaÉvente2b.Belépõk
FROM lkBelépõkSzámaÉvente2b INNER JOIN lkBelépõkSzámaÉventeHavonta2 ON lkBelépõkSzámaÉvente2b.Év = lkBelépõkSzámaÉventeHavonta2.Év
GROUP BY lkBelépõkSzámaÉventeHavonta2.Év, lkBelépõkSzámaÉvente2b.Belépõk;

#/#/#/
lkBelépõkSzámaÉventeHavonta3Akkumulálva
#/#/
SELECT lkBelépõkSzámaÉventeHavonta2Akkumulálva.Év, Sum(lkBelépõkSzámaÉventeHavonta2Akkumulálva.[1]) AS 01, Sum(lkBelépõkSzámaÉventeHavonta2Akkumulálva.[2]) AS 02, Sum(lkBelépõkSzámaÉventeHavonta2Akkumulálva.[3]) AS 03, Sum(lkBelépõkSzámaÉventeHavonta2Akkumulálva.[4]) AS 04, Sum(lkBelépõkSzámaÉventeHavonta2Akkumulálva.[5]) AS 05, Sum(lkBelépõkSzámaÉventeHavonta2Akkumulálva.[6]) AS 06, Sum(lkBelépõkSzámaÉventeHavonta2Akkumulálva.[7]) AS 07, Sum(lkBelépõkSzámaÉventeHavonta2Akkumulálva.[8]) AS 08, Sum(lkBelépõkSzámaÉventeHavonta2Akkumulálva.[9]) AS 09, Sum(lkBelépõkSzámaÉventeHavonta2Akkumulálva.[10]) AS 10, Sum(lkBelépõkSzámaÉventeHavonta2Akkumulálva.[11]) AS 11, Sum(lkBelépõkSzámaÉventeHavonta2Akkumulálva.[12]) AS 12, lkBelépõkSzámaÉvente2b.Belépõk
FROM lkBelépõkSzámaÉventeHavonta2Akkumulálva INNER JOIN lkBelépõkSzámaÉvente2b ON lkBelépõkSzámaÉventeHavonta2Akkumulálva.Év = lkBelépõkSzámaÉvente2b.Év
GROUP BY lkBelépõkSzámaÉventeHavonta2Akkumulálva.Év, lkBelépõkSzámaÉvente2b.Belépõk;

#/#/#/
lkBelépõkSzámaÉventeHavontaFõoszt02
#/#/
SELECT lkBelépõkSzámaÉventeHavontaFõosztOszt01.Fõosztály AS Fõosztály, lkBelépõkSzámaÉventeHavontaFõosztOszt01.év AS Év, Sum(((IIf([Hó]=1,[Belépõk száma],0)))) AS 1, Sum(((IIf([Hó]=2,[Belépõk száma],0)))) AS 2, Sum(((IIf([Hó]=3,[Belépõk száma],0)))) AS 3, Sum(((IIf([Hó]=4,[Belépõk száma],0)))) AS 4, Sum(((IIf([Hó]=5,[Belépõk száma],0)))) AS 5, Sum(((IIf([Hó]=6,[Belépõk száma],0)))) AS 6, Sum(((IIf([Hó]=7,[Belépõk száma],0)))) AS 7, Sum(((IIf([Hó]=8,[Belépõk száma],0)))) AS 8, Sum(((IIf([Hó]=9,[Belépõk száma],0)))) AS 9, Sum(((IIf([Hó]=10,[Belépõk száma],0)))) AS 10, Sum(((IIf([Hó]=12,[Belépõk száma],0)))) AS 11, Sum(((IIf([Hó]=12,[Belépõk száma],0)))) AS 12, [1]+[2]+[3]+[4]+[5]+[6]+[7]+[8]+[9]+[10]+[11]+[12] AS Összesen
FROM lkBelépõkSzámaÉventeHavontaFõosztOszt01
GROUP BY lkBelépõkSzámaÉventeHavontaFõosztOszt01.Fõosztály, lkBelépõkSzámaÉventeHavontaFõosztOszt01.év;

#/#/#/
lkBelépõkSzámaÉventeHavontaFõosztOszt01
#/#/
SELECT Trim(Replace(Replace(Replace([BelépõkUnióMáig].[Fõosztály],"Budapest Fõváros Kormányhivatala","BFKH")," 20200229-ig",""),"Budapest FõvárosKormányhivatala","BFKH")) AS Fõosztály, Replace([BelépõkUnióMáig].[Osztály]," 20200229-ig","") AS Osztály, Year([Jogviszony kezdete (belépés dátuma)]) AS Év, Month([Jogviszony kezdete (belépés dátuma)]) AS Hó, Count(tSzemélyek.Azonosító) AS [Belépõk száma]
FROM tSzemélyek RIGHT JOIN (SELECT lkBelépõkUnió.Fõosztály, lkBelépõkUnió.Osztály, lkBelépõkUnió.Adóazonosító, lkBelépõkUnió.[Jogviszony kezdõ dátuma]
  FROM lkBelépõkUnió
  UNION
  SELECT IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, lkBelépõk.Mezõ6 AS Osztály, lkBelépõk.Adóazonosító, lkBelépõk.[Jogviszony kezdõ dátuma]
  FROM lkBelépõk
)  AS BelépõkUnióMáig ON (tSzemélyek.[Adóazonosító jel] = BelépõkUnióMáig.Adóazonosító) AND (tSzemélyek.[Jogviszony kezdete (belépés dátuma)] = BelépõkUnióMáig.[Jogviszony kezdõ dátuma])
WHERE (((tSzemélyek.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (tSzemélyek.[KIRA jogviszony jelleg])="Munkaviszony") AND ((tSzemélyek.[Jogviszony kezdete (belépés dátuma)]) Is Not Null Or (tSzemélyek.[Jogviszony kezdete (belépés dátuma)])<>"") AND ((Year([Jogviszony kezdete (belépés dátuma)])) Between Year(Now())-4 And Year(Now())+1))
GROUP BY Trim(Replace(Replace(Replace([BelépõkUnióMáig].[Fõosztály],"Budapest Fõváros Kormányhivatala","BFKH")," 20200229-ig",""),"Budapest FõvárosKormányhivatala","BFKH")), Replace([BelépõkUnióMáig].[Osztály]," 20200229-ig",""), Year([Jogviszony kezdete (belépés dátuma)]), Month([Jogviszony kezdete (belépés dátuma)])
ORDER BY Year([Jogviszony kezdete (belépés dátuma)]), Month([Jogviszony kezdete (belépés dátuma)]);

#/#/#/
lkBelépõkSzámaÉventeHavontaFõosztOszt02
#/#/
SELECT lkBelépõkSzámaÉventeHavontaFõosztOszt01.Fõosztály, lkBelépõkSzámaÉventeHavontaFõosztOszt01.Osztály, lkBelépõkSzámaÉventeHavontaFõosztOszt01.Év, Sum(IIf([Hó]=1,[Belépõk száma],0)) AS 1, Sum(IIf([Hó]=2,[Belépõk száma],0)) AS 2, Sum(IIf([Hó]=3,[Belépõk száma],0)) AS 3, Sum(IIf([Hó]=4,[Belépõk száma],0)) AS 4, Sum(IIf([Hó]=5,[Belépõk száma],0)) AS 5, Sum(IIf([Hó]=6,[Belépõk száma],0)) AS 6, Sum(IIf([Hó]=7,[Belépõk száma],0)) AS 7, Sum(IIf([Hó]=8,[Belépõk száma],0)) AS 8, Sum(IIf([Hó]=9,[Belépõk száma],0)) AS 9, Sum(IIf([Hó]=10,[Belépõk száma],0)) AS 10, Sum(IIf([Hó]=12,[Belépõk száma],0)) AS 11, Sum(IIf([Hó]=12,[Belépõk száma],0)) AS 12, [1]+[2]+[3]+[4]+[5]+[6]+[7]+[8]+[9]+[10]+[11]+[12] AS Összesen
FROM lkBelépõkSzámaÉventeHavontaFõosztOszt01
GROUP BY lkBelépõkSzámaÉventeHavontaFõosztOszt01.Fõosztály, lkBelépõkSzámaÉventeHavontaFõosztOszt01.Osztály, lkBelépõkSzámaÉventeHavontaFõosztOszt01.Év;

#/#/#/
lkBelépõkSzámaÉventeHavontaFõosztOszt02-EgyFõosztályra
#/#/
SELECT lkBelépõkSzámaÉventeHavontaFõosztOszt02.*
FROM lkBelépõkSzámaÉventeHavontaFõosztOszt02
WHERE (((lkBelépõkSzámaÉventeHavontaFõosztOszt02.Fõosztály) Like "*" & [Add meg a Fõosztály] & "*"));

#/#/#/
lkBelépõkTeljes
#/#/
SELECT tBelépõkUnióÉstBelépõkJövõ.Sorszám, tBelépõkUnióÉstBelépõkJövõ.Név, tBelépõkUnióÉstBelépõkJövõ.Adóazonosító, tBelépõkUnióÉstBelépõkJövõ.Alaplétszám, tBelépõkUnióÉstBelépõkJövõ.[Megyei szint VAGY Járási Hivatal], tBelépõkUnióÉstBelépõkJövõ.Mezõ5, tBelépõkUnióÉstBelépõkJövõ.Mezõ6, tBelépõkUnióÉstBelépõkJövõ.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], tBelépõkUnióÉstBelépõkJövõ.Mezõ8, tBelépõkUnióÉstBelépõkJövõ.[Besorolási fokozat kód:], tBelépõkUnióÉstBelépõkJövõ.[Besorolási fokozat megnevezése:], tBelépõkUnióÉstBelépõkJövõ.[Álláshely azonosító], tBelépõkUnióÉstBelépõkJövõ.[Jogviszony kezdõ dátuma], tBelépõkUnióÉstBelépõkJövõ.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], tBelépõkUnióÉstBelépõkJövõ.[Illetmény (Ft/hó)]
FROM (SELECT tBelépõkUnió.*
FROM tBelépõkUnió
UNION SELECT  tBelépõkJövõ.*
FROM tBelépõkJövõ)  AS tBelépõkUnióÉstBelépõkJövõ;

#/#/#/
lkBelépõkUnió
#/#/
SELECT tBelépõkUnió.*, IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, tBelépõkUnió.Mezõ6 AS Osztály, [adóazonosító]*1 AS Adójel, "-" AS Üres
FROM tBelépõkUnió;

#/#/#/
lkBelsõEngedélyezettLétszámokJelenleg
#/#/
SELECT tBelsõEngedélyezettLétszámok.FõosztályKód, tBelsõEngedélyezettLétszámok.Fõosztály, tBelsõEngedélyezettLétszámok.Osztály, Sum(tBelsõEngedélyezettLétszámok.EngedélyVáltozás) AS Létszám
FROM tBelsõEngedélyezettLétszámok
WHERE (((tBelsõEngedélyezettLétszámok.Hatály)=(Select Max([Hatály]) From [tBelsõEngedélyezettLétszámok] as TMP WHere [tBelsõEngedélyezettLétszámok].[FõosztályKód]=tmp.[FõosztályKód])))
GROUP BY tBelsõEngedélyezettLétszámok.FõosztályKód, tBelsõEngedélyezettLétszámok.Fõosztály, tBelsõEngedélyezettLétszámok.Osztály;

#/#/#/
lkBelsõEngedélyezettLétszámtólEltérés01
#/#/
SELECT ÖsszesenAzlkÁlláshelyekHaviból.Fõosztály, lkBelsõEngedélyezettLétszámokJelenleg.Létszám AS Engedélyezett, ÖsszesenAzlkÁlláshelyekHaviból.[CountOfÁlláshely azonosító] AS Tényleges, [Engedélyezett]-[Tényleges] AS Eltérés
FROM lkBelsõEngedélyezettLétszámokJelenleg INNER JOIN (SELECT [lkÁlláshelyek(havi)].Fõosztály, Count([lkÁlláshelyek(havi)].[Álláshely azonosító]) AS [CountOfÁlláshely azonosító] FROM [lkÁlláshelyek(havi)] GROUP BY [lkÁlláshelyek(havi)].Fõosztály)  AS ÖsszesenAzlkÁlláshelyekHaviból ON lkBelsõEngedélyezettLétszámokJelenleg.Fõosztály = ÖsszesenAzlkÁlláshelyekHaviból.Fõosztály
GROUP BY ÖsszesenAzlkÁlláshelyekHaviból.Fõosztály, lkBelsõEngedélyezettLétszámokJelenleg.Létszám, ÖsszesenAzlkÁlláshelyekHaviból.[CountOfÁlláshely azonosító];

#/#/#/
lkBelsõEngedélyezettLétszámtólEltérés02
#/#/
SELECT lkBelsõEngedélyezettLétszámtólEltérés01.Fõosztály, lkBelsõEngedélyezettLétszámtólEltérés01.Engedélyezett, lkBelsõEngedélyezettLétszámtólEltérés01.Tényleges, lkBelsõEngedélyezettLétszámtólEltérés01.Eltérés
FROM lkBelsõEngedélyezettLétszámtólEltérés01
WHERE (((lkBelsõEngedélyezettLétszámtólEltérés01.Eltérés)<>0));

#/#/#/
lkBesorolásEmeléshez01
#/#/
SELECT Bfkh([Szervezetkód]) AS BFKH, lk_Állománytáblákból_Illetmények.Szervezetkód, lk_Állománytáblákból_Illetmények.Adójel, tSzervezet.[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] AS besorolás, lk_Állománytáblákból_Illetmények.[Álláshely azonosító], tBesorolás_átalakító_1.[alsó határ], tBesorolás_átalakító_1.[felsõ határ], lk_Állománytáblákból_Illetmények.Illetmény, Besorolás_átalakító.alsó2, Besorolás_átalakító.felsõ2, lk_Állománytáblákból_Illetmények.[Heti munkaórák száma], [Illetmény]/IIf([Heti munkaórák száma]=0,0.0001,[Heti munkaórák száma])*40 AS [40 órás illetmény], tBesorolás_átalakító_1.[Jogviszony típusa], lk_Állománytáblákból_Illetmények.Név, lk_Állománytáblákból_Illetmények.Fõosztály, lk_Állománytáblákból_Illetmények.Osztály
FROM (SELECT [alsó határ] AS alsó2, [felsõ határ] AS felsõ2, Üres, Kit, Mt, [Sorrend]-1 AS EmeltSorrend FROM tBesorolás_átalakító)  AS Besorolás_átalakító RIGHT JOIN (tBesorolás_átalakító AS tBesorolás_átalakító_1 RIGHT JOIN (lk_Állománytáblákból_Illetmények RIGHT JOIN tSzervezet ON lk_Állománytáblákból_Illetmények.[Álláshely azonosító]=tSzervezet.[Szervezetmenedzsment kód]) ON tBesorolás_átalakító_1.[Az álláshely jelölése]=lk_Állománytáblákból_Illetmények.BesorolásHavi) ON (Besorolás_átalakító.EmeltSorrend=tBesorolás_átalakító_1.Sorrend) AND (Besorolás_átalakító.Mt=tBesorolás_átalakító_1.Mt) AND (Besorolás_átalakító.Kit=tBesorolás_átalakító_1.Kit) AND (Besorolás_átalakító.Üres=tBesorolás_átalakító_1.Üres)
WHERE ((([Illetmény]/IIf([Heti munkaórák száma]=0,0.0001,[Heti munkaórák száma])*40) Not Between [alsó határ] And [felsõ határ])) OR ((([Illetmény]/IIf([Heti munkaórák száma]=0,0.0001,[Heti munkaórák száma])*40) Not Between [alsó2] And [felsõ2]));

#/#/#/
lkBesorolásEmeléshez02
#/#/
SELECT lkBesorolásEmeléshez01.BFKH, lkBesorolásEmeléshez01.Fõosztály, lkBesorolásEmeléshez01.Osztály, lkBesorolásEmeléshez01.Adójel, lkBesorolásEmeléshez01.Név, lkBesorolásEmeléshez01.[Jogviszony típusa], lkBesorolásEmeléshez01.besorolás AS [Jelenlegi beorolás], lkBesorolásEmeléshez01.[alsó határ] AS [Jelenlegi alsó határ], lkBesorolásEmeléshez01.[felsõ határ] AS [Jelenlegi felsó határ], lkBesorolásEmeléshez01.[40 órás illetmény], lkBesorolásEmeléshez01.alsó2 AS [Emelt alsó határ], lkBesorolásEmeléshez01.felsõ2 AS [Emelt felsõ határ], *
FROM lkBesorolásEmeléshez01
WHERE (((lkBesorolásEmeléshez01.besorolás)="Vezetõ-hivatalitanácsos")) OR (((lkBesorolásEmeléshez01.besorolás)="Hivatali tanácsos"))
ORDER BY lkBesorolásEmeléshez01.Adójel, lkBesorolásEmeléshez01.[40 órás illetmény];

#/#/#/
lkBesorolásHaviÁNYR
#/#/
SELECT lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító], lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat kód:], lkÁlláshelyek.jel2 AS ÁNYRbõl, lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat megnevezése:]
FROM lkJárásiKormányKözpontosítottUnió INNER JOIN lkÁlláshelyek ON lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító] = lkÁlláshelyek.[Álláshely azonosító];

#/#/#/
lkBesorolásHelyettes02
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkBesorolásHelyettesek.Név AS [TT-s neve], lkBesorolásHelyettesek.Adójel AS [TT-s adójele], lkSzemélyek.[Tartós távollét típusa], [Családi név] & " " & [Utónév] AS [TTH-s neve], lkBesorolásHelyettesek.Kezdete1, lkBesorolásHelyettesek.Vége1, "https://nexonport.kh.gov.hu/menu/hrm/szemelyiKarton/index?szemelyAzonosito=" & [azNexon] & "&r=13" AS Link
FROM kt_azNexon_Adójel INNER JOIN (lkSzemélyek RIGHT JOIN lkBesorolásHelyettesek ON lkSzemélyek.[Dolgozó teljes neve] = lkBesorolásHelyettesek.Név) ON kt_azNexon_Adójel.Adójel = lkBesorolásHelyettesek.Adójel
WHERE (((lkSzemélyek.[Tartós távollét típusa]) Is Not Null))
ORDER BY lkBesorolásHelyettesek.Név, lkBesorolásHelyettesek.Kezdete1, lkBesorolásHelyettesek.Vége1;

#/#/#/
lkBesorolásHelyettesek
#/#/
SELECT BesorolásHelyettesített.Azonosító, BesorolásHelyettesített.Adójel, BesorolásHelyettesített.[TAJ szám], BesorolásHelyettesített.[Egyedi azonosító], BesorolásHelyettesített.Törzsszám, BesorolásHelyettesített.Elõnév, BesorolásHelyettesített.[Családi név], BesorolásHelyettesített.Utónév, BesorolásHelyettesített.[Jogviszony ID], BesorolásHelyettesített.Kód, BesorolásHelyettesített.Megnevezés, BesorolásHelyettesített.Kezdete, BesorolásHelyettesített.Vége, BesorolásHelyettesített.Kezdete1, BesorolásHelyettesített.Vége1, BesorolásHelyettesített.[Helyettesítés oka], BesorolásHelyettesített.[Jogviszony ID1], BesorolásHelyettesített.[Eltérõ illetmény fokozata], BesorolásHelyettesített.Elõnév1, BesorolásHelyettesített.[Családi név1], BesorolásHelyettesített.Utónév1, Trim([Családi név1]) & " " & Trim([Utónév1] & " " & [Elõnév1]) AS Név
FROM BesorolásHelyettesített;

#/#/#/
lkBesorolásiEredményadatok
#/#/
SELECT [Adóazonosító jel]*1 AS Adójel, tBesorolásiEredményadatok.*, tBesorolásiEredményadatok.Kezdete4, dtÁtal([Vége5]) AS SzerzVég
FROM tBesorolásiEredményadatok;

#/#/#/
lkBesorolásiEredményadatokUtolsó
#/#/
SELECT lkBesorolásiEredményadatok.*
FROM lkBesorolásiEredményadatok
WHERE (((lkBesorolásiEredményadatok.[Változás dátuma])=(select Max([Tmp].[Változás dátuma]) from [lkBesorolásiEredményadatok] as Tmp where tmp.adójel=[lkBesorolásiEredményadatok].[Adójel])));

#/#/#/
lkBesorolásonkénti_létszám_01
#/#/
SELECT Álláshelyek.[Álláshely besorolási kategóriája], Count(Unió.Álláshely) AS CountOfÁlláshely
FROM (SELECT Járási_állomány.Név, Járási_állomány.[Álláshely azonosító] As Álláshely, [Besorolási fokozat kód:] as besorolás, "Járási" as Tábla FROM Járási_állomány UNION SELECT Kormányhivatali_állomány.Név, Kormányhivatali_állomány.[Álláshely azonosító] As Álláshely, [Besorolási fokozat kód:] as besorolás, "Kormányhivatali" as Tábla FROM Kormányhivatali_állomány UNION SELECT Központosítottak.Név, Központosítottak.[Álláshely azonosító] As Álláshely, [Besorolási fokozat kód:] as besorolás, "Központosítottak" as Tábla FROM Központosítottak )  AS Unió LEFT JOIN Álláshelyek ON Unió.Álláshely = Álláshelyek.[Álláshely azonosító]
GROUP BY Álláshelyek.[Álláshely besorolási kategóriája];

#/#/#/
lkBesorolásonkénti_létszám_és_illetmény
#/#/
SELECT IIf([Jogviszony típusa / jogviszony típus]="Munkaviszony","Munkaviszony",[Besorolási  fokozat (KT)]) AS Besorolás, Sum([Illetmény összesen kerekítés nélkül (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40) AS Összilletmény, Count(lkSzemélyek.[Adóazonosító jel]) AS Fõ, Round(Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS Átlag, Round(StDev([Illetmény összesen kerekítés nélkül (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS [Átlagtól való eltérés (StDev)]
FROM Álláshelyek LEFT JOIN lkSzemélyek ON Álláshelyek.[Álláshely azonosító] = lkSzemélyek.[Státusz kódja]
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
GROUP BY IIf([Jogviszony típusa / jogviszony típus]="Munkaviszony","Munkaviszony",[Besorolási  fokozat (KT)]);

#/#/#/
lkBesorolásonkénti_létszám_és_illetmény_AdottFõosztályra
#/#/
SELECT lkSzemélyek.Fõosztály, IIf([Jogviszony típusa / jogviszony típus]="Munkaviszony","Munkaviszony",[Besorolási  fokozat (KT)]) AS Besorolás, Sum([Illetmény összesen kerekítés nélkül (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40) AS Összilletmény, Count(lkSzemélyek.[Adóazonosító jel]) AS Fõ, Round(Avg([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS Átlag, Round(StDev([Illetmény összesen kerekítés nélkül (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS [Átlagtól való eltérés (StDev)]
FROM Álláshelyek LEFT JOIN lkSzemélyek ON Álláshelyek.[Álláshely azonosító] = lkSzemélyek.[Státusz kódja]
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
GROUP BY lkSzemélyek.Fõosztály, IIf([Jogviszony típusa / jogviszony típus]="Munkaviszony","Munkaviszony",[Besorolási  fokozat (KT)]);

#/#/#/
lkBesorolásonkénti_létszám_és_illetmény_átlaggal
#/#/
SELECT Nz([rang],0)*1 AS Rang_, lkBesorolásonkénti_létszám_és_illetmény.Besorolás, lkBesorolásonkénti_létszám_és_illetmény.Összilletmény, lkBesorolásonkénti_létszám_és_illetmény.Fõ, lkBesorolásonkénti_létszám_és_illetmény.Átlag, lkBesorolásonkénti_létszám_és_illetmény.[Átlagtól való eltérés (StDev)]
FROM lkBesorolásonkénti_létszám_és_illetmény LEFT JOIN tBesorolásKonverzió ON lkBesorolásonkénti_létszám_és_illetmény.Besorolás = tBesorolásKonverzió.Személytörzsbõl
GROUP BY Nz([rang],0)*1, lkBesorolásonkénti_létszám_és_illetmény.Besorolás, lkBesorolásonkénti_létszám_és_illetmény.Összilletmény, lkBesorolásonkénti_létszám_és_illetmény.Fõ, lkBesorolásonkénti_létszám_és_illetmény.Átlag, lkBesorolásonkénti_létszám_és_illetmény.[Átlagtól való eltérés (StDev)];

#/#/#/
lkBesorolásonkénti_létszám_és_illetmény_Eredmény
#/#/
SELECT Végösszeggel.Rang_ AS Sorszám, Végösszeggel.Besorolás AS Besorolás, Végösszeggel.Összilletmény AS Összilletmény, Végösszeggel.Fõ AS Fõ, Végösszeggel.Átlag AS Átlag, Végösszeggel.[Átlagtól való eltérés (StDev)] AS [Átlagtól való eltérés (StDev)]
FROM (SELECT lkBesorolásonkénti_létszám_és_illetmény_átlaggal.*
FROM lkBesorolásonkénti_létszám_és_illetmény_átlaggal
UNION
SELECT lkBesorolásonkénti_létszám_és_illetmény_Mindösszesen.*
FROM lkBesorolásonkénti_létszám_és_illetmény_Mindösszesen
)  AS Végösszeggel
ORDER BY Végösszeggel.Rang_;

#/#/#/
lkBesorolásonkénti_létszám_és_illetmény_Mindösszesen
#/#/
SELECT Max([Rang_])+1 AS rangsor, "Összesen: " AS Besorolás, Round(Sum(lkBesorolásonkénti_létszám_és_illetmény_átlaggal.Összilletmény)/100,0)*100 AS Mindösszesen, Sum(lkBesorolásonkénti_létszám_és_illetmény_átlaggal.Fõ) AS Összlétszám, Round(Sum([Összilletmény])/Sum([Fõ])/100,0)*100 AS Átlag, (SELECT Round(StDev([Illetmény összesen kerekítés nélkül (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)/100,0)*100 AS [Átlagtól való eltérés]
FROM lkSzemélyek LEFT JOIN Álláshelyek ON lkSzemélyek.[Státusz kódja] = Álláshelyek.[Álláshely azonosító]
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))) AS [Átlagtól való eltérés]
FROM lkBesorolásonkénti_létszám_és_illetmény_átlaggal
GROUP BY "Összesen: ";

#/#/#/
lkBesorolásVáltoztatások
#/#/
SELECT tBesorolásVáltoztatások.*
FROM tBesorolásVáltoztatások
WHERE (((tBesorolásVáltoztatások.Azonosító)=(Select Top 1 Azonosító from [tBesorolásVáltoztatások] as tmp Where tmp.[ÁlláshelyAzonosító]=[tBesorolásVáltoztatások].[ÁlláshelyAzonosító] Order By  tmp.hatály Desc)));

#/#/#/
lkBetöltöttLétszám
#/#/
SELECT 1 AS Sor, "Betöltött létszám:" AS Adat, Sum([fõ]) AS Érték, Sum(TTnélkül) AS nemTT
FROM (SELECT DISTINCT lkSzemélyek.Adójel, 1 AS Fõ, Abs([Tartós távollét típusa] Is Null) AS TTnélkül FROM lkSzemélyek WHERE lkSzemélyek.[Státusz neve] = "Álláshely")  AS lista;

#/#/#/
lkBFKHForrásKód
#/#/
SELECT DISTINCT lkSzemélyek.BFKH, lkForrásNexonSzervezetekÖsszerendelés.Fõoszt, lkForrásNexonSzervezetekÖsszerendelés.Oszt, lkForrásNexonSzervezetekÖsszerendelés.ForrásKód, tSzakfeladatForráskód.SZAKFELADAT
FROM (lkForrásNexonSzervezetekÖsszerendelés INNER JOIN tSzakfeladatForráskód ON lkForrásNexonSzervezetekÖsszerendelés.ForrásKód = tSzakfeladatForráskód.SzervEgysKód) INNER JOIN lkSzemélyek ON (lkForrásNexonSzervezetekÖsszerendelés.Fõoszt = lkSzemélyek.Fõosztály) AND (lkForrásNexonSzervezetekÖsszerendelés.Oszt = lkSzemélyek.[Szervezeti egység neve]);

#/#/#/
lkCímek01
#/#/
SELECT strcount(Nz([Állandó lakcím],"")," ") AS Kif1, lkSzemélyek.[Státusz neve]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY strcount(Nz([Állandó lakcím],"")," ") DESC;

#/#/#/
lkDÁP
#/#/
SELECT lkSzemélyek.[Adóazonosító jel] AS Adószám, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Besorolási  fokozat (KT)] AS Besorolás, lkSzemélyek.[KIRA feladat megnevezés] AS [Ellátandó feladat], lkSzemélyek.[Illetmény összesen kerekítés nélkül (eltérített)] AS Illetmény, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, "" AS [Születési név], "" AS [Születési hely], "" AS [Születési idõ], "" AS [Anyja neve], lkSzemélyek.[Állandó lakcím], lkSzemélyek.[Tartózkodási lakcím], [Hivatali email] & ", " & [Hivatali telefon] AS Elérhetõség, lkSzemélyek.[TAJ szám], "" AS Pénzintézet, ffsplit([Utalási cím],"|",3) AS Bankszámlaszám
FROM lkSzemélyek INNER JOIN tSpecifikusDolgozók ON (tSpecifikusDolgozók.[Anyja neve] = lkSzemélyek.[Anyja neve]) AND (tSpecifikusDolgozók.[Születési idõ] = lkSzemélyek.[Születési idõ]) AND (tSpecifikusDolgozók.[Születési hely] = lkSzemélyek.[Születési hely]) AND (lkSzemélyek.[Dolgozó születési neve] = tSpecifikusDolgozók.[Születési név]);

#/#/#/
lkDÁPb
#/#/
SELECT lkSzemélyek.[Adóazonosító jel] AS Adószám, tDÁPrésztvevõk.Név, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Besorolási  fokozat (KT)] AS Besorolás, lkSzemélyek.[KIRA feladat megnevezés] AS [Ellátandó feladat], lkSzemélyek.[Illetmény összesen kerekítés nélkül (eltérített)] AS Illetmény, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó születési neve] AS [Születési név], lkSzemélyek.[Születési hely], lkSzemélyek.[Születési idõ], lkSzemélyek.[Anyja neve], lkSzemélyek.[Állandó lakcím], lkSzemélyek.[Tartózkodási lakcím], [Hivatali email] & ", " & [Hivatali telefon] AS Elérhetõség, lkSzemélyek.[TAJ szám], "" AS Pénzintézet, ffsplit([Utalási cím],"|",3) AS Bankszámlaszám
FROM lkSzemélyek RIGHT JOIN tDÁPrésztvevõk ON lkSzemélyek.Fõosztály = tDÁPrésztvevõk.Hivatal;

#/#/#/
lkDiplomások4eFtAlatt
#/#/
SELECT bfkh([Szervezeti egység kódja]) AS BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], kt_azNexon_Adójel.azNexon, lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)] AS Illetmény, lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS Óraszám, [Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40 AS 40órásIlletmény, lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.[Iskolai végzettség foka], lkSzemélyek.[Tartós távollét típusa], lkSzemélyek.[Tartós távollét vége], lkSzemélyek.[Tartós távollét tervezett vége]
FROM kt_azNexon_Adójel RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel.Adójel = lkSzemélyek.Adójel
WHERE ((([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)<=400000) AND ((lkSzemélyek.[Iskolai végzettség foka])="Fõiskolai vagy felsõfokú alapképzés (BA/BsC)okl." Or (lkSzemélyek.[Iskolai végzettség foka])="Egyetemi /felsõfokú (MA/MsC) vagy osztatlan képz.") AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY bfkh([Szervezeti egység kódja]), lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkDolgozók18ÉvAlattiGyermekkel
#/#/
SELECT lkHozzátartozók.[Dolgozó adóazonosító jele], 1 AS fõ, Abs([Tartós távollét típusa] Is Null) AS TTnélkül
FROM lkHozzátartozók INNER JOIN lkSzemélyek ON lkHozzátartozók.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkHozzátartozók.[Születési idõ])>DateSerial(Year(Now())-18,Month(Now()),Day(Now()))) AND ((lkHozzátartozók.[Kapcsolat jellege])="Gyermek" Or (lkHozzátartozók.[Kapcsolat jellege])="Nevelt (mostoha)" Or (lkHozzátartozók.[Kapcsolat jellege])="Örökbe fogadott"));

#/#/#/
lkDolgozókFeladatköreBesorolása
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.Feladatkör, lkSzemélyek.[Elsõdleges feladatkör], lkSzemélyek.FEOR, lkSzemélyek.[KIRA jogviszony jelleg], lkSzemélyek.[Besorolási  fokozat (KT)]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH, lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkDolgozókLétszáma18ÉvAlattiGyermekkel
#/#/
SELECT 4 AS sor, "Dolgozók létszáma 18 év alatti gyermekkel:" AS Adat, Sum(fõ) AS Érték, Sum([TTnélkül]) AS NemTT
FROM (SELECT DISTINCT lkHozzátartozók.[Dolgozó adóazonosító jele], 1 AS fõ, Abs([Tartós távollét típusa] Is Null) AS TTnélkül FROM lkHozzátartozók INNER JOIN lkSzemélyek ON lkHozzátartozók.Adójel = lkSzemélyek.Adójel WHERE lkSzemélyek.[Státusz neve]="Álláshely" And lkHozzátartozók.[Születési idõ]>DateSerial(Year(Now())-18,Month(Now()),Day(Now())) And (lkHozzátartozók.[Kapcsolat jellege]="Gyermek" Or lkHozzátartozók.[Kapcsolat jellege]="Nevelt (mostoha)" Or lkHozzátartozók.[Kapcsolat jellege]="Örökbe fogadott"))  AS allekérdezésEgyedi;

#/#/#/
lkDolgozókLétszáma18ÉvAlattiUnokával
#/#/
SELECT "Dolgozók létszáma 18 év alatti unokával:" AS Adat, Sum(fõ) AS Érték, Sum([TTnélkül]) AS NemTT
FROM (SELECT DISTINCT lkHozzátartozók.[Dolgozó adóazonosító jele], 1 AS fõ, Abs([Tartós távollét típusa] Is Null) AS TTnélkül FROM lkHozzátartozók INNER JOIN lkSzemélyek ON lkHozzátartozók.Adójel = lkSzemélyek.Adójel WHERE lkSzemélyek.[Státusz neve]="Álláshely" And lkHozzátartozók.[Születési idõ]>DateSerial(Year(Now())-18,Month(Now()),Day(Now())) And (lkHozzátartozók.[Kapcsolat jellege]="Unoka"))  AS allekérdezésEgyedi;

#/#/#/
lkDolgozókLétszáma6ÉvAlattiGyermekkel
#/#/
SELECT "Dolgozók létszáma 6 év alatti gyermekkel:" AS Adat, Sum(fõ) AS Érték, Sum([TTnélkül]) AS NemTT
FROM (SELECT DISTINCT lkHozzátartozók.[Dolgozó adóazonosító jele], 1 AS fõ, Abs([Tartós távollét típusa] Is Null) AS TTnélkül FROM lkHozzátartozók INNER JOIN lkSzemélyek ON lkHozzátartozók.Adójel = lkSzemélyek.Adójel WHERE lkSzemélyek.[Státusz neve]="Álláshely" And lkHozzátartozók.[Születési idõ]>DateSerial(Year(Now())-6,Month(Now()),Day(Now())) And (lkHozzátartozók.[Kapcsolat jellege]="Gyermek" Or lkHozzátartozók.[Kapcsolat jellege]="Nevelt (mostoha)" Or lkHozzátartozók.[Kapcsolat jellege]="Örökbe fogadott"))  AS allekérdezésEgyedi;

#/#/#/
lkDolgozókLétszámaTöbb18ÉvAlattiGyermekkel
#/#/
SELECT "Dolgozók létszáma több 18 év alatti gyermekkel:" AS Adat, Sum([darab]) AS Érték, Sum(IIf([NemTT]<>0,[darab],0)) AS NemTT_
FROM lkDolgozókTöbb18ÉvAlattiGyermekkel;

#/#/#/
lkDolgozókTöbb18ÉvAlattiGyermekkel
#/#/
SELECT "Dolgozók létszáma 18 év alatti gyermekkel:" AS Adat, Sum(lkDolgozók18ÉvAlattiGyermekkel.fõ) AS Érték, Sum(lkDolgozók18ÉvAlattiGyermekkel.[TTnélkül]) AS NemTT, 1 AS darab
FROM lkDolgozók18ÉvAlattiGyermekkel
GROUP BY 1, lkDolgozók18ÉvAlattiGyermekkel.[Dolgozó adóazonosító jele]
HAVING (((Sum(lkDolgozók18ÉvAlattiGyermekkel.[fõ]))>1));

#/#/#/
lkDolgozókVégzettségeiFelsorolás01
#/#/
SELECT lkSzemélyekVégzettségeinekSzáma.VégzettségeinekASzáma, lkVégzettségek.Adójel, lkVégzettségek.[Végzettség neve], Min(lkVégzettségek.Azonosító) AS Azonosítók
FROM lkSzemélyekVégzettségeinekSzáma INNER JOIN lkVégzettségek ON lkSzemélyekVégzettségeinekSzáma.Adójel = lkVégzettségek.Adójel
GROUP BY lkSzemélyekVégzettségeinekSzáma.VégzettségeinekASzáma, lkVégzettségek.Adójel, lkVégzettségek.[Végzettség neve];

#/#/#/
lkDolgozókVégzettségeiFelsorolás02
#/#/
SELECT 1+(Select count(Tmp.Azonosítók) From tDolgozókVégzettségeiFelsorolás01 as Tmp Where Tmp.Adójel=tDolgozókVégzettségeiFelsorolás01.Adójel AND Tmp.Azonosítók<tDolgozókVégzettségeiFelsorolás01.Azonosítók ) AS Sorszám, tDolgozókVégzettségeiFelsorolás01.VégzettségeinekASzáma, tDolgozókVégzettségeiFelsorolás01.Adójel, tDolgozókVégzettségeiFelsorolás01.[Végzettség neve]
FROM tDolgozókVégzettségeiFelsorolás01;

#/#/#/
lkDolgozókVégzettségeiFelsorolás03
#/#/
PARAMETERS Üssél_egy_entert Long;
TRANSFORM First(tDolgozókVégzettségeiFelsorolás02.[Végzettség neve]) AS [FirstOfVégzettség neve]
SELECT tDolgozókVégzettségeiFelsorolás02.Adójel, tDolgozókVégzettségeiFelsorolás02.VégzettségeinekASzáma
FROM tDolgozókVégzettségeiFelsorolás02
GROUP BY tDolgozókVégzettségeiFelsorolás02.Adójel, tDolgozókVégzettségeiFelsorolás02.VégzettségeinekASzáma
PIVOT tDolgozókVégzettségeiFelsorolás02.Sorszám In (1,2,3,4,5,6,7,8,9,10,11,12);

#/#/#/
lkDolgozókVégzettségeiFelsorolás04
#/#/
SELECT lkDolgozókVégzettségeiFelsorolás03.Adójel, lkDolgozókVégzettségeiFelsorolás03.VégzettségeinekASzáma, strim([1] & ", " & [2] & ", " & [3] & ", " & [4] & ", " & [5] & ", " & [6] & ", " & [7] & ", " & [8] & ", " & [9] & ", " & [10] & ", " & [11] & ", " & [12],", ") AS Végzettségei
FROM lkDolgozókVégzettségeiFelsorolás03;

#/#/#/
lkDolgozókVégzettségeiFelsorolásTmp
#/#/
SELECT Count(Tmp.Azonosítók) AS CountOfAzonosítók
FROM lkDolgozókVégzettségeiFelsorolás01 AS Tmp
WHERE (((Tmp.Adójel)=lkDolgozókVégzettségeiFelsorolás01.Adójel) And ((Tmp.Azonosítók)<lkDolgozókVégzettségeiFelsorolás01.Azonosítók));

#/#/#/
lkEgészségügyiAlkalmasságiVizsga
#/#/
SELECT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Hivatali telefon] AS [Hivatali telefon], lkSzemélyek.[Hivatali email] AS [Hivatali email], Format([TAJ szám] & ""," @") AS TAJ, lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés, kt_azNexon_Adójel02.NLink AS NLink
FROM lkSzemélyek LEFT JOIN kt_azNexon_Adójel02 ON lkSzemélyek.Adójel = kt_azNexon_Adójel02.Adójel
WHERE (((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)])>=DateSerial(Year(DateAdd("m",-3,Date())),Month(DateAdd("m",-3,Date())),1)) AND ((lkSzemélyek.[Orvosi vizsgálat következõ idõpontja]) Is Null) AND ((lkSzemélyek.[Orvosi vizsgálat eredménye]) Is Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)])>=DateSerial(Year(DateAdd("m",-3,Date())),Month(DateAdd("m",-3,Date())),1)) AND ((lkSzemélyek.[Orvosi vizsgálat következõ idõpontja])<[Jogviszony kezdete (belépés dátuma)]) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], lkSzemélyek.BFKH;

#/#/#/
lkEgészségügyiSzolgáltatóAdataiUnió
#/#/
SELECT tEgészségügyiSzolgáltatóAdatai02.*
FROM tEgészségügyiSzolgáltatóAdatai02
UNION SELECT tEgészségügyiSzolgáltatóAdatai01.*
FROM  tEgészségügyiSzolgáltatóAdatai01;

#/#/#/
lkEgyesOsztályokTisztviselõi_lkSzemélyek
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés, IIf(Nz([Tartós távollét típusa],"")="","","tartósan távollévõ") AS [Tartósan távollévõ]
FROM lkSzemélyek
WHERE (((lkSzemélyek.Fõosztály) Like "* I. *") AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Like "kormány*")) OR (((lkSzemélyek.Fõosztály) Like "* XII. *")) OR (((lkSzemélyek.Fõosztály) Like "* XXI. *")) OR (((lkSzemélyek.Fõosztály) Like "* XXIII. *")) OR (((lkSzemélyek.Fõosztály) Like "* VI. *"))
ORDER BY bfkh([Szervezeti egység kódja]), lkSzemélyek.Osztály, lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkEgyFõosztályAktívDolgozóiEmailFeladat
#/#/
SELECT lkSzemélyek.[Szervezeti egység neve], lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Hivatali email], lkSzemélyek.[KIRA feladat megnevezés]
FROM lkSzemélyek INNER JOIN tBesorolásÁtalakítóEltérõBesoroláshoz ON lkSzemélyek.jel2 = tBesorolásÁtalakítóEltérõBesoroláshoz.jel
WHERE (((lkSzemélyek.Fõosztály) Like "Lakás*") AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null))
ORDER BY lkSzemélyek.BFKH, tBesorolásÁtalakítóEltérõBesoroláshoz.rang DESC , IIf(InStr([KIRA feladat megnevezés],"vezetõ")>0,1,2);

#/#/#/
lkÉletkorok
#/#/
SELECT Int(Sqr([Törzsszám])) AS Szám, DateDiff("yyyy",[Születési idõ],Date()) AS Életkor
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="álláshely"));

#/#/#/
lkElismerésreJogosítóIdõtCsakABfkhbanSzerzettek
#/#/
SELECT lkÖsszesJogviszonyIdõtartamSzemélyek.Adójel, Date()-Dtátal([Szolgálati elismerésre jogosultság / Jubileumi jutalom kezdõ dát])+1 AS ElsimerésreJogosítóIdõtartam
FROM lkSzolgálatiIdõElismerés INNER JOIN lkÖsszesJogviszonyIdõtartamSzemélyek ON lkSzolgálatiIdõElismerés.Adójel = lkÖsszesJogviszonyIdõtartamSzemélyek.Adójel
WHERE (((Date()-Dtátal([Szolgálati elismerésre jogosultság / Jubileumi jutalom kezdõ dát])+1)=[ÖsszIdõtartam]));

#/#/#/
lkElkószáltÁlláshelyekÁNYR
#/#/
SELECT lkÁlláshelyekBelsõElosztásaFõosztályOsztály.Fõoszt AS [Engedély szerinti fõosztály], lkÁlláshelyek.Fõoszt AS [ÁNYR szerinti fõosztály], lkÁlláshelyekBelsõElosztásaFõosztályOsztály.[Álláshely azonosító]
FROM lkÁlláshelyek INNER JOIN lkÁlláshelyekBelsõElosztásaFõosztályOsztály ON lkÁlláshelyek.[Álláshely azonosító] = lkÁlláshelyekBelsõElosztásaFõosztályOsztály.[Álláshely azonosító]
WHERE (((lkÁlláshelyek.Fõoszt)<>[lkÁlláshelyekBelsõElosztásaFõosztályOsztály].[Fõoszt]));

#/#/#/
lkElkószáltÁlláshelyekNexon
#/#/
SELECT lkÁlláshelyekBelsõElosztásaFõosztályOsztály.Fõoszt AS [Engedély szerinti fõosztály], lkÁlláshelyekHaviból.Fõoszt, lkÁlláshelyekBelsõElosztásaFõosztályOsztály.[Álláshely azonosító]
FROM lkÁlláshelyekBelsõElosztásaFõosztályOsztály INNER JOIN lkÁlláshelyekHaviból ON lkÁlláshelyekBelsõElosztásaFõosztályOsztály.[Álláshely azonosító] = lkÁlláshelyekHaviból.[Álláshely azonosító]
WHERE (((lkÁlláshelyekHaviból.Fõoszt)<>[lkÁlláshelyekBelsõElosztásaFõosztályOsztály].[Fõoszt]));

#/#/#/
lkEllenõrzés_03_e-mail_címek
#/#/
SELECT DISTINCT lk_Ellenõrzés_03.TO AS Kif1
FROM lk_Ellenõrzés_03;

#/#/#/
lkEllenõrzés_ProjektesekAlaplétszámon
#/#/
SELECT DISTINCT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Státusz költséghelyének neve] AS Költséghely, lkSzemélyek.[Státusz költséghelyének kódja] AS [Költséghely kód], kt_azNexon_Adójel02.NLink AS NLink, lkSzemélyek.[Státusz neve]
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND (([lkSzemélyek].[Státusz költséghelyének neve]) Is Not Null) AND ((lkSzemélyek.[Státusz típusa])="Szervezeti alaplétszám")) OR (((lkSzemélyek.[Státusz költséghelyének kódja]) Is Not Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Státusz típusa])="Szervezeti alaplétszám"));

#/#/#/
lkEllenõrzés_vezetõkFeladatköreBeosztása
#/#/
SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Szervezeti egység neve], lkSzemélyek.Besorolás, lkSzemélyek.Feladatok, lkSzemélyek.Feladatkör, lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.[Vezetõi beosztás megnevezése], lkSzemélyek.[Vezetõi megbízás típusa]
FROM kt_azNexon_Adójel INNER JOIN lkSzemélyek ON kt_azNexon_Adójel.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.Besorolás) Like "járási*" Or (lkSzemélyek.Besorolás) Like "*igazgató*" Or (lkSzemélyek.Besorolás) Like "*osztály*") AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null))
ORDER BY lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkEllenõrzõ_Lekérdezések__NEM_üres
#/#/
SELECT tJavítandóMezõnevek.azJavítandó, "SELECT '"          & [Ellenõrzéshez] & "' AS Tábla, '"          & [Eredeti] & "' AS Hiányzó_érték, "          & [Ellenõrzéshez] & ".[Adóazonosító], "          & [Ellenõrzéshez] & ".[Álláshely azonosító], "          & [Ellenõrzéshez] & ".[" & [SzervezetKód_mezõ] & "] " AS [Select], "FROM [" & [Ellenõrzéshez] & "] " AS [From], "WHERE ([" & [Ellenõrzéshez] & "].[" & [Import] & "] Is Null " & IIf([Szöveg],"OR [" & [Ellenõrzéshez] & "].[" & [Import] & "]='') ",") ") & IIf(IsNull([ÜresÁlláshelyMezõk]),""," AND ([" & [Ellenõrzéshez] & "].[" & [ÜresÁlláshelyMezõk] & "]<> 'üres állás' OR [" & [Ellenõrzéshez] & "].[" & [ÜresÁlláshelyMezõk] & "] is null ) ") AS [Where], tJavítandóMezõnevek.NemKötelezõ, tJavítandóMezõnevek.NemKötelezõÜresÁlláshelyEsetén, [Select] & [From] & [Where] AS [SQL], Len([SQL]) AS Hossz, tJavítandóMezõnevek.Ellenõrzéshez
FROM tJavítandóMezõnevek
WHERE (((tJavítandóMezõnevek.NemKötelezõ)=False) AND ((tJavítandóMezõnevek.Ellenõrzéshez) Is Not Null))
ORDER BY tJavítandóMezõnevek.azJavítandó;

#/#/#/
lkEllenõrzõ_Lekérdezések__ÜRES
#/#/
SELECT "SELECT '" & [Tábla] & "' AS Tábla, '" & [Import] & "' AS Hiányzó_érték, " & [Tábla] & ".[Adóazonosító], " & [Tábla] & ".[Álláshely azonosító], " & [Tábla] & ".[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] " AS [Select], "FROM [" & [Tábla] & "] " AS [From], "WHERE ([" & [Tábla] & "].[" & [Import] & "] Is Null OR [" & [Tábla] & "].[" & [Import] & "] = '')" & IIf(IsNull([ÜresÁlláshelyMezõk]),""," AND [" & [Tábla] & "].[" & [ÜresÁlláshelyMezõk] & "] = 'üres állás' ") AS [Where], tJavítandóMezõnevek.azJavítandó, tJavítandóMezõnevek.NemKötelezõ, tJavítandóMezõnevek.NemKötelezõÜresÁlláshelyEsetén, [Select] & [From] & [Where] AS [SQL], Len([SQL]) AS Hossz
FROM tJavítandóMezõnevek
WHERE (((tJavítandóMezõnevek.NemKötelezõ)=True) AND ((tJavítandóMezõnevek.NemKötelezõÜresÁlláshelyEsetén)=False));

#/#/#/
lkEllenõrzõ_Lekérdezések_ÜRES_union
#/#/
SELECT 'Kilépõk' AS Tábla, 'Besorolási fokozat megnevezése:' AS Hiányzó_érték, Kilépõk.[Adóazonosító], Kilépõk.[Álláshely azonosító], Kilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Kilépõk] WHERE ([Kilépõk].[Besorolási fokozat megnevezése:] Is Null OR [Kilépõk].[Besorolási fokozat megnevezése:] = '')
UNION
SELECT 'Határozottak' AS Tábla, 'Megyei szint VAGY Járási Hivatal' AS Hiányzó_érték, Határozottak.[Adóazonosító], Határozottak.[Álláshely azonosító], Határozottak.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Határozottak] WHERE ([Határozottak].[Megyei szint VAGY Járási Hivatal] Is Null OR [Határozottak].[Megyei szint VAGY Járási Hivatal] = '')
UNION
SELECT 'Határozottak' AS Tábla, 'Mezõ5' AS Hiányzó_érték, Határozottak.[Adóazonosító], Határozottak.[Álláshely azonosító], Határozottak.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Határozottak] WHERE ([Határozottak].[Mezõ5] Is Null OR [Határozottak].[Mezõ5] = '')
UNION
SELECT 'Határozottak' AS Tábla, 'Mezõ6' AS Hiányzó_érték, Határozottak.[Adóazonosító], Határozottak.[Álláshely azonosító], Határozottak.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Határozottak] WHERE ([Határozottak].[Mezõ6] Is Null OR [Határozottak].[Mezõ6] = '')
UNION
SELECT 'Határozottak' AS Tábla, 'ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ' AS Hiányzó_érték, Határozottak.[Adóazonosító], Határozottak.[Álláshely azonosító], Határozottak.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Határozottak] WHERE ([Határozottak].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] Is Null OR [Határozottak].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] = '')
UNION
SELECT 'Határozottak' AS Tábla, 'Besorolási fokozat megnevezése:' AS Hiányzó_érték, Határozottak.[Adóazonosító], Határozottak.[Álláshely azonosító], Határozottak.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Határozottak] WHERE ([Határozottak].[Besorolási fokozat megnevezése:] Is Null OR [Határozottak].[Besorolási fokozat megnevezése:] = '')
UNION SELECT 'Határozottak' AS Tábla, 'Mezõ24' AS Hiányzó_érték, Határozottak.[Adóazonosító], Határozottak.[Álláshely azonosító], Határozottak.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] FROM [Határozottak] WHERE ([Határozottak].[Mezõ24] Is Null OR [Határozottak].[Mezõ24] = '');

#/#/#/
lkEllenõrzõLekérdezések
#/#/
SELECT *
FROM lkEllenõrzõLekérdezések2
WHERE [Osztály] = [qWhere]
ORDER BY [LapNév], [TáblaCím];

#/#/#/
lkEllenõrzõLekérdezések2
#/#/
SELECT tEllenõrzõLekérdezések.azEllenõrzõ, tEllenõrzõLekérdezések.EllenõrzõLekérdezés, tEllenõrzõLekérdezések.Táblacím, IIf([graftulajdonság]="Type",[graftulérték],"") AS VaneGraf, tEllenõrzõLekérdezések.Kimenet, tEllenõrzõLekérdezések.KellVisszajelzes, tEllenõrzõLekérdezések.azUnion, tEllenõrzõLekérdezések.TáblaMegjegyzés, tLekérdezésTípusok.azETípus, tLekérdezésTípusok.TípusNeve, tLekérdezésTípusok.LapNév, tLekérdezésTípusok.Megjegyzés, tLekérdezésTípusok.Osztály, tLekérdezésTípusok.vbaPostProcessing, tEllenõrzõLekérdezések.Sorrend, tLekérdezésTípusok.Sorrend, tEllenõrzõLekérdezések.Sorrend
FROM tLekérdezésOsztályok INNER JOIN ((tLekérdezésTípusok INNER JOIN tEllenõrzõLekérdezések ON tLekérdezésTípusok.azETípus = tEllenõrzõLekérdezések.azETípus) LEFT JOIN tGrafikonok ON tEllenõrzõLekérdezések.azEllenõrzõ = tGrafikonok.azEllenõrzõ) ON tLekérdezésOsztályok.azOsztály = tLekérdezésTípusok.Osztály
ORDER BY tEllenõrzõLekérdezések.Sorrend, tLekérdezésTípusok.Sorrend, tEllenõrzõLekérdezések.Sorrend;

#/#/#/
lkEllenõrzõLekérdezések2csakLekérdezések
#/#/
SELECT DISTINCT lkEllenõrzõLekérdezések2.EllenõrzõLekérdezés
FROM lkEllenõrzõLekérdezések2
ORDER BY lkEllenõrzõLekérdezések2.EllenõrzõLekérdezés;

#/#/#/
lkEllenõrzõLekérdezések2Mezõnevekkel
#/#/
SELECT DISTINCT mSyslkMezõnevek.MezõNév, lkEllenõrzõLekérdezések2csakLekérdezések.EllenõrzõLekérdezés
FROM lkEllenõrzõLekérdezések2csakLekérdezések LEFT JOIN mSyslkMezõnevek ON lkEllenõrzõLekérdezések2csakLekérdezések.EllenõrzõLekérdezés = mSyslkMezõnevek.QueryName
WHERE (((lkEllenõrzõLekérdezések2csakLekérdezések.EllenõrzõLekérdezés)=[Ûrlapok]![ûEllenõrzõLekérdezések2]![A lekérdezés mezõk típusai:]![LekérdezésNeve]))
ORDER BY lkEllenõrzõLekérdezések2csakLekérdezések.EllenõrzõLekérdezés, mSyslkMezõnevek.MezõNév;

#/#/#/
lkEllenõrzõLekérdezések2ûrlaphoz
#/#/
SELECT tLekérdezésOsztályok.Sorrend AS [Oldalak sorrendje], tLekérdezésTípusok.Sorrend AS [Fejezetek sorrendje], tEllenõrzõLekérdezések.Sorrend AS [Lekérdezések sorrendje], tEllenõrzõLekérdezések.azEllenõrzõ, tEllenõrzõLekérdezések.EllenõrzõLekérdezés, tEllenõrzõLekérdezések.Táblacím, tEllenõrzõLekérdezések.Kimenet, tEllenõrzõLekérdezések.KellVisszajelzes, tEllenõrzõLekérdezések.azUnion, tEllenõrzõLekérdezések.TáblaMegjegyzés, tEllenõrzõLekérdezések.azETípus, tEllenõrzõLekérdezések.ElõzményUnió
FROM tLekérdezésOsztályok INNER JOIN (tLekérdezésTípusok INNER JOIN tEllenõrzõLekérdezések ON tLekérdezésTípusok.azETípus = tEllenõrzõLekérdezések.azETípus) ON tLekérdezésOsztályok.azOsztály = tLekérdezésTípusok.Osztály
WHERE (((tEllenõrzõLekérdezések.Táblacím) Like "*" & [Ûrlapok]![ûEllenõrzõLekérdezések2]![Keresés] & "*")) OR (((tEllenõrzõLekérdezések.EllenõrzõLekérdezés) Like "*" & [Ûrlapok]![ûEllenõrzõLekérdezések2]![Keresés] & "*")) OR (((tEllenõrzõLekérdezések.TáblaMegjegyzés) Like "*" & [Ûrlapok]![ûEllenõrzõLekérdezések2]![Keresés] & "*"))
ORDER BY tLekérdezésOsztályok.Sorrend, tLekérdezésTípusok.Sorrend, tEllenõrzõLekérdezések.Sorrend, tEllenõrzõLekérdezések.Táblacím;

#/#/#/
lkEllenõrzõLekérdezések3
#/#/
SELECT tLekérdezésTípusok.Sorrend AS Fejezetsorrend, tEllenõrzõLekérdezések.Sorrend AS Leksorrend, tEllenõrzõLekérdezések.EllenõrzõLekérdezés, tLekérdezésTípusok.LapNév, tLekérdezésTípusok.Osztály, tLekérdezésTípusok.Megjegyzés, tEllenõrzõLekérdezések.Táblacím, Nz([graftulérték],"") AS vaneGraf, tLekérdezésTípusok.azETípus, tEllenõrzõLekérdezések.Kimenet, tEllenõrzõLekérdezések.KellVisszajelzes, tEllenõrzõLekérdezések.azUnion, tEllenõrzõLekérdezések.TáblaMegjegyzés, tEllenõrzõLekérdezések.azHibaCsoport
FROM (tLekérdezésTípusok INNER JOIN tEllenõrzõLekérdezések ON tLekérdezésTípusok.azETípus = tEllenõrzõLekérdezések.azETípus) LEFT JOIN tGrafikonok ON tEllenõrzõLekérdezések.azEllenõrzõ = tGrafikonok.azEllenõrzõ
WHERE (((tGrafikonok.grafTulajdonság)="Type" Or (tGrafikonok.grafTulajdonság) Is Null))
ORDER BY tLekérdezésTípusok.Osztály, tLekérdezésTípusok.LapNév, tEllenõrzõLekérdezések.Táblacím, tLekérdezésTípusok.azETípus;

#/#/#/
lkEllenõrzõLekérdezésekHiányosMezõtípussal
#/#/
SELECT lkLekérdezésekMezõinekSzáma.EllenõrzõLekérdezés, lkLekérdezésekMezõinekSzáma.CountOfAttribute, lkEllenõrzõLekérdezésekTípusolMezõinekSzáma.CountOfMezõNeve, lkEllenõrzõLekérdezésekTípusolMezõinekSzáma.EllenõrzõLekérdezés
FROM lkLekérdezésekMezõinekSzáma RIGHT JOIN lkEllenõrzõLekérdezésekTípusolMezõinekSzáma ON lkLekérdezésekMezõinekSzáma.EllenõrzõLekérdezés = lkEllenõrzõLekérdezésekTípusolMezõinekSzáma.EllenõrzõLekérdezés
WHERE (((lkEllenõrzõLekérdezésekTípusolMezõinekSzáma.CountOfMezõNeve)<[CountOfAttribute]));

#/#/#/
lkEllenõrzõLekérdezésekSegédûrlaphoz
#/#/
SELECT tEllenõrzõLekérdezések.azETípus, tEllenõrzõLekérdezések.azEllenõrzõ, tEllenõrzõLekérdezések.Táblacím, tEllenõrzõLekérdezések.Sorrend
FROM tEllenõrzõLekérdezések;

#/#/#/
lkEllenõrzõLekérdezésekTípusolMezõinekSzáma
#/#/
SELECT lkEllenõrzõLekérdezések2.EllenõrzõLekérdezés, Count(tLekérdezésMezõTípusok.MezõNeve) AS CountOfMezõNeve
FROM lkEllenõrzõLekérdezések2 LEFT JOIN tLekérdezésMezõTípusok ON lkEllenõrzõLekérdezések2.EllenõrzõLekérdezés = tLekérdezésMezõTípusok.LekérdezésNeve
WHERE (((lkEllenõrzõLekérdezések2.Kimenet)=True))
GROUP BY lkEllenõrzõLekérdezések2.EllenõrzõLekérdezés;

#/#/#/
lkEllenõrzõLekérdezésVanegraf
#/#/
SELECT tEllenõrzõLekérdezések.EllenõrzõLekérdezés, IIf([tGrafikonok].[azEllenõrzõ] Is Null,0,-1) AS VaneGraf
FROM tEllenõrzõLekérdezések LEFT JOIN tGrafikonok ON tEllenõrzõLekérdezések.azEllenõrzõ = tGrafikonok.azEllenõrzõ;

#/#/#/
lkElsõOsztályvezetõvéSorolásDátuma
#/#/
SELECT [Adóazonosító jel]*1 AS Adójel, Min(tBesorolásiEredményadatok.[Változás dátuma]) AS [MinOfVáltozás dátuma]
FROM tBesorolásiEredményadatok
WHERE (((tBesorolásiEredményadatok.[Besorolási fokozat12])="Osztályvezetõ"))
GROUP BY [Adóazonosító jel]*1;

#/#/#/
lkEltérõBesorolásokLechnernek
#/#/
SELECT lkSzemélyek.Adójel, "" AS [HR kapcsolat azonosító], #1/1/2024# AS [Érvényesség kezdete], tBesorolásiKódok.Kód, tBesorolásÁtalakítóEltérõBesoroláshoz.[Besorolási  fokozat (KT)] AS ÁNYR, lkSzemélyek.[Besorolási  fokozat (KT)] AS [Nexon személytörzs], lkBesorolásVáltoztatások.RégiBesorolás, lkBesorolásVáltoztatások.ÚjBesorolás, lkÁlláshelyek.[Álláshely azonosító]
FROM lkBesorolásVáltoztatások RIGHT JOIN (tBesorolásiKódok INNER JOIN (lkSzemélyek INNER JOIN (lkÁlláshelyek INNER JOIN tBesorolásÁtalakítóEltérõBesoroláshoz ON lkÁlláshelyek.[Álláshely besorolási kategóriája] = tBesorolásÁtalakítóEltérõBesoroláshoz.[Álláshely besorolási kategóriája]) ON lkSzemélyek.[Státusz kódja] = lkÁlláshelyek.[Álláshely azonosító]) ON tBesorolásiKódok.Besorolás = tBesorolásÁtalakítóEltérõBesoroláshoz.[Besorolási  fokozat (KT)]) ON lkBesorolásVáltoztatások.ÁlláshelyAzonosító = lkÁlláshelyek.[Álláshely azonosító]
WHERE (((tBesorolásÁtalakítóEltérõBesoroláshoz.[Besorolási  fokozat (KT)])<>[lkSzemélyek].[Besorolási  fokozat (KT)]) AND ((lkBesorolásVáltoztatások.RégiBesorolás) Is Not Null));

#/#/#/
lkEltérõBesorolásokÚj01
#/#/
SELECT DISTINCT lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzervezetiÁlláshelyek.[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] AS [Szervezeti struktúra], lkBesorolásVáltoztatások.ÚjBesorolás, lkSzemélyek.Besorolás AS [Személyi karton], lkSzemélyek.[Jogviszony típusa / jogviszony típus], lkSzemélyek.[Tartós távollét típusa], lkSzervezetiÁlláshelyek.ÁlláshelyAzonosító AS [Álláshely azonosító], kt_azNexon_Adójel02.NLink, bfkh([SzervezetKód]) AS BFKH, IIf([Besorolás]<>[ÚjBesorolás],"Az eltérés oka: az új besoroltatás még nincs rögzítve a Nexon-ban.","") AS Megjegyzés
FROM lkBesorolásVáltoztatások RIGHT JOIN (kt_azNexon_Adójel02 RIGHT JOIN (lkSzervezetiÁlláshelyek LEFT JOIN lkSzemélyek ON lkSzervezetiÁlláshelyek.ÁlláshelyAzonosító = lkSzemélyek.[Státusz kódja]) ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel) ON lkBesorolásVáltoztatások.ÁlláshelyAzonosító = lkSzervezetiÁlláshelyek.ÁlláshelyAzonosító
WHERE (((lkSzervezetiÁlláshelyek.[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés])<>[Besorolás]) AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus])<>"Munkaviszony"));

#/#/#/
lkEltérõBesorolásokÚj02
#/#/
SELECT lkEltérõBesorolásokÚj01.Fõosztály AS Fõosztály, lkEltérõBesorolásokÚj01.Osztály AS Osztály, lkEltérõBesorolásokÚj01.Név AS Név, lkEltérõBesorolásokÚj01.[Álláshely azonosító] AS [Státusz kód], lkEltérõBesorolásokÚj01.[Szervezeti struktúra] AS [Szervezeti struktúrában], lkEltérõBesorolásokÚj01.[Személyi karton] AS [Személyi kartonon], lkEltérõBesorolásokÚj01.[Jogviszony típusa / jogviszony típus] AS [Jogviszony típusa], lkEltérõBesorolásokÚj01.[Tartós távollét típusa] AS [Tartós távollét típusa], lkEltérõBesorolásokÚj01.NLink AS NLink, lkEltérõBesorolásokÚj01.Megjegyzés AS Megjegyzés
FROM lkEltérõBesorolásokÚj01
ORDER BY lkEltérõBesorolásokÚj01.BFKH;

#/#/#/
lkEltérõIlletményekHaviSzemély
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkIlletményekHavi.Illetmény, lkSzemélyek.[Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)], lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker], lkSzemélyek.[Garantált bérminimumra történõ kiegészítés], lkSzemélyek.[Egyéb pótlék - összeg (eltérítés nélküli)], lkSzemélyek.Kerekítés, lkSzemélyek.[Illetmény összesen kerekítés nélkül (eltérítés nélküli)], lkSzemélyek.[Kerekített 100 %-os illetmény (eltérítés nélküli)], lkSzemélyek.[Eltérítés %]
FROM lkIlletményekHavi RIGHT JOIN lkSzemélyek ON lkIlletményekHavi.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Kerekített 100 %-os illetmény (eltérítés nélküli)])<>[lkIlletményekHavi].[Illetmény]));

#/#/#/
lkEltérõKöltséghelyek
#/#/
SELECT DISTINCT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Dolgozó költséghelyének kódja], lkSzemélyek.[Dolgozó költséghelyének neve], lkSzemélyek.[Státusz költséghelyének kódja], lkSzemélyek.[Státusz költséghelyének neve]
FROM lkSzemélyek;

#/#/#/
lkEltérõSzervezetnevek2
#/#/
SELECT lkÁlláshelyek.[Álláshely azonosító], lkÁlláshelyek.FõosztályÁlláshely AS [Fõosztály (ÁNYR)], Nz([5 szint]) AS [Osztály (ÁNYR)], lkSzervezetiÁlláshelyek.[Szervezeti egységének megnevezése], lkSzervezetiÁlláshelyek.Fõosztály AS [Fõosztály (Szervezeti)], lkSzervezetiÁlláshelyek.Osztály AS [Osztály (Szervezeti)]
FROM lkSzervezetiÁlláshelyek INNER JOIN lkÁlláshelyek ON lkSzervezetiÁlláshelyek.ÁlláshelyAzonosító = lkÁlláshelyek.[Álláshely azonosító]
WHERE (((lkSzervezetiÁlláshelyek.Osztály)<>[lkÁlláshelyek].[Oszt])) OR (((lkSzervezetiÁlláshelyek.Fõosztály)<>[lkÁlláshelyek].[FõosztályÁlláshely]));

#/#/#/
lkELvégzendõBesoroltatások00
#/#/
SELECT DISTINCT lkBesorolásiEredményadatok.Adójel, lkBesorolásiEredményadatok.kezdete10 AS BesorolásiFokozatKezdete, lkBesorolásiEredményadatok.vége11 AS BesorolásiFokozatVége, lkBesorolásiEredményadatok.[Utolsó besorolás dátuma], lkBesorolásiEredményadatok.Vége AS JogviszonVége
FROM lkBesorolásiEredményadatok
WHERE (((lkBesorolásiEredményadatok.[Utolsó besorolás dátuma]) Is Not Null) AND ((lkBesorolásiEredményadatok.Vége) Is Null Or (lkBesorolásiEredményadatok.Vége)>Date()) AND ((lkBesorolásiEredményadatok.vége11) Is Null Or (lkBesorolásiEredményadatok.vége11)>Date()));

#/#/#/
lkElvégzendõBesoroltatások01
#/#/
SELECT DISTINCT lkSzemélyek.BFKH, lkELvégzendõBesoroltatások00.Adójel, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], lkSzemélyek.[Jogviszony vége (kilépés dátuma)], lkELvégzendõBesoroltatások00.[Utolsó besorolás dátuma]
FROM lkELvégzendõBesoroltatások00 INNER JOIN lkSzemélyek ON lkELvégzendõBesoroltatások00.Adójel = lkSzemélyek.Adójel
WHERE (((lkELvégzendõBesoroltatások00.[Utolsó besorolás dátuma])<#1/1/2024#) AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus])="Kormányzati szolgálati jogviszony") AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkElvégzendõBesoroltatások02
#/#/
SELECT lkElvégzendõBesoroltatások01.Fõosztály AS Fõosztály, lkElvégzendõBesoroltatások01.Osztály AS Osztály, lkElvégzendõBesoroltatások01.Név AS Név, lkElvégzendõBesoroltatások01.[Utolsó besorolás dátuma] AS [Utolsó besorolás dátuma], kt_azNexon_Adójel02.NLink AS NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN lkElvégzendõBesoroltatások01 ON kt_azNexon_Adójel02.Adójel = lkElvégzendõBesoroltatások01.Adójel
ORDER BY lkElvégzendõBesoroltatások01.Fõosztály, lkElvégzendõBesoroltatások01.Osztály, lkElvégzendõBesoroltatások01.Név;

#/#/#/
lkElvégzendõBesoroltatások02_régi
#/#/
SELECT lkElvégzendõBesoroltatások01.BFKH, lkElvégzendõBesoroltatások01.Adójel, lkElvégzendõBesoroltatások01.Fõosztály AS Fõosztály, lkElvégzendõBesoroltatások01.Osztály AS Osztály, lkElvégzendõBesoroltatások01.Név AS Név, lkElvégzendõBesoroltatások01.[Utolsó besorolás dátuma] AS [Utolsó besorolás dátuma], kt_azNexon_Adójel.NLink AS NLink
FROM lkElvégzendõBesoroltatások01 LEFT JOIN kt_azNexon_Adójel ON lkElvégzendõBesoroltatások01.Adójel = kt_azNexon_Adójel.Adójel
ORDER BY lkElvégzendõBesoroltatások01.Fõosztály, lkElvégzendõBesoroltatások01.Osztály, lkElvégzendõBesoroltatások01.Név;

#/#/#/
lkEngedélyezettBesorolásHavihoz
#/#/
SELECT tBesorolásÁtalakítóEltérõBesoroláshoz.jel, IIf([Álláshely típusa] Like "A*","A","K") AS Típus, tBesorolásÁtalakítóEltérõBesoroláshoz.rang, lkÁlláshelyek.[Álláshely besorolási kategóriája], Count(lkÁlláshelyek.[Álláshely azonosító]) AS [CountOfÁlláshely azonosító]
FROM tBesorolásÁtalakítóEltérõBesoroláshoz INNER JOIN lkÁlláshelyek ON tBesorolásÁtalakítóEltérõBesoroláshoz.[Álláshely besorolási kategóriája] = lkÁlláshelyek.[Álláshely besorolási kategóriája]
GROUP BY tBesorolásÁtalakítóEltérõBesoroláshoz.jel, IIf([Álláshely típusa] Like "A*","A","K"), tBesorolásÁtalakítóEltérõBesoroláshoz.rang, lkÁlláshelyek.[Álláshely besorolási kategóriája]
ORDER BY IIf([Álláshely típusa] Like "A*","A","K"), tBesorolásÁtalakítóEltérõBesoroláshoz.rang;

#/#/#/
lkEngedélyezettésLétszámKimenet
#/#/
SELECT IIf([Fõosztály]="Kormánymegbízott","Fõispán",[Fõosztály]) AS Fõoszt, IIf(([Fõosztály] Like "*Fõosztály" And ([Osztály]="" Or [Osztály]="Fõosztályvezetõ")) Or ([Fõosztály] Like "BFKH*" And ([Osztály]="" Or [Osztály]="Hivatalvezetés")),[Fõosztály],IIf([Osztály]="Kormánymegbízott","Fõispán",[Osztály])) AS Oszt1, Sum(TT21_22_23ésLétszám21_22.L2021) AS L2021, Sum(TT21_22_23ésLétszám21_22.L2022) AS L2022, Sum(TT21_22_23ésLétszám21_22.L2023) AS L2023, Sum(TT21_22_23ésLétszám21_22.TT2021) AS TT2021, Sum(TT21_22_23ésLétszám21_22.TT2022) AS TT2022, Sum(TT21_22_23ésLétszám21_22.TT2023) AS TT2023
FROM (SELECT lkTT21_22_23.Fõosztály, lkTT21_22_23.Osztály, 0 AS L2021, 0 AS L2022, SumOfLétszám2023 as L2023, lkTT21_22_23.SumOfTTLétszám2021 AS TT2021, lkTT21_22_23.SumOfTTLétszám2022 AS TT2022, lkTT21_22_23.SumOfTTLétszám2023 AS TT2023
FROM lkTT21_22_23
UNION
SELECT lkEngedélyezettLétszámok.[Fõosztály], lkEngedélyezettLétszámok.Osztály, lkEngedélyezettLétszámok.SumOf2021 AS L2021, lkEngedélyezettLétszámok.SumOf2022 AS L2022, 0 AS L2023, 0 AS TT2021, 0 AS TT2022, 0 AS TT2023
FROM  lkEngedélyezettLétszámok)  AS TT21_22_23ésLétszám21_22
GROUP BY IIf([Fõosztály]="Kormánymegbízott","Fõispán",[Fõosztály]), IIf(([Fõosztály] Like "*Fõosztály" And ([Osztály]="" Or [Osztály]="Fõosztályvezetõ")) Or ([Fõosztály] Like "BFKH*" And ([Osztály]="" Or [Osztály]="Hivatalvezetés")),[Fõosztály],IIf([Osztály]="Kormánymegbízott","Fõispán",[Osztály]));

#/#/#/
lkEngedélyezettésLétszámKimenet02
#/#/
SELECT [Fõoszt] AS Fõosztály, IIf([Oszt1]="",[Fõoszt],[Oszt1]) AS Oszt, Sum(lkEngedélyezettésLétszámKimenet.L2021) AS L2021, Sum(lkEngedélyezettésLétszámKimenet.L2022) AS L2022, Sum(lkEngedélyezettésLétszámKimenet.L2023) AS L2023, Sum(lkEngedélyezettésLétszámKimenet.TT2021) AS TT2021, Sum(lkEngedélyezettésLétszámKimenet.TT2022) AS TT2022, Sum(lkEngedélyezettésLétszámKimenet.TT2023) AS TT2023
FROM lkEngedélyezettésLétszámKimenet
GROUP BY [Fõoszt], IIf([Oszt1]="",[Fõoszt],[Oszt1]);

#/#/#/
lkEngedélyezettLétszámok
#/#/
SELECT Replace(Replace([Fõosztály/Vezetõ],"Budapest Fõváros Kormányhivatala","BFKH"),"  "," ") AS Fõosztály, Unió2122.Osztály, Sum(Unió2122.[2021]) AS SumOf2021, Sum(Unió2122.[2022]) AS SumOf2022, Sum(Unió2122.[2023]) AS SumOf2023
FROM (SELECT tEngedélyezettLétszámok.[Fõosztály/Vezetõ], tEngedélyezettLétszámok.Osztály, tEngedélyezettLétszámok.Létszám AS 2021, 0 AS 2022, 0 AS 2023
FROM tEngedélyezettLétszámok
WHERE (((tEngedélyezettLétszámok.Hatály)=#1/1/2021#))
UNION
SELECT tEngedélyezettLétszámok.[Fõosztály/Vezetõ], tEngedélyezettLétszámok.Osztály, 0 AS 2021, tEngedélyezettLétszámok.Létszám AS 2022, 0 AS 2023
FROM tEngedélyezettLétszámok
WHERE (((tEngedélyezettLétszámok.Hatály)=#1/1/2022#))
UNION
SELECT tEngedélyezettLétszámok.[Fõosztály/Vezetõ], tEngedélyezettLétszámok.Osztály, 0 AS 2021, 0 AS 2022, tEngedélyezettLétszámok.Létszám AS 2023
FROM tEngedélyezettLétszámok
WHERE (((tEngedélyezettLétszámok.Hatály)=#3/25/2023#))
)  AS Unió2122
GROUP BY Unió2122.Osztály, Replace([Fõosztály/Vezetõ],"Budapest Fõváros Kormányhivatala","BFKH");

#/#/#/
lkEsetiCsúcsvezetõk
#/#/
SELECT "Budapest Fõváros Kormányhivatala" AS Kormányhivatal, lkSzemélyek.Besorolás, lkSzemélyek.[Dolgozó teljes neve]
FROM lkSzemélyek
WHERE (((lkSzemélyek.Besorolás)="fõispán") AND ((lkSzemélyek.[Státusz neve])="álláshely")) OR (((lkSzemélyek.Besorolás)="fõigazgató") AND ((lkSzemélyek.[Státusz neve])="álláshely")) OR (((lkSzemélyek.Besorolás) Like "*hivatal vezetõje") AND ((lkSzemélyek.[Státusz neve])="álláshely")) OR (((lkSzemélyek.Fõosztály) Like "Pénz*") AND ((lkSzemélyek.Besorolás)="fõosztályvezetõ") AND ((lkSzemélyek.[Státusz neve])="álláshely"))
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkEsetiEgyesFõosztályokLétszámaÉsVezetõi
#/#/
SELECT lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], lkFõosztályonéntiOsztályonkéntiLétszám.Létszám, lkSzemélyek.[Státusz típusa]
FROM lkSzemélyek INNER JOIN lkFõosztályonéntiOsztályonkéntiLétszám ON lkSzemélyek.BFKH = lkFõosztályonéntiOsztályonkéntiLétszám.BFKH
WHERE (((lkSzemélyek.Fõosztály)="Foglalkoztatási Fõosztály") AND ((lkSzemélyek.[Státusz típusa]) Like "Köz*") AND ((lkSzemélyek.Besorolás2)="Osztályvezetõ") AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkEsetiGyámügyiÁllománytábla01
#/#/
SELECT bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS bfkh, lkJárásiKormányKözpontosítottUnió.Fõosztály, lkJárásiKormányKözpontosítottUnió.Osztály, lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító], lkJárásiKormányKözpontosítottUnió.Név, lkJárásiKormányKözpontosítottUnió.[Havi illetmény], lkJárásiKormányKözpontosítottUnió.[Heti munkaórák száma], "" AS [Jogviszony vége]
FROM lkJárásiKormányKözpontosítottUnió
WHERE (((lkJárásiKormányKözpontosítottUnió.Fõosztály)="Gyámügyi Fõosztály") AND ((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás])<>"üres állás"))
ORDER BY lkJárásiKormányKözpontosítottUnió.Fõosztály, lkJárásiKormányKözpontosítottUnió.Osztály;

#/#/#/
lkEsetiGyámügyiÁllománytábla02
#/#/
SELECT bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS bfkh, lkKilépõUnió.Fõosztály, lkKilépõUnió.Osztály, lkKilépõUnió.[Álláshely azonosító], lkKilépõUnió.Név, lkKilépõUnió.[Illetmény (Ft/hó)], lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker], lkSzemélyek.[Jogviszony vége (kilépés dátuma)]
FROM lkSzemélyek INNER JOIN lkKilépõUnió ON (lkSzemélyek.[Jogviszony vége (kilépés dátuma)] = lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja]) AND (lkSzemélyek.[Adóazonosító jel] = lkKilépõUnió.Adóazonosító)
WHERE (((lkKilépõUnió.Fõosztály)="Gyámügyi Fõosztály"));

#/#/#/
lkEsetiGyámügyiÁllománytábla03
#/#/
SELECT *
FROM (SELECT lkEsetiGyámügyiÁllománytábla02.*
FROM lkEsetiGyámügyiÁllománytábla02
UNION SELECT  lkEsetiGyámügyiÁllománytábla01.*
FROM lkEsetiGyámügyiÁllománytábla01)  AS lkEsetiGyámügyiÁllománytábla0102;

#/#/#/
lkEsetiKockázatiKérdõív01
#/#/
SELECT lkSzemélyek.BFKH, "Budapest Fõváros Kormányhivatala" AS Szervezet, lkSzemélyek.[Szint 5 szervezeti egység név] AS Hivatal, lkSzemélyek.[Szint 6 szervezeti egység név] AS Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.Besorolás2, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Státusz típusa] AS Jelleg, lkSzemélyek.[KIRA jogviszony jelleg] AS Jogviszony
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH, lkSzemélyek.[Státusz típusa], lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkEsetiKockázatiKérdõív02
#/#/
SELECT lkSzervezetiÁlláshelyek.SzervezetKód AS BFKH, "Budapest Fõváros Kormányhivatala" AS Szervezet, lkSzervezetiÁlláshelyek.[Szint5 - leírás] AS Hivatal, lkSzervezetiÁlláshelyek.[Szint6 - leírás] AS Fõosztály, lkSzervezetiÁlláshelyek.[Szint7 - leírás] AS Osztály, lkSzervezetiÁlláshelyek.[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés] AS Besorolás, "" AS Név, lkSzervezetiÁlláshelyek.ÁlláshelyAzonosító AS [Álláshely azonosító], lkSzervezetiÁlláshelyek.[Státusz típusa] AS Jelleg, lkSzervezetiÁlláshelyek.[Tervezett betöltési adatok - Jogviszony típus] AS Jogviszony
FROM lkSzervezetiÁlláshelyek
WHERE (((lkSzervezetiÁlláshelyek.OSZLOPOK)="Státusz (betöltetlen)"));

#/#/#/
lkEsetiKockázatiKérdõív03
#/#/
SELECT lkEsetiKockázatiKérdõív02.*
FROM lkEsetiKockázatiKérdõív02
UNION SELECT lkEsetiKockázatiKérdõív01.*
FROM  lkEsetiKockázatiKérdõív01;

#/#/#/
lkEsetiNemzetiKorrupcióellenesStratégia
#/#/
SELECT lkSzervezetiVezetõkListája02.[Szervezeti egység vezetõje] AS [Kitöltõ neve], [Fõosztály] & ", " & [Név] AS [Kitöltõ szervezeti egysége], lkSzervezetiVezetõkListája02.Besorolása AS [Kitöltõ beosztása], IIf(Nz([HivataliVezetékes],[HivataliMobil]) Like "Hibás*","",Nz([HivataliVezetékes],[HivataliMobil])) AS [Kitöltõ telefonszáma], lkSzervezetiVezetõkListája02.[Hivatali email] AS [Kitöltõ e-mail címe], lkSzervezetiVezetõkListája02.HivataliMobil
FROM lkSzervezetiVezetõkListája02 INNER JOIN tmpKorrupcióEllenesLekérdezéshez ON lkSzervezetiVezetõkListája02.[BFKH kód] = tmpKorrupcióEllenesLekérdezéshez.BFKH
WHERE (((tmpKorrupcióEllenesLekérdezéshez.Kell_e)=True))
ORDER BY bfkh([BFKH kód]);

#/#/#/
lkEsetiProjektbeFelveendõk
#/#/
SELECT kt_azNexon_Adójel02.Adójel, tEsetiProjektbeFelveendõk.[Költséghely*]
FROM tEsetiProjektbeFelveendõk LEFT JOIN kt_azNexon_Adójel02 ON tEsetiProjektbeFelveendõk.[Személy azonosítója*] = kt_azNexon_Adójel02.azNexon;

#/#/#/
lkEsküLejártIdõpontokhozHozzáfûz
#/#/
INSERT INTO tEsküLejártIdõpontok ( [Szervezeti egység kód], [Szervezeti egység], [Szervezeti szint száma-neve], [Jogviszony típus], [Jogviszony kezdete], [Jogviszony vége], [Dolgozó neve], [Adóazonosító jel], [Figyelendõ dátum típusa], [Figyelendõ dátum], [Szint 1 szervezeti egység kód], [Szint 1 szervezeti egység név], [Szint 2 szervezeti egység kód], [Szint 2 szervezeti egység név], [Szint 3 szervezeti egység kód], [Szint 3 szervezeti egység név], [Szint 4 szervezeti egység kód], [Szint 4 szervezeti egység név], [Szint 5 szervezeti egység kód], [Szint 5 szervezeti egység név], [Szint 6 szervezeti egység kód], [Szint 6 szervezeti egység név], [Szint 7 szervezeti egység kód], [Szint 7 szervezeti egység név], [Szint 8 szervezeti egység kód], [Szint 8 szervezeti egység név], [Szint 9 szervezeti egység kód], [Szint 9 szervezeti egység név], [Szint 10 szervezeti egység kód], [Szint 10 szervezeti egység név] )
SELECT TmptEsküLejártIdõpontok.[Szervezeti egység kód] AS Kif1, TmptEsküLejártIdõpontok.[Szervezeti egység] AS Kif2, TmptEsküLejártIdõpontok.[Szervezeti szint száma-neve] AS Kif3, TmptEsküLejártIdõpontok.[Jogviszony típus] AS Kif4, dtátal([  Jogviszony kezdete]) AS [Jogviszony kezdete], dtátal([  Jogviszony vége]) AS [Jogviszony vége], TmptEsküLejártIdõpontok.[Dolgozó neve] AS Kif5, TmptEsküLejártIdõpontok.[Adóazonosító jel] AS Kif6, TmptEsküLejártIdõpontok.[Figyelendõ dátum típusa] AS Kif7, dtátal([Figyelendõ dátum]) AS Kif3, TmptEsküLejártIdõpontok.[Szint 1 szervezeti egység kód] AS Kif8, TmptEsküLejártIdõpontok.[Szint 1 szervezeti egység név] AS Kif9, TmptEsküLejártIdõpontok.[Szint 2 szervezeti egység kód] AS Kif10, TmptEsküLejártIdõpontok.[Szint 2 szervezeti egység név] AS Kif11, TmptEsküLejártIdõpontok.[Szint 3 szervezeti egység kód] AS Kif12, TmptEsküLejártIdõpontok.[Szint 3 szervezeti egység név] AS Kif13, TmptEsküLejártIdõpontok.[Szint 4 szervezeti egység kód] AS Kif14, TmptEsküLejártIdõpontok.[Szint 4 szervezeti egység név] AS Kif15, TmptEsküLejártIdõpontok.[Szint 5 szervezeti egység kód] AS Kif16, TmptEsküLejártIdõpontok.[Szint 5 szervezeti egység név] AS Kif17, TmptEsküLejártIdõpontok.[Szint 6 szervezeti egység kód] AS Kif18, TmptEsküLejártIdõpontok.[Szint 6 szervezeti egység név] AS Kif19, TmptEsküLejártIdõpontok.[Szint 7 szervezeti egység kód] AS Kif20, TmptEsküLejártIdõpontok.[Szint 7 szervezeti egység név] AS Kif21, TmptEsküLejártIdõpontok.[Szint 8 szervezeti egység kód] AS Kif22, TmptEsküLejártIdõpontok.[Szint 8 szervezeti egység név] AS Kif23, TmptEsküLejártIdõpontok.[Szint 9 szervezeti egység kód] AS Kif24, TmptEsküLejártIdõpontok.[Szint 9 szervezeti egység név] AS Kif25, TmptEsküLejártIdõpontok.[Szint 10 szervezeti egység kód] AS Kif26, TmptEsküLejártIdõpontok.[Szint 10 szervezeti egység név] AS Kif27
FROM TmptEsküLejártIdõpontok
WHERE ((([TmptEsküLejártIdõpontok].[Adóazonosító jel]) Is Not Null));

#/#/#/
lkÉvNem
#/#/
SELECT lkSzemélyek.[Adóazonosító jel], Year([Születési idõ]) AS Év, IIf([Neme]="nõ",2,1) AS Nem
FROM lkSzemélyek;

#/#/#/
lkÉvNem_kereszttábla
#/#/
TRANSFORM Count(lkÉvNem.[Adóazonosító jel]) AS [CountOfAdóazonosító jel]
SELECT lkÉvNem.Év, Count(lkÉvNem.[Adóazonosító jel]) AS Összesen
FROM lkÉvNem
GROUP BY lkÉvNem.Év
PIVOT lkÉvNem.[Nem] In (1,2);

#/#/#/
lkÉvVégiLétszámokÉsKilépõkNyugdíjasokNélkül
#/#/
SELECT lkLétszámMindenÉvUtolsóNapján.Év, lkLétszámMindenÉvUtolsóNapján.CountOfAdóazonosító AS [Létszám az év utolsó napján], lkKilépõkSzámaÉvente.[Kilépõk száma]
FROM lkKilépõkSzámaÉvente RIGHT JOIN lkLétszámMindenÉvUtolsóNapján ON lkKilépõkSzámaÉvente.KilépésÉve = lkLétszámMindenÉvUtolsóNapján.Év;

#/#/#/
lkFARrésztvevõ
#/#/
SELECT tFARrésztvevõ.Adóazonosító, tFARrésztvevõ.[Legmagasabb iskolai végzettsége], lkFARfordítótáblaVégzettséghez.FAR, lkSzemélyek.[Iskolai végzettség foka], lkSzemélyek.[Dolgozó teljes neve] AS [Viselt neve], lkSzemélyek.[Dolgozó születési neve] AS [Születési neve], lkSzemélyek.[Anyja neve], tFARrésztvevõ.[Születési ország], lkSzemélyek.[Születési hely] AS [Születési helye], lkSzemélyek.[Születési idõ] AS [Születési ideje], tFARrésztvevõ.[E-mail címe], tFARrésztvevõ.[Magyarországi lakcímmel nem rendelkezõ nem magyar állampolgár], tFARrésztvevõ.[DHK Képzési hitel?], tFARrésztvevõ.[Résztvevõ által fizetendõ díj], tFARrésztvevõ.Tábla
FROM (lkSzemélyek RIGHT JOIN tFARrésztvevõ ON lkSzemélyek.[Adóazonosító jel]=tFARrésztvevõ.Adóazonosító) LEFT JOIN lkFARfordítótáblaVégzettséghez ON lkSzemélyek.[Iskolai végzettség foka]=lkFARfordítótáblaVégzettséghez.Nexon;

#/#/#/
lkFeladatKirafeladatFunkció
#/#/
SELECT ktFeladatKirafeladatFunkció.Azonosító, Nz([Feladat],"") AS Feladata, ktFeladatKirafeladatFunkció.[KIRA feladat megnevezés], Nz([Megnevezés (magyar)],"-") AS Funkció
FROM ktFeladatKirafeladatFunkció LEFT JOIN tFunkciók ON ktFeladatKirafeladatFunkció.azFunkció = tFunkciók.azFunkció;

#/#/#/
lkFeladatkör_KIRAfeladat
#/#/
SELECT DISTINCT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.Feladatkör, lkSzemélyek.[KIRA feladat megnevezés]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lkFeladatkörökAKabinetbenÉsAzIgazgatóságon
#/#/
SELECT DISTINCT lkSzemélyek.Fõosztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[KIRA feladat megnevezés]
FROM lkSzemélyek
WHERE (((lkSzemélyek.Fõosztály) Like "Fõispáni*" Or (lkSzemélyek.Fõosztály) Like "Fõigazgatói*") AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.Fõosztály DESC , lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkFeladatkörönkéntiLétszám
#/#/
SELECT DISTINCT lkSzemélyek.[KIRA feladat megnevezés] AS [meghagyásra kijelölt munkakörök megnevezése], Count(lkSzemélyek.Adójel) AS A, 0 AS B, Count(lkSzemélyek.Adójel) AS C
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
GROUP BY lkSzemélyek.[KIRA feladat megnevezés], 0
ORDER BY lkSzemélyek.[KIRA feladat megnevezés];

#/#/#/
lkFeladatkörönkéntiMeghagyottak
#/#/
SELECT lkMeghagyásEredmény.munkakör, 0 AS A, Count(lkMeghagyásEredmény.[TAJ szám]) AS B, 0-Count([lkMeghagyásEredmény].[TAJ szám]) AS C
FROM lkMeghagyásEredmény
GROUP BY lkMeghagyásEredmény.munkakör, 0, 0;

#/#/#/
lkFeltehetõenTévesNemûDolgozók
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Neme, kt_azNexon_Adójel02.NLink
FROM tUtónevekNemekkel, kt_azNexon_Adójel02 INNER JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.Neme)<>[tUtónevekNemekkel].[neme]) AND ((utolsó([Dolgozó teljes neve]," ",0))=[tUtónevekNemekkel].[Keresztnév]));

#/#/#/
lkFennállóHibák
#/#/
SELECT tRégiHibák.[Elsõ mezõ] AS Hash, tRégiHibák.lekérdezésNeve, tRégiHibák.[Második mezõ] AS Hibaszöveg, tRégiHibák.[Elsõ Idõpont]
FROM tRégiHibák
WHERE (((tRégiHibák.[Utolsó Idõpont])=(select max([utolsó idõpont]) from tRégiHibák )))
ORDER BY tRégiHibák.[Elsõ Idõpont];

#/#/#/
lkFennállóHibákStatisztika
#/#/
SELECT tRégiHibák.lekérdezésNeve, Count(tRégiHibák.[Elsõ mezõ]) AS Hibák, Count(lkktRégiHibákIntézkedésekUtolsóIntézkedés.azIntézkedések) AS [Ebbõl intézett]
FROM tRégiHibák LEFT JOIN lkktRégiHibákIntézkedésekUtolsóIntézkedés ON tRégiHibák.[Elsõ mezõ] = lkktRégiHibákIntézkedésekUtolsóIntézkedés.HASH
WHERE (((tRégiHibák.[Utolsó Idõpont])=(select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve <>"lkÜresÁlláshelyekÁllapotfelmérõ" And lekérdezésneve <>"lkFontosHiányzóAdatok02")))
GROUP BY tRégiHibák.lekérdezésNeve
HAVING (((tRégiHibák.lekérdezésNeve)<>"lkLejártAlkalmasságiÉrvényesség" And (tRégiHibák.lekérdezésNeve)<>"lkÜresÁlláshelyekÁllapotfelmérõ" And "lekérdezésneve"<>"lkFontosHiányzóAdatok02"));

#/#/#/
lkFennállóNemHibák
#/#/
SELECT lkVisszajelzésekKezelése.SenderEmailAddress, lkVisszajelzésekKezelése.lekérdezésNeve, lkVisszajelzésekKezelése.VisszajelzésSzövege, lkVisszajelzésekKezelése.[Fennállás kezdete], lkFennállóHibák.Hibaszöveg
FROM lkFennállóHibák INNER JOIN ((lkVisszajelzésekKezelése INNER JOIN lkRégiHibákUtolsóIntézkedés ON lkVisszajelzésekKezelése.Hash = lkRégiHibákUtolsóIntézkedés.HASH) INNER JOIN tIntézkedésFajták ON lkRégiHibákUtolsóIntézkedés.azIntFajta = tIntézkedésFajták.azIntFajta) ON lkFennállóHibák.Hash = lkVisszajelzésekKezelése.Hash
WHERE (((tIntézkedésFajták.IntézkedésFajta)="referens szerint nem hiba"));

#/#/#/
lkFennállóOsztályozandóHibák
#/#/
SELECT lkVisszajelzésekKezelése.SenderEmailAddress, lkVisszajelzésekKezelése.lekérdezésNeve, lkVisszajelzésekKezelése.VisszajelzésSzövege, lkVisszajelzésekKezelése.[Fennállás kezdete], lkFennállóHibák.Hibaszöveg
FROM lkFennállóHibák INNER JOIN ((lkVisszajelzésekKezelése INNER JOIN lkRégiHibákUtolsóIntézkedés ON lkVisszajelzésekKezelése.Hash = lkRégiHibákUtolsóIntézkedés.HASH) INNER JOIN tIntézkedésFajták ON lkRégiHibákUtolsóIntézkedés.azIntFajta = tIntézkedésFajták.azIntFajta) ON lkFennállóHibák.Hash = lkVisszajelzésekKezelése.Hash
WHERE (((tIntézkedésFajták.IntézkedésFajta)="osztályozandó"));

#/#/#/
lkFESZ
#/#/
SELECT FESZ.Azonosító, FESZ.Név, Csakszám([TAJ]) AS [TAJ szám], dtÁtal([Szüldátum]) AS Szül, FESZ.Osztály, FESZ.[FEOR megnevezés], FESZ.[Alk tipus], dtÁtal([Alk dátuma]) AS ADátum, dtÁtal([Érvényes]) AS Érvény, FESZ.Korlátozás, FESZ.Hatály
FROM FESZ;

#/#/#/
lkFesz_01
#/#/
SELECT CStr([TAJ szám]) AS TAJ, lkFESZ.Név, lkFESZ.Szül, lkFESZ.Osztály, lkFESZ.[FEOR megnevezés], lkFESZ.[Alk tipus], lkFESZ.ADátum, lkFESZ.Érvény, lkFESZ.Korlátozás
FROM lkFESZ
WHERE (((CStr([TAJ szám]))<>0));

#/#/#/
lkFesz_01b
#/#/
SELECT lkSzemélyek.Azonosító, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkFesz_01.Név, lkFesz_01.TAJ, lkFesz_01.Szül, lkFesz_01.Osztály AS EüOsztály, lkFesz_01.[FEOR megnevezés], lkFesz_01.[Alk tipus], lkFesz_01.ADátum, lkFesz_01.Érvény, lkFesz_01.Korlátozás, lkSzemélyek.[Orvosi vizsgálat idõpontja], lkSzemélyek.[Orvosi vizsgálat típusa], lkSzemélyek.[Orvosi vizsgálat eredménye], lkSzemélyek.[Orvosi vizsgálat észrevételek], lkSzemélyek.[Orvosi vizsgálat következõ idõpontja]
FROM lkFesz_01 INNER JOIN lkSzemélyek ON lkFesz_01.TAJ = lkSzemélyek.[TAJ szám];

#/#/#/
lkFesz_02
#/#/
SELECT lkSzemélyek.Azonosító, lkSzemélyek.Fõosztály, lkSzemélyek.[Szervezeti egység neve] AS Osztály, lkFESZ.Név, lkFESZ.[TAJ szám], lkFESZ.Szül, lkFESZ.Osztály AS EüOsztály, lkFESZ.[FEOR megnevezés], lkFESZ.[Alk tipus], lkFESZ.ADátum, lkFESZ.Érvény, lkFESZ.Korlátozás, lkSzemélyek.[Orvosi vizsgálat idõpontja], lkSzemélyek.[Orvosi vizsgálat típusa], lkSzemélyek.[Orvosi vizsgálat eredménye], lkSzemélyek.[Orvosi vizsgálat észrevételek], lkSzemélyek.[Orvosi vizsgálat következõ idõpontja]
FROM lkSzemélyek RIGHT JOIN lkFESZ ON (lkSzemélyek.[Születési idõ] = lkFESZ.Szül) AND (lkSzemélyek.[Dolgozó teljes neve] = lkFESZ.Név)
WHERE (((lkSzemélyek.Azonosító) Is Not Null));

#/#/#/
lkFESZ_ellenõrzés
#/#/
SELECT lkFESZ.Név, lkFESZ.Szül
FROM lkFESZ LEFT JOIN lk_Fesz_03 ON (lkFESZ.Név = lk_Fesz_03.Név) AND (lkFESZ.Szül = lk_Fesz_03.Szül)
WHERE (((lk_Fesz_03.Azonosító) Is Null));

#/#/#/
lkFontosHiányzóAdatok01
#/#/
SELECT lk_Ellenõrzés_03.Fõosztály, lk_Ellenõrzés_03.Osztály, lk_Ellenõrzés_03.Név, lk_Ellenõrzés_03.[Hiányzó érték], lk_Ellenõrzés_03.[Státusz kód], lk_Ellenõrzés_03.Megjegyzés, lk_Ellenõrzés_03.NLink, TextToMD5Hex([Fõosztály] & "|" & [Osztály] & "|" & [Név] & "|" & [Hiányzó érték] & "|" & [Státusz kód] & "|" & [NLink] & "|" & [Megjegyzés] & "|") AS Hash
FROM lk_Ellenõrzés_03
WHERE (((lk_Ellenõrzés_03.[Hiányzó érték])<>"Hivatali email" And (lk_Ellenõrzés_03.[Hiányzó érték])<>"Munkavégzés helye - cím" And (lk_Ellenõrzés_03.[Hiányzó érték])<>"Központosított álláshelyhez nincs megjelölve költséghely vagy költséghely-kód (projekt)." And (lk_Ellenõrzés_03.[Hiányzó érték])<>"Eskületétel idõpontja"));

#/#/#/
lkFontosHiányzóAdatok02
#/#/
SELECT lkFontosHiányzóAdatok01.Fõosztály, lkFontosHiányzóAdatok01.Osztály, lkFontosHiányzóAdatok01.Név, lkFontosHiányzóAdatok01.[Hiányzó érték], lkFontosHiányzóAdatok01.[Státusz kód], lkFontosHiányzóAdatok01.NLink, lkFontosHiányzóAdatok01.Megjegyzés
FROM lkFontosHiányzóAdatok01 LEFT JOIN lkktRégiHibákIntézkedésekLegutolsóIntézkedés ON lkFontosHiányzóAdatok01.Hash = lkktRégiHibákIntézkedésekLegutolsóIntézkedés.HASH
WHERE (((lkktRégiHibákIntézkedésekLegutolsóIntézkedés.azIntFajta)=3 Or (lkktRégiHibákIntézkedésekLegutolsóIntézkedés.azIntFajta) Is Null Or (lkktRégiHibákIntézkedésekLegutolsóIntézkedés.azIntFajta)=8));

#/#/#/
lkForrásNexonSzervezetekÖsszerendelés
#/#/
SELECT tForrásNexonSzervezetekÖsszerendelés.Azonosító, Replace([Fõosztály],"Budapest Fõváros Kormányhivatala","BFKH") AS Fõoszt, IIf([Osztály]="Járási hivatal",[Fõosztály],[Osztály]) AS Oszt, tForrásNexonSzervezetekÖsszerendelés.ForrásKód
FROM tForrásNexonSzervezetekÖsszerendelés;

#/#/#/
lkFõispániKabinetÁlláshelyei
#/#/
TRANSFORM Min(tHaviJelentésHatálya1.hatálya) AS MinOfhatálya
SELECT tKormányhivatali_állomány.[Álláshely azonosító]
FROM tKormányhivatali_állomány INNER JOIN tHaviJelentésHatálya1 ON tKormányhivatali_állomány.hatályaID = tHaviJelentésHatálya1.hatályaID
WHERE (((tHaviJelentésHatálya1.hatálya)>#1/1/2024#) AND ((tKormányhivatali_állomány.Mezõ6)="fõispáni kabinet"))
GROUP BY tKormányhivatali_állomány.[Álláshely azonosító]
ORDER BY tKormányhivatali_állomány.[Álláshely azonosító], tHaviJelentésHatálya1.hatálya
PIVOT tHaviJelentésHatálya1.hatálya;

#/#/#/
lkFõispániKabinetÁlláshelyei2
#/#/
TRANSFORM First(lkÁllománytáblákTörténetiUniója.Fõoszt) AS FirstOfFõoszt
SELECT lkÁllománytáblákTörténetiUniója.[Álláshely azonosító]
FROM tFõispániKabinetÁlláshelyei20240831ig INNER JOIN (lkÁllománytáblákTörténetiUniója INNER JOIN tHaviJelentésHatálya1 ON lkÁllománytáblákTörténetiUniója.hatályaID = tHaviJelentésHatálya1.hatályaID) ON tFõispániKabinetÁlláshelyei20240831ig.ÁlláshelyAz = lkÁllománytáblákTörténetiUniója.[Álláshely azonosító]
WHERE (((tHaviJelentésHatálya1.hatálya)>#1/1/2024#))
GROUP BY lkÁllománytáblákTörténetiUniója.[Álláshely azonosító]
PIVOT tHaviJelentésHatálya1.hatálya;

#/#/#/
lkFõosztályDolgozóinakListájaIdõszakiMátrixban01
#/#/
SELECT HumánUnió.Adójel, HumánUnió.[Dolgozó teljes neve], HumánUnió.Belépés, HumánUnió.Kilépés, lkKiemeltNapok.év & Right("0" & lkKiemeltNapok.hó,2) AS ÉvHó, IIf(lkKiemeltNapok.KiemeltNapok Between dtÁtal(Nz([Tartós távollét kezdete],#1/1/3000#)) And dtÁtal(Nz([Tartós távollét vége],#1/1/3000#)),2,1)
FROM (SELECT lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés, #01/01/3000# AS Kilépés, [Tartós távollét kezdete], [Tartós távollét vége] FROM lkSzemélyek WHERE (((lkSzemélyek.Fõosztály) Like "*"&[Melyik fõosztályt keressük]&"*")) 
UNION 
SELECT lkKilépõUnió.Adójel, lkKilépõUnió.Név, lkKilépõUnió.[Jogviszony kezdõ dátuma] AS Belépés, iif(dtÁtal(lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja])=0,#01/01/3000#,dtÁtal(lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja])) AS Kilépés,#01/01/3000# as TTkezdete, #01/01/3000# as TTvége 
FROM lkKilépõUnió WHERE (((lkKilépõUnió.Fõosztály) Like "*"&[Melyik fõosztályt keressük]&"*"))  )  AS HumánUnió INNER JOIN lkKiemeltNapok ON (HumánUnió.Belépés <= lkKiemeltNapok.KiemeltNapok) AND (HumánUnió.Kilépés >= lkKiemeltNapok.KiemeltNapok)
WHERE (((HumánUnió.Kilépés)>#1/1/2023#) AND ((lkKiemeltNapok.KiemeltNapok) Between #1/1/2023# And Now()) AND ((lkKiemeltNapok.nap)=1));

#/#/#/
lkFõosztályDolgozóinakListájaIdõszakiMátrixban02
#/#/
TRANSFORM Sum(lkFõosztályDolgozóinakListájaIdõszakiMátrixban01.Expr1005) AS SumOfExpr1005
SELECT lkFõosztályDolgozóinakListájaIdõszakiMátrixban01.[Dolgozó teljes neve]
FROM lkFõosztályDolgozóinakListájaIdõszakiMátrixban01
GROUP BY lkFõosztályDolgozóinakListájaIdõszakiMátrixban01.[Dolgozó teljes neve]
PIVOT lkFõosztályDolgozóinakListájaIdõszakiMátrixban01.ÉvHó In (2301,2302,2303,2304,2305,2306,2307,2308,2309,2310,2311,2312,2401,2402,2403);

#/#/#/
lkFõosztályiLétszám2024Ifélév00
#/#/
SELECT lktKormányhivatali_állomány.Osztály, lktKormányhivatali_állomány.hatályaID, IIf([Születési év \ üres állás]="üres állás",0,1) AS Létszám
FROM lktKormányhivatali_állomány
WHERE (((lktKormányhivatali_állomány.Fõosztály) Like "Humán*"));

#/#/#/
lkFõosztályiLétszám2024Ifélév01
#/#/
SELECT tHaviJelentésHatálya1.hatályaID, lkKiemeltNapok.KiemeltNapok
FROM tHaviJelentésHatálya1 INNER JOIN lkKiemeltNapok ON tHaviJelentésHatálya1.hatálya = lkKiemeltNapok.KiemeltNapok
WHERE (((lkKiemeltNapok.tnap)<>1 And (lkKiemeltNapok.tnap)<>15) AND ((lkKiemeltNapok.KiemeltNapok) Between #12/31/2023# And #7/31/2024#))
GROUP BY tHaviJelentésHatálya1.hatályaID, lkKiemeltNapok.KiemeltNapok;

#/#/#/
lkFõosztályiLétszám2024Ifélév02
#/#/
SELECT lkFõosztályiLétszám2024Ifélév01.KiemeltNapok, lkFõosztályiLétszám2024Ifélév00.Osztály, Sum(lkFõosztályiLétszám2024Ifélév00.Létszám) AS SumOfLétszám
FROM lkFõosztályiLétszám2024Ifélév00 INNER JOIN lkFõosztályiLétszám2024Ifélév01 ON lkFõosztályiLétszám2024Ifélév00.hatályaID = lkFõosztályiLétszám2024Ifélév01.hatályaID
GROUP BY lkFõosztályiLétszám2024Ifélév01.KiemeltNapok, lkFõosztályiLétszám2024Ifélév00.Osztály;

#/#/#/
lkFõosztályiLétszám2024Ifélév03
#/#/
SELECT ElõzõDátumIs.hatályaID, ElõzõDátumIs.MaxOfKiemeltNapok AS Elõzõ, ElõzõDátumIs.KiemeltNapok
FROM (SELECT lkFõosztályiLétszám2024Ifélév01.hatályaID, lkFõosztályiLétszám2024Ifélév01.KiemeltNapok, Max(lkFõosztályiLétszám2024Ifélév01_1.[KiemeltNapok]) AS MaxOfKiemeltNapok FROM lkFõosztályiLétszám2024Ifélév01 AS lkFõosztályiLétszám2024Ifélév01_1 RIGHT JOIN lkFõosztályiLétszám2024Ifélév01 ON lkFõosztályiLétszám2024Ifélév01_1.KiemeltNapok < lkFõosztályiLétszám2024Ifélév01.KiemeltNapok GROUP BY lkFõosztályiLétszám2024Ifélév01.hatályaID, lkFõosztályiLétszám2024Ifélév01.KiemeltNapok)  AS ElõzõDátumIs
ORDER BY ElõzõDátumIs.KiemeltNapok;

#/#/#/
lkFõosztályiLétszám2024Ifélév04
#/#/
TRANSFORM Sum(1) AS Létszám
SELECT lktKormányhivatali_állomány.Adóazonosító
FROM (lktKormányhivatali_állomány INNER JOIN tHaviJelentésHatálya1 ON lktKormányhivatali_állomány.hatályaID = tHaviJelentésHatálya1.hatályaID) INNER JOIN lkFõosztályiLétszám2024Ifélév01 ON tHaviJelentésHatálya1.hatályaID = lkFõosztályiLétszám2024Ifélév01.hatályaID
WHERE (((lktKormányhivatali_állomány.Fõosztály) Like "Humán*") AND ((lktKormányhivatali_állomány.[Születési év \ üres állás])<>"üres állás"))
GROUP BY lktKormányhivatali_állomány.Adóazonosító, lktKormányhivatali_állomány.Fõosztály
PIVOT tHaviJelentésHatálya1.hatálya;

#/#/#/
lkFõosztályiLétszám2024Ifélév05
#/#/
SELECT lktKormányhivatali_állomány.Osztály, lktKormányhivatali_állomány.Adóazonosító, tHaviJelentésHatálya1.hatálya, lkFõosztályiLétszám2024Ifélév03.Elõzõ, 1 AS Létszám, tHaviJelentésHatálya1.hatályaID
FROM ((lktKormányhivatali_állomány INNER JOIN tHaviJelentésHatálya1 ON lktKormányhivatali_állomány.hatályaID = tHaviJelentésHatálya1.hatályaID) INNER JOIN lkFõosztályiLétszám2024Ifélév01 ON tHaviJelentésHatálya1.hatályaID = lkFõosztályiLétszám2024Ifélév01.hatályaID) INNER JOIN lkFõosztályiLétszám2024Ifélév03 ON tHaviJelentésHatálya1.hatályaID = lkFõosztályiLétszám2024Ifélév03.hatályaID
WHERE (((lktKormányhivatali_állomány.[Születési év \ üres állás])<>"üres állás") AND ((lktKormányhivatali_állomány.Fõosztály) Like "Humán*"));

#/#/#/
lkFõosztályiLétszám2024Ifélév06belépõk
#/#/
SELECT jelenlegi.Osztály, jelenlegi.hatálya, Sum(IIf(IsNull([Elõzõ].[Adóazonosító]),1,0)) AS Belépõk, Sum(0) AS Kilépõk
FROM lkFõosztályiLétszám2024Ifélév05 AS elõzõ RIGHT JOIN lkFõosztályiLétszám2024Ifélév05 AS jelenlegi ON (elõzõ.hatálya = jelenlegi.Elõzõ) AND (elõzõ.Adóazonosító = jelenlegi.Adóazonosító)
GROUP BY jelenlegi.Osztály, jelenlegi.hatálya;

#/#/#/
lkFõosztályiLétszám2024Ifélév06kilépõk
#/#/
SELECT elõzõ.Osztály, elõzõ.hatálya, Sum(0) AS Belépõk, Sum(IIf(IsNull([jelenlegi].[Adóazonosító]),1,0)) AS Kilépõk
FROM lkFõosztályiLétszám2024Ifélév05 AS elõzõ LEFT JOIN lkFõosztályiLétszám2024Ifélév05 AS jelenlegi ON (elõzõ.Adóazonosító = jelenlegi.Adóazonosító) AND (elõzõ.hatálya = jelenlegi.Elõzõ)
GROUP BY elõzõ.Osztály, elõzõ.hatálya;

#/#/#/
lkFõosztályiLétszám2024Ifélév06létszám
#/#/
SELECT lkFõosztályiLétszám2024Ifélév05.Osztály, lkFõosztályiLétszám2024Ifélév05.hatálya, Sum(lkFõosztályiLétszám2024Ifélév05.Létszám) AS Létszám
FROM lkFõosztályiLétszám2024Ifélév05
GROUP BY lkFõosztályiLétszám2024Ifélév05.Osztály, lkFõosztályiLétszám2024Ifélév05.hatálya;

#/#/#/
lkFõosztályiLétszám2024Ifélév06összes
#/#/
SELECT BeKilépõk.Osztály, BeKilépõk.hatálya, lkFõosztályiLétszám2024Ifélév06létszám.Létszám, Sum(BeKilépõk.Belépõk) AS SumOfBelépõk, Sum(BeKilépõk.Kilépõk) AS SumOfKilépõk
FROM lkFõosztályiLétszám2024Ifélév06létszám INNER JOIN (SELECT lkFõosztályiLétszám2024Ifélév06kilépõk.*
FROM lkFõosztályiLétszám2024Ifélév06kilépõk
UNION
SELECT lkFõosztályiLétszám2024Ifélév06belépõk.*
FROM  lkFõosztályiLétszám2024Ifélév06belépõk
)  AS BeKilépõk ON (lkFõosztályiLétszám2024Ifélév06létszám.Osztály = BeKilépõk.Osztály) AND (lkFõosztályiLétszám2024Ifélév06létszám.hatálya = BeKilépõk.hatálya)
GROUP BY BeKilépõk.Osztály, BeKilépõk.hatálya, lkFõosztályiLétszám2024Ifélév06létszám.Létszám
HAVING (((BeKilépõk.hatálya) Between #1/1/2024# And #6/30/2024#));

#/#/#/
lkFõosztályiLétszám2024Ifélév07
#/#/
SELECT jelenlegi.Fõosztály, jelenlegi.Osztály, jelenlegi.Név, jelenlegi.Adóazonosító, jelenlegi.[Ellátott feladat], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], lkSzemélyek.[Jogviszony vége (kilépés dátuma)], IIf(IsNull([Elõzõ].[Fõosztály]) And IsNull([Elõzõ].[osztály]),"",Format([jelenlegi].[hatálya],"yyyy/ mm/")) AS Hónaptól, "" AS Hónapig, [Elõzõ].[Fõosztály] & IIf(IsNull([Elõzõ].[Osztály]),"","/" & [Elõzõ].[Osztály]) AS Honnan, [Jelenlegi].[Fõosztály] & "/" & [Jelenlegi].[Osztály] AS Hová, jelenlegi.Jogviszony, jelenlegi.hatályaID, IIf(IsNull([Elõzõ].[Adóazonosító]),1,0) AS Belépõ
FROM lkSzemélyek INNER JOIN (lkFõosztályiLétszám2024Ifélév0700 AS elõzõ RIGHT JOIN lkFõosztályiLétszám2024Ifélév0700 AS jelenlegi ON (elõzõ.hatálya = jelenlegi.Elõzõ) AND (elõzõ.Adóazonosító = jelenlegi.Adóazonosító)) ON lkSzemélyek.[Adóazonosító jel] = jelenlegi.Adóazonosító
WHERE (((jelenlegi.Fõosztály)<>[Elõzõ].[fõosztály])) OR (((jelenlegi.Osztály)<>[Elõzõ].[osztály])) OR (((elõzõ.Fõosztály) Is Null) AND ((elõzõ.Osztály) Is Null));

#/#/#/
lkFõosztályiLétszám2024Ifélév0700
#/#/
SELECT lkÁllománytáblákTörténetiUniója.Fõoszt AS Fõosztály, lkÁllománytáblákTörténetiUniója.Osztály, lkÁllománytáblákTörténetiUniója.Adóazonosító, lkÁllománytáblákTörténetiUniója.Név, lkÁllománytáblákTörténetiUniója.[Ellátott feladat], tHaviJelentésHatálya1.hatálya, lkFõosztályiLétszám2024Ifélév03.Elõzõ, 1 AS Létszám, tHaviJelentésHatálya1.hatályaID, IIf(InStr(1,[Besorolási fokozat kód:],"Mt.")>0,"Mt.","Kit.") AS Jogviszony
FROM ((lkÁllománytáblákTörténetiUniója INNER JOIN tHaviJelentésHatálya1 ON lkÁllománytáblákTörténetiUniója.hatályaID = tHaviJelentésHatálya1.hatályaID) INNER JOIN lkFõosztályiLétszám2024Ifélév01 ON tHaviJelentésHatálya1.hatályaID = lkFõosztályiLétszám2024Ifélév01.hatályaID) INNER JOIN lkFõosztályiLétszám2024Ifélév03 ON tHaviJelentésHatálya1.hatályaID = lkFõosztályiLétszám2024Ifélév03.hatályaID
WHERE (((lkÁllománytáblákTörténetiUniója.[Születési év \ üres állás])<>"üres állás"));

#/#/#/
lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01
#/#/
SELECT DISTINCT lkHaviLétszámFõosztály.Jelleg, IIf(Len([FõosztályKód])<=9,0,IIf([FõosztályKód] Like "BFKH.1.2.*",2,1)) AS Sorrend, lkFõosztályok.FõosztályKód, lkHaviLétszámFõosztály.Fõosztály, lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01b.Engedélyezett, lkHaviLétszámFõosztály.[Betöltött létszám], "" AS [indokolás a betöltetlen álláshelyhez], lkHaviLétszámFõosztály.[Üres álláshely], lk_Fõosztályonkénti_átlagilletmény02_vezetõknélkül.Átlagilletmény
FROM lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01b RIGHT JOIN (lkFõosztályok RIGHT JOIN (lk_Fõosztályonkénti_átlagilletmény02_vezetõknélkül RIGHT JOIN lkHaviLétszámFõosztály ON lk_Fõosztályonkénti_átlagilletmény02_vezetõknélkül.Fõosztály = lkHaviLétszámFõosztály.Fõosztály) ON lkFõosztályok.Fõosztály = lkHaviLétszámFõosztály.Fõosztály) ON (lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01b.FõosztályÁlláshely = lkHaviLétszámFõosztály.Fõosztály) AND (lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01b.jelleg = lkHaviLétszámFõosztály.Jelleg);

#/#/#/
lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01b
#/#/
SELECT lkÁlláshelyek.FõosztályÁlláshely, Count(lkÁlláshelyek.[Álláshely azonosító]) AS Engedélyezett, IIf([Álláshely típusa] Like "ALAP*","A","K") AS jelleg
FROM lkÁlláshelyek
GROUP BY lkÁlláshelyek.FõosztályÁlláshely, IIf([Álláshely típusa] Like "ALAP*","A","K");

#/#/#/
lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér02
#/#/
SELECT lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01.Fõosztály, lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01.Engedélyezett, lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01.[Betöltött létszám], lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01.[indokolás a betöltetlen álláshelyhez], lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01.[Üres álláshely], lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01.Átlagilletmény
FROM lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01
ORDER BY lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01.Jelleg, lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01.Sorrend, lkFõosztályLétszámÉsVezetõkNélküliÁtlagbér01.FõosztályKód;

#/#/#/
lkFõosztályok
#/#/
SELECT DISTINCT lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.Fõosztály, lkSzemélyek.BFKH, lkSzemélyek.FõosztályKód
FROM lkSzemélyek;

#/#/#/
lkFõosztályokLétszámánakKerületenkéntiEloszlása
#/#/
SELECT lkVárosKerületenkéntiFõosztályonkéntiLétszám01.Fõosztály, lkVárosKerületenkéntiFõosztályonkéntiLétszám01.Kerület, [Létszám]/[FõosztályiLétszám] AS Arány
FROM lkVárosKerületenkéntiFõosztályonkéntiLétszám01 INNER JOIN lkFõosztályonkéntiBetöltöttLétszám ON lkVárosKerületenkéntiFõosztályonkéntiLétszám01.Fõosztály = lkFõosztályonkéntiBetöltöttLétszám.Fõosztály;

#/#/#/
lkFõosztályokOsztályokSorszámal2
#/#/
SELECT lk_Fõosztály_Osztály_lkSzemélyek.[Szervezeti egység kódja], lk_Fõosztály_Osztály_lkSzemélyek.BFKH, lk_Fõosztály_Osztály_lkSzemélyek.Fõosztály, lk_Fõosztály_Osztály_lkSzemélyek.Osztály, [lk_Fõosztály_Osztály_lkSzemélyek].[Sorszám]*1 AS Sorszám INTO tFõosztályokOsztályokSorszámmal
FROM lk_Fõosztály_Osztály_lkSzemélyek
WHERE (((lk_Fõosztály_Osztály_lkSzemélyek.BFKH) Like "BFKH*"))
ORDER BY lk_Fõosztály_Osztály_lkSzemélyek.[Szervezeti egység kódja], [lk_Fõosztály_Osztály_lkSzemélyek].[Sorszám]*1;

#/#/#/
lkFõosztályokOsztályokSorszámmal
#/#/
SELECT tFõosztályokOsztályokSorszámmal.bfkh AS bfkhkód, tFõosztályokOsztályokSorszámmal.Fõosztály, tFõosztályokOsztályokSorszámmal.Osztály, tFõosztályokOsztályokSorszámmal.Sorszám AS Sorsz
FROM tFõosztályokOsztályokSorszámmal;

#/#/#/
lkFõosztályonéntiOsztályonkéntiLétszám
#/#/
SELECT 1 AS sor, lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, Nz(Osztály,"-") AS Osztály_, Count(*) AS Létszám
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null))
GROUP BY 1, lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, Nz(Osztály,"-"), lkSzemélyek.FõosztályKód, lkSzemélyek.Osztály;

#/#/#/
lkFõosztályonkéntiBetöltöttLétszám
#/#/
SELECT lkSzemélyekFõosztÉsÖsszesen.Fõosztály AS Fõosztály, lkSzemélyekFõosztÉsÖsszesen.FõosztályiLétszám AS FõosztályiLétszám, [lk_TT-sekFõosztályonként].[Tartósan távollévõk] AS [Tartósan távollévõk], [Tartósan távollévõk]/([FõosztályiLétszám]) AS [TT-sek aránya], lkSzemélyekFõosztÉsÖsszesen.KözpontosítottLétszám AS [Központosított létszám]
FROM [lk_TT-sekFõosztályonként] RIGHT JOIN lkSzemélyekFõosztÉsÖsszesen ON [lk_TT-sekFõosztályonként].Fõosztály = lkSzemélyekFõosztÉsÖsszesen.Fõosztály
ORDER BY [lkSzemélyekFõosztÉsÖsszesen].[Sor] & ".", lkSzemélyekFõosztÉsÖsszesen.FõosztKód;

#/#/#/
lkFõosztályonkéntiOsztályonkéntiLétszám_részösszegekkel
#/#/
SELECT [Sor] & "." AS Sorsz, UNIÓ.BFKH AS [Szervezeti egység kód], UNIÓ.Fõosztály, UNIÓ.Osztály, UNIÓ.Létszám
FROM (SELECT 0 AS sor, bfkh(Nz(lkSzemélyek.FõosztályKód,0)) AS BFKH, lkSzemélyek.Fõosztály, "Összesen:" AS Osztály, Count(*) AS Létszám
    FROM lkSzemélyek
    WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
    GROUP BY 0, lkSzemélyek.Fõosztály, lkSzemélyek.FõosztályKód, ""

    UNION
    SELECT 1 as sor, bfkh(Nz(lkSzemélyek.FõosztályKód,0)) AS BFKH, Fõosztály,Osztály, Count(*) as Létszám
    FROM lkSzemélyek
    WHERE lkSzemélyek.[Státusz neve]="Álláshely"
    GROUP BY 1,bfkh(Nz(lkSzemélyek.FõosztályKód,0)) , lkSzemélyek.Fõosztály,lkSzemélyek.FõosztályKód,Osztály
    )  AS UNIÓ
WHERE ((("/// Leírás: A megadott lekérdezés két SELECT utasítást kombinál az UNION használatával, hogy egyetlen eredménykészletet hozzon létre. 
        Az elsõ SELECT kimutatás a fõosztályonkénti (osztályvezetõi), míg a második SELECT utasítás a BFKH-nként (osztályonkénti) és a 
        fõosztályonkénti dolgozók számát számolja ki. 
        Az eredményül kapott adatkészlet tartalmazza a Sor (sorszám), Szervezeti egység kód (szervezeti egység kódja), Fõosztály, 
        Osztály és Létszám (alkalmazottak száma) oszlopokat. 
        A végeredményt ezután a BFKH és a sor szerint csökkenõ sorrendbe rendezi. ///")<>False))
ORDER BY UNIÓ.BFKH, UNIÓ.sor DESC , UNIÓ.Osztály;

#/#/#/
lkFõosztályOsztályNévIlletmény
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Illetmény összesen kerekítés nélkül (eltérített)] AS Illetmény, lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS Óraszám, [Illetmény]/[Óraszám]*40 AS [40 órás illetmény], lkSzemélyek.[Tartós távollét típusa]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Tartós távollét típusa])="" Or (lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkFõosztályvezetõkHivatalvezetõk
#/#/
SELECT lkMindenVezetõ.Fõosztály, lkMindenVezetõ.[Dolgozó teljes neve] AS Név, lkMindenVezetõ.Besorolás2
FROM lkMindenVezetõ
WHERE (((lkMindenVezetõ.Besorolás2)<>"osztályvezetõ" And (lkMindenVezetõ.Besorolás2) Not Like "*helyett*" And (lkMindenVezetõ.Besorolás2)<>"fõispán" And (lkMindenVezetõ.Besorolás2) Not Like "*igazgató*"));

#/#/#/
lkFõosztOsztSzintûMobilitás_Befogadók
#/#/
SELECT tÁllományUnió20231231.[Járási Hivatal], tÁllományUnió20231231.Osztály, Count(tÁllományUnió20231231.Adóazonosító) AS [Létszám (fõ)]
FROM tÁllományUnió20231231 INNER JOIN tÁllományUnió20230102 ON tÁllományUnió20231231.Adóazonosító = tÁllományUnió20230102.Adóazonosító
WHERE (((tÁllományUnió20231231.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ])<>[tÁllományUnió20230102].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AND ((tÁllományUnió20231231.[Születési év \ üres állás])<>"üres állás"))
GROUP BY tÁllományUnió20231231.[Járási Hivatal], tÁllományUnió20231231.Osztály;

#/#/#/
lkFõosztOsztSzintûMobilitás_Kibocsátók
#/#/
SELECT tÁllományUnió20230102.[Járási Hivatal], tÁllományUnió20230102.Osztály, Count(tÁllományUnió20230102.Adóazonosító) AS [Létszám (fõ)]
FROM tÁllományUnió20231231 INNER JOIN tÁllományUnió20230102 ON tÁllományUnió20231231.Adóazonosító = tÁllományUnió20230102.Adóazonosító
WHERE (((tÁllományUnió20230102.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ])<>tÁllományUnió20231231.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) And ((tÁllományUnió20230102.[Születési év \ üres állás])<>"üres állás"))
GROUP BY tÁllományUnió20230102.[Járási Hivatal], tÁllományUnió20230102.Osztály;

#/#/#/
lkFõosztSzintûMobilitás_Befogadók
#/#/
SELECT tÁllományUnió20231231.[Járási Hivatal], Count(tÁllományUnió20231231.Adóazonosító) AS [Létszám (fõ)]
FROM tÁllományUnió20231231 INNER JOIN tÁllományUnió20230102 ON tÁllományUnió20231231.Adóazonosító = tÁllományUnió20230102.Adóazonosító
WHERE (((tÁllományUnió20231231.[Járási Hivatal])<>[tÁllományUnió20230102].[Járási Hivatal]) AND ((tÁllományUnió20231231.[Születési év \ üres állás])<>"üres állás"))
GROUP BY tÁllományUnió20231231.[Járási Hivatal];

#/#/#/
lkFõosztSzintûMobilitás_Kibocsátók
#/#/
SELECT tÁllományUnió20230102.[Járási Hivatal], Count(tÁllományUnió20230102.Adóazonosító) AS [Létszám (fõ)]
FROM tÁllományUnió20231231 INNER JOIN tÁllományUnió20230102 ON tÁllományUnió20231231.Adóazonosító = tÁllományUnió20230102.Adóazonosító
WHERE (((tÁllományUnió20230102.[Járási Hivatal])<>[tÁllományUnió20231231].[Járási Hivatal]) AND ((tÁllományUnió20230102.[Születési év \ üres állás])<>"üres állás"))
GROUP BY tÁllományUnió20230102.[Járási Hivatal];

#/#/#/
lkFunkciókSzerintiLétszámok01
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.Feladat, lkSzemélyek.[KIRA feladat megnevezés], IIf([Funkció]="-",IIf([Funkcionális]=True,"a) csoport","Egyéb (…) II"),[Funkció]) AS Funkciója, Choose(Left(IIf([Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] Is Null Or [Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis]="",0,[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis]),1)*1,"alapfokú","középfokú","felsõfokú","felsõfokú","középfokú","középfokú") AS Végzettség, IIf([lkSzemélyek].[Besorolás2] Like "*osztály*" Or [lkSzemélyek].[Besorolás2] Like "*járási*" Or [lkSzemélyek].[Besorolás2] Like "*igazgató*" Or [lkSzemélyek].[Besorolás2] Like "fõispán","Vezetõi létszám","Nem vezetõi létszám") AS Vezetõ, 1 AS Létszám, lkSzemélyek.[jogviszony típusa / jogviszony típus] AS Jogviszony
FROM lkJárásiKormányKözpontosítottUnió RIGHT JOIN (tFunkcionálisSzakmaiFõosztályok RIGHT JOIN (lkFeladatKirafeladatFunkció RIGHT JOIN lkSzemélyek ON (lkFeladatKirafeladatFunkció.[KIRA feladat megnevezés] = lkSzemélyek.[KIRA feladat megnevezés]) AND (lkFeladatKirafeladatFunkció.Feladata = lkSzemélyek.Feladat)) ON tFunkcionálisSzakmaiFõosztályok.SzervezetKód = lkSzemélyek.FõosztályKód) ON lkJárásiKormányKözpontosítottUnió.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkSzemélyek.[Státusz típusa]) Like "Központosít*") AND ((lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker])>=60));

#/#/#/
lkFunkciókSzerintiLétszámok02
#/#/
SELECT lkFunkciókSzerintiLétszámok01.Funkciója, lkFunkciókSzerintiLétszámok01.Végzettség, lkFunkciókSzerintiLétszámok01.Vezetõ, lkFunkciókSzerintiLétszámok01.Jogviszony AS Jogviszony, Sum(lkFunkciókSzerintiLétszámok01.Létszám) AS SumOfLétszám
FROM lkFunkciókSzerintiLétszámok01
GROUP BY lkFunkciókSzerintiLétszámok01.Funkciója, lkFunkciókSzerintiLétszámok01.Végzettség, lkFunkciókSzerintiLétszámok01.Vezetõ, lkFunkciókSzerintiLétszámok01.Jogviszony;

#/#/#/
lkFunkciókSzerintiLétszámok03
#/#/
SELECT lkFunkciókSzerintiLétszámok02.Funkciója, lkFunkciókSzerintiLétszámok02.Végzettség, lkFunkciókSzerintiLétszámok02.Vezetõ, lkFunkciókSzerintiLétszámok02.Jogviszony, lkFunkciókSzerintiLétszámok02.SumOfLétszám AS Létszám, Round([Létszám]*Nz([Engedélyezett létszám, ha semmi, akkor 5350],5350)/(Select sum([Létszám]) from lkFunkciókSzerintiLétszámok01),2) AS Statisztikai
FROM lkFunkciókSzerintiLétszámok02;

#/#/#/
lkGarantáltBérminimumEmelése
#/#/
PARAMETERS [Emelés%] IEEEDouble;
SELECT lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Iskolai végzettség foka], lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker], [Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40 AS Illetmény40, (296400*(1+[Emelés%]/100))/[Illetmény40]-1 AS [Szükséges emelés], lkJárásiKormányKözpontosítottUnió.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h]
FROM lkSzemélyek INNER JOIN lkJárásiKormányKözpontosítottUnió ON lkSzemélyek.Adójel=lkJárásiKormányKözpontosítottUnió.Adójel
WHERE (((lkSzemélyek.[Iskolai végzettség foka])<>"Általános iskola 8 osztály") AND (([Kerekített 100 %-os illetmény (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40)<296400*(1+[Emelés%]/100)) AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Jogviszony vége (kilépés dátuma)])>#7/1/2023# Or (lkSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Null));

#/#/#/
lkGyámügyiFõosztályDolgozói
#/#/
SELECT GyámDolgozók.Adójel, GyámDolgozók.Név, GyámDolgozók.[Jelenlegi fõosztálya], GyámDolgozók.[Jelenlegi osztálya], GyámDolgozók.Fõosztály, GyámDolgozók.Osztály, GyámDolgozók.Belépés, GyámDolgozók.Kilépés, Megjegyzés
FROM (SELECT lk2019ótaAGyámügyrõlKilépettek.*, "2019 óta kilépett" as Megjegyzés
FROM lk2019ótaAGyámügyrõlKilépettek
UNION SELECT lkAGyámonJelenlegDolgozók.*, "Jelenleg a Gymúgyi Fõosztályon dolgozik" as Megjegyzés
FROM lkAGyámonJelenlegDolgozók
UNION SELECT lk2019ótaAGyámraBelépettek.*, "2019 óta lépett be" as Megjegyzés
FROM lk2019ótaAGyámraBelépettek)  AS GyámDolgozók
ORDER BY GyámDolgozók.Név, GyámDolgozók.Belépés;

#/#/#/
lkHASHCsere01
#/#/
PARAMETERS [Megtartandó szakaszok száma] Short, Lekérdezés Text ( 255 );
SELECT tRégiHibák.lekérdezésNeve, TextToMD5Hex(strVége([Második mezõ],"|",[megtartandó szakaszok száma])) AS ÚjHash, tRégiHibák.[Elsõ Idõpont], strVége([Második mezõ],"|",[megtartandó szakaszok száma]) AS [Új szöveg]
FROM tRégiHibák
WHERE (((tRégiHibák.lekérdezésNeve)=[lekérdezés]));

#/#/#/
lkHASHCsere02
#/#/
UPDATE lkHASHCsere01 INNER JOIN tRégiHibák ON lkHASHCsere01.ÚjHash = tRégiHibák.[Elsõ mezõ] SET tRégiHibák.[Elsõ Idõpont] = [lkHASHCsere01].[Elsõ Idõpont];

#/#/#/
lkHatályUnion
#/#/
SELECT Kormányhivatali_állomány.HatályaID
FROM Kormányhivatali_állomány
UNION
SELECT Járási_állomány.HatályaID
FROM Járási_állomány
UNION
SELECT Központosítottak.HatályaID
FROM Központosítottak
UNION
SELECT Határozottak.HatályaID
FROM Határozottak
UNION
SELECT Belépõk.HatályaID
FROM Belépõk
UNION
SELECT Kilépõk.HatályaID
FROM Kilépõk
UNION
SELECT FedlaprólLétszámtábla.HatályaID
FROM FedlaprólLétszámtábla
UNION SELECT FedlaprólLétszámtábla2.HatályaID
FROM FedlaprólLétszámtábla2;

#/#/#/
lkHatályUnionCount
#/#/
SELECT Count(lkHatályUnion.HatályaID) AS Szám
FROM lkHatályUnion;

#/#/#/
lkHatározottak_TT
#/#/
SELECT Határozottak.[Tartós távollévõ neve], Határozottak.Adóazonosító, Határozottak.[Megyei szint VAGY Járási Hivatal], Határozottak.Mezõ5, Határozottak.Mezõ6, Határozottak.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Határozottak.Mezõ8, Határozottak.[Besorolási fokozat kód:], Határozottak.[Besorolási fokozat megnevezése:], Határozottak.[Álláshely azonosító], Határozottak.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Határozottak.[Tartós távollét kezdete], Határozottak.[Tartós távollét várható vége], Határozottak.[Tartósan távollévõ illetményének teljes összege], "" AS Üres
FROM Határozottak;

#/#/#/
lkHatározottak_TTH
#/#/
SELECT Határozottak.[Tartós távollévõ álláshelyén határozott idõre foglalkoztatott ne], Határozottak.Mezõ17, Határozottak.Mezõ18, Határozottak.Mezõ19, Határozottak.Mezõ20, Határozottak.Mezõ21, Határozottak.Mezõ22, Határozottak.Mezõ23, Határozottak.Mezõ24, Határozottak.Mezõ25, Határozottak.[Tartós távollévõ státuszán foglalkoztatott határozott idejû jogv], Határozottak.Mezõ27, Határozottak.[Tartós távollévõ státuszán foglalkoztatott illetményének teljes ], "" AS Üres
FROM Határozottak;

#/#/#/
lkHatározottak_TTH_OsztályonkéntiLétszám
#/#/
SELECT lkHatározottak_TTH.Mezõ21 AS BFKH, IIf([Mezõ18]="megyei szint",[Mezõ19],[Mezõ18]) AS Fõosztály, lkHatározottak_TTH.Mezõ20 AS Osztály, 0 AS [Betöltött létszám], 0 AS TTLétszám, Count(lkHatározottak_TTH.Mezõ17) AS HatározottLétszám, 0 AS Korr
FROM lkHatározottak_TTH
GROUP BY lkHatározottak_TTH.Mezõ21, IIf([Mezõ18]="megyei szint",[Mezõ19],[Mezõ18]), lkHatározottak_TTH.Mezõ20, 0, "", 0, 0, 0;

#/#/#/
lkHatározottak_TTH_Személytörzs_alapján
#/#/
SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Adójel, lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.[Státusz kódja], lkSzemélyek.[Helyettesített dolgozó neve], lkSzemélyek.[Helyettesített dolgozó szerzõdés/kinevezéses munkaköre] AS Kif1
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Helyettesített dolgozó neve]) Is Not Null));

#/#/#/
lkHatározottakÉsHelyettesek
#/#/
SELECT lkSzemélyek.[Szerzõdés/Kinevezés típusa], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Státusz kódja] AS ÁNYR, lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.[Dolgozó teljes neve] AS Név, Trim([Elõnév1] & " " & [Családi név1] & " " & [Utónév1]) AS [Helyettesített neve], lkSzemélyek.[Határozott idejû _szerzõdés/kinevezés lejár] AS [Határozott idõ vége]
FROM BesorolásHelyettesített RIGHT JOIN lkSzemélyek ON BesorolásHelyettesített.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Szerzõdés/Kinevezés típusa])="határozott") AND ((lkSzemélyek.[KIRA jogviszony jelleg])="Kormányzati szolgálati jogviszony (KIT)") AND ((lkSzemélyek.[Státusz típusa])="Szervezeti alaplétszám")) OR (((lkSzemélyek.[KIRA jogviszony jelleg])="Kormányzati szolgálati jogviszony (KIT)") AND ((lkSzemélyek.[Státusz típusa])="Szervezeti alaplétszám") AND ((BesorolásHelyettesített.Adójel) Is Not Null))
ORDER BY lkSzemélyek.[Szerzõdés/Kinevezés típusa];

#/#/#/
lkháttértár_tBesorolásiEredményadatok_áttöltés
#/#/
INSERT INTO tBesorolásiEredményadatok IN 'L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Háttértárak\Ellenõrzés_0.9.6_háttér_.mdb.accdb'
SELECT [tBesorolásiEredményadatok_import].[Adóazonosító jel] AS [Adóazonosító jel], [tBesorolásiEredményadatok_import].[TAJ szám] AS [TAJ szám], [tBesorolásiEredményadatok_import].[Egyedi azonosító] AS [Egyedi azonosító], [tBesorolásiEredményadatok_import].[Törzsszám] AS Törzsszám, [tBesorolásiEredményadatok_import].[Elõnév] AS Elõnév, [tBesorolásiEredményadatok_import].[Családi név] AS [Családi név], [tBesorolásiEredményadatok_import].[Utónév] AS Utónév, [tBesorolásiEredményadatok_import].[Jogviszony ID] AS [Jogviszony ID], [tBesorolásiEredményadatok_import].[Kód] AS Kód, [tBesorolásiEredményadatok_import].[Megnevezés] AS Megnevezés, [tBesorolásiEredményadatok_import].[Kezdete] AS Kezdete, [tBesorolásiEredményadatok_import].[Vége] AS Vége, [tBesorolásiEredményadatok_import].[Változás dátuma] AS [Változás dátuma], [tBesorolásiEredményadatok_import].[Kezdete1] AS Kezdete1, [tBesorolásiEredményadatok_import].[Vége2] AS Vége2, [tBesorolásiEredményadatok_import].[Megnevezés3] AS Megnevezés3, [tBesorolásiEredményadatok_import].[Kezdete4] AS Kezdete4, [tBesorolásiEredményadatok_import].[Vége5] AS Vége5, [tBesorolásiEredményadatok_import].[Napi óra] AS [Napi óra], [tBesorolásiEredményadatok_import].[Heti óra] AS [Heti óra], [tBesorolásiEredményadatok_import].[Havi óra] AS [Havi óra], [tBesorolásiEredményadatok_import].[Kezdete6] AS Kezdete6, [tBesorolásiEredményadatok_import].[Vége7] AS Vége7, [tBesorolásiEredményadatok_import].[Típus] AS Típus, [tBesorolásiEredményadatok_import].[Jelleg] AS Jelleg, [tBesorolásiEredményadatok_import].[Kezdete8] AS Kezdete8, [tBesorolásiEredményadatok_import].[Vége9] AS Vége9, [tBesorolásiEredményadatok_import].[Besorolási fokozat] AS [Besorolási fokozat], [tBesorolásiEredményadatok_import].[Nem fogadta el a besorolást] AS [Nem fogadta el a besorolást], [tBesorolásiEredményadatok_import].[Kezdete10] AS Kezdete10, [tBesorolásiEredményadatok_import].[Vége11] AS Vége11, [tBesorolásiEredményadatok_import].[Kulcsszám] AS Kulcsszám, [tBesorolásiEredményadatok_import].[Besorolási osztály] AS [Besorolási osztály], [tBesorolásiEredményadatok_import].[Besorolási fokozat12] AS [Besorolási fokozat12], [tBesorolásiEredményadatok_import].[Következõ besorolási fokozat dátum] AS [Következõ besorolási fokozat dátum], [tBesorolásiEredményadatok_import].[Fiktív kulcsszám] AS [Fiktív kulcsszám], [tBesorolásiEredményadatok_import].[Fiktív besorolási osztály] AS [Fiktív besorolási osztály], [tBesorolásiEredményadatok_import].[Fiktív besorolási fokozat] AS [Fiktív besorolási fokozat], [tBesorolásiEredményadatok_import].[Fiktív következõ besorolási fokozat dátum] AS [Fiktív következõ besorolási fokozat dátum], [tBesorolásiEredményadatok_import].[Utolsó besorolás dátuma] AS [Utolsó besorolás dátuma], [tBesorolásiEredményadatok_import].[Kezdete13] AS Kezdete13, [tBesorolásiEredményadatok_import].[Vége14] AS Vége14, [tBesorolásiEredményadatok_import].[Eszmei fizetési fokozat idõ] AS [Eszmei fizetési fokozat idõ], [tBesorolásiEredményadatok_import].[Kezdete15] AS Kezdete15, [tBesorolásiEredményadatok_import].[Vége16] AS Vége16, [tBesorolásiEredményadatok_import].[Eszmei közszolgálati jogviszony idõ] AS [Eszmei közszolgálati jogviszony idõ], [tBesorolásiEredményadatok_import].[Kezdete17] AS Kezdete17, [tBesorolásiEredményadatok_import].[Vége18] AS Vége18, [tBesorolásiEredményadatok_import].[Közszolgálati jogviszony idõ] AS [Közszolgálati jogviszony idõ], [tBesorolásiEredményadatok_import].[Kezdete19] AS Kezdete19, [tBesorolásiEredményadatok_import].[Vége20] AS Vége20, [tBesorolásiEredményadatok_import].[Számított fizetési fokozat idõ] AS [Számított fizetési fokozat idõ], [tBesorolásiEredményadatok_import].[Kezdete21] AS Kezdete21, [tBesorolásiEredményadatok_import].[Vége22] AS Vége22, [tBesorolásiEredményadatok_import].[Szolgálati elismerés / Jubileum jutalom idõ] AS [Szolgálati elismerés / Jubileum jutalom idõ], [tBesorolásiEredményadatok_import].[Kezdete23] AS Kezdete23, [tBesorolásiEredményadatok_import].[Vége24] AS Vége24, [tBesorolásiEredményadatok_import].[Végkielégítésre jogosító idõ] AS [Végkielégítésre jogosító idõ], [tBesorolásiEredményadatok_import].[Kezdete25] AS Kezdete25, [tBesorolásiEredményadatok_import].[Vége26] AS Vége26, [tBesorolásiEredményadatok_import].[Szolgálati jogviszonyban eltöltött idõ] AS [Szolgálati jogviszonyban eltöltött idõ], [tBesorolásiEredményadatok_import].[Kezdete27] AS Kezdete27, [tBesorolásiEredményadatok_import].[Vége28] AS Vége28, [tBesorolásiEredményadatok_import].[Álláshelyi idõ] AS [Álláshelyi idõ], [tBesorolásiEredményadatok_import].[Kezdete29] AS Kezdete29, [tBesorolásiEredményadatok_import].[Vége30] AS Vége30, [tBesorolásiEredményadatok_import].[Saját munkahelyen eltöltött idõ] AS [Saját munkahelyen eltöltött idõ], [tBesorolásiEredményadatok_import].[Kezdete31] AS Kezdete31, [tBesorolásiEredményadatok_import].[Vége32] AS Vége32, [tBesorolásiEredményadatok_import].[Szakmai gyakorlat kezdõ dátuma] AS [Szakmai gyakorlat kezdõ dátuma], [tBesorolásiEredményadatok_import].[Kezdete33] AS Kezdete33, [tBesorolásiEredményadatok_import].[Vége34] AS Vége34, [tBesorolásiEredményadatok_import].[Alapilletmény] AS Alapilletmény, [tBesorolásiEredményadatok_import].[Garantált bérminimum] AS [Garantált bérminimum], [tBesorolásiEredményadatok_import].[Kerekítés] AS Kerekítés, [tBesorolásiEredményadatok_import].[Összesen] AS Összesen
FROM tBesorolásiEredményadatok_import;

#/#/#/
lkháttértár_tBesorolásiEredményadatok_törlõ
#/#/
DELETE *
FROM tBesorolásiEredményadatok IN 'L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Háttértárak\Ellenõrzés_0.9.6_háttér_.mdb.accdb';

#/#/#/
lkháttértár_tSzemélyek_áttöltés
#/#/
INSERT INTO tSzemélyek ( Adójel, [Dolgozó teljes neve], [Dolgozó születési neve], [Születési idõ], [Születési hely], [Anyja neve], Neme, Törzsszám, [Egyedi azonosító], [Adóazonosító jel], [TAJ szám], [Ügyfélkapu kód], [Elsõdleges állampolgárság], [Személyi igazolvány száma], [Személyi igazolvány érvényesség kezdete], [Személyi igazolvány érvényesség vége], [Nyelvtudás Angol], [Nyelvtudás Arab], [Nyelvtudás Bolgár], [Nyelvtudás Cigány], [Nyelvtudás Cigány (lovári)], [Nyelvtudás Cseh], [Nyelvtudás Eszperantó], [Nyelvtudás Finn], [Nyelvtudás Francia], [Nyelvtudás Héber], [Nyelvtudás Holland], [Nyelvtudás Horvát], [Nyelvtudás Japán], [Nyelvtudás Jelnyelv], [Nyelvtudás Kínai], [Nyelvtudás Latin], [Nyelvtudás Lengyel], [Nyelvtudás Német], [Nyelvtudás Norvég], [Nyelvtudás Olasz], [Nyelvtudás Orosz], [Nyelvtudás Portugál], [Nyelvtudás Román], [Nyelvtudás Spanyol], [Nyelvtudás Szerb], [Nyelvtudás Szlovák], [Nyelvtudás Szlovén], [Nyelvtudás Török], [Nyelvtudás Újgörög], [Nyelvtudás Ukrán], [Orvosi vizsgálat idõpontja], [Orvosi vizsgálat típusa], [Orvosi vizsgálat eredménye], [Orvosi vizsgálat észrevételek], [Orvosi vizsgálat következõ idõpontja], [Erkölcsi bizonyítvány száma], [Erkölcsi bizonyítvány dátuma], [Erkölcsi bizonyítvány eredménye], [Erkölcsi bizonyítvány kérelem azonosító], [Erkölcsi bizonyítvány közügyektõl eltiltva], [Erkölcsi bizonyítvány jármûvezetéstõl eltiltva], [Erkölcsi bizonyítvány intézkedés alatt áll], [Munkaköri leírások (csatolt dokumentumok fájlnevei)], [Egyéb HR dokumentumok (csatolt dokumentumok fájlnevei)], [Kormányhivatal rövid neve], [Szervezeti egység kódja], [Szervezeti egység neve], [Szervezeti munkakör neve], [Vezetõi megbízás típusa], [Státusz kódja], [Státusz költséghelyének kódja], [Státusz költséghelyének neve ], [Létszámon felül létrehozott státusz], [Státusz típusa], [Státusz neve], [Többes betöltés], [Vezetõ neve], [Vezetõ adóazonosító jele], [Vezetõ email címe], [Állandó lakcím], [Tartózkodási lakcím], [Levelezési cím_], [Öregségi nyugdíj-korhatár elérésének idõpontja (dátum)], Nyugdíjas, [Nyugdíj típusa], [Nyugdíjas korú továbbfoglalkoztatási engedéllyel rendelkezik], [Megváltozott munkaképesség], [Önkéntes tartalékos katona], [Utolsó vagyonnyilatkozat leadásának dátuma], [Vagyonnyilatkozat nyilvántartási száma], [Következõ vagyonnyilatkozat esedékessége], [Nemzetbiztonsági ellenõrzés dátuma], [Védett állományba tartozó munkakör], [Vezetõi megbízás típusa1], [Vezetõi beosztás megnevezése], [Vezetõi beosztás (megbízás) kezdete], [Vezetõi beosztás (megbízás) vége], [Iskolai végzettség foka], [Iskolai végzettség neve], [Alapvizsga kötelezés dátuma], [Alapvizsga letétel tényleges határideje], [Alapvizsga mentesség], [Alapvizsga mentesség oka], [Szakvizsga kötelezés dátuma], [Szakvizsga letétel tényleges határideje], [Szakvizsga mentesség], [Foglalkozási viszony], [Foglalkozási viszony statisztikai besorolása], [Dolgozó szerzõdéses/kinevezéses munkaköre / kinevezési okmányban], [Beosztástervezés helyszínek], [Beosztástervezés tevékenységek], [Részleges távmunka szerzõdés kezdete], [Részleges távmunka szerzõdés vége], [Részleges távmunka szerzõdés intervalluma], [Részleges távmunka szerzõdés mértéke], [Részleges távmunka szerzõdés helyszíne], [Részleges távmunka szerzõdés helyszíne 2], [Részleges távmunka szerzõdés helyszíne 3], [Egyéni túlóra keret megállapodás kezdete], [Egyéni túlóra keret megállapodás vége], [Egyéni túlóra keret megállapodás mértéke], [KIRA feladat azonosítója - intézmény prefix-szel ellátva], [KIRA feladat azonosítója], [KIRA feladat megnevezés], [Osztott munkakör], [Funkciócsoport: kód-megnevezés], [Funkció: kód-megnevezés], [Dolgozó költséghelyének kódja], [Dolgozó költséghelyének neve], Feladatkör, [Elsõdleges feladatkör], Feladatok, FEOR, [Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó napi óraker], [Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker], [Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker], [Szerzõdés/Kinevezés típusa], Iktatószám, [Szerzõdés/kinevezés verzió_érvényesség kezdete], [Szerzõdés/kinevezés verzió_érvényesség vége], [Határozott idejû _szerzõdés/kinevezés lejár], [Szerzõdés dokumentum (csatolt dokumentumok fájlnevei)], [Megjegyzés (pl# határozott szerzõdés/kinevezés oka)], [Munkavégzés helye - megnevezés], [Munkavégzés helye - cím], [Jogviszony típusa / jogviszony típus], [Jogviszony sorszáma], [KIRA jogviszony jelleg], [Kölcsönbe adó cég], [Teljesítményértékelés - Értékelõ személy], [Teljesítményértékelés - Érvényesség kezdet], [Teljesítményértékelés - Értékelt idõszak kezdet], [Teljesítményértékelés - Értékelt idõszak vége], [Teljesítményértékelés dátuma], [Teljesítményértékelés - Beállási százalék], [Teljesítményértékelés - Pontszám], [Teljesítményértékelés - Megjegyzés], [Dolgozói jellemzõk], [Fizetési osztály (KA)/ Pedagógusi fokozat (KA pedagógus)/besorol], [Besorolási  fokozat (KT)], [Jogfolytonos idõ kezdete], [Jogviszony kezdete (belépés dátuma)], [Jogviszony vége (kilépés dátuma)], [Utolsó munkában töltött nap], [Kezdeményezés dátuma], [Hatályossá válik], [HR kapcsolat megszûnés módja (Kilépés módja)], [HR kapcsolat megszûnes indoka (Kilépés indoka)], Indokolás, [Következõ munkahely], [MT: Felmondási idõ kezdete KJT, KTTV: Felmentési idõ kezdete], [Felmondási idõ vége (MT) Felmentési idõ vége (KJT, KTTV)], [Munkavégzés alóli mentesítés kezdete (KJT, KTTV) Felmentési idõ ], [Munkavégzés alóli mentesítés vége (KJT, KTTV) Felmentési idõ vég], [Tartós távollét típusa], [Tartós távollét kezdete], [Tartós távollét vége], [Tartós távollét tervezett vége], [Helyettesített dolgozó neve], [Szerzõdés/Kinevezés - próbaidõ vége], [Utalási cím], [Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)], [Garantált bérminimumra történõ kiegészítés], Kerekítés, [Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérít], [Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (el], [Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérítés nélküli)], [Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérítés nél], [Egyéb pótlék - összeg (eltérítés nélküli)], [Illetmény összesen kerekítés nélkül (eltérítés nélküli)], [Kerekített 100 %-os illetmény (eltérítés nélküli)], [Eltérítés %], [Alapilletmény / Munkabér / Megbízási díj (eltérített)], [Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérí1], [Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (e1], [Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérített)], [Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérített)], [Egyéb pótlék - összeg (eltérített)], [Illetmény összesen kerekítés nélkül (eltérített)], [Kerekített 100 %-os illetmény (eltérített)], [További munkavégzés helye 1 Teljes munkaidõ %-a], [További munkavégzés helye 2 Teljes munkaidõ %-a], [KT: Kerekített 100 %-os illetmény (eltérített) + Helyettesítési ], [Szint 1 szervezeti egység név], [Szint 1 szervezeti egység kód], [Szint 2 szervezeti egység név], [Szint 2 szervezeti egység kód], [Szint 3 szervezeti egység név], [Szint 3 szervezeti egység kód], [Szint 4 szervezeti egység név], [Szint 4 szervezeti egység kód], [Szint 5 szervezeti egység név], [Szint 5 szervezeti egység kód], [Szint 6 szervezeti egység név], [Szint 6 szervezeti egység kód], [Szint 7 szervezeti egység név], [Szint 7 szervezeti egység kód], [AD egyedi azonosító], [Hivatali email], [Hivatali mobil], [Hivatali telefon], [Hivatali telefon mellék], Iroda, [Otthoni e-mail], [Otthoni mobil], [Otthoni telefon], [További otthoni mobil] ) IN 'L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Háttértárak\Ellenõrzés_0.9.6_háttér_.mdb.accdb'
SELECT tSzemélyek_Import.Adójel, tSzemélyek_Import.[Dolgozó teljes neve], tSzemélyek_Import.[Dolgozó születési neve], tSzemélyek_Import.[Születési idõ], tSzemélyek_Import.[Születési hely], tSzemélyek_Import.[Anyja neve], tSzemélyek_Import.Neme, tSzemélyek_Import.Törzsszám, tSzemélyek_Import.[Egyedi azonosító], tSzemélyek_Import.[Adóazonosító jel], tSzemélyek_Import.[TAJ szám], tSzemélyek_Import.[Ügyfélkapu kód], tSzemélyek_Import.[Elsõdleges állampolgárság], tSzemélyek_Import.[Személyi igazolvány száma], tSzemélyek_Import.[Személyi igazolvány érvényesség kezdete], tSzemélyek_Import.[Személyi igazolvány érvényesség vége], tSzemélyek_Import.[Nyelvtudás Angol], tSzemélyek_Import.[Nyelvtudás Arab], tSzemélyek_Import.[Nyelvtudás Bolgár], tSzemélyek_Import.[Nyelvtudás Cigány], tSzemélyek_Import.[Nyelvtudás Cigány (lovári)], tSzemélyek_Import.[Nyelvtudás Cseh], tSzemélyek_Import.[Nyelvtudás Eszperantó], tSzemélyek_Import.[Nyelvtudás Finn], tSzemélyek_Import.[Nyelvtudás Francia], tSzemélyek_Import.[Nyelvtudás Héber], tSzemélyek_Import.[Nyelvtudás Holland], tSzemélyek_Import.[Nyelvtudás Horvát], tSzemélyek_Import.[Nyelvtudás Japán], tSzemélyek_Import.[Nyelvtudás Jelnyelv], tSzemélyek_Import.[Nyelvtudás Kínai], tSzemélyek_Import.[Nyelvtudás Latin], tSzemélyek_Import.[Nyelvtudás Lengyel], tSzemélyek_Import.[Nyelvtudás Német], tSzemélyek_Import.[Nyelvtudás Norvég], tSzemélyek_Import.[Nyelvtudás Olasz], tSzemélyek_Import.[Nyelvtudás Orosz], tSzemélyek_Import.[Nyelvtudás Portugál], tSzemélyek_Import.[Nyelvtudás Román], tSzemélyek_Import.[Nyelvtudás Spanyol], tSzemélyek_Import.[Nyelvtudás Szerb], tSzemélyek_Import.[Nyelvtudás Szlovák], tSzemélyek_Import.[Nyelvtudás Szlovén], tSzemélyek_Import.[Nyelvtudás Török], tSzemélyek_Import.[Nyelvtudás Újgörög], tSzemélyek_Import.[Nyelvtudás Ukrán], tSzemélyek_Import.[Orvosi vizsgálat idõpontja], tSzemélyek_Import.[Orvosi vizsgálat típusa], tSzemélyek_Import.[Orvosi vizsgálat eredménye], tSzemélyek_Import.[Orvosi vizsgálat észrevételek], tSzemélyek_Import.[Orvosi vizsgálat következõ idõpontja], tSzemélyek_Import.[Erkölcsi bizonyítvány száma], tSzemélyek_Import.[Erkölcsi bizonyítvány dátuma], tSzemélyek_Import.[Erkölcsi bizonyítvány eredménye], tSzemélyek_Import.[Erkölcsi bizonyítvány kérelem azonosító], tSzemélyek_Import.[Erkölcsi bizonyítvány közügyektõl eltiltva], tSzemélyek_Import.[Erkölcsi bizonyítvány jármûvezetéstõl eltiltva], tSzemélyek_Import.[Erkölcsi bizonyítvány intézkedés alatt áll], tSzemélyek_Import.[Munkaköri leírások (csatolt dokumentumok fájlnevei)], tSzemélyek_Import.[Egyéb HR dokumentumok (csatolt dokumentumok fájlnevei)], tSzemélyek_Import.[Kormányhivatal rövid neve], tSzemélyek_Import.[Szervezeti egység kódja], tSzemélyek_Import.[Szervezeti egység neve], tSzemélyek_Import.[Szervezeti munkakör neve], tSzemélyek_Import.[Vezetõi megbízás típusa], tSzemélyek_Import.[Státusz kódja], tSzemélyek_Import.[Státusz költséghelyének kódja], tSzemélyek_Import.[Státusz költséghelyének neve ], tSzemélyek_Import.[Létszámon felül létrehozott státusz], tSzemélyek_Import.[Státusz típusa], tSzemélyek_Import.[Státusz neve], tSzemélyek_Import.[Többes betöltés], tSzemélyek_Import.[Vezetõ neve], tSzemélyek_Import.[Vezetõ adóazonosító jele], tSzemélyek_Import.[Vezetõ email címe], tSzemélyek_Import.[Állandó lakcím], tSzemélyek_Import.[Tartózkodási lakcím], tSzemélyek_Import.[Levelezési cím_], tSzemélyek_Import.[Öregségi nyugdíj-korhatár elérésének idõpontja (dátum)], tSzemélyek_Import.Nyugdíjas, tSzemélyek_Import.[Nyugdíj típusa], tSzemélyek_Import.[Nyugdíjas korú továbbfoglalkoztatási engedéllyel rendelkezik], tSzemélyek_Import.[Megváltozott munkaképesség], tSzemélyek_Import.[Önkéntes tartalékos katona], tSzemélyek_Import.[Utolsó vagyonnyilatkozat leadásának dátuma], tSzemélyek_Import.[Vagyonnyilatkozat nyilvántartási száma], tSzemélyek_Import.[Következõ vagyonnyilatkozat esedékessége], tSzemélyek_Import.[Nemzetbiztonsági ellenõrzés dátuma], tSzemélyek_Import.[Védett állományba tartozó munkakör], tSzemélyek_Import.[Vezetõi megbízás típusa1], tSzemélyek_Import.[Vezetõi beosztás megnevezése], tSzemélyek_Import.[Vezetõi beosztás (megbízás) kezdete], tSzemélyek_Import.[Vezetõi beosztás (megbízás) vége], tSzemélyek_Import.[Iskolai végzettség foka], tSzemélyek_Import.[Iskolai végzettség neve], tSzemélyek_Import.[Alapvizsga kötelezés dátuma], tSzemélyek_Import.[Alapvizsga letétel tényleges határideje], tSzemélyek_Import.[Alapvizsga mentesség], tSzemélyek_Import.[Alapvizsga mentesség oka], tSzemélyek_Import.[Szakvizsga kötelezés dátuma], tSzemélyek_Import.[Szakvizsga letétel tényleges határideje], tSzemélyek_Import.[Szakvizsga mentesség], tSzemélyek_Import.[Foglalkozási viszony], tSzemélyek_Import.[Foglalkozási viszony statisztikai besorolása], tSzemélyek_Import.[Dolgozó szerzõdéses/kinevezéses munkaköre / kinevezési okmányban], tSzemélyek_Import.[Beosztástervezés helyszínek], tSzemélyek_Import.[Beosztástervezés tevékenységek], tSzemélyek_Import.[Részleges távmunka szerzõdés kezdete], tSzemélyek_Import.[Részleges távmunka szerzõdés vége], tSzemélyek_Import.[Részleges távmunka szerzõdés intervalluma], tSzemélyek_Import.[Részleges távmunka szerzõdés mértéke], tSzemélyek_Import.[Részleges távmunka szerzõdés helyszíne], tSzemélyek_Import.[Részleges távmunka szerzõdés helyszíne 2], tSzemélyek_Import.[Részleges távmunka szerzõdés helyszíne 3], tSzemélyek_Import.[Egyéni túlóra keret megállapodás kezdete], tSzemélyek_Import.[Egyéni túlóra keret megállapodás vége], tSzemélyek_Import.[Egyéni túlóra keret megállapodás mértéke], tSzemélyek_Import.[KIRA feladat azonosítója - intézmény prefix-szel ellátva], tSzemélyek_Import.[KIRA feladat azonosítója], tSzemélyek_Import.[KIRA feladat megnevezés], tSzemélyek_Import.[Osztott munkakör], tSzemélyek_Import.[Funkciócsoport: kód-megnevezés], tSzemélyek_Import.[Funkció: kód-megnevezés], tSzemélyek_Import.[Dolgozó költséghelyének kódja], tSzemélyek_Import.[Dolgozó költséghelyének neve], tSzemélyek_Import.Feladatkör, tSzemélyek_Import.[Elsõdleges feladatkör], tSzemélyek_Import.Feladatok, tSzemélyek_Import.FEOR, tSzemélyek_Import.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó napi óraker], tSzemélyek_Import.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker], tSzemélyek_Import.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker], tSzemélyek_Import.[Szerzõdés/Kinevezés típusa], tSzemélyek_Import.Iktatószám, tSzemélyek_Import.[Szerzõdés/kinevezés verzió_érvényesség kezdete], tSzemélyek_Import.[Szerzõdés/kinevezés verzió_érvényesség vége], tSzemélyek_Import.[Határozott idejû _szerzõdés/kinevezés lejár], tSzemélyek_Import.[Szerzõdés dokumentum (csatolt dokumentumok fájlnevei)], tSzemélyek_Import.[Megjegyzés (pl# határozott szerzõdés/kinevezés oka)], tSzemélyek_Import.[Munkavégzés helye - megnevezés], tSzemélyek_Import.[Munkavégzés helye - cím], tSzemélyek_Import.[Jogviszony típusa / jogviszony típus], tSzemélyek_Import.[Jogviszony sorszáma], tSzemélyek_Import.[KIRA jogviszony jelleg], tSzemélyek_Import.[Kölcsönbe adó cég], tSzemélyek_Import.[Teljesítményértékelés - Értékelõ személy], tSzemélyek_Import.[Teljesítményértékelés - Érvényesség kezdet], tSzemélyek_Import.[Teljesítményértékelés - Értékelt idõszak kezdet], tSzemélyek_Import.[Teljesítményértékelés - Értékelt idõszak vége], tSzemélyek_Import.[Teljesítményértékelés dátuma], tSzemélyek_Import.[Teljesítményértékelés - Beállási százalék], tSzemélyek_Import.[Teljesítményértékelés - Pontszám], tSzemélyek_Import.[Teljesítményértékelés - Megjegyzés], tSzemélyek_Import.[Dolgozói jellemzõk], tSzemélyek_Import.[Fizetési osztály (KA)/ Pedagógusi fokozat (KA pedagógus)/besorol], tSzemélyek_Import.[Besorolási  fokozat (KT)], tSzemélyek_Import.[Jogfolytonos idõ kezdete], tSzemélyek_Import.[Jogviszony kezdete (belépés dátuma)], dtÁtal([tSzemélyek_Import].[Jogviszony vége (kilépés dátuma)]) AS [Jogviszony vége (kilépés dátuma)], tSzemélyek_Import.[Utolsó munkában töltött nap], tSzemélyek_Import.[Kezdeményezés dátuma], tSzemélyek_Import.[Hatályossá válik], tSzemélyek_Import.[HR kapcsolat megszûnés módja (Kilépés módja)], tSzemélyek_Import.[HR kapcsolat megszûnes indoka (Kilépés indoka)], tSzemélyek_Import.Indokolás, tSzemélyek_Import.[Következõ munkahely], tSzemélyek_Import.[MT: Felmondási idõ kezdete KJT, KTTV: Felmentési idõ kezdete], tSzemélyek_Import.[Felmondási idõ vége (MT) Felmentési idõ vége (KJT, KTTV)], Nz([Munkavégzés alóli mentesítés kezdete (KJT, KTTV) Felmentési idõ ],"") AS Kif1, Nz([Munkavégzés alóli mentesítés vége (KJT, KTTV) Felmentési idõ vég],"") AS Kif2, tSzemélyek_Import.[Tartós távollét típusa], tSzemélyek_Import.[Tartós távollét kezdete], tSzemélyek_Import.[Tartós távollét vége], tSzemélyek_Import.[Tartós távollét tervezett vége], IIf(IsNull([Helyettesített dolgozó neve]),"",[Helyettesített dolgozó neve]) AS Kif3, tSzemélyek_Import.[Szerzõdés/Kinevezés - próbaidõ vége], tSzemélyek_Import.[Utalási cím], tSzemélyek_Import.[Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)], tSzemélyek_Import.[Garantált bérminimumra történõ kiegészítés], tSzemélyek_Import.Kerekítés, tSzemélyek_Import.[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérít], tSzemélyek_Import.[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (el], tSzemélyek_Import.[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérítés nélküli)], tSzemélyek_Import.[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérítés nél], tSzemélyek_Import.[Egyéb pótlék - összeg (eltérítés nélküli)], tSzemélyek_Import.[Illetmény összesen kerekítés nélkül (eltérítés nélküli)], tSzemélyek_Import.[Kerekített 100 %-os illetmény (eltérítés nélküli)], tSzemélyek_Import.[Eltérítés %], tSzemélyek_Import.[Alapilletmény / Munkabér / Megbízási díj (eltérített)], tSzemélyek_Import.[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérí1], tSzemélyek_Import.[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (e1], tSzemélyek_Import.[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérített)], tSzemélyek_Import.[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérített)], tSzemélyek_Import.[Egyéb pótlék - összeg (eltérített)], tSzemélyek_Import.[Illetmény összesen kerekítés nélkül (eltérített)], tSzemélyek_Import.[Kerekített 100 %-os illetmény (eltérített)], tSzemélyek_Import.[További munkavégzés helye 1 Teljes munkaidõ %-a], tSzemélyek_Import.[További munkavégzés helye 2 Teljes munkaidõ %-a], tSzemélyek_Import.[KT: Kerekített 100 %-os illetmény (eltérített) + Helyettesítési ], tSzemélyek_Import.[Szint 1 szervezeti egység név], tSzemélyek_Import.[Szint 1 szervezeti egység kód], tSzemélyek_Import.[Szint 2 szervezeti egység név], tSzemélyek_Import.[Szint 2 szervezeti egység kód], tSzemélyek_Import.[Szint 3 szervezeti egység név], tSzemélyek_Import.[Szint 3 szervezeti egység kód], tSzemélyek_Import.[Szint 4 szervezeti egység név], tSzemélyek_Import.[Szint 4 szervezeti egység kód], tSzemélyek_Import.[Szint 5 szervezeti egység név], tSzemélyek_Import.[Szint 5 szervezeti egység kód], tSzemélyek_Import.[Szint 6 szervezeti egység név], tSzemélyek_Import.[Szint 6 szervezeti egység kód], tSzemélyek_Import.[Szint 7 szervezeti egység név], tSzemélyek_Import.[Szint 7 szervezeti egység kód], tSzemélyek_Import.[AD egyedi azonosító], tSzemélyek_Import.[Hivatali email], tSzemélyek_Import.[Hivatali mobil], tSzemélyek_Import.[Hivatali telefon], tSzemélyek_Import.[Hivatali telefon mellék], tSzemélyek_Import.Iroda, tSzemélyek_Import.[Otthoni e-mail], tSzemélyek_Import.[Otthoni mobil], tSzemélyek_Import.[Otthoni telefon], tSzemélyek_Import.[További otthoni mobil]
FROM tSzemélyek_Import;

#/#/#/
lkháttértár_tSzemélyek_törlõ
#/#/
DELETE *
FROM tSzemélyek IN 'L:\Ugyintezok\Adatszolgáltatók\Adatbázisok\Háttértárak\Ellenõrzés_0.9.6_háttér_.mdb.accdb';

#/#/#/
lkHaviAdatszolgáltatásbólHiányzók
#/#/
SELECT lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Adóazonosító jel] AS Adóazonosító, Year([Születési idõ]) AS [Születési év], IIf([lkszemélyek].[Neme]="nõ",2,1) AS Nem, lkSzemélyek.Fõosztály AS [Járási Hivatal], lkSzemélyek.Osztály, lkSzemélyek.[Szervezeti egység kódja], ffsplit([Feladatkör],"-",2) AS [Ellátott feladat], lkSzemélyek.[Szerzõdés/kinevezés verzió_érvényesség kezdete] AS Kinevezés, "SZ" AS [Feladat jellege], IIf([Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]=40,"T","R") AS Forma, lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS [Heti munkaórák száma], 1 AS [Betöltés aránya], tBesorolás_átalakító.[Az álláshely jelölése], lkSzemélyek.Besorolás2 AS [Besorolási fokozat], lkÁlláshelyek.[Álláshely azonosító], lkSzemélyek.[Illetmény összesen kerekítés nélkül (eltérített)], "" AS [Eu finanszírozott], "" AS [Illetmény forrása], IIf(Len([Tartós távollét típusa])<1,"","TT") AS Kif1, lkSzemélyek.[Tartós távollét típusa], IIf([Szerzõdés/Kinevezés típusa]="határozatlan","HL","HT") AS Idõtartam, tLegmagasabbVégzettség04.azFok AS [Végzettség foka], "" AS Kif2, lkSzemélyek.VégzettségFok, IIf([lkszemélyek].[Osztály] Like "*ablak*",Mid(Left([munkavégzés helye - cím],13),6,13) & " " & Mid([munkavégzés helye - cím],2,2),"") AS KAB
FROM (tLegmagasabbVégzettség04 RIGHT JOIN (lkSzemélyek RIGHT JOIN (lkJárásiKormányKözpontosítottUnió RIGHT JOIN lkÁlláshelyek ON lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító] = lkÁlláshelyek.[Álláshely azonosító]) ON lkSzemélyek.[Státusz kódja] = lkÁlláshelyek.[Álláshely azonosító]) ON tLegmagasabbVégzettség04.[Dolgozó azonosító] = lkSzemélyek.[Adóazonosító jel]) LEFT JOIN tBesorolás_átalakító ON (lkSzemélyek.[Besorolási  fokozat (KT)] = tBesorolás_átalakító.Besorolási_fokozat) AND (lkSzemélyek.[Jogviszony típusa / jogviszony típus] = tBesorolás_átalakító.[Jogviszony típusa])
WHERE (((lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító]) Is Null) AND ((tBesorolás_átalakító.Üres)=False))
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkHaviAdatszolgáltatásbólHiányzókNexonaz
#/#/
SELECT DISTINCT lkSzemélyekÉsNexonAz.azNexon
FROM lkSzemélyekÉsNexonAz INNER JOIN lkHaviAdatszolgáltatásbólHiányzók ON lkSzemélyekÉsNexonAz.[Adóazonosító jel] = lkHaviAdatszolgáltatásbólHiányzók.Adóazonosító
ORDER BY lkSzemélyekÉsNexonAz.azNexon;

#/#/#/
lkHavibólHiányzóÁlláshelyek
#/#/
SELECT lkÁlláshelyekHaviból.[Álláshely azonosító], lkÁlláshelyek.[Álláshely azonosító], lkÁlláshelyek.[Álláshely besorolási kategóriája]
FROM lkÁlláshelyek LEFT JOIN lkÁlláshelyekHaviból ON lkÁlláshelyek.[Álláshely azonosító] = lkÁlláshelyekHaviból.[Álláshely azonosító]
WHERE (((lkÁlláshelyekHaviból.[Álláshely azonosító]) Is Null));

#/#/#/
lkHaviJelentésHatálya
#/#/
SELECT TOP 1 IIf((Select TOP 1 [szám] from [lkHatályUnionCount])>1,'Hibás beolvasás!',[hatálya]) AS Hatály
FROM lkHatályUnion INNER JOIN tHaviJelentésHatálya ON lkHatályUnion.HatályaID = tHaviJelentésHatálya.hatályaID;

#/#/#/
lkHaviJelentésHatálya_utolsók
#/#/
SELECT tHaviJelentésHatálya1.hatályaID, tHaviJelentésHatálya1.hatálya, tHaviJelentésHatálya1.[rögzítés] AS [Utolsó rögzítés], tHaviJelentésHatálya1.fájlnév
FROM tHaviJelentésHatálya1
WHERE (((tHaviJelentésHatálya1.[rögzítés])=(SELECT Max(TMP.rögzítés) FROM tHaviJelentésHatálya1 as TMP WHERE (((TMP.hatálya)=[tHaviJelentésHatálya1].[hatálya])))))
ORDER BY tHaviJelentésHatálya1.hatályaID;

#/#/#/
lkHaviJelentésHatályaAFileMezõAlapján
#/#/
SELECT TOP 1 thavijelentéshatálya.hatálya
FROM thavijelentéshatálya
WHERE (((thavijelentéshatálya.fájlnév)=[Ûrlapok]![ûFõmenü02]![File]))
ORDER BY thavijelentéshatálya.rögzítés DESC;

#/#/#/
lkHaviLétszám
#/#/
SELECT lkHaviLétszámUnió.BFKHKód, lkHaviLétszámUnió.Fõosztály, lkHaviLétszámUnió.Osztály, Sum(lkHaviLétszámUnió.Betöltött) AS [Betöltött létszám], Sum(lkHaviLétszámUnió.Üres) AS [Üres álláshely], Sum(lkHaviLétszámUnió.TT) AS TT
FROM lkHaviLétszámUnió
GROUP BY lkHaviLétszámUnió.BFKHKód, lkHaviLétszámUnió.Fõosztály, lkHaviLétszámUnió.Osztály, lkHaviLétszámUnió.Jelleg
ORDER BY bfkh([BFKHkód]);

#/#/#/
lkHaviLétszámFõosztály
#/#/
SELECT lkHaviLétszámUnió.Jelleg, lkHaviLétszámUnió.Fõosztály, Sum(lkHaviLétszámUnió.Betöltött) AS [Betöltött létszám], Sum(lkHaviLétszámUnió.Üres) AS [Üres álláshely], Sum(lkHaviLétszámUnió.TT) AS TT
FROM lkHaviLétszámUnió
GROUP BY lkHaviLétszámUnió.Jelleg, lkHaviLétszámUnió.Fõosztály;

#/#/#/
lkHaviLétszámJárási
#/#/
SELECT Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] AS BFKHKód, Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS Fõosztály, Járási_állomány.Mezõ7 AS Osztály, Sum(IIf([Mezõ4]="üres állás",0,[Mezõ14])) AS Betöltött, Sum(IIf([Mezõ4]="üres állás",[Mezõ14],0)) AS Üres, Járási_állomány.[Besorolási fokozat kód:], Sum(IIf([Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] Is Null Or [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp]="",0,[Mezõ14])) AS TT
FROM Járási_állomány
GROUP BY Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH"), Járási_állomány.Mezõ7, Járási_állomány.[Besorolási fokozat kód:];

#/#/#/
lkHaviLétszámKormányhivatali
#/#/
SELECT Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] AS BFKHKód, Kormányhivatali_állomány.Mezõ6 AS Fõosztály, Kormányhivatali_állomány.Mezõ7 AS Osztály, Sum(IIf([Mezõ4]="üres állás",0,[Mezõ14])) AS Betöltött, Sum(IIf([Mezõ4]="üres állás",[Mezõ14],0)) AS Üres, Kormányhivatali_állomány.[Besorolási fokozat kód:], Sum(IIf([Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] Is Null Or [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp]="",0,[Mezõ14])) AS TT
FROM Kormányhivatali_állomány
GROUP BY Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Kormányhivatali_állomány.Mezõ6, Kormányhivatali_állomány.Mezõ7, Kormányhivatali_állomány.[Besorolási fokozat kód:];

#/#/#/
lkHaviLétszámKorrekció
#/#/
SELECT First(lkJárásiKormányUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS BFKH, lkJárásiKormányUnió.[Járási Hivatal] AS Fõosztály, lkJárásiKormányUnió.Osztály, 0 AS [Betöltött létszám], 0 AS TTLétszám, 0 AS HatározottLétszám, -([CountOfAdóazonosító]-1) AS Korr
FROM lkJárásiKormányUnió RIGHT JOIN lkJárásiKormányUnióDuplikátumok ON lkJárásiKormányUnió.Adóazonosító = lkJárásiKormányUnióDuplikátumok.Adóazonosító
GROUP BY lkJárásiKormányUnió.[Járási Hivatal], lkJárásiKormányUnió.Osztály, 0, -([CountOfAdóazonosító]-1), lkJárásiKormányUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], 0, 0, 0;

#/#/#/
lkHaviLétszámKözpontosított
#/#/
SELECT Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] AS BFKHKód, IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ6],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, Központosítottak.Mezõ7 AS Osztály, Sum(IIf([Mezõ4]="üres állás",0,[Mezõ13])) AS Betöltött, Sum(IIf([Mezõ4]="üres állás",[Mezõ13],0)) AS Üres, Központosítottak.[Besorolási fokozat kód:], Sum(IIf([Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] Is Null Or [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp]="",0,[Mezõ13])) AS TT
FROM Központosítottak
GROUP BY Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító], IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ6],[Megyei szint VAGY Járási Hivatal]), Központosítottak.Mezõ7, Központosítottak.[Besorolási fokozat kód:];

#/#/#/
lkHaviLétszámUnió
#/#/
SELECT *, "A" as Jelleg
FROM  lkHaviLétszámKormányhivatali
UNION SELECT *, "A" as Jelleg
FROM lkHaviLétszámJárási
UNION SELECT *, "K" as Jelleg
FROM  lkHaviLétszámKözpontosított;

#/#/#/
lkHibákIntézkedésFajtánkéntiSzáma
#/#/
SELECT IIf([IntézkedésFajta] Is Null,"nem volt intézkedés",[IntézkedésFajta]) AS Fajta, Count(tRégiHibák.[Elsõ mezõ]) AS [CountOfElsõ mezõ]
FROM tIntézkedésFajták RIGHT JOIN (tIntézkedések RIGHT JOIN (tRégiHibák LEFT JOIN ktRégiHibákIntézkedések ON tRégiHibák.[Elsõ mezõ] = ktRégiHibákIntézkedések.HASH) ON tIntézkedések.azIntézkedések = ktRégiHibákIntézkedések.azIntézkedések) ON tIntézkedésFajták.azIntFajta = tIntézkedések.azIntFajta
WHERE ((((select max([utolsó idõpont]) from tRégiHibák ))=[Utolsó Idõpont]))
GROUP BY IIf([IntézkedésFajta] Is Null,"nem volt intézkedés",[IntézkedésFajta]);

#/#/#/
lkHibásKöltséghelyûStátuszok
#/#/
SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Státusz kódja], lkSzemélyek.[Dolgozó költséghelyének neve], lkSzemélyek.[Státusz költséghelyének neve ], tSzervezet_1.[Státuszának költséghely megnevezése], tSzervezet.[Költséghely megnevezés]
FROM (lkSzemélyek LEFT JOIN tSzervezet ON lkSzemélyek.[Státusz kódja] = tSzervezet.[Szervezetmenedzsment kód]) LEFT JOIN tSzervezet AS tSzervezet_1 ON lkSzemélyek.[Adóazonosító jel] = tSzervezet_1.[Szervezetmenedzsment kód]
WHERE (((lkSzemélyek.[Dolgozó költséghelyének neve])<>[tszervezet_1].[Státuszának költséghely megnevezése]) AND (([Dolgozó költséghelyének neve] Or [tszervezet].[Költséghely megnevezés] Or [tszervezet_1].[Státuszának költséghely megnevezése])=-1)) OR (((lkSzemélyek.[Dolgozó költséghelyének neve])<>[tszervezet].[Költséghely megnevezés]) AND (([Dolgozó költséghelyének neve] Or [tszervezet].[Költséghely megnevezés] Or [tszervezet_1].[Státuszának költséghely megnevezése])=-1)) OR (((tSzervezet_1.[Státuszának költséghely megnevezése])<>[tszervezet].[Költséghely megnevezés]) AND (([Dolgozó költséghelyének neve] Or [tszervezet].[Költséghely megnevezés] Or [tszervezet_1].[Státuszának költséghely megnevezése])=-1)) OR (((tSzervezet_1.[Státuszának költséghely megnevezése])<>[lkszemélyek].[Dolgozó költséghelyének neve]) AND (([Dolgozó költséghelyének neve] Or [tszervezet].[Költséghely megnevezés] Or [tszervezet_1].[Státuszának költséghely megnevezése])=-1)) OR (((tSzervezet.[Költséghely megnevezés])<>[lkszemélyek].[Dolgozó költséghelyének neve]) AND (([Dolgozó költséghelyének neve] Or [tszervezet].[Költséghely megnevezés] Or [tszervezet_1].[Státuszának költséghely megnevezése])=-1)) OR (((tSzervezet.[Költséghely megnevezés])<>[tszervezet_1].[Státuszának költséghely megnevezése]) AND (([Dolgozó költséghelyének neve] Or [tszervezet].[Költséghely megnevezés] Or [tszervezet_1].[Státuszának költséghely megnevezése])=-1));

#/#/#/
lkHibaVisszajelzéstKüldõkÉsVisszajelzéseikÖsszSzáma
#/#/
SELECT DISTINCT [Dolgozó teljes neve] & " (" & [SenderEmailAddress] & ")" AS Feladó, Count(tBejövõVisszajelzések.azVisszajelzés) AS [Visszajelzések száma]
FROM (lkSzemélyek INNER JOIN tBejövõÜzenetek ON lkSzemélyek.[Hivatali email] = tBejövõÜzenetek.SenderEmailAddress) INNER JOIN (tBejövõVisszajelzések INNER JOIN tVisszajelzésTípusok ON tBejövõVisszajelzések.VisszajelzésKód = tVisszajelzésTípusok.VisszajelzésKód) ON tBejövõÜzenetek.azÜzenet = tBejövõVisszajelzések.azÜzenet
WHERE (((tVisszajelzésTípusok.VisszajelzésTípusCsoport)=1) AND ((tBejövõÜzenetek.DeliveredDate) Between Date() And Date()-30))
GROUP BY [Dolgozó teljes neve] & " (" & [SenderEmailAddress] & ")"
ORDER BY Count(tBejövõVisszajelzések.azVisszajelzés) DESC;

#/#/#/
lkHibaVisszajelzéstKüldõkÉsVisszajelzéseikSzáma
#/#/
SELECT DISTINCT lkAzElmúltTízNap.Dátum, [Dolgozó teljes neve] & " (" & [SenderEmailAddress] & ")" AS Feladó, Count(tBejövõVisszajelzések.azVisszajelzés) AS [Visszajelzések száma]
FROM lkAzElmúltTízNap, (lkSzemélyek INNER JOIN tBejövõÜzenetek ON lkSzemélyek.[Hivatali email] = tBejövõÜzenetek.SenderEmailAddress) INNER JOIN (tBejövõVisszajelzések INNER JOIN tVisszajelzésTípusok ON tBejövõVisszajelzések.VisszajelzésKód = tVisszajelzésTípusok.VisszajelzésKód) ON tBejövõÜzenetek.azÜzenet = tBejövõVisszajelzések.azÜzenet
WHERE (((tBejövõÜzenetek.DeliveredDate)>=[Dátum] And (tBejövõÜzenetek.DeliveredDate)<[Dátum]+1) AND ((tVisszajelzésTípusok.VisszajelzésTípusCsoport)=1))
GROUP BY lkAzElmúltTízNap.Dátum, [Dolgozó teljes neve] & " (" & [SenderEmailAddress] & ")"
ORDER BY lkAzElmúltTízNap.Dátum DESC , Count(tBejövõVisszajelzések.azVisszajelzés) DESC;

#/#/#/
lkHozzátartozók
#/#/
SELECT tHozzátartozók.*, Nz([Dolgozó adóazonosító jele],0)*1 AS Adójel
FROM tHozzátartozók;

#/#/#/
lkHRvezetõk
#/#/
SELECT 
FROM lkSzemélyek;

#/#/#/
lkIlletmények
#/#/
SELECT lkSzemélyek.Törzsszám, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, Álláshelyek.[Álláshely besorolási kategóriája], lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Illetmény összesen kerekítés nélkül (eltérített)] AS Illetmény, lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS Óraszám, [Illetmény összesen kerekítés nélkül (eltérített)]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40 AS [40 órás illetmény], IIf(ffsplit([Feladatkör],"-",2)="",[Feladatkör],ffsplit([Feladatkör],"-",2)) AS Feladat, IIf(Nz([Tartós távollét típusa],"")="","","Igen") AS TT
FROM Álláshelyek INNER JOIN lkSzemélyek ON Álláshelyek.[Álláshely azonosító] = lkSzemélyek.[Státusz kódja]
WHERE (((IIf(Nz([Tartós távollét típusa],"")="","","Igen"))="" Or (IIf(Nz([Tartós távollét típusa],"")="","","Igen"))=IIf(Nz([A tartós távollévõket is belevegyük (Igen/Nem)],"Nem")="Igen","Igen","")) AND ((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lkIlletményekABottom30IlletménybenRészesülõk
#/#/
SELECT DISTINCT lkIlletmények.Törzsszám, lkIlletmények.Fõosztály, lkIlletmények.Osztály, lkIlletmények.Név, lkIlletmények.[40 órás illetmény], lkIlletmények.TT
FROM lkIlletmények LEFT JOIN lkIlletményekBottom30 ON lkIlletmények.[40 órás illetmény] = lkIlletményekBottom30.[40 órás illetmény]
WHERE (((lkIlletményekBottom30.[40 órás illetmény]) Is Not Null));

#/#/#/
lkIlletményekBottom30
#/#/
SELECT TOP 31 lkIlletmények.[40 órás illetmény]
FROM lkIlletmények
GROUP BY lkIlletmények.[40 órás illetmény]
ORDER BY lkIlletmények.[40 órás illetmény];

#/#/#/
lkIlletményekHavi
#/#/
SELECT Illetmény, Adójel, SzervezetKód
FROM (SELECT 'Járási_állomány' as Tábla, [Járási_állomány].[Mezõ18] as [Illetmény], (Nz([Adóazonosító],0)*1) As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]  as SzervezetKód
        FROM [Járási_állomány] 
        WHERE ([Járási_állomány].[Mezõ4]<> 'üres állás' OR [Járási_állomány].[Mezõ4] is null )  
    UNION 
    SELECT 'Kormányhivatali_állomány' as Tábla, [Kormányhivatali_állomány].[Mezõ18] as [Illetmény], (Nz([Adóazonosító],0)*1) As Adójel, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] As SzervezetKód 
        FROM [Kormányhivatali_állomány] 
        WHERE ([Kormányhivatali_állomány].[Mezõ4]<> 'üres állás'  OR [Kormányhivatali_állomány].[Mezõ4] is null)  
    UNION 
    SELECT 'Központosítottak' as Tábla, [Központosítottak].[Mezõ17] as [Illetmény], (Nz([Adóazonosító],0)*1) As Adójel, [Nexon szótárelemnek megfelelõ szervezeti egység azonosító] As SzervezetKód 
        FROM [Központosítottak] 
        WHERE ([Központosítottak].[Mezõ4]<> 'üres állás' OR [Központosítottak].[Mezõ4] is null  )  
)  AS IlletményUnió;

#/#/#/
lkIlletményekÖsszevetésPénzüggyel01
#/#/
SELECT DISTINCT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkIlletményekPÜ.Név, lkIlletményekPÜ.[Adóazonosító jel], lkIlletményekPÜ.[Átsorolás összesen] AS PGF, lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)] AS NEXON, lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS [Heti óra], [Nexon]/[Heti óra]*40 AS [Nexon 40 óra], kt_azNexon_Adójel.Nlink AS Link, lkSzemélyek.[Státusz típusa], lkIlletményekPÜ.[Jogviszony, juttatás típusa]
FROM (lkIlletményekPÜ LEFT JOIN lkSzemélyek ON lkIlletményekPÜ.[Adóazonosító jel] = lkSzemélyek.Adójel) LEFT JOIN kt_azNexon_Adójel ON lkSzemélyek.Adójel = kt_azNexon_Adójel.Adójel
WHERE (((lkSzemélyek.[Státusz típusa]) Is Not Null) AND ((lkIlletményekPÜ.[Jogviszony, juttatás típusa])=20 Or (lkIlletményekPÜ.[Jogviszony, juttatás típusa])=6 Or (lkIlletményekPÜ.[Jogviszony, juttatás típusa])=18));

#/#/#/
lkIlletményekÖsszevetésPénzüggyel02
#/#/
SELECT DISTINCT lkIlletményekÖsszevetésPénzüggyel01.Fõosztály, lkIlletményekÖsszevetésPénzüggyel01.Osztály, lkIlletményekÖsszevetésPénzüggyel01.Név, lkIlletményekÖsszevetésPénzüggyel01.PGF, lkIlletményekÖsszevetésPénzüggyel01.NEXON, lkIlletményekÖsszevetésPénzüggyel01.[Heti óra], lkIlletményekÖsszevetésPénzüggyel01.[Nexon 40 óra], lkIlletményekÖsszevetésPénzüggyel01.Link AS NLink
FROM lkIlletményekÖsszevetésPénzüggyel01
WHERE (((lkIlletményekÖsszevetésPénzüggyel01.NEXON)<>[PGF]));

#/#/#/
lkIlletményekPÜ
#/#/
SELECT tIlletmények.*, dtÁtal([Jv kezdete]) AS JogvKezdete, dtÁtal([Jv vége]) AS JogvVége
FROM tIlletmények
WHERE (((dtÁtal([Jv kezdete]))<=#11/30/2023# Or (dtÁtal([Jv kezdete])) Is Null) AND ((dtÁtal([Jv vége]))>="#2023. 11. 30.#" Or (dtÁtal([Jv vége])) Is Null));

#/#/#/
lkIlletményekVégzettségFokaSzerint
#/#/
SELECT lkSzemélyek.Fõosztály, lkLegmagasabbVégzettség05.FirstOfazFok, Avg([KT: Kerekített 100 %-os illetmény (eltérített) + Helyettesítési ]/[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40) AS Illetmény, tVégzFok.Végzettségek
FROM tVégzFok INNER JOIN ((lkSzemélyek INNER JOIN lkLegmagasabbVégzettség05 ON lkSzemélyek.[Adóazonosító jel] = lkLegmagasabbVégzettség05.[Dolgozó azonosító]) LEFT JOIN lkMindenVezetõ ON lkSzemélyek.[Adóazonosító jel] = lkMindenVezetõ.[Adóazonosító jel]) ON tVégzFok.azFok = lkLegmagasabbVégzettség05.FirstOfazFok
WHERE (((lkSzemélyek.Fõosztály) Like "Humán*") AND ((lkMindenVezetõ.[Adóazonosító jel]) Is Null) AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND (("###### Ez a lekérdezés kommentje ######")<>False))
GROUP BY lkSzemélyek.Fõosztály, lkLegmagasabbVégzettség05.FirstOfazFok, tVégzFok.Végzettségek;

#/#/#/
lkIlletményhezÁtlag_vezetõknélkül
#/#/
SELECT DISTINCT lkSzemélyek.*
FROM lkSzemélyek LEFT JOIN tBesorolás_átalakító ON lkSzemélyek.[Besorolási  fokozat (KT)] = tBesorolás_átalakító.Besorolási_fokozat
WHERE (((tBesorolás_átalakító.Vezetõ)=No) AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null));

#/#/#/
lkIlletményLista
#/#/
SELECT [lkSzemélyek].[Kerekített 100 %-os illetmény (eltérített)]/[lkSzemélyek].[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40 AS Illetmény
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="álláshely") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null Or (lkSzemélyek.[Tartós távollét típusa])="") AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus])<>"Hivatásos állományú")) OR (((lkSzemélyek.[Jogviszony típusa / jogviszony típus])="Hivatásos állományú") AND ((lkSzemélyek.[Besorolási  fokozat (KT)])="Fõosztályvezetõ"))
ORDER BY [lkSzemélyek].[Kerekített 100 %-os illetmény (eltérített)]/[lkSzemélyek].[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker]*40;

#/#/#/
lkIlletményNöveléshezAdatok01
#/#/
SELECT kt_azNexon_Adójel.azNexon AS Az, lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, IIf(Nz([besorolási  fokozat (KT)],"")="",[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés],Nz([besorolási  fokozat (KT)],"")) AS Besorolás, lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)] AS [Jelenlegi illetmény], lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS [Heti munkaidõ], lkSzemélyek.[Jogviszony vége (kilépés dátuma)] AS Kilépés, 1 AS Fõ
FROM (lkSzemélyek LEFT JOIN kt_azNexon_Adójel ON lkSzemélyek.Adójel=kt_azNexon_Adójel.Adójel) LEFT JOIN lkSzervezetÁlláshelyek ON lkSzemélyek.[Státusz kódja]=lkSzervezetÁlláshelyek.Álláshely
WHERE (((lkSzemélyek.[Jogviszony vége (kilépés dátuma)])>#6/13/2023# Or (lkSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lkIlletményNöveléshezAdatok02
#/#/
SELECT lkFõosztályok.[Szervezeti egység kódja], lkIlletményNöveléshezAdatok01.Fõosztály, Sum(lkIlletményNöveléshezAdatok01.fõ) AS [Fõosztályi létszám]
FROM lkFõosztályok INNER JOIN lkIlletményNöveléshezAdatok01 ON lkFõosztályok.Fõosztály=lkIlletményNöveléshezAdatok01.Fõosztály
GROUP BY lkFõosztályok.[Szervezeti egység kódja], lkIlletményNöveléshezAdatok01.Fõosztály;

#/#/#/
lkIlletményNöveléshezAdatok03
#/#/
SELECT lkIlletményNöveléshezAdatok01.Az, lkIlletményNöveléshezAdatok01.[Szervezeti egység kódja], lkIlletményNöveléshezAdatok01.Fõosztály, lkIlletményNöveléshezAdatok01.Osztály, lkIlletményNöveléshezAdatok01.Név, lkIlletményNöveléshezAdatok01.Besorolás, lkIlletményNöveléshezAdatok01.[Jelenlegi illetmény], lkIlletményNöveléshezAdatok01.[Heti munkaidõ], lkIlletményNöveléshezAdatok01.Kilépés, lkIlletményNöveléshezAdatok02.[Fõosztályi létszám]
FROM lkIlletményNöveléshezAdatok02 RIGHT JOIN lkIlletményNöveléshezAdatok01 ON lkIlletményNöveléshezAdatok02.Fõosztály=lkIlletményNöveléshezAdatok01.Fõosztály
ORDER BY lkIlletményNöveléshezAdatok01.Fõosztály;

#/#/#/
lkIlletményNöveléshezAdatokPénzügynek01
#/#/
SELECT kt_azNexon_Adójel.azNexon AS Az, lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Státusz kódja], IIf(Nz([besorolási  fokozat (KT)],"")="",[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés],Nz([besorolási  fokozat (KT)],"")) AS Besorolás, lkSzemélyek.[Státusz típusa], lkSzemélyek.[Foglalkozási viszony statisztikai besorolása], lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS [Heti munkaidõ], lkSzemélyek.[Szerzõdés/Kinevezés típusa], lkSzemélyek.[KIRA jogviszony jelleg], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], lkSzemélyek.[Jogviszony vége (kilépés dátuma)] AS Kilépés, lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)] AS [Jelenlegi illetmény], lkSzemélyek.[Tartós távollét típusa], lkSzemélyek.[Tartós távollét kezdete], lkSzemélyek.[Tartós távollét vége], lkSzemélyek.[Helyettesített dolgozó neve], 1 AS Fõ, IIf([KIRA jogviszony jelleg]="Munkaviszony",True,False) AS Mt, IIf([KIRA jogviszony jelleg]="Munkaviszony",False,True) AS Kit, False AS Üres
FROM (lkSzemélyek LEFT JOIN kt_azNexon_Adójel ON lkSzemélyek.Adójel=kt_azNexon_Adójel.Adójel) LEFT JOIN lkSzervezetÁlláshelyek ON lkSzemélyek.[Státusz kódja]=lkSzervezetÁlláshelyek.Álláshely
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lkIlletményNöveléshezAdatokPénzügynek02
#/#/
SELECT DISTINCT lkIlletményNöveléshezAdatokPénzügynek01.Adójel, lkIlletményNöveléshezAdatokPénzügynek01.Név, lkIlletményNöveléshezAdatokPénzügynek01.Fõosztály, lkIlletményNöveléshezAdatokPénzügynek01.Osztály, lkIlletményNöveléshezAdatokPénzügynek01.[Státusz kódja], lkIlletményNöveléshezAdatokPénzügynek01.Besorolás, lkIlletményNöveléshezAdatokPénzügynek01.[Státusz típusa], lkIlletményNöveléshezAdatokPénzügynek01.[Foglalkozási viszony statisztikai besorolása], lkIlletményNöveléshezAdatokPénzügynek01.[Heti munkaidõ], lkIlletményNöveléshezAdatokPénzügynek01.[Szerzõdés/Kinevezés típusa], lkIlletményNöveléshezAdatokPénzügynek01.[KIRA jogviszony jelleg], lkIlletményNöveléshezAdatokPénzügynek01.[Jogviszony kezdete (belépés dátuma)], lkIlletményNöveléshezAdatokPénzügynek01.Kilépés, lkIlletményNöveléshezAdatokPénzügynek01.[Tartós távollét típusa], lkIlletményNöveléshezAdatokPénzügynek01.[Tartós távollét kezdete], lkIlletményNöveléshezAdatokPénzügynek01.[Tartós távollét vége], lkIlletményNöveléshezAdatokPénzügynek01.[Helyettesített dolgozó neve], lkIlletményNöveléshezAdatokPénzügynek01.[Jelenlegi illetmény], "" AS [Javasolt emelés], "" AS [Új illetmény], tBesorolás_átalakító.[alsó határ], tBesorolás_átalakító.[felsõ határ], "" AS [alsó ellenõrzés], "" AS [felsõ ellenõrzés], "" AS kontroll, "" AS Megjegyzés
FROM tBesorolás_átalakító INNER JOIN lkIlletményNöveléshezAdatokPénzügynek01 ON (tBesorolás_átalakító.Besorolás = lkIlletményNöveléshezAdatokPénzügynek01.Besorolás) AND (tBesorolás_átalakító.Üres = lkIlletményNöveléshezAdatokPénzügynek01.Üres) AND (tBesorolás_átalakító.Kit = lkIlletményNöveléshezAdatokPénzügynek01.Kit) AND (tBesorolás_átalakító.Mt = lkIlletményNöveléshezAdatokPénzügynek01.Mt)
WHERE (((lkIlletményNöveléshezAdatokPénzügynek01.[Státusz típusa])="Szervezeti alaplétszám") AND ((lkIlletményNöveléshezAdatokPénzügynek01.Kilépés) Is Null Or (lkIlletményNöveléshezAdatokPénzügynek01.Kilépés)>#6/13/2023#))
ORDER BY lkIlletményNöveléshezAdatokPénzügynek01.Adójel;

#/#/#/
lkIlletményTörténet
#/#/
SELECT lkKormányhivataliJárásiKözpTörténet.Adójel, lkKormányhivataliJárásiKözpTörténet.[Heti munkaórák száma], lkKormányhivataliJárásiKözpTörténet.[Havi illetmény], lkKormányhivataliJárásiKözpTörténet.hatálya, lkKormányhivataliJárásiKözpTörténet.[Besorolási fokozat kód:], lkKormányhivataliJárásiKözpTörténet.[Besorolási fokozat megnevezése:]
FROM lkKormányhivataliJárásiKözpTörténet;

#/#/#/
lkIndítópulthozOldalakFejezetek
#/#/
SELECT tLekérdezésOsztályok.azOsztály, tLekérdezésOsztályok.Osztály, tLekérdezésOsztályok.TartalomIsmertetõ, tLekérdezésTípusok.LapNév, tLekérdezésTípusok.Megjegyzés
FROM tLekérdezésOsztályok INNER JOIN tLekérdezésTípusok ON tLekérdezésOsztályok.azOsztály = tLekérdezésTípusok.Osztály;

#/#/#/
lkIntézkedések
#/#/
SELECT tIntézkedések.azIntézkedések, tIntézkedések.azIntFajta, tIntézkedések.IntézkedésDátuma, tIntézkedések.Hivatkozás, tIntézkedésFajták.IntézkedésFajta
FROM tIntézkedésFajták INNER JOIN tIntézkedések ON tIntézkedésFajták.azIntFajta = tIntézkedések.azIntFajta;

#/#/#/
lkJárási_állomány
#/#/
SELECT Járási_állomány.Sorszám, Járási_állomány.Név, Járási_állomány.Adóazonosító, Járási_állomány.Mezõ4 AS [Születési év \ üres állás], Járási_állomány.Mezõ5 AS Neme, Járási_állomány.[Járási Hivatal], Járási_állomány.Mezõ7 AS Osztály, Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Járási_állomány.Mezõ9 AS [Ellátott feladat], Járási_állomány.Mezõ10 AS Kinevezés, Járási_állomány.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], Járási_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], Járási_állomány.[Heti munkaórák száma], Járási_állomány.Mezõ14 AS [Betöltés aránya], Járási_állomány.[Besorolási fokozat kód:], Járási_állomány.[Besorolási fokozat megnevezése:], Járási_állomány.[Álláshely azonosító], Járási_állomány.Mezõ18 AS [Havi illetmény], Járási_állomány.Mezõ19 AS [Eu finanszírozott], Járási_állomány.Mezõ20 AS [Illetmény forrása], Járási_állomány.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], Járási_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Járási_állomány.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], Járási_állomány.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], Járási_állomány.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], Járási_állomány.Mezõ26 AS [Képesítést adó végzettség], Járási_állomány.Mezõ27 AS KAB, Járási_állomány.[KAB 001-3** Branch ID]
FROM Járási_állomány;

#/#/#/
lkJárásiKormányKözpontosítottUnió
#/#/
SELECT LétszámUnió.Sorszám, LétszámUnió.Név, LétszámUnió.Adóazonosító, LétszámUnió.[Születési év \ üres állás], LétszámUnió.Neme, LétszámUnió.[Járási Hivatal], LétszámUnió.Osztály, LétszámUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], LétszámUnió.[Ellátott feladat], LétszámUnió.Kinevezés, LétszámUnió.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], LétszámUnió.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], LétszámUnió.[Heti munkaórák száma], LétszámUnió.[Betöltés aránya], LétszámUnió.[Besorolási fokozat kód:], LétszámUnió.[Besorolási fokozat megnevezése:], LétszámUnió.[Álláshely azonosító], LétszámUnió.[Havi illetmény], LétszámUnió.[Eu finanszírozott], LétszámUnió.[Illetmény forrása], LétszámUnió.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], LétszámUnió.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], LétszámUnió.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], LétszámUnió.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], LétszámUnió.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], LétszámUnió.[Képesítést adó végzettség], LétszámUnió.KAB, LétszámUnió.[KAB 001-3** Branch ID], IIf([Adóazonosító] Is Null Or [Adóazonosító]="",0,[Adóazonosító]*1) AS Adójel, LétszámUnió.Jelleg, TextToMD5Hex([Álláshely azonosító]) AS Hash, Replace([Járási Hivatal],"budapest fõváros kormányhivatala","BFKH") AS Fõosztály
FROM (SELECT *, "A" as Jelleg
FROM lkJárási_állomány
UNION SELECT *, "A" as Jelleg
FROM lkKormányhivatali_állomány
UNION SELECT *, "K" as Jelleg
FROM lkKözpontosítottak
)  AS LétszámUnió;

#/#/#/
lkJárásiKormányUnió
#/#/
SELECT AlaplétszámUnió.Sorszám, AlaplétszámUnió.Név, AlaplétszámUnió.Adóazonosító, AlaplétszámUnió.[Születési év \ üres állás], AlaplétszámUnió.Neme, AlaplétszámUnió.[Járási Hivatal], AlaplétszámUnió.Osztály, AlaplétszámUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], AlaplétszámUnió.[Ellátott feladat], AlaplétszámUnió.Kinevezés, AlaplétszámUnió.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], AlaplétszámUnió.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], AlaplétszámUnió.[Heti munkaórák száma], AlaplétszámUnió.[Betöltés aránya], AlaplétszámUnió.[Besorolási fokozat kód:], AlaplétszámUnió.[Besorolási fokozat megnevezése:], AlaplétszámUnió.[Álláshely azonosító], AlaplétszámUnió.[Havi illetmény], AlaplétszámUnió.[Eu finanszírozott], AlaplétszámUnió.[Illetmény forrása], AlaplétszámUnió.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], AlaplétszámUnió.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], AlaplétszámUnió.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], AlaplétszámUnió.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], AlaplétszámUnió.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], AlaplétszámUnió.[Képesítést adó végzettség], AlaplétszámUnió.KAB, AlaplétszámUnió.[KAB 001-3** Branch ID], *
FROM (SELECT *
FROM lkJárási_állomány
UNION SELECT *
FROM lkKormányhivatali_állomány
)  AS AlaplétszámUnió;

#/#/#/
lkJárásiKormányUnióDuplikátumok
#/#/
SELECT lkJárásiKormányUnió.Adóazonosító, Count(lkJárásiKormányUnió.Adóazonosító) AS CountOfAdóazonosító
FROM lkJárásiKormányUnió
WHERE (((lkJárásiKormányUnió.Adóazonosító)<>""))
GROUP BY lkJárásiKormányUnió.Adóazonosító
HAVING Count(lkJárásiKormányUnió.Adóazonosító)>1;

#/#/#/
lkJárásiVezetõHelyettesekIlletménye
#/#/
SELECT lkJárásiVezetõk.Kód, lkJárásiVezetõk.[Dolgozó teljes neve], lkJárásiVezetõk.Hivatal, lkJárásiVezetõk.[Besorolási  fokozat (KT)], lkJárásiVezetõk.[Kerekített 100 %-os illetmény (eltérített)] AS Illetmény
FROM lkJárásiVezetõk
WHERE (((lkJárásiVezetõk.[Besorolási  fokozat (KT)])="Járási / kerületi hivatal vezetõjének helyettese"));

#/#/#/
lkJárásiVezetõk
#/#/
SELECT bfkh(Nz([Szervezeti egység kódja],"")) AS Kód, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Adóazonosító jel], lkSzemélyek.Fõosztály AS Hivatal, lkSzemélyek.[Születési hely], lkSzemélyek.[Születési idõ], lkSzemélyek.[Állandó lakcím], lkSzemélyek.[Tartózkodási lakcím], lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.[Vezetõi beosztás megnevezése], lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)]
FROM lkSzemélyek
WHERE (((lkSzemélyek.Fõosztály) Like "BFKH*") AND ((lkSzemélyek.[Besorolási  fokozat (KT)]) Like "Járási*"))
ORDER BY bfkh(Nz([Szervezeti egység kódja],""));

#/#/#/
lkJav_táblák
#/#/
SELECT tJav_táblák.kód, tJav_táblák.Tábla, tJav_táblák.Ellenõrzéshez
FROM tJav_táblák;

#/#/#/
lkJogviszonyok
#/#/
SELECT tIlletmények.*, [Adóazonosító jel]*1 AS Adójel
FROM tIlletmények;

#/#/#/
lkJogviszonyokÉsSzemélyekSzáma
#/#/
SELECT Egy.CountOfAzonosító AS [Jogviszonyok száma], Count(Egy.Adójel) AS [Érintett személyek száma]
FROM (SELECT DISTINCT tSzemélyek.Adójel, Count(tSzemélyek.Azonosító) AS CountOfAzonosító FROM tSzemélyek GROUP BY tSzemélyek.Adójel)  AS Egy
GROUP BY Egy.CountOfAzonosító;

#/#/#/
lkKABKormányablakVégzettségûek
#/#/
SELECT lkVégzettségek.Adójel, lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkVégzettségek.[Végzettség neve], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés, "" AS [Vizsga letétel terv határideje], "" AS [Vizsga letétel tény határideje], "" AS [Kötelezés dátuma]
FROM lkSzemélyek INNER JOIN lkVégzettségek ON lkSzemélyek.Adójel = lkVégzettségek.Adójel
WHERE (((lkVégzettségek.[Végzettség neve])="kormányablak ügyintézõi vizsga (NKE)") AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkVégzettségek.[Végzettség neve])="kormányablak ügyintézõ"))
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkKABKormányablakVizsgávalRendelkezõk
#/#/
SELECT lkKözigazgatásiVizsga.Adójel, lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkKözigazgatásiVizsga.[Vizsga típusa], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés, lkKözigazgatásiVizsga.[Vizsga letétel terv határideje], lkKözigazgatásiVizsga.[Vizsga letétel tény határideje], lkKözigazgatásiVizsga.[Kötelezés dátuma]
FROM lkKözigazgatásiVizsga INNER JOIN lkSzemélyek ON lkKözigazgatásiVizsga.Adójel = lkSzemélyek.Adójel
WHERE (((lkKözigazgatásiVizsga.[Vizsga típusa])="KAB Kormányablak ügyintézõi vizsg.") AND 


((([lkKözigazgatásiVizsga].[Vizsga eredménye] Is Null Or [lkKözigazgatásiVizsga].[Vizsga eredménye]="") 
And ([lkKözigazgatásiVizsga].[Oklevél száma] Is Null Or [lkKözigazgatásiVizsga].[Oklevél száma]="") 
And ([lkKözigazgatásiVizsga].[Oklevél dátuma] Is Null Or [lkKözigazgatásiVizsga].[Oklevél dátuma]=0))=False) 



AND (("####### Az Eredmény, az Oklevél száma vagy az oklevél dátuma közül legalább az egyik ki van töltve. ############")=True))
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkKABÜgyintézõk
#/#/
SELECT [lkJárásiKormányKözpontosítottUnió].[Adóazonosító]*1 AS Adójel, bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS BFKH, Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS Hivatal, lkJárásiKormányKözpontosítottUnió.Osztály, lkJárásiKormányKözpontosítottUnió.Név, lkJárásiKormányKözpontosítottUnió.[Ellátott feladat], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés, lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége] AS [Próbaidõ vége], IIf([Tartós távollét típusa] Is Not Null,"Igen","Nem") AS Távollévõ
FROM lkSzemélyek RIGHT JOIN lkJárásiKormányKözpontosítottUnió ON lkSzemélyek.[Adóazonosító jel] = lkJárásiKormányKözpontosítottUnió.Adóazonosító
WHERE (((lkJárásiKormányKözpontosítottUnió.Osztály) Like "*Személy*" Or (lkJárásiKormányKözpontosítottUnió.Osztály) Like "Kormányabla*" Or (lkJárásiKormányKözpontosítottUnió.Osztály) Like "*Okmány*") AND ((lkJárásiKormányKözpontosítottUnió.[Ellátott feladat])="Ügyfélszolgálati és kormányablak feladatok") AND ((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás])<>"üres állás")) OR (((lkJárásiKormányKözpontosítottUnió.Osztály) Like "*Személy*" Or (lkJárásiKormányKözpontosítottUnió.Osztály) Like "Kormányabla*" Or (lkJárásiKormányKözpontosítottUnió.Osztály) Like "*Okmány*") AND ((lkJárásiKormányKözpontosítottUnió.[Ellátott feladat])="Okmányirodai feladatok") AND ((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás])<>"üres állás")) OR (((lkJárásiKormányKözpontosítottUnió.Osztály) Like "*Személy*" Or (lkJárásiKormányKözpontosítottUnió.Osztály) Like "Kormányabla*" Or (lkJárásiKormányKözpontosítottUnió.Osztály) Like "*Okmány*") AND ((lkJárásiKormányKözpontosítottUnió.[Ellátott feladat])="Ügyfélszolgálati feladatok") AND ((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás])<>"üres állás"))
ORDER BY bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]);

#/#/#/
lkKABÜgyintézõkIlletménye_eseti
#/#/
SELECT tBFKH([Járási Hivatal]) AS Hivatal, lkJárásiKormányKözpontosítottUnió.Osztály, [Név] & IIf([Besorolási fokozat kód:]="Ov."," (ov.)","") AS Neve, lkJárásiKormányKözpontosítottUnió.[Havi illetmény], lkJárásiKormányKözpontosítottUnió.[Heti munkaórák száma], tBesorolás_átalakító.[alsó határ], tBesorolás_átalakító.[felsõ határ]
FROM (lkSzemélyek RIGHT JOIN lkJárásiKormányKözpontosítottUnió ON lkSzemélyek.[Adóazonosító jel] = lkJárásiKormányKözpontosítottUnió.Adóazonosító) INNER JOIN tBesorolás_átalakító ON lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat kód:] = tBesorolás_átalakító.[Az álláshely jelölése]
WHERE (((lkJárásiKormányKözpontosítottUnió.Osztály) Like "Kormányabla*") AND ((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás])<>"üres állás")) OR (((lkJárásiKormányKözpontosítottUnió.Osztály) Like "Kormányabla*") AND ((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás])<>"üres állás")) OR (((lkJárásiKormányKözpontosítottUnió.Osztály) Like "Kormányabla*") AND ((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás])<>"üres állás"))
ORDER BY bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]), IIf([Besorolási fokozat kód:]="Ov.",0,1), [Név] & IIf([Besorolási fokozat kód:]="Ov."," (ov.)","");

#/#/#/
lkKABügyintézõkKormányirodaiLekérdezése
#/#/
SELECT "Budapest Fõváros Kormányhivatala" AS Kormányhivatal, Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS Hivatal, lkJárásiKormányKözpontosítottUnió.Osztály, lkSzervezetiEgységekLegnagyobbLétszámúTelephelyei.Cím, lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító], lkJárásiKormányKözpontosítottUnió.Neme, lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat megnevezése:], IIf([Szerzõdés/Kinevezés - próbaidõ vége]>=Date(),"x","") AS [Próbaidejét tölti], "" AS Kormányablakban, lkJárásiKormányKözpontosítottUnió.Kinevezés
FROM lkSzervezetiEgységekLegnagyobbLétszámúTelephelyei RIGHT JOIN (lkSzemélyek RIGHT JOIN lkJárásiKormányKözpontosítottUnió ON lkSzemélyek.[Adóazonosító jel] = lkJárásiKormányKözpontosítottUnió.Adóazonosító) ON lkSzervezetiEgységekLegnagyobbLétszámúTelephelyei.BFKH = lkSzemélyek.BFKH
WHERE (((lkJárásiKormányKözpontosítottUnió.Osztály) Like "*Személy*" Or (lkJárásiKormányKözpontosítottUnió.Osztály) Like "Kormányabla*" Or (lkJárásiKormányKözpontosítottUnió.Osztály) Like "*Okmány*") AND ((lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat megnevezése:]) Not Like "M*") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkJárásiKormányKözpontosítottUnió.[Ellátott feladat])="Ügyfélszolgálati és kormányablak feladatok") AND ((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás])<>"üres állás")) OR (((lkJárásiKormányKözpontosítottUnió.Osztály) Like "*Személy*" Or (lkJárásiKormányKözpontosítottUnió.Osztály) Like "Kormányabla*" Or (lkJárásiKormányKözpontosítottUnió.Osztály) Like "*Okmány*") AND ((lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat megnevezése:]) Not Like "M*") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkJárásiKormányKözpontosítottUnió.[Ellátott feladat])="Okmányirodai feladatok") AND ((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás])<>"üres állás")) OR (((lkJárásiKormányKözpontosítottUnió.Osztály) Like "*Személy*" Or (lkJárásiKormányKözpontosítottUnió.Osztály) Like "Kormányabla*" Or (lkJárásiKormányKözpontosítottUnió.Osztály) Like "*Okmány*") AND ((lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat megnevezése:]) Not Like "M*") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkJárásiKormányKözpontosítottUnió.[Ellátott feladat])="Ügyfélszolgálati feladatok") AND ((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás])<>"üres állás"))
ORDER BY bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]);

#/#/#/
lkKABVizsgaÉsVégzettség
#/#/
SELECT DISTINCT KABVizgaÉsKABVégzettségUnió.Adójel, KABVizgaÉsKABVégzettségUnió.BFKH, KABVizgaÉsKABVégzettségUnió.Fõosztály, KABVizgaÉsKABVégzettségUnió.Osztály, KABVizgaÉsKABVégzettségUnió.Név, KABVizgaÉsKABVégzettségUnió.Belépés, KABVizgaÉsKABVégzettségUnió.[Vizsga letétel terv határideje], KABVizgaÉsKABVégzettségUnió.[Vizsga letétel tény határideje], KABVizgaÉsKABVégzettségUnió.[Kötelezés dátuma]
FROM (SELECT Adójel, lkKABKormányablakVégzettségûek.BFKH, lkKABKormányablakVégzettségûek.Fõosztály, lkKABKormányablakVégzettségûek.Osztály, lkKABKormányablakVégzettségûek.Név, lkKABKormányablakVégzettségûek.Belépés,   [Vizsga letétel terv határideje],  [Vizsga letétel tény határideje],  [Kötelezés dátuma]
FROM lkKABKormányablakVégzettségûek
UNION
SELECT Adójel, lkKABKormányablakVizsgávalRendelkezõk.BFKH, lkKABKormányablakVizsgávalRendelkezõk.Fõosztály, lkKABKormányablakVizsgávalRendelkezõk.Osztály, lkKABKormányablakVizsgávalRendelkezõk.Név, lkKABKormányablakVizsgávalRendelkezõk.Belépés,   [Vizsga letétel terv határideje],  [Vizsga letétel tény határideje],  [Kötelezés dátuma]
FROM  lkKABKormányablakVizsgávalRendelkezõk)  AS KABVizgaÉsKABVégzettségUnió;

#/#/#/
lkKABvizsgávalNemRendelkezõKABÜgyintézõk
#/#/
SELECT lkKABÜgyintézõk.BFKH, "Budapest Fõváros Kormányhivatala" AS Kormányhivatal, lkKABÜgyintézõk.Adójel, lkKABÜgyintézõk.Hivatal, lkKABÜgyintézõk.Osztály, lkKABÜgyintézõk.Név, lkKABÜgyintézõk.[Ellátott feladat], lkKABÜgyintézõk.Belépés, lkKABÜgyintézõk.[Próbaidõ vége], lkKABÜgyintézõk.Távollévõ, (SELECT DISTINCT TOP 1
 Tmp1.[Vizsga letétel terv határideje]
    FROM lkKözigazgatásiVizsga as Tmp1
    WHERE Tmp1.[Vizsga típusa]="KAB Kormányablak ügyintézõi vizsg."
        AND
               Tmp1.Adójel = lkKABÜgyintézõk.Adójel
    ORDER BY  Tmp1.[Vizsga letétel terv határideje] Desc
) AS VizsgaTervHatárideje, (SELECT DISTINCT TOP 1
  Tmp1.[Vizsga letétel tény határideje]
    FROM lkKözigazgatásiVizsga as Tmp1
    WHERE Tmp1.[Vizsga típusa]="KAB Kormányablak ügyintézõi vizsg."
        AND
               Tmp1.Adójel = lkKABÜgyintézõk.Adójel
    ORDER BY Tmp1.[Vizsga letétel tény határideje] DESC
) AS VizsgaTényHatárideje, (SELECT DISTINCT TOP 1
  Tmp1.[Kötelezés dátuma]
    FROM lkKözigazgatásiVizsga as Tmp1
    WHERE Tmp1.[Vizsga típusa]="KAB Kormányablak ügyintézõi vizsg."
        AND
               Tmp1.Adójel = lkKABÜgyintézõk.Adójel
    ORDER BY   Tmp1.[Kötelezés dátuma] DESC
) AS KötelezésDátuma
FROM lkKABÜgyintézõk LEFT JOIN lkKABVizsgaÉsVégzettség ON lkKABÜgyintézõk.Adójel = lkKABVizsgaÉsVégzettség.Adójel
WHERE (((lkKABVizsgaÉsVégzettség.Adójel) Is Null));

#/#/#/
lkKABvizsgávalNemRendelkezõKABÜgyintézõkSzáma
#/#/
SELECT 1 as sor, Count(lkKABvizsgávalNemRendelkezõKABÜgyintézõk.Adójel) AS Létszám, Sum(IIf([Távollévõ]="IGEN",1,0)) AS [Tartós távollévõ], Létszám -[Tartós távollévõ] as Összesen
FROM lkKABvizsgávalNemRendelkezõKABÜgyintézõk
UNION
SELECT 2 as sor, Count(lkKABvizsgávalNemRendelkezõKABÜgyintézõk.Adójel) AS Létszám, Sum(IIf([Távollévõ]="IGEN",1,0)) AS [Tartós távollévõ], Létszám -[Tartós távollévõ]
FROM lkKABvizsgávalNemRendelkezõKABÜgyintézõk
WHERE (((lkKABvizsgávalNemRendelkezõKABÜgyintézõk.[Próbaidõ vége])<=#7/1/2024#))
UNION SELECT 3 as sor, Count(lkKABvizsgávalNemRendelkezõKABÜgyintézõk.Adójel) AS Létszám, Sum(IIf([Távollévõ]="IGEN",1,0)) AS [Tartós távollévõ], Létszám -[Tartós távollévõ]
FROM lkKABvizsgávalNemRendelkezõKABÜgyintézõk
WHERE (((lkKABvizsgávalNemRendelkezõKABÜgyintézõk.Belépés)>=#1/1/2022#) AND ((lkKABvizsgávalNemRendelkezõKABÜgyintézõk.[Próbaidõ vége])<=#7/1/2024#));

#/#/#/
lkKabvizsgávalNemRendelkezõkListája
#/#/
SELECT lkKABvizsgávalNemRendelkezõKABÜgyintézõk.BFKH, kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN lkKABvizsgávalNemRendelkezõKABÜgyintézõk ON kt_azNexon_Adójel02.Adójel = lkKABvizsgávalNemRendelkezõKABÜgyintézõk.Adójel;

#/#/#/
lkKABvizsgávalRendelkezõKABÜgyintézõk
#/#/
SELECT lkKABÜgyintézõk.BFKH, "Budapest Fõváros Kormányhivatala" AS Kormányhivatal, lkKABÜgyintézõk.Hivatal, lkKABÜgyintézõk.Osztály, lkKABÜgyintézõk.Adójel, lkKABÜgyintézõk.Név, lkKABÜgyintézõk.[Ellátott feladat], lkKABÜgyintézõk.Belépés, lkKABÜgyintézõk.[Próbaidõ vége], lkKABÜgyintézõk.Távollévõ, (SELECT DISTINCT TOP 1
 Tmp1.[Vizsga letétel terv határideje]
    FROM lkKözigazgatásiVizsga as Tmp1
    WHERE Tmp1.[Vizsga típusa]="KAB Kormányablak ügyintézõi vizsg."
        AND
               Tmp1.Adójel = lkKABÜgyintézõk.Adójel
    ORDER BY  Tmp1.[Vizsga letétel terv határideje] Desc
) AS VizsgaTervHatárideje, (SELECT DISTINCT TOP 1
  Tmp1.[Vizsga letétel tény határideje]
    FROM lkKözigazgatásiVizsga as Tmp1
    WHERE Tmp1.[Vizsga típusa]="KAB Kormányablak ügyintézõi vizsg."
        AND
               Tmp1.Adójel = lkKABÜgyintézõk.Adójel
    ORDER BY Tmp1.[Vizsga letétel tény határideje] DESC
) AS VizsgaTényHatárideje, (SELECT DISTINCT TOP 1
  Tmp1.[Kötelezés dátuma]
    FROM lkKözigazgatásiVizsga as Tmp1
    WHERE Tmp1.[Vizsga típusa]="KAB Kormányablak ügyintézõi vizsg."
        AND
               Tmp1.Adójel = lkKABÜgyintézõk.Adójel
    ORDER BY   Tmp1.[Kötelezés dátuma] DESC
) AS KötelezésDátuma
FROM lkKABÜgyintézõk INNER JOIN lkKABVizsgaÉsVégzettség ON lkKABÜgyintézõk.Adójel = lkKABVizsgaÉsVégzettség.Adójel
WHERE (((lkKABVizsgaÉsVégzettség.Adójel) Is Null));

#/#/#/
lkKABvizsgávalRendelkezõKABÜgyintézõkSzámaOsztályonként
#/#/
SELECT lkKABvizsgávalRendelkezõKABÜgyintézõk.BFKH, lkKABvizsgávalRendelkezõKABÜgyintézõk.Kormányhivatal, lkKABvizsgávalRendelkezõKABÜgyintézõk.Hivatal, lkKABvizsgávalRendelkezõKABÜgyintézõk.Osztály, Count(lkKABvizsgávalRendelkezõKABÜgyintézõk.Adójel) AS [KAB vizsgával rendelkezõk]
FROM lkKABvizsgávalRendelkezõKABÜgyintézõk
WHERE (((lkKABvizsgávalRendelkezõKABÜgyintézõk.Távollévõ)="Nem"))
GROUP BY lkKABvizsgávalRendelkezõKABÜgyintézõk.BFKH, lkKABvizsgávalRendelkezõKABÜgyintézõk.Kormányhivatal, lkKABvizsgávalRendelkezõKABÜgyintézõk.Hivatal, lkKABvizsgávalRendelkezõKABÜgyintézõk.Osztály;

#/#/#/
lkKeresendõk
#/#/
SELECT tKeresendõk.Azonosító, tKeresendõk.Sorszám, tKeresendõk.Fõosztály, tKeresendõk.Osztály
FROM tKeresendõk;

#/#/#/
lkKerületiLakosok
#/#/
SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Születési idõ], lkSzemélyek.[Születési hely], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, Replace(Nz([Állandó lakcím],""),"Magyarország, ","") AS Állandó, Replace(Nz([Tartózkodási lakcím],""),"Magyarország, ","") AS Tartózkodási, IRSZ(Replace(Nz([Állandó lakcím],""),"Magyarország, ","")) AS [Állandó IRSZ], IRSZ(Replace(Nz([Tartózkodási lakcím],""),"Magyarország, ","")) AS [Tartózkodási IRSZ], lkSzemélyek.[Otthoni e-mail], lkSzemélyek.[Otthoni mobil], lkSzemélyek.[Otthoni telefon], lkSzemélyek.[További otthoni mobil]
FROM lkSzemélyek
WHERE (((IRSZ(Replace(Nz([Állandó lakcím],""),"Magyarország, ",""))) Like "10" & [Kerület] & "*")) OR (((IRSZ(Replace(Nz([Tartózkodási lakcím],""),"Magyarország, ",""))) Like "10" & [Kerület] & "*"));

#/#/#/
lkKiBelépõkLétszáma
#/#/
SELECT KiBelépõkLétszáma.Fõosztály, KiBelépõkLétszáma.Osztály, KiBelépõkLétszáma.Dátum, Sum(KiBelépõkLétszáma.Létszám) AS Fõ INTO tKiBelépõkLétszáma
FROM (SELECT lkKilépõUnió.Fõosztály, lkKilépõUnió.Osztály, lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja] AS Dátum, Sum(-1) AS Létszám
FROM lkKilépõUnió
GROUP BY lkKilépõUnió.Fõosztály, lkKilépõUnió.Osztály, lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja]
UNION
SELECT  lkBelépõkUnió.Fõosztály, lkBelépõkUnió.Osztály, lkBelépõkUnió.[Jogviszony kezdõ dátuma] AS Dátum, Sum(1) AS Létszám
FROM  lkBelépõkUnió
GROUP BY lkBelépõkUnió.Fõosztály, lkBelépõkUnió.Osztály, lkBelépõkUnió.[Jogviszony kezdõ dátuma])  AS KiBelépõkLétszáma
GROUP BY KiBelépõkLétszáma.Fõosztály, KiBelépõkLétszáma.Osztály, KiBelépõkLétszáma.Dátum;

#/#/#/
lkKiemeltNapok
#/#/
SELECT lkSorszámok.Sorszám AS év, lkSorszámok_1.Sorszám AS hó, lkSorszámok_2.Sorszám AS tnap, dtÁtal([év] & "." & [hó] & "." & [tnap]) AS KiemeltNapok, Day([KiemeltNapok]) AS nap
FROM lkSorszámok, lkSorszámok AS lkSorszámok_1, lkSorszámok AS lkSorszámok_2
WHERE (((lkSorszámok.Sorszám) Between 19 And Year(Now())-2000) AND ((lkSorszámok_1.Sorszám)<13) AND ((lkSorszámok_2.Sorszám) In (1,15,31)))
ORDER BY lkSorszámok.Sorszám, lkSorszámok_1.Sorszám, lkSorszámok_2.Sorszám;

#/#/#/
lkKilépésiDátumNélküliek
#/#/
SELECT kt_azNexon_Adójel02.azNexon, lkKilépõUnió.Név, lkKilépõUnió.Adóazonosító, lkKilépõUnió.Fõosztály, lkKilépõUnió.Osztály, lkSzemélyekMind.[Jogviszony kezdete (belépés dátuma)], lkKilépõUnió.[Jogviszony kezdõ dátuma], lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)], lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja], lkSzemélyekMind.[Jogviszony sorszáma]
FROM (lkSzemélyekMind INNER JOIN lkKilépõUnió ON (lkSzemélyekMind.[Jogviszony kezdete (belépés dátuma)] = lkKilépõUnió.[Jogviszony kezdõ dátuma]) AND (lkSzemélyekMind.Adójel = lkKilépõUnió.Adójel)) INNER JOIN kt_azNexon_Adójel02 ON lkSzemélyekMind.Adójel = kt_azNexon_Adójel02.Adójel
WHERE (((lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)])=0));

#/#/#/
lkKilépõDolgozók
#/#/
SELECT DISTINCT bfkh([Szervezeti egység kódja]) AS BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Státusz kódja], IIf(Nz([besorolási  fokozat (KT)],"")="",[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés],Nz([besorolási  fokozat (KT)],"")) AS Besorolás, lkSzemélyek.[Státusz típusa], lkSzemélyek.[KIRA jogviszony jelleg], lkSzemélyek.[Jogviszony vége (kilépés dátuma)], lkSzemélyek.[HR kapcsolat megszûnés módja (Kilépés módja)]
FROM lkSzemélyek LEFT JOIN lkSzervezetÁlláshelyek ON lkSzemélyek.[Státusz kódja] = lkSzervezetÁlláshelyek.Álláshely
WHERE (((lkSzemélyek.[Jogviszony vége (kilépés dátuma)])>Date()) AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Null) AND ((lkSzemélyek.[HR kapcsolat megszûnés módja (Kilépés módja)]) Is Not Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY bfkh([Szervezeti egység kódja]);

#/#/#/
lkKilépõk
#/#/
SELECT Kilépõk.Sorszám, Kilépõk.Név, Kilépõk.Adóazonosító, Kilépõk.[Megyei szint VAGY Járási Hivatal], Kilépõk.Mezõ5, Kilépõk.Mezõ6, Kilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Kilépõk.Mezõ8, Kilépõk.[Besorolási fokozat kód:], Kilépõk.[Besorolási fokozat megnevezése:], Kilépõk.[Álláshely azonosító], Kilépõk.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva], Kilépõk.[Jogviszony kezdõ dátuma], Kilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja], Kilépõk.[Végkielégítésre jogosító hónapok száma], Kilépõk.[Felmentési idõ hónapok száma], "-" AS Üres, Kilépõk.[Illetmény (Ft/hó)], [Adóazonosító]*1 AS Adójel
FROM Kilépõk;

#/#/#/
lkKilépõk_Havi
#/#/
SELECT Kilépõk.Név, [Kilépõk].[Adóazonosító]*1 AS Adóazonosító, Kilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja] AS Kilépés, Month([Jogviszony megszûnésének, megszüntetésének idõpontja]) AS Hó
FROM Kilépõk;

#/#/#/
lkKilépõk_Havi_vs_Személyek
#/#/
SELECT lkKilépõk_Havi.Név AS NévHavi, lkKilépõk_Havi.Adóazonosító, lkKilépõk_Havi.Kilépés, lkSzemélyek.[Dolgozó teljes neve] AS Név_, lkSzemélyek.Adójel, lkSzemélyek.[Jogviszony vége (kilépés dátuma)] AS Kilépés_, lkSzemélyek.[Helyettesített dolgozó neve], lkSzemélyek.[Tartós távollét típusa], lkSzemélyek.[HR kapcsolat megszûnés módja (Kilépés módja)], lkSzemélyek.[Jogviszony típusa / jogviszony típus]
FROM lkSzemélyek LEFT JOIN lkKilépõk_Havi ON lkSzemélyek.Adójel = lkKilépõk_Havi.Adóazonosító
WHERE (((lkKilépõk_Havi.Adóazonosító) Is Null) AND ((lkSzemélyek.[Jogviszony vége (kilépés dátuma)]) Between #1/1/2023# And #4/30/2023#) AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Not Like "Személyes*"));

#/#/#/
lkKilépõk_Személyek01
#/#/
SELECT tSzemélyek.[Dolgozó teljes neve] AS Név, Year([Jogviszony vége (kilépés dátuma)]) AS KilépésÉve, Month([Jogviszony vége (kilépés dátuma)]) AS KilépésHava, [tSzemélyek].[Adójel]*1 AS Adóazonosító, tSzemélyek.[Jogviszony vége (kilépés dátuma)] AS Kilépés, tSzemélyek.[Szervezeti egység kódja], -1 AS Létszám
FROM tSzemélyek
WHERE (((tSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Not Null) AND ((tSzemélyek.[Szervezeti egység kódja]) Not Like "BFKH-MEGB")) OR (((tSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Not Null) AND ((tSzemélyek.[Szervezeti egység kódja])="")) OR (((tSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Not Null) AND ((tSzemélyek.[Szervezeti egység kódja]) Is Null));

#/#/#/
lkKilépõk_Személyek02
#/#/
TRANSFORM Sum(lkKilépõk_Személyek01.Létszám) AS SumOfLétszám
SELECT lkKilépõk_Személyek01.KilépésHava
FROM lkKilépõk_Személyek01
WHERE (((lkKilépõk_Személyek01.KilépésÉve)>2018))
GROUP BY lkKilépõk_Személyek01.KilépésHava
PIVOT lkKilépõk_Személyek01.KilépésÉve;

#/#/#/
lkKilépõkBFKHnálLedolgozottIdejeHetente
#/#/
TRANSFORM Count(tSzemélyek.Adójel) AS CountOfAdójel
SELECT DateDiff("w",[Jogviszony kezdete (belépés dátuma)],[Jogviszony vége (kilépés dátuma)]) AS Kif1
FROM tSzemélyek
WHERE (((tSzemélyek.[Jogviszony vége (kilépés dátuma)])<>0))
GROUP BY DateDiff("w",[Jogviszony kezdete (belépés dátuma)],[Jogviszony vége (kilépés dátuma)])
PIVOT Year([Jogviszony vége (kilépés dátuma)]);

#/#/#/
lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta01
#/#/
SELECT Trim(Replace(Replace(Replace([lkKilépõUnió].[Fõosztály],"Budapest Fõváros Kormányhivatala","BFKH")," 20200229-ig",""),"Budapest FõvárosKormányhivatala","BFKH")) AS Fõosztály, Year([Jogviszony megszûnésének, megszüntetésének idõpontja]) AS Év, Month([Jogviszony megszûnésének, megszüntetésének idõpontja]) AS Hó, 1 AS fõ
FROM lkKilépõUnió
WHERE (((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva]) Like "*próbaidõ*"));

#/#/#/
lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02
#/#/
SELECT lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta01.Fõosztály, lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta01.Év, lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta01.fõ, IIf([Hó]=1,[fõ],0) AS 1, IIf([Hó]=2,[fõ],0) AS 2, IIf([Hó]=3,[fõ],0) AS 3, IIf([Hó]=4,[fõ],0) AS 4, IIf([Hó]=5,[fõ],0) AS 5, IIf([Hó]=6,[fõ],0) AS 6, IIf([Hó]=7,[fõ],0) AS 7, IIf([Hó]=8,[fõ],0) AS 8, IIf([Hó]=9,[fõ],0) AS 9, IIf([Hó]=10,[fõ],0) AS 10, IIf([Hó]=11,[fõ],0) AS 11, IIf([Hó]=12,[fõ],0) AS 12
FROM lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta01;

#/#/#/
lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta03
#/#/
SELECT lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.Fõosztály, lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.Év, Sum(lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.[1]) AS [1 hó], Sum(lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.[2]) AS [2 hó], Sum(lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.[3]) AS [3 hó], Sum(lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.[4]) AS [4 hó], Sum(lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.[5]) AS [5 hó], Sum(lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.[6]) AS [6 hó], Sum(lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.[7]) AS [7 hó], Sum(lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.[8]) AS [8 hó], Sum(lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.[9]) AS [9 hó], Sum(lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.[10]) AS [10 hó], Sum(lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.[11]) AS [11 hó], Sum(lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.[12]) AS [12 hó]
FROM lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02
GROUP BY lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.Fõosztály, lkKilépõkPróbaidõFõosztályonkéntÉventeHavonta02.Év;

#/#/#/
lkKilépõkSzáma
#/#/
SELECT dtÁtal([Jogviszony vége (kilépés dátuma)]) AS Dátum, 0 AS [Belépõk száma], Count(lkSzemélyek.Adójel) AS [Kilépõk száma]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Like "munka*" Or (lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Like "korm*"))
GROUP BY dtÁtal([Jogviszony vége (kilépés dátuma)]), 0
HAVING (((dtÁtal([Jogviszony vége (kilépés dátuma)])) Between Now() And DateSerial(Year(Now()),Month(Now())+1,Day(Now()))));

#/#/#/
lkKilépõkSzámaÉvente
#/#/
SELECT Year([Jogviszony megszûnésének, megszüntetésének idõpontja]) AS KilépésÉve, Sum(IIf([Csoport]="nyugdíj",0,1)) AS [Kilépõk száma]
FROM tMegszûnésMódjaCsoportok RIGHT JOIN lkKilépõUnió ON tMegszûnésMódjaCsoportok.MegszûnésMódja = lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva]
WHERE (((lkKilépõUnió.Fõosztály) Like Nz([Fõosztály_],"") & "*") AND ((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja])<#9/30/2024#))
GROUP BY Year([Jogviszony megszûnésének, megszüntetésének idõpontja])
HAVING (((Year([Jogviszony megszûnésének, megszüntetésének idõpontja])) Between 2020 And 2024));

#/#/#/
lkKilépõkSzámaÉvente_Indokonként
#/#/
TRANSFORM Count(lkSzemélyekMind.Azonosító) AS [Kilépõk száma]
SELECT lkSzemélyekMind.[HR kapcsolat megszûnés módja (Kilépés módja)]
FROM tSzemélyek INNER JOIN lkSzemélyekMind ON tSzemélyek.Azonosító = lkSzemélyekMind.Azonosító
WHERE (((lkSzemélyekMind.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (lkSzemélyekMind.[KIRA jogviszony jelleg])="Munkaviszony") AND ((lkSzemélyekMind.JogviszonyVége) Is Not Null Or (lkSzemélyekMind.JogviszonyVége)<>"") AND ((Year([JogviszonyVége]))>=2019 And (Year([JogviszonyVége]))<=Year(Now())))
GROUP BY lkSzemélyekMind.[HR kapcsolat megszûnés módja (Kilépés módja)]
ORDER BY Year([JogviszonyVége])
PIVOT Year([JogviszonyVége]);

#/#/#/
lkKilépõkSzámaÉvente2b
#/#/
SELECT lkKilépõkSzámaÉventeHavonta.Év, Sum(lkKilépõkSzámaÉventeHavonta.[Kilépõk száma]) AS Kilépõk
FROM lkKilépõkSzámaÉventeHavonta
GROUP BY lkKilépõkSzámaÉventeHavonta.Év;

#/#/#/
lkKilépõkSzámaÉventeFélévente01
#/#/
SELECT Year([JogviszonyVége]) AS Év, IIf(Month([JogviszonyVége])<7,1,2) AS Félév, lkSzemélyekMind.[KIRA jogviszony jelleg], Count(lkSzemélyekMind.Azonosító) AS [Kilépõk száma]
FROM lkSzemélyekMind
WHERE (((lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)]) Is Not Null Or (lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)])<>"") AND ((Year([JogviszonyVége]))>=2019 And (Year([JogviszonyVége]))<=Year(Now())+1))
GROUP BY Year([JogviszonyVége]), IIf(Month([JogviszonyVége])<7,1,2), lkSzemélyekMind.[KIRA jogviszony jelleg]
HAVING (((lkSzemélyekMind.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (lkSzemélyekMind.[KIRA jogviszony jelleg])="Munkaviszony"))
ORDER BY Year([JogviszonyVége]), IIf(Month([JogviszonyVége])<7,1,2);

#/#/#/
lkKilépõkSzámaÉventeFélévente02a
#/#/
TRANSFORM Sum(lkKilépõkSzámaÉventeFélévente01.[Kilépõk száma]) AS [SumOfKilépõk száma]
SELECT 1 AS Sorszám, lkKilépõkSzámaÉventeFélévente01.[KIRA jogviszony jelleg], lkKilépõkSzámaÉventeFélévente01.Év
FROM lkKilépõkSzámaÉventeFélévente01
GROUP BY 1, lkKilépõkSzámaÉventeFélévente01.[KIRA jogviszony jelleg], lkKilépõkSzámaÉventeFélévente01.Év
ORDER BY lkKilépõkSzámaÉventeFélévente01.[KIRA jogviszony jelleg], lkKilépõkSzámaÉventeFélévente01.Év
PIVOT lkKilépõkSzámaÉventeFélévente01.Félév;

#/#/#/
lkKilépõkSzámaÉventeFélévente02b
#/#/
TRANSFORM Sum(lkKilépõkSzámaÉventeFélévente01.[Kilépõk száma]) AS [SumOfKilépõk száma]
SELECT 2 AS Sorszám, "Kit. és Mt. együtt:" AS [KIRA jogviszony jelleg], lkKilépõkSzámaÉventeFélévente01.Év
FROM lkKilépõkSzámaÉventeFélévente01
GROUP BY 2, "Kit. és Mt. együtt:", lkKilépõkSzámaÉventeFélévente01.Év
ORDER BY "Kit. és Mt. együtt:", lkKilépõkSzámaÉventeFélévente01.Év
PIVOT lkKilépõkSzámaÉventeFélévente01.Félév;

#/#/#/
lkKilépõkSzámaÉventeFélévente03
#/#/
SELECT lkKilépõkSzámaÉventeFélévente02a.Sorszám, lkKilépõkSzámaÉventeFélévente02a.[KIRA jogviszony jelleg], lkKilépõkSzámaÉventeFélévente02a.Év, lkKilépõkSzámaÉventeFélévente02a.[1], lkKilépõkSzámaÉventeFélévente02a.[2]
FROM lkKilépõkSzámaÉventeFélévente02a
UNION SELECT lkKilépõkSzámaÉventeFélévente02b.Sorszám, lkKilépõkSzámaÉventeFélévente02b.[KIRA jogviszony jelleg], lkKilépõkSzámaÉventeFélévente02b.Év, lkKilépõkSzámaÉventeFélévente02b.[1], lkKilépõkSzámaÉventeFélévente02b.[2]
FROM lkKilépõkSzámaÉventeFélévente02b;

#/#/#/
lkKilépõkSzámaÉventeHavonta
#/#/
SELECT Year([JogviszonyVége]) AS Év, Month([JogviszonyVége]) AS Hó, Count(lkSzemélyekMind.Azonosító) AS [Kilépõk száma]
FROM lkSzemélyekMind
WHERE (((lkSzemélyekMind.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (lkSzemélyekMind.[KIRA jogviszony jelleg])="Munkaviszony" Or (lkSzemélyekMind.[KIRA jogviszony jelleg]) Like "Hivatás*") AND ((lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)]) Is Not Null Or (lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)])<>"") AND ((Year([JogviszonyVége]))>=2019 And (Year([JogviszonyVége]))<=Year(Now())+1))
GROUP BY Year([JogviszonyVége]), Month([JogviszonyVége])
ORDER BY Year([JogviszonyVége]), Month([JogviszonyVége]);

#/#/#/
lkKilépõkSzámaÉventeHavonta2
#/#/
SELECT lkKilépõkSzámaÉventeHavonta.Év, IIf([Hó]=1,[Kilépõk száma],0) AS 1, IIf([Hó]=2,[Kilépõk száma],0) AS 2, IIf([Hó]=3,[Kilépõk száma],0) AS 3, IIf([Hó]=4,[Kilépõk száma],0) AS 4, IIf([Hó]=5,[Kilépõk száma],0) AS 5, IIf([Hó]=6,[Kilépõk száma],0) AS 6, IIf([Hó]=7,[Kilépõk száma],0) AS 7, IIf([Hó]=8,[Kilépõk száma],0) AS 8, IIf([Hó]=9,[Kilépõk száma],0) AS 9, IIf([Hó]=10,[Kilépõk száma],0) AS 10, IIf([Hó]=11,[Kilépõk száma],0) AS 11, IIf([Hó]=12,[Kilépõk száma],0) AS 12
FROM lkKilépõkSzámaÉventeHavonta;

#/#/#/
lkKilépõkSzámaÉventeHavonta2Akkumulálva
#/#/
SELECT lkKilépõkSzámaÉventeHavonta.Év, IIf([Hó]<=1,[Kilépõk száma],0) AS 1, IIf([Hó]<=2,[Kilépõk száma],0) AS 2, IIf([Hó]<=3,[Kilépõk száma],0) AS 3, IIf([Hó]<=4,[Kilépõk száma],0) AS 4, IIf([Hó]<=5,[Kilépõk száma],0) AS 5, IIf([Hó]<=6,[Kilépõk száma],0) AS 6, IIf([Hó]<=7,[Kilépõk száma],0) AS 7, IIf([Hó]<=8,[Kilépõk száma],0) AS 8, IIf([Hó]<=9,[Kilépõk száma],0) AS 9, IIf([Hó]<=10,[Kilépõk száma],0) AS 10, IIf([Hó]<=11,[Kilépõk száma],0) AS 11, IIf([Hó]<=12,[Kilépõk száma],0) AS 12
FROM lkKilépõkSzámaÉventeHavonta;

#/#/#/
lkKilépõkSzámaÉventeHavonta3
#/#/
SELECT lkKilépõkSzámaÉventeHavonta2.Év, Sum(lkKilépõkSzámaÉventeHavonta2.[1]) AS 01, Sum(lkKilépõkSzámaÉventeHavonta2.[2]) AS 02, Sum(lkKilépõkSzámaÉventeHavonta2.[3]) AS 03, Sum(lkKilépõkSzámaÉventeHavonta2.[4]) AS 04, Sum(lkKilépõkSzámaÉventeHavonta2.[5]) AS 05, Sum(lkKilépõkSzámaÉventeHavonta2.[6]) AS 06, Sum(lkKilépõkSzámaÉventeHavonta2.[7]) AS 07, Sum(lkKilépõkSzámaÉventeHavonta2.[8]) AS 08, Sum(lkKilépõkSzámaÉventeHavonta2.[9]) AS 09, Sum(lkKilépõkSzámaÉventeHavonta2.[10]) AS 10, Sum(lkKilépõkSzámaÉventeHavonta2.[11]) AS 11, Sum(lkKilépõkSzámaÉventeHavonta2.[12]) AS 12, lkKilépõkSzámaÉvente2b.Kilépõk
FROM lkKilépõkSzámaÉvente2b INNER JOIN lkKilépõkSzámaÉventeHavonta2 ON lkKilépõkSzámaÉvente2b.Év=lkKilépõkSzámaÉventeHavonta2.Év
GROUP BY lkKilépõkSzámaÉventeHavonta2.Év, lkKilépõkSzámaÉvente2b.Kilépõk;

#/#/#/
lkKilépõkSzámaÉventeHavonta3Akkumulálva
#/#/
SELECT lkKilépõkSzámaÉventeHavonta2Akkumulálva.Év, Sum(lkKilépõkSzámaÉventeHavonta2Akkumulálva.[1]) AS 01, Sum(lkKilépõkSzámaÉventeHavonta2Akkumulálva.[2]) AS 02, Sum(lkKilépõkSzámaÉventeHavonta2Akkumulálva.[3]) AS 03, Sum(lkKilépõkSzámaÉventeHavonta2Akkumulálva.[4]) AS 04, Sum(lkKilépõkSzámaÉventeHavonta2Akkumulálva.[5]) AS 05, Sum(lkKilépõkSzámaÉventeHavonta2Akkumulálva.[6]) AS 06, Sum(lkKilépõkSzámaÉventeHavonta2Akkumulálva.[7]) AS 07, Sum(lkKilépõkSzámaÉventeHavonta2Akkumulálva.[8]) AS 08, Sum(lkKilépõkSzámaÉventeHavonta2Akkumulálva.[9]) AS 09, Sum(lkKilépõkSzámaÉventeHavonta2Akkumulálva.[10]) AS 10, Sum(lkKilépõkSzámaÉventeHavonta2Akkumulálva.[11]) AS 11, Sum(lkKilépõkSzámaÉventeHavonta2Akkumulálva.[12]) AS 12, lkKilépõkSzámaÉvente2b.Kilépõk
FROM lkKilépõkSzámaÉventeHavonta2Akkumulálva INNER JOIN lkKilépõkSzámaÉvente2b ON lkKilépõkSzámaÉventeHavonta2Akkumulálva.Év = lkKilépõkSzámaÉvente2b.Év
GROUP BY lkKilépõkSzámaÉventeHavonta2Akkumulálva.Év, lkKilépõkSzámaÉvente2b.Kilépõk;

#/#/#/
lkKilépõkSzámaÉventeHavontaFõoszt02
#/#/
SELECT lkKilépõkSzámaÉventeHavontaFõosztOszt01.Fõosztály AS Fõosztály, lkKilépõkSzámaÉventeHavontaFõosztOszt01.Év AS Év, Sum((IIf([Hó]=1,[Kilépõk száma],0))) AS 1, Sum((IIf([Hó]=2,[Kilépõk száma],0))) AS 2, Sum((IIf([Hó]=3,[Kilépõk száma],0))) AS 3, Sum((IIf([Hó]=4,[Kilépõk száma],0))) AS 4, Sum((IIf([Hó]=5,[Kilépõk száma],0))) AS 5, Sum((IIf([Hó]=6,[Kilépõk száma],0))) AS 6, Sum((IIf([Hó]=7,[Kilépõk száma],0))) AS 7, Sum((IIf([Hó]=8,[Kilépõk száma],0))) AS 8, Sum((IIf([Hó]=9,[Kilépõk száma],0))) AS 9, Sum((IIf([Hó]=10,[Kilépõk száma],0))) AS 10, Sum((IIf([Hó]=11,[Kilépõk száma],0))) AS 11, Sum((IIf([Hó]=12,[Kilépõk száma],0))) AS 12, [1]+[2]+[3]+[4]+[5]+[6]+[7]+[8]+[9]+[10]+[11]+[12] AS Összesen
FROM lkKilépõkSzámaÉventeHavontaFõosztOszt01
GROUP BY lkKilépõkSzámaÉventeHavontaFõosztOszt01.Fõosztály, lkKilépõkSzámaÉventeHavontaFõosztOszt01.Év;

#/#/#/
lkKilépõkSzámaÉventeHavontaFõosztOszt01
#/#/
SELECT Trim(Replace(Replace(Replace([lkKilépõUnió].[Fõosztály],"Budapest Fõváros Kormányhivatala","BFKH")," 20200229-ig",""),"Budapest FõvárosKormányhivatala","BFKH")) AS Fõosztály, Replace([lkKilépõUnió].[Osztály]," 20200229-ig","") AS Osztály, Year([JogviszonyVége]) AS Év, Month([JogviszonyVége]) AS Hó, Count(lkSzemélyekMind.Azonosító) AS [Kilépõk száma]
FROM lkSzemélyekMind RIGHT JOIN lkKilépõUnió ON (lkSzemélyekMind.[Adóazonosító jel] = lkKilépõUnió.Adóazonosító) AND (lkSzemélyekMind.JogviszonyVége = lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja])
WHERE (((lkSzemélyekMind.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (lkSzemélyekMind.[KIRA jogviszony jelleg])="Munkaviszony") AND ((lkSzemélyekMind.JogviszonyVége)<>0) AND ((Year([JogviszonyVége])) Between Year(Now())-4 And Year(Now())+1))
GROUP BY Trim(Replace(Replace(Replace([lkKilépõUnió].[Fõosztály],"Budapest Fõváros Kormányhivatala","BFKH")," 20200229-ig",""),"Budapest FõvárosKormányhivatala","BFKH")), Replace([lkKilépõUnió].[Osztály]," 20200229-ig",""), Year([JogviszonyVége]), Month([JogviszonyVége])
ORDER BY Year([JogviszonyVége]), Month([JogviszonyVége]);

#/#/#/
lkKilépõkSzámaÉventeHavontaFõosztOszt02
#/#/
SELECT lkKilépõkSzámaÉventeHavontaFõosztOszt01.Fõosztály, lkKilépõkSzámaÉventeHavontaFõosztOszt01.Osztály, lkKilépõkSzámaÉventeHavontaFõosztOszt01.Év, Sum(IIf([Hó]=1,[Kilépõk száma],0)) AS 1, Sum(IIf([Hó]=2,[Kilépõk száma],0)) AS 2, Sum(IIf([Hó]=3,[Kilépõk száma],0)) AS 3, Sum(IIf([Hó]=4,[Kilépõk száma],0)) AS 4, Sum(IIf([Hó]=5,[Kilépõk száma],0)) AS 5, Sum(IIf([Hó]=6,[Kilépõk száma],0)) AS 6, Sum(IIf([Hó]=7,[Kilépõk száma],0)) AS 7, Sum(IIf([Hó]=8,[Kilépõk száma],0)) AS 8, Sum(IIf([Hó]=9,[Kilépõk száma],0)) AS 9, Sum(IIf([Hó]=10,[Kilépõk száma],0)) AS 10, Sum(IIf([Hó]=11,[Kilépõk száma],0)) AS 11, Sum(IIf([Hó]=12,[Kilépõk száma],0)) AS 12, [1]+[2]+[3]+[4]+[5]+[6]+[7]+[8]+[9]+[10]+[11]+[12] AS Összesen
FROM lkKilépõkSzámaÉventeHavontaFõosztOszt01
GROUP BY lkKilépõkSzámaÉventeHavontaFõosztOszt01.Fõosztály, lkKilépõkSzámaÉventeHavontaFõosztOszt01.Osztály, lkKilépõkSzámaÉventeHavontaFõosztOszt01.Év;

#/#/#/
lkKilépõkSzámaÉventeHavontaFõosztOszt02-EgyFõosztályra
#/#/
SELECT lkKilépõkSzámaÉventeHavontaFõosztOszt02.*
FROM lkKilépõkSzámaÉventeHavontaFõosztOszt02
WHERE (((lkKilépõkSzámaÉventeHavontaFõosztOszt02.Fõosztály) Like "*" & [Add meg a Fõosztály] & "*"));

#/#/#/
lkKilépõkSzámaÉventeHavontaKorral
#/#/
SELECT Year([JogviszonyVége]) AS Év, Month([JogviszonyVége]) AS Hó, Count(lkSzemélyekMind.Azonosító) AS [Kilépõk száma], Year(Now())-Year([Születési idõ]) AS Kor
FROM lkSzemélyekMind
WHERE (((lkSzemélyekMind.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (lkSzemélyekMind.[KIRA jogviszony jelleg])="Munkaviszony") AND ((lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)]) Is Not Null Or (lkSzemélyekMind.[Jogviszony vége (kilépés dátuma)])<>"") AND ((Year([JogviszonyVége]))>=2019 And (Year([JogviszonyVége]))<=Year(Now())+1))
GROUP BY Year([JogviszonyVége]), Month([JogviszonyVége]), Year(Now())-Year([Születési idõ])
ORDER BY Year([JogviszonyVége]), Month([JogviszonyVége]);

#/#/#/
lkKilépõkSzámaÉventeKorral
#/#/
SELECT lkKilépõkSzámaÉventeHavontaKorral.Év, Switch([Kor]>=0 And [Kor]<=22,"18-22 évek között:",[Kor]>=23 And [Kor]<=28,"23-28 évek között:",[Kor]>=29 And [Kor]<=35,"29-35 évek között:",[Kor]>=36 And [Kor]<=40,"36-40 évek között:",[Kor]>=41 And [Kor]<=45,"41-45 évek között:",[Kor]>=46 And [Kor]<=50,"46-50 évek között:",[Kor]>=51 And [Kor]<=60,"51-60 évek között:",[Kor]>=61 And [Kor]<=65,"61-65 évek között:",[Kor]>=66 And [Kor]<=200,"66 év fölött:") AS Korkategoria, Sum(lkKilépõkSzámaÉventeHavontaKorral.[Kilépõk száma]) AS Kilépõk
FROM lkKilépõkSzámaÉventeHavontaKorral
GROUP BY lkKilépõkSzámaÉventeHavontaKorral.Év, Switch([Kor]>=0 And [Kor]<=22,"18-22 évek között:",[Kor]>=23 And [Kor]<=28,"23-28 évek között:",[Kor]>=29 And [Kor]<=35,"29-35 évek között:",[Kor]>=36 And [Kor]<=40,"36-40 évek között:",[Kor]>=41 And [Kor]<=45,"41-45 évek között:",[Kor]>=46 And [Kor]<=50,"46-50 évek között:",[Kor]>=51 And [Kor]<=60,"51-60 évek között:",[Kor]>=61 And [Kor]<=65,"61-65 évek között:",[Kor]>=66 And [Kor]<=200,"66 év fölött:");

#/#/#/
lkKilépõUnió
#/#/
SELECT DISTINCT Unió2019_mostanáig.Sorszám, Unió2019_mostanáig.Név, Unió2019_mostanáig.Adóazonosító, Unió2019_mostanáig.Alaplétszám, Unió2019_mostanáig.[Megyei szint VAGY Járási Hivatal], Unió2019_mostanáig.Mezõ5, Unió2019_mostanáig.Mezõ6, Unió2019_mostanáig.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Unió2019_mostanáig.Mezõ8, Unió2019_mostanáig.[Besorolási fokozat kód:], Unió2019_mostanáig.[Besorolási fokozat megnevezése:], Unió2019_mostanáig.[Álláshely azonosító], Unió2019_mostanáig.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva], Unió2019_mostanáig.[Jogviszony kezdõ dátuma], Unió2019_mostanáig.[Jogviszony megszûnésének, megszüntetésének idõpontja], Unió2019_mostanáig.[Illetmény (Ft/hó)], Unió2019_mostanáig.[Végkielégítésre jogosító hónapok száma], Unió2019_mostanáig.[Felmentési idõ hónapok száma], IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, Unió2019_mostanáig.tKilépõkUnió.Mezõ6 AS Osztály, [adóazonosító]*1 AS Adójel, *
FROM (SELECT  tKilépõkUnió.Sorszám, tKilépõkUnió.Név, tKilépõkUnió.Adóazonosító, tKilépõkUnió.Alaplétszám, tKilépõkUnió.[Megyei szint VAGY Járási Hivatal], tKilépõkUnió.Mezõ5, tKilépõkUnió.Mezõ6, tKilépõkUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], tKilépõkUnió.Mezõ8, tKilépõkUnió.[Besorolási fokozat kód:], tKilépõkUnió.[Besorolási fokozat megnevezése:], tKilépõkUnió.[Álláshely azonosító], tKilépõkUnió.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva], tKilépõkUnió.[Jogviszony kezdõ dátuma], tKilépõkUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja], tKilépõkUnió.[Illetmény (Ft/hó)], tKilépõkUnió.[Végkielégítésre jogosító hónapok száma], tKilépõkUnió.[Felmentési idõ hónapok száma]
FROM tKilépõkUnió
UNION
SELECT Kilépõk.Sorszám, Kilépõk.Név, Kilépõk.Adóazonosító, Kilépõk.Alaplétszám, Kilépõk.[Megyei szint VAGY Járási Hivatal], Kilépõk.Mezõ5, Kilépõk.Mezõ6, Kilépõk.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Kilépõk.Mezõ8, Kilépõk.[Besorolási fokozat kód:], Kilépõk.[Besorolási fokozat megnevezése:], Kilépõk.[Álláshely azonosító], Kilépõk.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva], Kilépõk.[Jogviszony kezdõ dátuma], Kilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja], Kilépõk.[Illetmény (Ft/hó)], Kilépõk.[Végkielégítésre jogosító hónapok száma], Kilépõk.[Felmentési idõ hónapok száma]
FROM Kilépõk)  AS Unió2019_mostanáig;

#/#/#/
lkKimenetÜresÁlláshelyekKimutatáshoz
#/#/
SELECT BetöltöttekÉsÜresek.[ÁNYR azonosító], BetöltöttekÉsÜresek.Besorolás, BetöltöttekÉsÜresek.Jelleg, BetöltöttekÉsÜresek.[Betöltõ neve], BetöltöttekÉsÜresek.Fõosztály, BetöltöttekÉsÜresek.Osztály, BetöltöttekÉsÜresek.Állapot, BetöltöttekÉsÜresek.[Ellátott feladat], BetöltöttekÉsÜresek.Megjegyzés, *
FROM (SELECT Betöltöttek.*
FROM lkKimenetÜresÁlláshelyekKimutatáshoz01 AS Betöltöttek
UNION SELECT Üresek.*
FROM  lkKimenetÜresÁlláshelyekKimutatáshoz02 AS Üresek)  AS BetöltöttekÉsÜresek;

#/#/#/
lkKimenetÜresÁlláshelyekKimutatáshoz01
#/#/
SELECT lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító] AS [ÁNYR azonosító], lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat megnevezése:] AS Besorolás, lkJárásiKormányKözpontosítottUnió.Jelleg, lkJárásiKormányKözpontosítottUnió.Név AS [Betöltõ neve], lkJárásiKormányKözpontosítottUnió.[Járási Hivatal] AS Fõosztály, lkJárásiKormányKözpontosítottUnió.Osztály, "Betöltött" AS Állapot, lkJárásiKormányKözpontosítottUnió.[Ellátott feladat], IIf([Besorolási fokozat kód:] Like "*Ov*" Or [Besorolási fokozat kód:] Like "*Jhv*" Or [Besorolási fokozat kód:] Like "*ig." Or [Besorolási fokozat kód:]="fsp.","vezetõi","") AS Megjegyzés
FROM lkJárásiKormányKözpontosítottUnió
WHERE (((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás]) Not Like "üres*"));

#/#/#/
lkKimenetÜresÁlláshelyekKimutatáshoz02
#/#/
SELECT lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító] AS [ÁNYR azonosító], lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat megnevezése:] AS Besorolás, lkJárásiKormányKözpontosítottUnió.Jelleg, lkJárásiKormányKözpontosítottUnió.Név AS [Betöltõ neve], lkJárásiKormányKözpontosítottUnió.[Járási Hivatal] AS Fõosztály, lkJárásiKormányKözpontosítottUnió.Osztály, "Üres:" & Nz([VisszajelzésSzövege],"Nincs folyamatban") AS Állapot, lkJárásiKormányKözpontosítottUnió.[Ellátott feladat], IIf([Besorolási fokozat kód:] Like "*Ov*" Or [Besorolási fokozat kód:] Like "*Jhv*" Or [Besorolási fokozat kód:] Like "*ig." Or [Besorolási fokozat kód:]="fsp.","vezetõi","") AS Megjegyzés
FROM lkJárásiKormányKözpontosítottUnió LEFT JOIN (lkÜzenetekVisszajelzések LEFT JOIN tVisszajelzésTípusok ON lkÜzenetekVisszajelzések.VisszajelzésKód = tVisszajelzésTípusok.VisszajelzésKód) ON lkJárásiKormányKözpontosítottUnió.[Hash] = lkÜzenetekVisszajelzések.Hash
WHERE (((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás]) Like "üres*") AND ((lkÜzenetekVisszajelzések.DeliveredDate)=(Select Max([DeliveredDate]) FROM [lkÜzenetekVisszajelzések] as Tmp Where [lkÜzenetekVisszajelzések].Hash=Tmp.hash) Or (lkÜzenetekVisszajelzések.DeliveredDate) Is Null)) OR (((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás]) Like "üres*") AND ((lkÜzenetekVisszajelzések.DeliveredDate) Is Null));

#/#/#/
lkKimenetÜresÁlláshelyekKimutetáshoz2a
#/#/
SELECT lkKimenetÜresÁlláshelyekKimutatáshoz.Fõosztály, lkKimenetÜresÁlláshelyekKimutatáshoz.Osztály, lkKimenetÜresÁlláshelyekKimutatáshoz.Jelleg, IIf([Állapot] Like "üres*",1,0) AS Üres, IIf([Megjegyzés]="vezetõi" And [Állapot] Like "üres*",1,0) AS [Ebbõl üres vezetõi álláshely], IIf([Állapot] Like "üres*",0,1) AS Betöltött, IIf([Megjegyzés]="vezetõi" And [Állapot] Not Like "üres*",1,0) AS [Betöltött vezetõi]
FROM lkKimenetÜresÁlláshelyekKimutatáshoz;

#/#/#/
lkKimenetÜresÁlláshelyekKimutetáshoz2b
#/#/
SELECT lkKimenetÜresÁlláshelyekKimutetáshoz2a.Fõosztály, lkKimenetÜresÁlláshelyekKimutetáshoz2a.Osztály, lkKimenetÜresÁlláshelyekKimutetáshoz2a.Jelleg, Sum(lkKimenetÜresÁlláshelyekKimutetáshoz2a.Üres) AS Üres, Sum(lkKimenetÜresÁlláshelyekKimutetáshoz2a.[Ebbõl üres vezetõi álláshely]) AS [Ebbõl üres vezetõi álláshely], Sum(lkKimenetÜresÁlláshelyekKimutetáshoz2a.Betöltött) AS Betöltött, Sum(lkKimenetÜresÁlláshelyekKimutetáshoz2a.[Betöltött vezetõi]) AS [Betöltött vezetõi]
FROM lkKimenetÜresÁlláshelyekKimutetáshoz2a
GROUP BY lkKimenetÜresÁlláshelyekKimutetáshoz2a.Fõosztály, lkKimenetÜresÁlláshelyekKimutetáshoz2a.Osztály, lkKimenetÜresÁlláshelyekKimutetáshoz2a.Jelleg;

#/#/#/
lkKinaiulBeszélõk
#/#/
SELECT lkSzemélyek.Törzsszám, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Nyelvtudás Kínai]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Nyelvtudás Kínai])="IGEN") AND ((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lkKiraHiba
#/#/
SELECT tKiraHiba.Azonosító, [Adóazonosító]*1 AS Adójel, tKiraHiba.Név, tKiraHiba.KIRAzonosító, tKiraHiba.Egység, tKiraHiba.Hiba, tKiraHiba.ImportDátum
FROM lkSzemélyek RIGHT JOIN tKiraHiba ON lkSzemélyek.Adójel = tKiraHiba.Adóazonosító
WHERE (((tKiraHiba.ImportDátum)=#9/18/2023#) AND ((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lkKiraHibaStatisztika
#/#/
SELECT lkKiraHibaJav.Hibák, Count(lkKiraHibaJav.Azonosító) AS Mennyiség
FROM (SELECT IIf([Hiba] Like "A dolgozó új belépõként lett rögzítve * hatály dátummal. Csak az adott napon érvényes adatok kerülnek feldolgozásra.","##A dolgozó...##",[hiba]) AS Hibák, lkKiraHiba.Azonosító FROM lkKiraHiba)  AS lkKiraHibaJav
GROUP BY lkKiraHibaJav.Hibák;

#/#/#/
lkKorfa01
#/#/
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

#/#/#/
lkKorfa02
#/#/
SELECT Korcsoport, sum([Férfi]) AS Férfiak, sum([Nõ]) AS Nõk
FROM lkKorfa01
GROUP BY Korcsoport;

#/#/#/
lkKorfa03
#/#/
SELECT "Összesen:" AS Korcsoport, Sum(lkKorfa02.Férfiak) AS Férfiak, Sum(lkKorfa02.Nõk) AS Nõk
FROM lkKorfa02
GROUP BY "Összesen:";

#/#/#/
lkKorfa04
#/#/
SELECT Unió.Korcsoport, Unió.Férfiak AS Férfi, Unió.Nõk AS Nõ
FROM (SELECT *
  FROM lkKorfa02
  UNION
  SELECT *
  FROM lkKorfa03
  )  AS Unió;

#/#/#/
lkKorfa06
#/#/
SELECT lkKorfa04.Korcsoport AS Korcsoport, lkKorfa04.Férfi AS Férfi, lkKorfa04.Nõ AS Nõ
FROM lkKorfa04;

#/#/#/
lkKormányhivatali_állomány
#/#/
SELECT Kormányhivatali_állomány.Sorszám, Kormányhivatali_állomány.Név, Kormányhivatali_állomány.Adóazonosító, Kormányhivatali_állomány.Mezõ4 AS [Születési év \ üres állás], Kormányhivatali_állomány.Mezõ5 AS Neme, Kormányhivatali_állomány.Mezõ6 AS Fõosztály, Kormányhivatali_állomány.Mezõ7 AS Osztály, Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Kormányhivatali_állomány.Mezõ9 AS [Ellátott feladat], Kormányhivatali_állomány.Mezõ10 AS Kinevezés, Kormányhivatali_állomány.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], Kormányhivatali_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], Kormányhivatali_állomány.[Heti munkaórák száma], Kormányhivatali_állomány.Mezõ14 AS [Betöltés aránya], Kormányhivatali_állomány.[Besorolási fokozat kód:], Kormányhivatali_állomány.[Besorolási fokozat megnevezése:], Kormányhivatali_állomány.[Álláshely azonosító], Kormányhivatali_állomány.Mezõ18 AS [Havi illetmény], Kormányhivatali_állomány.Mezõ19 AS [Eu finanszírozott], Kormányhivatali_állomány.Mezõ20 AS [Illetmény forrása], Kormányhivatali_állomány.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], Kormányhivatali_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Kormányhivatali_állomány.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], Kormányhivatali_állomány.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], Kormányhivatali_állomány.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], Kormányhivatali_állomány.Mezõ26 AS [Képesítést adó végzettség], Kormányhivatali_állomány.Mezõ27 AS KAB, Kormányhivatali_állomány.[KAB 001-3** Branch ID]
FROM Kormányhivatali_állomány;

#/#/#/
lkKormányhivataliJárásiKözpTörténet
#/#/
SELECT LétszámUnióTörténet.Sorszám, LétszámUnióTörténet.Név, LétszámUnióTörténet.Adóazonosító, LétszámUnióTörténet.[Születési év \ üres állás], LétszámUnióTörténet.Neme, LétszámUnióTörténet.[Járási Hivatal_], LétszámUnióTörténet.Osztály, LétszámUnióTörténet.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], LétszámUnióTörténet.[Ellátott feladat], LétszámUnióTörténet.Kinevezés, LétszámUnióTörténet.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], LétszámUnióTörténet.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], LétszámUnióTörténet.[Heti munkaórák száma], LétszámUnióTörténet.[Betöltés aránya], LétszámUnióTörténet.[Besorolási fokozat kód:], LétszámUnióTörténet.[Besorolási fokozat megnevezése:], LétszámUnióTörténet.[Álláshely azonosító], LétszámUnióTörténet.[Havi illetmény], LétszámUnióTörténet.[Eu finanszírozott], LétszámUnióTörténet.[Illetmény forrása], LétszámUnióTörténet.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], LétszámUnióTörténet.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], LétszámUnióTörténet.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], LétszámUnióTörténet.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], LétszámUnióTörténet.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], LétszámUnióTörténet.[Képesítést adó végzettség], LétszámUnióTörténet.KAB, LétszámUnióTörténet.[KAB 001-3** Branch ID], IIf([Adóazonosító] Is Null Or [Adóazonosító]="",0,[Adóazonosító]*1) AS Adójel, tHaviJelentésHatálya1.hatálya
FROM (SELECT *
FROM lktJárási_állomány
UNION SELECT *
FROM lktKormányhivatali_állomány
UNION SELECT *
FROM lktKözpontosítottak
)  AS LétszámUnióTörténet INNER JOIN tHaviJelentésHatálya1 ON LétszámUnióTörténet.hatályaID = tHaviJelentésHatálya1.hatályaID;

#/#/#/
lkKöltözõSzervezetLétszám
#/#/
SELECT lkKeresendõk.Sorszám, Tmp.Fõosztály, Tmp.Osztály_, Tmp.Létszám
FROM lkKeresendõk, lkFõosztályonéntiOsztályonkéntiLétszám AS Tmp
WHERE (((Tmp.Fõosztály)=[lkKeresendõk].[Fõosztály]) AND ((Tmp.Osztály_)=[lkKeresendõk].[Osztály])) OR (((Tmp.Fõosztály)=[lkKeresendõk].[Fõosztály]) AND ((Tmp.Osztály_) Like [lkKeresendõk].[Osztály]))
ORDER BY lkKeresendõk.Sorszám, Tmp.BFKH DESC , Tmp.Sor;

#/#/#/
lkKöltségvetéshezBesorolásonkéntiLétszám01
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.[Jogviszony típusa / jogviszony típus], Nz(IIf([Jogviszony típusa / jogviszony típus]="Munkaviszony",Choose(Left(IIf([Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] Is Null Or [Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis]="",0,[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis]),1)*1,"alapfokú","középfokú","felsõfokú","felsõfokú","középfokú","középfokú"),"-"),"középfokú") AS Végzettség, lkSzemélyek.[Státusz neve], lkSzemélyek.[Tartós távollét típusa], lkSzemélyek.[Státusz típusa], lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker], Nz([Összesen],[lkSzemélyek].[Kerekített 100 %-os illetmény (eltérítés nélküli)]) AS [Kerekített 100 %-os illetmény (eltérítés nélküli)], Nz([tKöltségvetéshezHivatásosok].[Besorolás],[lkSzemélyek].[Besorolás2]) AS Besorolás2
FROM tKöltségvetéshezHivatásosok RIGHT JOIN (lkJárásiKormányKözpontosítottUnió RIGHT JOIN (lkSzemélyek LEFT JOIN lkBesorolásVáltoztatások ON lkSzemélyek.[Státusz kódja] = lkBesorolásVáltoztatások.ÁlláshelyAzonosító) ON lkJárásiKormányKözpontosítottUnió.Adójel = lkSzemélyek.Adójel) ON tKöltségvetéshezHivatásosok.[Adóazonosító jel] = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkSzemélyek.[Státusz típusa])="Szervezeti alaplétszám") AND ((lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker])>=60));

#/#/#/
lkKöltségvetéshezBesorolásonkéntiLétszám01 másolata
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.[Jogviszony típusa / jogviszony típus], Nz(IIf([Jogviszony típusa / jogviszony típus]="Munkaviszony",Choose(Left(IIf([Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis] Is Null Or [Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis]="",0,[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis]),1)*1,"alapfokú","középfokú","felsõfokú","felsõfokú","középfokú","középfokú"),"-"),"középfokú") AS Végzettség, lkSzemélyek.[Státusz neve], lkSzemélyek.[Tartós távollét típusa], lkSzemélyek.[Státusz típusa], lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker], Nz([Összesen],[lkSzemélyek].[Kerekített 100 %-os illetmény (eltérítés nélküli)]) AS [Kerekített 100 %-os illetmény (eltérítés nélküli)], Nz([tKöltségvetéshezHivatásosok].[Besorolás],[lkSzemélyek].[Besorolás2]) AS Besorolás2
FROM tKöltségvetéshezHivatásosok RIGHT JOIN (lkJárásiKormányKözpontosítottUnió RIGHT JOIN (lkSzemélyek LEFT JOIN lkBesorolásVáltoztatások ON lkSzemélyek.[Státusz kódja] = lkBesorolásVáltoztatások.ÁlláshelyAzonosító) ON lkJárásiKormányKözpontosítottUnió.Adójel = lkSzemélyek.Adójel) ON tKöltségvetéshezHivatásosok.[Adóazonosító jel] = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkSzemélyek.[Státusz típusa])="Szervezeti alaplétszám") AND ((lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker])>=60));

#/#/#/
lkKöltségvetéshezBesorolásonkéntiLétszám02
#/#/
SELECT lkKöltségvetéshezBesorolásonkéntiLétszám01.[Jogviszony típusa / jogviszony típus] AS Jogviszony, lkKöltségvetéshezBesorolásonkéntiLétszám01.Végzettség, IIf([Jogviszony típusa / jogviszony típus]="Munkaviszony","-",[Besorolás2]) AS Besorolás, Count(lkKöltségvetéshezBesorolásonkéntiLétszám01.Adójel) AS [Betöltött létszám], Round([Betöltött létszám]*Nz([Engedélyezett létszám, ha semmi, akkor 5350],5350)/(Select count(adójel) from lkKöltségvetéshezBesorolásonkéntiLétszám01),2) AS [Statisztikai létszám], Sum(lkKöltségvetéshezBesorolásonkéntiLétszám01.[Kerekített 100 %-os illetmény (eltérítés nélküli)]) AS Illetmény
FROM lkKöltségvetéshezBesorolásonkéntiLétszám01
GROUP BY lkKöltségvetéshezBesorolásonkéntiLétszám01.[Jogviszony típusa / jogviszony típus], lkKöltségvetéshezBesorolásonkéntiLétszám01.Végzettség, IIf([Jogviszony típusa / jogviszony típus]="Munkaviszony","-",[Besorolás2]);

#/#/#/
lkKöltségvetéshezBesorolásonkéntiLétszám02Átlagbér
#/#/
SELECT Sum(lkKöltségvetéshezBesorolásonkéntiLétszám02.[Betöltött létszám]) AS Fõ, Sum(lkKöltségvetéshezBesorolásonkéntiLétszám02.Illetmény) AS Ft, Nz([Új átlagbér, ha semmi, akkor 585000],585000)/([Ft]/[Fõ]) AS Átlagbérszorzó
FROM lkKöltségvetéshezBesorolásonkéntiLétszám02;

#/#/#/
lkKöltségvetéshezBesorolásonkéntiLétszám03
#/#/
SELECT tKöltségvetéshezBesorolások.Sor, tKöltségvetéshezBesorolások.Besorolás, Sum(lkKöltségvetéshezBesorolásonkéntiLétszám02.[Betöltött létszám]) AS [SumOfBetöltött létszám], Sum(lkKöltségvetéshezBesorolásonkéntiLétszám02.[Statisztikai létszám]) AS [SumOfStatisztikai létszám], Sum(lkKöltségvetéshezBesorolásonkéntiLétszám02.Illetmény) AS SumOfIlletmény, Sum([Statisztikai létszám]/[Betöltött létszám]*[Illetmény]*(SELECT first([Átlagbérszorzó]) FROM lkKöltségvetéshezBesorolásonkéntiLétszám02Átlagbér )) AS [Statisztikai illetmény]
FROM tKöltségvetéshezBesorolások RIGHT JOIN lkKöltségvetéshezBesorolásonkéntiLétszám02 ON (tKöltségvetéshezBesorolások.BesorolásSzemélytörzs = lkKöltségvetéshezBesorolásonkéntiLétszám02.Besorolás) AND (tKöltségvetéshezBesorolások.Végzettség = lkKöltségvetéshezBesorolásonkéntiLétszám02.Végzettség) AND (tKöltségvetéshezBesorolások.Jogviszony = lkKöltségvetéshezBesorolásonkéntiLétszám02.[Jogviszony])
GROUP BY tKöltségvetéshezBesorolások.Sor, tKöltségvetéshezBesorolások.Besorolás;

#/#/#/
lkKözigazgatásiAlapvizsgaAlólMentesítettek
#/#/
SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Dolgozó születési neve], lkSzemélyek.[Anyja neve], lkSzemélyek.[Születési idõ], lkSzemélyek.[Hivatali email], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)]) Between #1/5/2020# And #4/30/2022#) AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus]) Like "Kormány*") AND ((lkSzemélyek.[Besorolási  fokozat (KT)]) Not Like "*osztály*" And (lkSzemélyek.[Besorolási  fokozat (KT)]) Not Like "*járás*" And (lkSzemélyek.[Besorolási  fokozat (KT)]) Not Like "*igazg*" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"fõispán"));

#/#/#/
lkKözigazgatásiVizsga
#/#/
SELECT [Dolgozó azonosító]*1 AS Adójel, tKözigazgatásiVizsga.*
FROM tKözigazgatásiVizsga;

#/#/#/
lkKözpontosítottak
#/#/
SELECT Központosítottak.Sorszám, Központosítottak.Név, Központosítottak.Adóazonosító, Központosítottak.Mezõ4 AS [Születési év \ üres állás], "" AS Nem, Replace(IIf([Megyei szint VAGY Járási Hivatal]="Megyei szint",[Központosítottak].[Mezõ6],[Megyei szint VAGY Járási Hivatal]),"Budapest Fõváros Kormányhivatala ","BFKH ") AS Fõoszt, Központosítottak.Mezõ7 AS Osztály, Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Központosítottak.Mezõ10 AS [Ellátott feladat], Központosítottak.Mezõ11 AS Kinevezés, "SZ" AS [Feladat jellege], Központosítottak.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], 0 AS [Heti munkaórák száma], 1 AS [Betöltés aránya], Központosítottak.[Besorolási fokozat kód:], Központosítottak.[Besorolási fokozat megnevezése:], Központosítottak.[Álláshely azonosító], Központosítottak.Mezõ17 AS [Havi illetmény], "" AS [Eu finanszírozott], "" AS [Illetmény forrása], "" AS [Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], Központosítottak.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Központosítottak.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], Központosítottak.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], "" AS [Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], "" AS [Képesítést adó végzettség], "" AS KAB, "" AS [KAB 001-3** Branch ID]
FROM Központosítottak
WHERE ((("")=True Or ("")='IIf([Neme]="Nõ";2;1)'));

#/#/#/
lkKözpontosítottakLétszámánakaMegoszlása
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, Nz([Költséghely*],[Státusz költséghelyének neve ]) AS Ktghely, Count(lkSzemélyek.Azonosító) AS Létszám
FROM tEsetiProjektbeFelveendõk RIGHT JOIN (kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel) ON tEsetiProjektbeFelveendõk.[Személy azonosítója*] = kt_azNexon_Adójel02.azNexon
WHERE (((lkSzemélyek.[Státusz típusa]) Like "Köz*"))
GROUP BY lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, Nz([Költséghely*],[Státusz költséghelyének neve ]);

#/#/#/
lkKSZDRbenNemSzereplõk
#/#/
SELECT DISTINCT bfkh([FõosztályKód]) AS BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés
FROM lkSzemélyek LEFT JOIN tKSZDR ON lkSzemélyek.[Adóazonosító jel] = tKSZDR.[Adóazonosító jel]
WHERE (((tKSZDR.[Teljes név]) Is Null) AND ((lkSzemélyek.[Státusz neve])="álláshely"))
ORDER BY bfkh([FõosztályKód]), lkSzemélyek.[Jogviszony kezdete (belépés dátuma)];

#/#/#/
lkKSZDRhibákKimenet
#/#/
SELECT IIf(Nz([lkSzemélyek].[Fõosztály],"")="",[lkKilépõUnió].[Fõosztály],[lkSzemélyek].[Fõosztály]) AS Fõoszt, IIf(Nz([lkSzemélyek].[osztály],"")="",[lkKilépõUnió].[osztály],[lkSzemélyek].[osztály]) AS Oszt, tKSZDRhibák.Név, tKSZDRhibák.Adószám, tKSZDRhibák.[KSZDR hiányzó adat], tKSZDRhibák.Megoldások, lkSzemélyek.[Jogviszony vége (kilépés dátuma)]
FROM lkKilépõUnió RIGHT JOIN (lkSzemélyek RIGHT JOIN tKSZDRhibák ON lkSzemélyek.Adójel = tKSZDRhibák.Adószám) ON lkKilépõUnió.Adójel = tKSZDRhibák.Adószám;

#/#/#/
lkktRégiHibákIntézkedésekLegutolsóIntézkedés
#/#/
SELECT lkktRégiHibákIntézkedésekUtolsóIntézkedés.HASH, lkktRégiHibákIntézkedésekUtolsóIntézkedés.azIntézkedések, lkktRégiHibákIntézkedésekUtolsóIntézkedés.IntézkedésDátuma, lkktRégiHibákIntézkedésekUtolsóIntézkedés.azIntFajta, lkktRégiHibákIntézkedésekUtolsóIntézkedés.rögzítésDátuma, lkktRégiHibákIntézkedésekUtolsóIntézkedés.Hivatkozás, lkktRégiHibákIntézkedésekUtolsóIntézkedés.IntézkedésFajta
FROM lkktRégiHibákIntézkedésekUtolsóIntézkedés
WHERE (((lkktRégiHibákIntézkedésekUtolsóIntézkedés.azIntézkedések)=(SELECT top 1 First(Tmp.azIntézkedések) AS FirstOfazIntézkedések
FROM lkktRégiHibákIntézkedésekUtolsóIntézkedés AS Tmp
WHERE (((Tmp.Hash)=[lkktRégiHibákIntézkedésekUtolsóIntézkedés].[hash]))
GROUP BY Tmp.IntézkedésDátuma, Tmp.rögzítésDátuma
ORDER BY Tmp.IntézkedésDátuma DESC , Tmp.rögzítésDátuma DESC
)));

#/#/#/
lkktRégiHibákIntézkedésekUtolsóIntézkedés
#/#/
SELECT ktRégiHibákIntézkedések.HASH, ktRégiHibákIntézkedések.azIntézkedések, lkIntézkedések.IntézkedésDátuma, lkIntézkedések.azIntFajta, ktRégiHibákIntézkedések.rögzítésDátuma, lkIntézkedések.Hivatkozás, lkIntézkedések.IntézkedésFajta
FROM lkIntézkedések INNER JOIN ktRégiHibákIntézkedések ON lkIntézkedések.azIntézkedések = ktRégiHibákIntézkedések.azIntézkedések;

#/#/#/
lkLakcímek
#/#/
SELECT DISTINCT lkSzemélyek.Adójel, Trim(Replace(IIf(Len(Nz([Tartózkodási lakcím],Nz([Állandó lakcím],"")))<2,Nz([Állandó lakcím],""),Nz([Tartózkodási lakcím],Nz([Állandó lakcím],""))),"Magyarország,","")) AS Cím, lkSzemélyek.[Állandó lakcím], lkSzemélyek.[Tartózkodási lakcím], IIf(IsNumeric(Left([Cím],1)),Left([Cím],4),0)*1 AS Irsz
FROM lkSzemélyek;

#/#/#/
lkLaktámFluktuációLista01
#/#/
SELECT Nü([tKormányhivatali_állomány].[Adóazonosító],"-") AS [Adóazonosító jel], tKormányhivatali_állomány.Név, tKormányhivatali_állomány.Mezõ6 AS Fõosztály, tHaviJelentésHatálya.hatálya, Year([MaxOfhatálya]) & ". " & Right("0" & Month([MaxOfhatálya]),2) & "." AS [Utolsó teljes hónapja a fõosztályon]
FROM (SELECT tKormányhivatali_állomány.Adóazonosító, Max(tHaviJelentésHatálya.hatálya) AS MaxOfhatálya FROM tKormányhivatali_állomány INNER JOIN tHaviJelentésHatálya ON tKormányhivatali_állomány.hatályaID = tHaviJelentésHatálya.hatályaID WHERE (((tKormányhivatali_állomány.Mezõ6)="Lakástámogatási Fõosztály")) GROUP BY tKormányhivatali_állomány.Adóazonosító)  AS MaxLaktám RIGHT JOIN (tKormányhivatali_állomány INNER JOIN tHaviJelentésHatálya ON tKormányhivatali_állomány.hatályaID = tHaviJelentésHatálya.hatályaID) ON MaxLaktám.Adóazonosító = tKormányhivatali_állomány.Adóazonosító
WHERE (((Nü(tKormányhivatali_állomány.Adóazonosító,"-"))<>"-") And ((tKormányhivatali_állomány.Mezõ6)="Lakástámogatási Fõosztály") And ((tHaviJelentésHatálya.hatályaID)=47));

#/#/#/
lkLaktámFluktuációLista02
#/#/
SELECT lkSzemélyek.[Adóazonosító jel], Nü([Fõosztály],"Kilépett: " & [Jogviszony vége (kilépés dátuma)]) AS [Jelenlegi szervezeti egysége]
FROM lkSzemélyek;

#/#/#/
lkLaktámFluktuációLista03
#/#/
SELECT lkLaktámFluktuációLista01.[Adóazonosító jel], lkLaktámFluktuációLista01.Név, lkLaktámFluktuációLista01.Fõosztály, lkLaktámFluktuációLista01.hatálya, lkLaktámFluktuációLista01.[Utolsó teljes hónapja a fõosztályon], lkLaktámFluktuációLista02.[Jelenlegi szervezeti egysége]
FROM lkLaktámFluktuációLista01 LEFT JOIN lkLaktámFluktuációLista02 ON lkLaktámFluktuációLista01.[Adóazonosító jel] = lkLaktámFluktuációLista02.[Adóazonosító jel];

#/#/#/
lkLaktámFluktuációLista04
#/#/
SELECT lkSzemélyek.[Adóazonosító jel], lkSzemélyek.[Dolgozó teljes neve] AS Név, IIf([Jogviszony vége (kilépés dátuma)] Is Null,Year([Jogviszony vége (kilépés dátuma)]) & ". " & Right("0" & Month([Jogviszony vége (kilépés dátuma)]),2) & ".",Year(Now()) & ". " & Right("0" & Month(Now()),2) & ".") AS [Utolsó teljes hónapja a fõosztályon], lkSzemélyek.Fõosztály AS [Jelenlegi szervezeti egysége]
FROM lkSzemélyek LEFT JOIN tmpLaktámFluktuációLista ON lkSzemélyek.Adójel = tmpLaktámFluktuációLista.[Adóazonosító jel]
WHERE (((lkSzemélyek.Fõosztály) Like "Lakás*") AND ((tmpLaktámFluktuációLista.[Adóazonosító jel]) Is Null));

#/#/#/
lkLegmagasabbVégzettség05
#/#/
SELECT tLegmagasabbVégzettség04.[Dolgozó azonosító], First(tLegmagasabbVégzettség04.azFok) AS FirstOfazFok
FROM tLegmagasabbVégzettség04
GROUP BY tLegmagasabbVégzettség04.[Dolgozó azonosító]
ORDER BY tLegmagasabbVégzettség04.[Dolgozó azonosító], First(tLegmagasabbVégzettség04.azFok) DESC;

#/#/#/
lkLegrégibbHibák
#/#/
SELECT tRégiHibák.[Második mezõ], tRégiHibák.[Elsõ Idõpont]
FROM tRégiHibák
WHERE ((((select max([utolsó idõpont]) from tRégiHibák ))=[Utolsó Idõpont]))
GROUP BY tRégiHibák.[Második mezõ], tRégiHibák.[Elsõ Idõpont], tRégiHibák.[Utolsó Idõpont]
ORDER BY tRégiHibák.[Elsõ Idõpont];

#/#/#/
lkLegrégibbHibák_aktív_statisztika
#/#/
SELECT TOP 10 ffsplit([Második mezõ],"|",1) AS Fõosztály, Count(tRégiHibák.[Elsõ Idõpont]) AS [Szükséges intézkedések száma]
FROM lkktRégiHibákIntézkedésekLegutolsóIntézkedés RIGHT JOIN tRégiHibák ON lkktRégiHibákIntézkedésekLegutolsóIntézkedés.HASH = tRégiHibák.[Elsõ mezõ]
WHERE ((((select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve <>"lkÜresÁlláshelyekÁllapotfelmérõ" And lekérdezésneve <>"lkFontosHiányzóAdatok02"))=[Utolsó Idõpont]) AND ((lkktRégiHibákIntézkedésekLegutolsóIntézkedés.IntézkedésFajta)="referens beavatkozását igényli" Or (lkktRégiHibákIntézkedésekLegutolsóIntézkedés.IntézkedésFajta) Is Null Or (lkktRégiHibákIntézkedésekLegutolsóIntézkedés.IntézkedésFajta)="hiba") AND ((tRégiHibák.lekérdezésNeve)<>"lkÜresÁlláshelyekÁllapotfelmérõ"))
GROUP BY ffsplit([Második mezõ],"|",1)
ORDER BY Count(tRégiHibák.[Elsõ Idõpont]) DESC;

#/#/#/
lkLegrégibbHibák_aktív_statisztika_elõkészítés
#/#/
SELECT Replace(ffsplit([Második mezõ],"|",1),"Budapest Fõváros Kormányhivatala","BFKH") AS Fõosztály, tRégiHibák.[Második mezõ], tRégiHibák.[Elsõ Idõpont], tRégiHibák.[Utolsó Idõpont]
FROM lkktRégiHibákIntézkedésekLegutolsóIntézkedés RIGHT JOIN tRégiHibák ON lkktRégiHibákIntézkedésekLegutolsóIntézkedés.HASH = tRégiHibák.[Elsõ mezõ]
WHERE ((((select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve <>"lkÜresÁlláshelyekÁllapotfelmérõ" And lekérdezésneve <>"lkFontosHiányzóAdatok02"))=[Utolsó Idõpont]) AND ((lkktRégiHibákIntézkedésekLegutolsóIntézkedés.IntézkedésFajta)="referens beavatkozását igényli" Or (lkktRégiHibákIntézkedésekLegutolsóIntézkedés.IntézkedésFajta) Is Null Or (lkktRégiHibákIntézkedésekLegutolsóIntézkedés.IntézkedésFajta)="hiba") AND ((tRégiHibák.lekérdezésNeve)<>"lkÜresÁlláshelyekÁllapotfelmérõ" And (tRégiHibák.lekérdezésNeve)<>"lkFontosHiányzóAdatok02"))
ORDER BY tRégiHibák.[Elsõ Idõpont];

#/#/#/
lkLegrégibbHibák_aktív_statisztika2
#/#/
SELECT lkLegrégibbHibák_aktív_statisztika_elõkészítés.Fõosztály, Round(Max([Utolsó Idõpont]-[Elsõ Idõpont]),0) AS [Legrégebbi hiba (nap)], Round(Avg([Utolsó idõpont]-[Elsõ Idõpont]),0) AS [Átlag (nap)], Count(lkLegrégibbHibák_aktív_statisztika_elõkészítés.[Elsõ Idõpont]) AS [Hibák száma (db)], Round(Sum([Utolsó idõpont]-[Elsõ Idõpont]),0) AS Súlyosság
FROM lkLegrégibbHibák_aktív_statisztika_elõkészítés
GROUP BY lkLegrégibbHibák_aktív_statisztika_elõkészítés.Fõosztály
ORDER BY Round(Max([Utolsó Idõpont]-[Elsõ Idõpont]),0) DESC , Round(Sum([Utolsó idõpont]-[Elsõ Idõpont]),0) DESC , Count(lkLegrégibbHibák_aktív_statisztika_elõkészítés.[Elsõ Idõpont]) DESC;

#/#/#/
lkLegrégibbHibák_aktív_statisztika3
#/#/
SELECT lkLegrégibbHibák_aktív_statisztika_elõkészítés.Fõosztály, Round(Max(([Utolsó idõpont]-[Elsõ Idõpont])),0) AS [Legrégebbi hiba (nap)], Round(Avg([Utolsó idõpont]-[Elsõ Idõpont]),0) AS [Átlag (nap)], Count(lkLegrégibbHibák_aktív_statisztika_elõkészítés.[Elsõ Idõpont]) AS [Hibák száma (db)], Round(Sum([Utolsó idõpont]-[Elsõ Idõpont]),0) AS Súlyosság
FROM lkLegrégibbHibák_aktív_statisztika_elõkészítés
GROUP BY lkLegrégibbHibák_aktív_statisztika_elõkészítés.Fõosztály
HAVING (((Round(Sum([Utolsó idõpont]-[Elsõ Idõpont]),0))>=1000))
ORDER BY Round(Sum([Utolsó idõpont]-[Elsõ Idõpont]),0) DESC , Count(lkLegrégibbHibák_aktív_statisztika_elõkészítés.[Elsõ Idõpont]) DESC , Round(Avg([Utolsó idõpont]-[Elsõ Idõpont]),0) DESC;

#/#/#/
lkLegrégibbHibák_statisztika
#/#/
SELECT TOP 100 ffsplit([Második mezõ],"|",1) AS Fõosztály, Count(lkLegrégibbHibák_statisztika_elõkészítés.[Elsõ Idõpont]) AS [Szükséges intézkedések száma]
FROM lkLegrégibbHibák_statisztika_elõkészítés
GROUP BY ffsplit([Második mezõ],"|",1)
ORDER BY Count(lkLegrégibbHibák_statisztika_elõkészítés.[Elsõ Idõpont]) DESC;

#/#/#/
lkLegrégibbHibák_statisztika_elõkészítés
#/#/
SELECT tRégiHibák.[Második mezõ], tRégiHibák.[Elsõ Idõpont]
FROM tRégiHibák
WHERE ((((select max([utolsó idõpont]) from tRégiHibák ))=[Utolsó Idõpont]) AND (((select min([elsõ idõpont]) from lkLegrégibbHibák ))=[Elsõ Idõpont]))
GROUP BY tRégiHibák.[Második mezõ], tRégiHibák.[Elsõ Idõpont], tRégiHibák.[Utolsó Idõpont]
ORDER BY tRégiHibák.[Elsõ Idõpont];

#/#/#/
lkLegrégibbHibák_teljes_statisztika
#/#/
SELECT TOP 10 ffsplit([Második mezõ],"|",1) AS Fõosztály, Count(lkLegrégibbHibák.[Elsõ Idõpont]) AS [Szükséges intézkedések száma]
FROM lkLegrégibbHibák
GROUP BY ffsplit([Második mezõ],"|",1)
ORDER BY Count(lkLegrégibbHibák.[Elsõ Idõpont]) DESC;

#/#/#/
lkLejáróHatáridõk
#/#/
SELECT tLejáróHatáridõk.[Szervezeti egység kód], tLejáróHatáridõk.[Szervezeti egység], tLejáróHatáridõk.[Szervezeti szint száma-neve], tLejáróHatáridõk.[Jogviszony típus], dtátal([tLejáróHatáridõk].[Jogviszony kezdete]) AS [Jogviszony kezdete], dtátal([tLejáróHatáridõk].[Jogviszony vége]) AS [Jogviszony vége], tLejáróHatáridõk.[Dolgozó neve], tLejáróHatáridõk.[Adóazonosító jel], tLejáróHatáridõk.[Figyelendõ dátum típusa], dtátal([tLejáróHatáridõk].[Figyelendõ dátum]) AS [Figyelendõ dátum], tLejáróHatáridõk.[Szint 1 szervezeti egység kód], tLejáróHatáridõk.[Szint 1 szervezeti egység név], tLejáróHatáridõk.[Szint 2 szervezeti egység kód], tLejáróHatáridõk.[Szint 2 szervezeti egység név], tLejáróHatáridõk.[Szint 3 szervezeti egység kód], tLejáróHatáridõk.[Szint 3 szervezeti egység név], tLejáróHatáridõk.[Szint 4 szervezeti egység kód], tLejáróHatáridõk.[Szint 4 szervezeti egység név], tLejáróHatáridõk.[Szint 5 szervezeti egység kód], tLejáróHatáridõk.[Szint 5 szervezeti egység név], tLejáróHatáridõk.[Szint 6 szervezeti egység kód], tLejáróHatáridõk.[Szint 6 szervezeti egység név], tLejáróHatáridõk.[Szint 7 szervezeti egység kód], tLejáróHatáridõk.[Szint 7 szervezeti egység név], tLejáróHatáridõk.[Szint 8 szervezeti egység kód], tLejáróHatáridõk.[Szint 8 szervezeti egység név], tLejáróHatáridõk.[Szint 9 szervezeti egység kód], tLejáróHatáridõk.[Szint 9 szervezeti egység név], tLejáróHatáridõk.[Szint 10 szervezeti egység kód], tLejáróHatáridõk.[Szint 10 szervezeti egység név]
FROM tLejáróHatáridõk;

#/#/#/
lkLejáróHatáridõk1
#/#/
SELECT tLejáróHatáridõk.[Szervezeti egység kód], tLejáróHatáridõk.[Szervezeti egység], tLejáróHatáridõk.[Szervezeti szint száma-neve], tLejáróHatáridõk.[Jogviszony típus], dtátal([tLejáróHatáridõk].[Jogviszony kezdete]) AS [Jogviszony kezdete], dtátal([tLejáróHatáridõk].[Jogviszony vége]) AS [Jogviszony vége], tLejáróHatáridõk.[Dolgozó neve], tLejáróHatáridõk.[Adóazonosító jel], tLejáróHatáridõk.[Figyelendõ dátum típusa], dtátal([tLejáróHatáridõk].[Figyelendõ dátum]) AS [Figyelendõ dátum], tLejáróHatáridõk.[Szint 1 szervezeti egység kód], tLejáróHatáridõk.[Szint 1 szervezeti egység név], tLejáróHatáridõk.[Szint 2 szervezeti egység kód], tLejáróHatáridõk.[Szint 2 szervezeti egység név], tLejáróHatáridõk.[Szint 3 szervezeti egység kód], tLejáróHatáridõk.[Szint 3 szervezeti egység név], tLejáróHatáridõk.[Szint 4 szervezeti egység kód], tLejáróHatáridõk.[Szint 4 szervezeti egység név], tLejáróHatáridõk.[Szint 5 szervezeti egység kód], tLejáróHatáridõk.[Szint 5 szervezeti egység név], tLejáróHatáridõk.[Szint 6 szervezeti egység kód], tLejáróHatáridõk.[Szint 6 szervezeti egység név], tLejáróHatáridõk.[Szint 7 szervezeti egység kód], tLejáróHatáridõk.[Szint 7 szervezeti egység név], tLejáróHatáridõk.[Szint 8 szervezeti egység kód], tLejáróHatáridõk.[Szint 8 szervezeti egység név], tLejáróHatáridõk.[Szint 9 szervezeti egység kód], tLejáróHatáridõk.[Szint 9 szervezeti egység név], tLejáróHatáridõk.[Szint 10 szervezeti egység kód], tLejáróHatáridõk.[Szint 10 szervezeti egység név]
FROM tLejáróHatáridõk;

#/#/#/
lkLejártAlkalmasságiÉrvényesség
#/#/
SELECT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Orvosi vizsgálat következõ idõpontja], kt_azNexon_Adójel02.NLink AS NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Orvosi vizsgálat következõ idõpontja])<DateSerial(Year(Date()),Month(Date())-11,1)-1) AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkSzemélyek.[státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkLejártAlkalmasságiÉrvényesség1
#/#/
SELECT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Orvosi vizsgálat következõ idõpontja], kt_azNexon_Adójel02.NLink AS NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Orvosi vizsgálat következõ idõpontja])<DateSerial(Year(Date()),Month(Date())-11,1)-1) AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkSzemélyek.[státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkLekérdezésekMezõinekSzáma
#/#/
SELECT lkEllenõrzõLekérdezések2.EllenõrzõLekérdezés, Count(MSysQueries.Attribute) AS CountOfAttribute
FROM lkEllenõrzõLekérdezések2 INNER JOIN (MSysObjects INNER JOIN MSysQueries ON MSysObjects.Id = MSysQueries.ObjectId) ON lkEllenõrzõLekérdezések2.EllenõrzõLekérdezés = MSysObjects.Name
WHERE (((MSysQueries.Attribute)=6) AND ((lkEllenõrzõLekérdezések2.Kimenet)=True))
GROUP BY lkEllenõrzõLekérdezések2.EllenõrzõLekérdezés;

#/#/#/
lkLekérdezésekTípusokCsoportok
#/#/
SELECT nSelect([EllenõrzõLekérdezés]) AS db, tLekérdezésTípusok.Osztály, tLekérdezésTípusok.LapNév, tLekérdezésTípusok.Megjegyzés, tEllenõrzõLekérdezések.EllenõrzõLekérdezés, tUnionCsoportok.azUnion
FROM tUnionCsoportok RIGHT JOIN (tLekérdezésTípusok RIGHT JOIN tEllenõrzõLekérdezések ON tLekérdezésTípusok.azETípus = tEllenõrzõLekérdezések.azETípus) ON tUnionCsoportok.azUnion = tEllenõrzõLekérdezések.azUnion
ORDER BY tLekérdezésTípusok.Osztály, tLekérdezésTípusok.LapNév;

#/#/#/
lkLekérdezésekTípusokCsoportok_allekérdezésCsoportokSzáma
#/#/
SELECT Count(DistinctlkLekérdezésekTípusokCsoportok.azUnion) AS AlLekérdezésCsoportokSzáma
FROM (SELECT DISTINCT lkLekérdezésekTípusokCsoportok.[azUnion] FROM lkLekérdezésekTípusokCsoportok WHERE (((lkLekérdezésekTípusokCsoportok.[azUnion]) Is Not Null)))  AS DistinctlkLekérdezésekTípusokCsoportok;

#/#/#/
lkLekérdezésTípusok
#/#/
SELECT tLekérdezésTípusok.azETípus, tLekérdezésTípusok.LapNév AS Fejezet, tLekérdezésOsztályok.Osztály AS Oldal, tLekérdezésTípusok.Sorrend, tLekérdezésTípusok.Megjegyzés, tLekérdezésTípusok.vbaPostProcessing, tLekérdezésTípusok.azVisszajelzésTípusCsoport, tLekérdezésOsztályok.Sorrend
FROM tLekérdezésOsztályok INNER JOIN tLekérdezésTípusok ON tLekérdezésOsztályok.azOsztály = tLekérdezésTípusok.Osztály
ORDER BY tLekérdezésOsztályok.Osztály, tLekérdezésOsztályok.Sorrend, IIf([tLekérdezésTípusok].[Sorrend] Is Null,999,[tLekérdezésTípusok].[Sorrend]), tLekérdezésTípusok.LapNév;

#/#/#/
lkLétreNemJöttJogviszony
#/#/
SELECT DISTINCT lkKilépõUnió.Adóazonosító, kt_azNexon_Adójel02.azNexon, "?" AS [Jogviszony sorszáma]
FROM lkKilépõUnió LEFT JOIN kt_azNexon_Adójel02 ON lkKilépõUnió.Adójel = kt_azNexon_Adójel02.Adójel
WHERE (((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva])="Létre nem jött jogviszony") AND ((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva])>=DateSerial(Year(Date()),1,1)));

#/#/#/
lkLétreNemJöttJogviszony_SMAX
#/#/
SELECT DISTINCT tSzemélyek.Adójel, kt_azNexon_Adójel.azNexon, tSzemélyek.[Jogviszony sorszáma]
FROM kt_azNexon_Adójel INNER JOIN tSzemélyek ON kt_azNexon_Adójel.Adójel = tSzemélyek.Adójel
WHERE (((tSzemélyek.[HR kapcsolat megszûnés módja (Kilépés módja)])="Létre nem jött jogviszony"));

#/#/#/
lkLétszámBelépésKiépésJogviszony
#/#/
SELECT tSzemélyek.[Jogviszony típusa / jogviszony típus] AS Jogviszony, tSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés, IIf(dtÁtal([Jogviszony vége (kilépés dátuma)])=0,#1/1/3000#,dtÁtal([Jogviszony vége (kilépés dátuma)])) AS Kilépés, 1 AS Létszám
FROM tSzemélyek
WHERE (((tSzemélyek.[Jogviszony típusa / jogviszony típus])<>"Személyes jelenlét" And (tSzemélyek.[Jogviszony típusa / jogviszony típus])<>"Megbízásos"));

#/#/#/
lkLétszámBesorolásonkéntHavibólAlaplétszám
#/#/
SELECT lk_HavibólÁlláshelyek.Tábla AS Zóna, lk_HavibólÁlláshelyek.[Az álláshely megynevezése] AS Besorolás_bemenet, lk_HavibólÁlláshelyek.[Álláshely száma] AS Nexonban
FROM lk_HavibólÁlláshelyek
WHERE (((lk_HavibólÁlláshelyek.Tábla)="Alaplétszám"))
ORDER BY lk_HavibólÁlláshelyek.Azonosító;

#/#/#/
lkLétszámBesorolásonkéntHavibólAlaplétszámÖssz
#/#/
SELECT lkLétszámBesorolásonkéntHavibólAlaplétszám.Zóna, "Alaplétszám összesen:" AS Besorolás_bemenet, Sum(lkLétszámBesorolásonkéntHavibólAlaplétszám.Nexonban) AS SumOfNexonban
FROM lkLétszámBesorolásonkéntHavibólAlaplétszám
GROUP BY lkLétszámBesorolásonkéntHavibólAlaplétszám.Zóna, "Alaplétszám összesen:";

#/#/#/
lkLétszámBesorolásonkéntHavibólKözpontosított
#/#/
SELECT lk_HavibólÁlláshelyek.Tábla AS Zóna, lk_HavibólÁlláshelyek.[Az álláshely megynevezése] AS Besorolás_bemenet, lk_HavibólÁlláshelyek.[Álláshely száma] AS Nexonban
FROM lk_HavibólÁlláshelyek
WHERE (((lk_HavibólÁlláshelyek.Tábla)="Központosított"))
ORDER BY lk_HavibólÁlláshelyek.Azonosító;

#/#/#/
lkLétszámBesorolásonkéntHavibólKözpontosítottÖssz
#/#/
SELECT lkLétszámBesorolásonkéntHavibólKözpontosított.Zóna, "Központosított összesen:" AS Besorolás_bemenet, Sum(lkLétszámBesorolásonkéntHavibólKözpontosított.Nexonban) AS SumOfNexonban
FROM lkLétszámBesorolásonkéntHavibólKözpontosított
GROUP BY lkLétszámBesorolásonkéntHavibólKözpontosított.Zóna, "Központosított összesen:";

#/#/#/
lkLétszámBesorolásonkéntHavibólMindösszesen
#/#/
SELECT "Mindösszesen" AS Zóna, lkLétszámBesorolásonkéntHavibólAlaplétszámÉsKözpontosított.Besorolás_bemenet, Sum(lkLétszámBesorolásonkéntHavibólAlaplétszámÉsKözpontosított.Nexonban) AS SumOfNexonban
FROM (SELECT lkLétszámBesorolásonkéntHavibólKözpontosított.Zóna, lkLétszámBesorolásonkéntHavibólKözpontosított.Besorolás_bemenet, lkLétszámBesorolásonkéntHavibólKözpontosított.Nexonban
FROM lkLétszámBesorolásonkéntHavibólKözpontosított
UNION
SELECT lkLétszámBesorolásonkéntHavibólAlaplétszám.Zóna, lkLétszámBesorolásonkéntHavibólAlaplétszám.Besorolás_bemenet, lkLétszámBesorolásonkéntHavibólAlaplétszám.Nexonban
FROM lkLétszámBesorolásonkéntHavibólAlaplétszám
)  AS lkLétszámBesorolásonkéntHavibólAlaplétszámÉsKözpontosított
GROUP BY "Mindösszesen", lkLétszámBesorolásonkéntHavibólAlaplétszámÉsKözpontosított.Besorolás_bemenet;

#/#/#/
lkLétszámBesorolásonkéntHavibólMindösszesenÖssz
#/#/
SELECT lkLétszámBesorolásonkéntHavibólMindösszesen.Zóna, "Mindösszesen összesen:" AS Besorolás_bemenet, Sum(lkLétszámBesorolásonkéntHavibólMindösszesen.SumOfNexonban) AS SumOfSumOfNexonban
FROM lkLétszámBesorolásonkéntHavibólMindösszesen
GROUP BY lkLétszámBesorolásonkéntHavibólMindösszesen.Zóna, "Mindösszesen összesen:";

#/#/#/
lkLétszámBesorolásonkéntHavibólUNIÓ
#/#/
SELECT HatRészesUnió.Sor, HatRészesUnió.Zóna, tBesorolásKonverzió.ÁNYRbõl AS Besorolás, HatRészesUnió.Nexonban
FROM tBesorolásKonverzió INNER JOIN (SELECT *, 3 as Sor FROM lkLétszámBesorolásonkéntHavibólKözpontosított  UNION SELECT *, 5 as Sor FROM lkLétszámBesorolásonkéntHavibólMindösszesen  UNION SELECT *, 1 as Sor FROM lkLétszámBesorolásonkéntHavibólAlaplétszám  UNION SELECT *, 2 as Sor FROM lkLétszámBesorolásonkéntHavibólAlaplétszámÖssz  UNION SELECT *, 4 as Sor FROM lkLétszámBesorolásonkéntHavibólKözpontosítottÖssz  UNION SELECT *, 6 as Sor FROM lkLétszámBesorolásonkéntHavibólMindösszesenÖssz )  AS HatRészesUnió ON tBesorolásKonverzió.Haviból=HatRészesUnió.Besorolás_bemenet;

#/#/#/
lkLétszámEngedéllyelValóÖsszevetés_Eredmény
#/#/
SELECT (Select max(SorszámEng) From tEngedéllyelValóÖsszevetésTábla)-[SorszámEng]+(IIf([tEngedéllyelValóÖsszevetésTábla].[Zóna]="Alaplétszám",0,IIf([tEngedéllyelValóÖsszevetésTábla].[zóna]="Központosított",12,24))) AS Sorszám, tEngedéllyelValóÖsszevetésTábla.Magyarázat, tEngedéllyelValóÖsszevetésTábla.Zóna AS Keret, tEngedéllyelValóÖsszevetésTábla.Besorolás_bemenet AS Besorolás, tEngedéllyelValóÖsszevetésTábla.Engedélyezett, tEngedéllyelValóÖsszevetésTábla.Betöltött, tEngedéllyelValóÖsszevetésTábla.Üres, tEngedéllyelValóÖsszevetésTábla.[Összes álláshely], ([Nexonban]) AS [Nexonban összesen], ([Összes álláshely]-[Nexonban]) AS Eltérés
FROM lkLétszámBesorolásonkéntHavibólUNIÓ RIGHT JOIN tEngedéllyelValóÖsszevetésTábla ON (lkLétszámBesorolásonkéntHavibólUNIÓ.Besorolás = tEngedéllyelValóÖsszevetésTábla.Besorolás_bemenet) AND (lkLétszámBesorolásonkéntHavibólUNIÓ.Zóna = tEngedéllyelValóÖsszevetésTábla.Zóna);

#/#/#/
lkLétszámFõosztályonkéntOsztályonként20230101
#/#/
SELECT lkTTLétszámFõosztályonkéntOsztályonként2023.Fõosztály, lkTTLétszámFõosztályonkéntOsztályonként2023.Osztály, 0 AS TTLétszám2021, 0 AS TTLétszám2022, 0 AS TTLétszám2023, Sum(lkTTLétszámFõosztályonkéntOsztályonként2023.Létszám2023) AS SumOfLétszám2023
FROM lkTTLétszámFõosztályonkéntOsztályonként2023
GROUP BY lkTTLétszámFõosztályonkéntOsztályonként2023.Fõosztály, lkTTLétszámFõosztályonkéntOsztályonként2023.Osztály, 0, 0, 0;

#/#/#/
lkLétszámMindenÉvUtolsóNapján
#/#/
SELECT Year([hatálya]) AS Év, Count(lkÁllománytáblákTörténetiUniója.Adóazonosító) AS CountOfAdóazonosító
FROM lkÁllománytáblákTörténetiUniója INNER JOIN tHaviJelentésHatálya1 ON lkÁllománytáblákTörténetiUniója.hatályaID = tHaviJelentésHatálya1.hatályaID
WHERE (((Year([hatálya])) Between 2019 And 2023) AND ((Month([hatálya]))=12) AND ((Day([hatálya]))=31) AND ((lkÁllománytáblákTörténetiUniója.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h]) Not Like "*TT*") AND ((lkÁllománytáblákTörténetiUniója.Adóazonosító) Is Not Null) AND ((lkÁllománytáblákTörténetiUniója.[Születési év \ üres állás])<>"üres állás") AND ((lkÁllománytáblákTörténetiUniója.Fõoszt) Like Nz([Fõosztály_],"") & "*")) OR (((Year([hatálya]))=2024) AND ((Month([hatálya]))=9) AND ((Day([hatálya]))=30) AND ((lkÁllománytáblákTörténetiUniója.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h]) Not Like "*TT*") AND ((lkÁllománytáblákTörténetiUniója.Adóazonosító) Is Not Null) AND ((lkÁllománytáblákTörténetiUniója.[Születési év \ üres állás])<>"üres állás") AND ((lkÁllománytáblákTörténetiUniója.Fõoszt) Like Nz([Fõosztály_],"") & "*"))
GROUP BY Year([hatálya]);

#/#/#/
lkLétszámokNevezetesNapokon01
#/#/
SELECT lkKiemeltNapok.KiemeltNapok, lkLétszámBelépésKiépésJogviszony.Jogviszony, Sum(lkLétszámBelépésKiépésJogviszony.Létszám) AS SumOfLétszám
FROM lkLétszámBelépésKiépésJogviszony, lkKiemeltNapok
WHERE (((lkKiemeltNapok.Nap)=IIf([hó]=1,31,28)) AND ((lkKiemeltNapok.Év)=21) AND (("######### A JOIN mûveletet szétszedi, ezért WHERE feltételt használunk! #################")<>False) AND ((lkKiemeltNapok.KiemeltNapok) Between [lkLétszámBelépésKiépésJogviszony].[Belépés] And [lkLétszámBelépésKiépésJogviszony].[Kilépés]))
GROUP BY lkKiemeltNapok.KiemeltNapok, lkLétszámBelépésKiépésJogviszony.Jogviszony, lkLétszámBelépésKiépésJogviszony.Létszám;

#/#/#/
lkLétszámokNevezetesNapokonÛrlaphoz01B
#/#/
SELECT lkKiemeltNapok.KiemeltNapok, lkLétszámBelépésKiépésJogviszony.Jogviszony, Sum(lkLétszámBelépésKiépésJogviszony.Létszám) AS SumOfLétszám
FROM lkLétszámBelépésKiépésJogviszony, lkKiemeltNapok
WHERE (((lkLétszámBelépésKiépésJogviszony.Jogviszony) Like [Ûrlapok]![ûLétszámKiemeltNapokonB]![Jogviszony] & "*") AND ((lkKiemeltNapok.Nap)=[Ûrlapok]![ûLétszámKiemeltNapokonB]![VálasztottNap]) AND (("######### A JOIN mûveletet szétszedi, ezért WHERE feltételt használunk! #################")<>False) AND ((lkKiemeltNapok.KiemeltNapok) Between [lkLétszámBelépésKiépésJogviszony].[Belépés] And [lkLétszámBelépésKiépésJogviszony].[Kilépés]))
GROUP BY lkKiemeltNapok.KiemeltNapok, lkLétszámBelépésKiépésJogviszony.Jogviszony, lkLétszámBelépésKiépésJogviszony.Létszám;

#/#/#/
lkLétszámokNevezetesNapokonÛrlaphoz02B
#/#/
SELECT lkLétszámokNevezetesNapokonÛrlaphoz01b.KiemeltNapok, lkLétszámokNevezetesNapokonÛrlaphoz01b.Jogviszony, lkLétszámokNevezetesNapokonÛrlaphoz01b.SumOfLétszám
FROM lkLétszámokNevezetesNapokonÛrlaphoz01b
WHERE (((lkLétszámokNevezetesNapokonÛrlaphoz01b.KiemeltNapok) Between [Ûrlapok]![ûLétszámKiemeltNapokonB]![Kezdõév] And [Ûrlapok]![ûLétszámKiemeltNapokonB]![VégeÉv]));

#/#/#/
lkLétszámStatisztikaÖsszetett
#/#/
SELECT 
FROM lkDolgozókLétszáma18ÉvAlattiGyermekkel, lkNõkLétszáma02, lkNõkLétszáma6ÉvAlattiGyermekkel;

#/#/#/
lkLezártFeladatkörhözRendeltDolgozókFõosztályonként
#/#/
SELECT DISTINCT lkSzemélyek.FõosztályKód, lkSzemélyek.Fõosztály, Count(lkSzemélyek.Azonosító) AS Létszám
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Elsõdleges feladatkör]) Like "Lezárt*"))
GROUP BY lkSzemélyek.FõosztályKód, lkSzemélyek.Fõosztály
ORDER BY lkSzemélyek.FõosztályKód;

#/#/#/
lkMásBesorolásúOsztályvezetõk
#/#/
SELECT lkOsztályvezetõiÁlláshelyek.Fõosztály, lkOsztályvezetõiÁlláshelyek.Osztály, lkOsztályvezetõiÁlláshelyek.[Dolgozó teljes neve], lkOsztályvezetõiÁlláshelyek.[Besorolási  fokozat (KT)] AS Besorolás, lkOsztályvezetõiÁlláshelyek.[Vezetõi beosztás megnevezése], lkOsztályvezetõiÁlláshelyek.[Tartós távollét típusa], lkOsztályvezetõiÁlláshelyek.álláshely, lkOsztályvezetõiÁlláshelyek.NLink
FROM lkOsztályvezetõiÁlláshelyek
WHERE (((lkOsztályvezetõiÁlláshelyek.[Besorolási  fokozat (KT)]) Not Like "*Osztályvezetõ" Or (lkOsztályvezetõiÁlláshelyek.[Besorolási  fokozat (KT)]) Is Null) AND ((lkOsztályvezetõiÁlláshelyek.[Vezetõi beosztás megnevezése]) Like "*Osztályvezetõ")) OR (((lkOsztályvezetõiÁlláshelyek.[Besorolási  fokozat (KT)]) Like "*Osztályvezetõ") AND ((lkOsztályvezetõiÁlláshelyek.[Vezetõi beosztás megnevezése]) Not Like "*Osztályvezetõ" Or (lkOsztályvezetõiÁlláshelyek.[Vezetõi beosztás megnevezése]) Is Null)) OR (((lkOsztályvezetõiÁlláshelyek.[Besorolási  fokozat (KT)]) Not Like "*kerületi*") AND ((lkOsztályvezetõiÁlláshelyek.[Vezetõi beosztás megnevezése]) Like "*kerületi*")) OR (((lkOsztályvezetõiÁlláshelyek.[Besorolási  fokozat (KT)]) Like "*kerületi*") AND ((lkOsztályvezetõiÁlláshelyek.[Vezetõi beosztás megnevezése]) Not Like "*kerületi*"))
ORDER BY lkOsztályvezetõiÁlláshelyek.bfkh;

#/#/#/
lkMeghagyás01
#/#/
SELECT tMeghagyandókAránya.Azonosító, tMeghagyandókAránya.Fõosztály, lkSzervezetiBetöltések.FõosztályKód, lkSzervezetiBetöltések.[Szülõ szervezeti egységének kódja], 1 AS Létszám, tMeghagyandókAránya.Meghagyandó AS [Meghagyandó%], lkSzervezetiBetöltések.[Szervezetmenedzsment kód]
FROM lkSzemélyek INNER JOIN (tMeghagyandókAránya INNER JOIN lkSzervezetiBetöltések ON tMeghagyandókAránya.[Szervezeti egység kódja] = lkSzervezetiBetöltések.FõosztályKód) ON lkSzemélyek.[Adóazonosító jel] = lkSzervezetiBetöltések.[Szervezetmenedzsment kód];

#/#/#/
lkMeghagyás01_régi
#/#/
SELECT tMeghagyandókAránya.Azonosító, tMeghagyandókAránya.Fõosztály, lkSzervezetiBetöltések.FõosztályKód, lkSzervezetiBetöltések.[Szülõ szervezeti egységének kódja], 1 AS Létszám, tMeghagyandókAránya.Meghagyandó AS [Meghagyandó%], lkSzervezetiBetöltések.[Szervezetmenedzsment kód]
FROM lkSzemélyek INNER JOIN (tMeghagyandókAránya INNER JOIN lkSzervezetiBetöltések ON tMeghagyandókAránya.[Szervezeti egység kódja] = lkSzervezetiBetöltések.FõosztályKód) ON lkSzemélyek.[Adóazonosító jel] = lkSzervezetiBetöltések.[Szervezetmenedzsment kód]
WHERE (((lkSzemélyek.[Besorolási  fokozat (KT)])<>"Fõosztályvezetõ" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Osztályvezetõ" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Járási / kerületi hivatal vezetõje" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Járási / kerületi hivatal vezetõjének helyettese" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Fõispán" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Kormányhivatal fõigazgatója" And (lkSzemélyek.[Besorolási  fokozat (KT)])<>"Kormányhivatal igazgatója") AND ((Year(Now())-Year([Születési idõ])) Between 18 And 65) AND ((lkSzemélyek.Neme)=("férfi")));

#/#/#/
lkMeghagyás02
#/#/
SELECT lkMeghagyás01.Azonosító, lkMeghagyás01.FõosztályKód, lkMeghagyás01.Fõosztály, Sum(lkMeghagyás01.Létszám) AS SumOfLétszám, lkMeghagyás01.[Meghagyandó%], Sum([Létszám]*[Meghagyandó%]/100) AS [Meghagyandó létszám]
FROM lkMeghagyás01
GROUP BY lkMeghagyás01.Azonosító, lkMeghagyás01.FõosztályKód, lkMeghagyás01.Fõosztály, lkMeghagyás01.[Meghagyandó%];

#/#/#/
lkMeghagyás03
#/#/
SELECT lkMeghagyás02.Azonosító, lkMeghagyás02.FõosztályKód, lkMeghagyás02.Fõosztály, lkMeghagyás02.SumOfLétszám, lkMeghagyás02.[Meghagyandó%], Round([Meghagyandó létszám]) AS Meghagyandók INTO tMeghagyás03
FROM lkMeghagyás02;

#/#/#/
lkMeghagyásB01
#/#/
SELECT DISTINCT lkSzervezetiBetöltések.FõosztályKód, tBesorolás_átalakító.Sorrend, lkSzervezetiBetöltések.[Státuszának kódja], Replace([Státuszának kódja],"S-","")*1 AS Szám, lkSzemélyek.[Dolgozó teljes neve] INTO tMeghagyásB01
FROM ((lkSzervezetiBetöltések INNER JOIN lkSzemélyek ON lkSzervezetiBetöltések.[Szervezetmenedzsment kód] = lkSzemélyek.[Adóazonosító jel]) INNER JOIN tBesorolás_átalakító ON lkSzemélyek.Besorolás2 = tBesorolás_átalakító.Besorolási_fokozat) INNER JOIN tMeghagyásraKijelöltMunkakörök ON lkSzemélyek.[KIRA feladat megnevezés] = tMeghagyásraKijelöltMunkakörök.Feladatkörök
WHERE (((Year(Now())-Year([Születési idõ])) Between 18 And 65) AND ((lkSzemélyek.Neme)="férfi"));

#/#/#/
lkMeghagyásB02
#/#/
SELECT tMeghagyásB01.FõosztályKód, tMeghagyásB01.Sorrend AS Besorolás, tMeghagyásB01.Szám, tMeghagyásB01.[Státuszának kódja], DCount("*","tMeghagyásB01","FõosztályKód = '" & [FõosztályKód] & "' AND sorrend < " & [sorrend])+DCount("*","tMeghagyásB01","FõosztályKód = '" & [FõosztályKód] & "' AND sorrend = " & [sorrend] & " AND Szám < " & [Szám])+1 AS Sorszám3 INTO tMeghagyásB02
FROM tMeghagyásB01
ORDER BY tMeghagyásB01.FõosztályKód, tMeghagyásB01.Sorrend, tMeghagyásB01.Szám;

#/#/#/
lkMeghagyásEredmény
#/#/
SELECT lkMeghagyásÚjEredmény.[TAJ szám], ffsplit([Dolgozó születési neve]," ",1) AS [Születési név1], ffsplit([Dolgozó születési neve]," ",2) AS [Születési név2], IIf(ffsplit([Dolgozó születési neve]," ",3)=ffsplit([Dolgozó születési neve]," ",2) Or Left(ffsplit([Dolgozó születési neve]," ",3),1)="(","",ffsplit([Dolgozó születési neve]," ",3)) AS [Születési név3], IIf(InStr(1,[Dolgozó teljes neve],"dr.",0),"dr.",IIf(InStr(1,[Dolgozó teljes neve],"Dr.",0),"Dr.","")) AS Elõtag, ffsplit([Dolgozó teljes neve]," ",1) AS [Házassági név1], ffsplit([Dolgozó teljes neve]," ",2) AS [Házassági név2], IIf(ffsplit([Dolgozó teljes neve]," ",3)=ffsplit([Dolgozó teljes neve]," ",2) Or Left(ffsplit([Dolgozó teljes neve]," ",3),1)="(" Or Left(ffsplit([Dolgozó teljes neve]," ",3),3)="dr." Or Left(ffsplit([Dolgozó teljes neve]," ",3),3)="Dr.","",ffsplit([Dolgozó teljes neve]," ",3)) AS [Házassági név3], drLeválaszt([Anyja neve]) & " " & ffsplit(drLeválaszt([Anyja neve],False)," ",1) AS [Anyja neve1], ffsplit(drLeválaszt([Anyja neve],False)," ",2) AS [Anyja neve2], IIf(ffsplit(drLeválaszt([Anyja neve],False)," ",3)=ffsplit(drLeválaszt([Anyja neve],False)," ",2) Or Left(ffsplit(drLeválaszt([Anyja neve],False)," ",3),1)="(","",ffsplit(drLeválaszt([Anyja neve],False)," ",3)) AS [Anyja neve3], lkMeghagyásÚjEredmény.[Születési idõ], lkMeghagyásÚjEredmény.[Születési hely], lkMeghagyásÚjEredmény.Feladatkörök AS munkakör
FROM lkMeghagyásÚjEredmény;

#/#/#/
lkMeghagyásEredmény_ÁllományTáblaSzerûen
#/#/
SELECT tMeghagyás03.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], tMeghagyásB02.[Státuszának kódja] AS ÁNYR, lkSzemélyek.[KIRA feladat megnevezés], tMeghagyás03.CountOfLétszám AS Betöltött, tMeghagyás03.[Meghagyandó%], tMeghagyás03.Meghagyandók, [CountOfLétszám]-[Meghagyandók] AS MegNemHagyandók, tMeghagyásB02.Sorszám3, IIf([Sorszám3]<=([CountOfLétszám]-[Meghagyandók]),"Nem kerül meghagyásra",IIf([Szervezeti egység kódja]="BFKH.1.27.2.","Nem kerül meghagyásra","Meghagyandó")) AS Eredmény
FROM lkSzemélyek RIGHT JOIN (tMeghagyás03 RIGHT JOIN tMeghagyásB02 ON tMeghagyás03.FõosztályKód = tMeghagyásB02.FõosztályKód) ON lkSzemélyek.[Státusz kódja] = tMeghagyásB02.[Státuszának kódja]
ORDER BY lkSzemélyek.BFKH, tMeghagyásB02.Sorszám3;

#/#/#/
lkMeghagyásEredmény_régi
#/#/
SELECT lkSzemélyek.[TAJ szám], lkSzemélyek.[Dolgozó születési neve] AS [Születési név], lkSzemélyek.[Dolgozó teljes neve] AS [Házassági név], lkSzemélyek.[Anyja neve], lkSzemélyek.[Születési idõ], lkSzemélyek.[Születési hely], lkSzemélyek.[KIRA feladat megnevezés] AS munkakör, tMeghagyásB02.Besorolás
FROM lkSzemélyek RIGHT JOIN (tMeghagyás03 RIGHT JOIN tMeghagyásB02 ON tMeghagyás03.FõosztályKód = tMeghagyásB02.FõosztályKód) ON lkSzemélyek.[Státusz kódja] = tMeghagyásB02.[Státuszának kódja]
WHERE (((tMeghagyásB02.Besorolás)<>"Fõosztályvezetõ" And (tMeghagyásB02.Besorolás)<>"Osztályvezetõ" And (tMeghagyásB02.Besorolás)<>"Járási / kerületi hivatal vezetõje" And (tMeghagyásB02.Besorolás)<>"Járási / kerületi hivatal vezetõjének helyettese" And (tMeghagyásB02.Besorolás)<>"Fõispán" And (tMeghagyásB02.Besorolás)<>"Kormányhivatal fõigazgatója" And (tMeghagyásB02.Besorolás)<>"Kormányhivatal igazgatója") AND ((IIf([Sorszám3]<=([SumOfLétszám]-[Meghagyandók]),False,True))=True))
ORDER BY Bfkh(Nz([tMeghagyás03].[FõosztályKód],"BFKH.1.")), tMeghagyásB02.Sorszám3 DESC;

#/#/#/
lkMeghagyásMátrix
#/#/
SELECT [Létszám és Meghagyottak].[meghagyásra kijelölt munkakörök megnevezése], Sum([Létszám és Meghagyottak].A) AS Összes, Sum([Létszám és Meghagyottak].B) AS Meghagyandók, Sum([Létszám és Meghagyottak].C) AS [Meg nem hagyandók]
FROM tMeghagyásraKijelöltMunkakörök RIGHT JOIN (SELECT lkFeladatkörönkéntiLétszám.*
  FROM lkFeladatkörönkéntiLétszám
  UNION
  SELECT lkFeladatkörönkéntiMeghagyottak.*
  FROM  lkFeladatkörönkéntiMeghagyottak
)  AS [Létszám és Meghagyottak] ON tMeghagyásraKijelöltMunkakörök.Feladatkörök = [Létszám és Meghagyottak].[meghagyásra kijelölt munkakörök megnevezése]
GROUP BY [Létszám és Meghagyottak].[meghagyásra kijelölt munkakörök megnevezése];

#/#/#/
lkMeghagyásMátrixB
#/#/
SELECT valami.[meghagyásra kijelölt munkakörök megnevezése], Sum(valami.A) AS Összes, Sum(valami.B) AS Meghagyandók, Sum(valami.C) AS [Meg nem hagyandók]
FROM (SELECT lkFeladatkörönkéntiLétszám.*
  FROM lkFeladatkörönkéntiLétszám
  UNION
  SELECT lkFeladatkörönkéntiMeghagyottak.*
  FROM  lkFeladatkörönkéntiMeghagyottak)  AS valami
GROUP BY valami.[meghagyásra kijelölt munkakörök megnevezése];

#/#/#/
lkMeghagyásÚj01
#/#/
SELECT DISTINCT lkSzemélyek.BFKH, lkSzemélyek.FõosztályKód, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[TAJ szám], lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Dolgozó születési neve], lkSzemélyek.[Anyja neve], lkSzemélyek.[Születési idõ], lkSzemélyek.[Születési hely], IIf(([Besorolás2]="Fõosztályvezetõ" Or [Besorolás2]="Osztályvezetõ" Or [Besorolás2] Like "Járási*" Or [Besorolás2]="Fõispán" Or [Besorolás2]="Kormányhivatal fõigazgatója" Or [Besorolás2]="Kormányhivatal igazgatója") And [Meghagyandó%]>0,0,1) AS Vezetõ, IIf(Year(Now())-Year([Születési idõ])>65,0,1) AS Kor, IIf([Neme]="nõ",0,1) AS Nem, [Vezetõ]*[Kor]*[Nem] AS Rang, Replace([Státusz kódja],"S-","")*1 AS Szám, tBesorolás_átalakító.Sorrend, lkSzemélyek.[KIRA feladat megnevezés] INTO tMeghagyásÚjB01
FROM (lkSzemélyek LEFT JOIN tMeghagyás03 ON lkSzemélyek.FõosztályKód=tMeghagyás03.FõosztályKód) LEFT JOIN tBesorolás_átalakító ON lkSzemélyek.Besorolás2=tBesorolás_átalakító.Besorolási_fokozat
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkMeghagyásÚj02
#/#/
SELECT tMeghagyásÚjB01.FõosztályKód, tMeghagyásÚjB01.Sorrend AS Besorolás, tMeghagyásÚjB01.Szám, tMeghagyásÚjB01.Sorrend, CDbl(DCount("*","tMeghagyásÚjB01","FõosztályKód = '" & [FõosztályKód] & "' AND rang < " & [rang])+DCount("*","tMeghagyásÚjB01","FõosztályKód = '" & [FõosztályKód] & "' AND rang = " & [rang] & " AND sorrend > " & [sorrend])+DCount("*","tMeghagyásÚjB01","FõosztályKód = '" & [FõosztályKód] & "' AND rang = " & [rang] & " AND sorrend = " & [sorrend] & " AND Szám < " & [Szám])+1) AS Sorszám3, tMeghagyásÚjB01.Fõosztály, tMeghagyásÚjB01.Osztály, tMeghagyásÚjB01.[TAJ szám], tMeghagyásÚjB01.[Dolgozó születési neve], tMeghagyásÚjB01.[Dolgozó teljes neve], tMeghagyásÚjB01.[Anyja neve], tMeghagyásÚjB01.[Születési idõ], tMeghagyásÚjB01.[Születési hely], tMeghagyásÚjB01.Vezetõ, tMeghagyásÚjB01.Kor, tMeghagyásÚjB01.[Nem], tMeghagyásÚjB01.Rang, tMeghagyásÚjB01.[KIRA feladat megnevezés] INTO tMeghagyásÚjB02
FROM tMeghagyásÚjB01
ORDER BY tMeghagyásÚjB01.FõosztályKód, tMeghagyásÚjB01.Sorrend, tMeghagyásÚjB01.Szám;

#/#/#/
lkMeghagyásÚj03
#/#/
SELECT tMeghagyásÚjB02.Besorolás, tMeghagyásÚjB02.Sorrend, tMeghagyásÚjB02.Szám, tMeghagyásÚjB02.Vezetõ, tMeghagyásÚjB02.Kor, tMeghagyásÚjB02.[Nem], tMeghagyásÚjB02.FõosztályKód, tMeghagyásÚjB02.Rang, tMeghagyásÚjB02.Sorszám3, tMeghagyásÚjB02.Fõosztály, tMeghagyásÚjB02.Osztály, tMeghagyásÚjB02.[TAJ szám], tMeghagyásÚjB02.[Dolgozó születési neve], tMeghagyásÚjB02.[Dolgozó teljes neve], tMeghagyásÚjB02.[Anyja neve], tMeghagyásÚjB02.[Születési idõ], tMeghagyásÚjB02.[Születési hely], [KIRA feladat megnevezés]
FROM tMeghagyásÚjB02 INNER JOIN tMeghagyás03 ON (tMeghagyás03.Meghagyandók>=tMeghagyásÚjB02.Sorszám3) AND (tMeghagyásÚjB02.FõosztályKód=tMeghagyás03.FõosztályKód)
ORDER BY tMeghagyásÚjB02.FõosztályKód, tMeghagyásÚjB02.Rang, tMeghagyásÚjB02.Sorszám3;

#/#/#/
lkMeghagyásÚjEredmény
#/#/
SELECT lkMeghagyásÚj03.[Nem], lkMeghagyásÚj03.Kor, lkMeghagyásÚj03.FõosztályKód, lkMeghagyásÚj03.Sorszám3, lkMeghagyásÚj03.Fõosztály, lkMeghagyásÚj03.Osztály, lkMeghagyásÚj03.[TAJ szám], lkMeghagyásÚj03.[Dolgozó születési neve], lkMeghagyásÚj03.[Dolgozó teljes neve], lkMeghagyásÚj03.[Anyja neve], lkMeghagyásÚj03.[Születési idõ], lkMeghagyásÚj03.[Születési hely], tMeghagyásraKijelöltMunkakörök.Feladatkörök
FROM tMeghagyásraKijelöltMunkakörök INNER JOIN lkMeghagyásÚj03 ON tMeghagyásraKijelöltMunkakörök.Feladatkörök=lkMeghagyásÚj03.[KIRA feladat megnevezés]
WHERE (((lkMeghagyásÚj03.[Nem])=1) AND ((lkMeghagyásÚj03.Kor)=1))
ORDER BY lkMeghagyásÚj03.FõosztályKód;

#/#/#/
lkMentességek
#/#/
SELECT tMentességek.*, [Családnév] & " " & [Utónév] AS Név, IIf([Születési hely] Like "Budapest*","Budapest",[Születési hely]) AS SzülHely
FROM tMentességek;

#/#/#/
lkMezõkÉsTípusuk
#/#/
SELECT tSzemélyMezõk.Az, tSzemélyMezõk.Oszlopnév, tSzemélyMezõk.Típus, tSzemélyMezõk.Mezõnév, tSzemélyMezõk.Skip, tMezõTípusok.Constant, tMezõTípusok.Description, tMezõTípusok.DbType
FROM tSzemélyMezõk INNER JOIN tMezõTípusok ON tSzemélyMezõk.Típus = tMezõTípusok.Value;

#/#/#/
lkMindenKerületbeBelépõk
#/#/
SELECT lkBelépõkUnió.[Megyei szint VAGY Járási Hivatal] AS Kerület, lkBelépõkUnió.Név, lkBelépõkUnió.[Jogviszony kezdõ dátuma]
FROM lkBelépõkUnió
WHERE (((lkBelépõkUnió.[Megyei szint VAGY Járási Hivatal])="Budapest Fõváros Kormányhivatala XIV. Kerületi Hivatala") AND ((lkBelépõkUnió.[Jogviszony kezdõ dátuma]) Between #7/1/2023# And #7/31/2024#));

#/#/#/
lkMindenKerületbõlKilépettekHavonta
#/#/
SELECT Replace([Megyei szint VAGY Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS Kerület, DateSerial(Year([Jogviszony megszûnésének, megszüntetésének idõpontja]),Month([Jogviszony megszûnésének, megszüntetésének idõpontja])+1,1)-1 AS Tárgyhó, Sum(1) AS Fõ
FROM lkKilépõUnió
WHERE (((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva]) Not Like "*létre*") AND ((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja]) Between #7/1/2023# And #7/31/2024#))
GROUP BY Replace([Megyei szint VAGY Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH"), DateSerial(Year([Jogviszony megszûnésének, megszüntetésének idõpontja]),Month([Jogviszony megszûnésének, megszüntetésének idõpontja])+1,1)-1;

#/#/#/
lkMindenKerületiBetöltöttLétszám01
#/#/
SELECT Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS [Kerületi hivatal], tHaviJelentésHatálya1.hatálya, Sum(IIf([Mezõ4]="üres állás",0,1)) AS [Betöltött létszám], Sum(IIf([Mezõ4]="üres állás",1,0)) AS Üres
FROM tHaviJelentésHatálya1 INNER JOIN tJárási_állomány ON tHaviJelentésHatálya1.hatályaID = tJárási_állomány.hatályaID
GROUP BY Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH"), tHaviJelentésHatálya1.hatálya
HAVING (((tHaviJelentésHatálya1.hatálya) Between #7/1/2023# And #7/31/2024#));

#/#/#/
lkMindenKerületiBetöltöttLétszám02
#/#/
SELECT lkMindenKerületiBetöltöttLétszám01.[Kerületi hivatal], lkMindenKerületiBetöltöttLétszám01.hatálya, lkMindenKerületiBetöltöttLétszám01.[Betöltött létszám], lkMindenKerületiBetöltöttLétszám01.Üres, [Betöltött létszám]+[Üres] AS Engedélyezett
FROM lkMindenKerületiBetöltöttLétszám01;

#/#/#/
lkMindenKerületiKimutatás01
#/#/
SELECT lkMindenKerületiBetöltöttLétszám02.[Kerületi hivatal], lkMindenKerületiBetöltöttLétszám02.hatálya, lkMindenKerületiBetöltöttLétszám02.[Betöltött létszám], lkMindenKerületiBetöltöttLétszám02.Üres, lkMindenKerületiBetöltöttLétszám02.Engedélyezett, IIf([hatálya]=[Tárgyhó] And [kerületi hivatal]=[kerület],[Fõ],0) AS Kilépettek
FROM lkMindenKerületiBetöltöttLétszám02 LEFT JOIN lkMindenKerületbõlKilépettekHavonta ON lkMindenKerületiBetöltöttLétszám02.[Kerületi hivatal] = lkMindenKerületbõlKilépettekHavonta.Kerület;

#/#/#/
lkMindenKerületiKimutatás02
#/#/
SELECT lkMindenKerületiKimutatás01.[Kerületi hivatal], lkMindenKerületiKimutatás01.hatálya, lkMindenKerületiKimutatás01.[Betöltött létszám], lkMindenKerületiKimutatás01.Üres, lkMindenKerületiKimutatás01.Engedélyezett, Sum(lkMindenKerületiKimutatás01.Kilépettek) AS SumOfKilépettek
FROM lkMindenKerületiKimutatás01
GROUP BY lkMindenKerületiKimutatás01.[Kerületi hivatal], lkMindenKerületiKimutatás01.hatálya, lkMindenKerületiKimutatás01.[Betöltött létszám], lkMindenKerületiKimutatás01.Üres, lkMindenKerületiKimutatás01.Engedélyezett
HAVING (((lkMindenKerületiKimutatás01.[Kerületi hivatal]) Like "*XIV*"));

#/#/#/
lkMindenKilépettVezetõ
#/#/
SELECT lkKilépõUnió.Adójel, lkKilépõUnió.Név, lkKilépõUnió.Fõosztály, lkKilépõUnió.Osztály, lkKilépõUnió.[Besorolási fokozat megnevezése:], lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva], lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja] AS Kilépés, DateDiff("yyyy",Mid([Adóazonosító],2,5)*1-12051,dtÁtal([Jogviszony megszûnésének, megszüntetésének idõpontja])) AS [Életkora kilépéskor], Mid([Adóazonosító],2,5)*1-12051 AS [Születési dátum]
FROM lkKilépõUnió
WHERE (((lkKilépõUnió.[Besorolási fokozat megnevezése:])="osztályvezetõ" Or (lkKilépõUnió.[Besorolási fokozat megnevezése:]) Like "kerületi*" Or (lkKilépõUnió.[Besorolási fokozat megnevezése:]) Like "fõosztály*" Or (lkKilépõUnió.[Besorolási fokozat megnevezése:]) Like "*igazgató*" Or (lkKilépõUnió.[Besorolási fokozat megnevezése:])="fõispán"));

#/#/#/
lkMindenVezetõ
#/#/
SELECT lkSzemélyek.[Adóazonosító jel], bfkh(Nz([Szervezeti egység kódja],"-")) AS BFKH, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.Besorolás2, LCase(Replace(Nz([Besorolási  fokozat (KT)],""),"Járási / ","")) & IIf(Nz([Tartós távollét típusa],"")<>""," (TT)","") AS [Ellátott feladat], lkSzemélyek.[Születési hely], lkSzemélyek.[Születési idõ], lkSzemélyek.[Anyja neve], lkSzemélyek.[Állandó lakcím], lkSzemélyek.[Tartózkodási lakcím], lkSzemélyek.Adójel, dtÁtal([Jogviszony vége (kilépés dátuma)]) AS Kilépés, DateSerial(Year(Nz([Születési idõ],0))+65,Month(Nz([Születési idõ],0)),Day(Nz([Születési idõ],0))-1) AS [Öregségi nyugdíj korhatár], lkSzemélyek.[Születési idõ], lkSzemélyek.[Hivatali email]
FROM lkSzemélyek
WHERE (((LCase(Replace(Nz([Besorolási  fokozat (KT)],""),"Járási / ","")) & IIf(Nz([Tartós távollét típusa],"")<>""," (TT)",""))="osztályvezetõ") AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null)) OR (((LCase(Replace(Nz([Besorolási  fokozat (KT)],""),"Járási / ","")) & IIf(Nz([Tartós távollét típusa],"")<>""," (TT)","")) Like "kerületi*") AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null)) OR (((LCase(Replace(Nz([Besorolási  fokozat (KT)],""),"Járási / ","")) & IIf(Nz([Tartós távollét típusa],"")<>""," (TT)","")) Like "fõosztály*") AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null)) OR (((LCase(Replace(Nz([Besorolási  fokozat (KT)],""),"Járási / ","")) & IIf(Nz([Tartós távollét típusa],"")<>""," (TT)","")) Like "*igazgató*") AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null)) OR (((LCase(Replace(Nz([Besorolási  fokozat (KT)],""),"Járási / ","")) & IIf(Nz([Tartós távollét típusa],"")<>""," (TT)",""))="fõispán") AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null))
ORDER BY bfkh(Nz([Szervezeti egység kódja],"-")), LCase(Replace(Nz([Besorolási  fokozat (KT)],""),"Járási / ","")) & IIf(Nz([Tartós távollét típusa],"")<>""," (TT)","");

#/#/#/
lkMobilmodulAdatFelülvizsgálat
#/#/
SELECT DISTINCT [SIM adatok - 2023-08-29 (2)].Azonosító, [SIM adatok - 2023-08-29 (2)].TelefonszámId, [SIM adatok - 2023-08-29 (2)].Telefonszám, [SIM adatok - 2023-08-29 (2)].Megjegyzés, [SIM adatok - 2023-08-29 (2)].[Dolgozó név], [SIM adatok - 2023-08-29 (2)].[Személytörzsben aktív -e], [SIM adatok - 2023-08-29 (2)].[Személytörzs szerinti e-mail cím], [SIM adatok - 2023-08-29 (2)].[Személytörzsben szervezeti egysége], [SIM adatok - 2023-08-29 (2)].[NEXON ID], [SIM adatok - 2023-08-29 (2)].Beosztás, [SIM adatok - 2023-08-29 (2)].[Szervezeti egység], lkSzemélyekÉsNexonAz.Fõosztály, lkSzemélyekÉsNexonAz.[Dolgozó teljes neve], lkSzemélyekÉsNexonAz.[Hivatali email], IIf([Státusz neve] Is Null,
    "A dolgozó kilépett",
    Trim(
        IIf([Fõosztály]<>[Szervezeti egység],
            "A szervezeti egység:" & [Fõosztály] & ".",
            "") 
        & " " & 
        IIf([Dolgozó teljes neve]<>[Dolgozó név] AND [Dolgozó név] NOT LIKE "Dr.*",
            "A név: " & [Dolgozó teljes neve] & ".",
            "") 
        & " " & 
        IIf([Hivatali email]<>[Személytörzs szerinti e-mail cím],
            "A Nexonban nyilvántartott email: " & [Hivatali email] & ".",
            "")
        )
    ) AS Adathelyesbítés, ffsplit(lkSzemélyekÉsNexonAz.[Elsõdleges feladatkör],"-",2) AS [Elsõdleges feladatkör Nexon]
FROM lkSzemélyekÉsNexonAz RIGHT JOIN [SIM adatok - 2023-08-29 (2)] ON (lkSzemélyekÉsNexonAz.azNexon = [SIM adatok - 2023-08-29 (2)].[NEXON ID]) 
            OR 
            (lkSzemélyekÉsNexonAz.[Dolgozó teljes neve] = [SIM adatok - 2023-08-29 (2)].[Dolgozó név]);

#/#/#/
lkMozgásÉventeHavonta
#/#/
SELECT Mozgás.Év, Sum(Mozgás.[01]) AS [01 hó], Sum(Mozgás.[02]) AS [02 hó], Sum(Mozgás.[03]) AS [03 hó], Sum(Mozgás.[04]) AS [04 hó], Sum(Mozgás.[05]) AS [05 hó], Sum(Mozgás.[06]) AS [06 hó], Sum(Mozgás.[07]) AS [07 hó], Sum(Mozgás.[08]) AS [08 hó], Sum(Mozgás.[09]) AS [09 hó], Sum(Mozgás.[10]) AS [10 hó], Sum(Mozgás.[11]) AS [11 hó], Sum(Mozgás.[12]) AS [12 hó], Sum(Mozgás.Belépõk) AS Mozgás
FROM (SELECT *
FROM lkBelépõkSzámaÉventeHavonta3
UNION
SELECT lkKilépõkSzámaÉventeHavonta3.Év
, lkKilépõkSzámaÉventeHavonta3.[01] * -1
, lkKilépõkSzámaÉventeHavonta3.[02] * -1
, lkKilépõkSzámaÉventeHavonta3.[03] * -1
, lkKilépõkSzámaÉventeHavonta3.[04] * -1
, lkKilépõkSzámaÉventeHavonta3.[05] * -1
, lkKilépõkSzámaÉventeHavonta3.[06] * -1
, lkKilépõkSzámaÉventeHavonta3.[07] * -1
, lkKilépõkSzámaÉventeHavonta3.[08] * -1
, lkKilépõkSzámaÉventeHavonta3.[09] * -1
, lkKilépõkSzámaÉventeHavonta3.[10] * -1
, lkKilépõkSzámaÉventeHavonta3.[11] * -1
, lkKilépõkSzámaÉventeHavonta3.[12] * -1
, lkKilépõkSzámaÉventeHavonta3.Kilépõk * -1
FROM lkKilépõkSzámaÉventeHavonta3
)  AS Mozgás
GROUP BY Mozgás.Év;

#/#/#/
lkMSysQueries
#/#/
SELECT qry.Attribute, qry.Expression, qry.Flag, qry.LvExtra, qob.Name AS ObjectName, qry.Name1 AS columnName, qry.Name2 AS alias
FROM MSysQueries AS qry LEFT JOIN MSysObjects AS qob ON qry.ObjectId = qob.Id
ORDER BY qob.Name;

#/#/#/
lkMunkaalkalmassági
#/#/
SELECT lkSzemélyek.[TAJ szám] AS [azonosító száma], "" AS [név elõtag], lkSzemélyek.[Dolgozó teljes neve] AS [munkavállaló neve], lkSzemélyek.Neme AS nem, lkSzemélyek.[Születési hely], lkSzemélyek.[Születési idõ], lkSzemélyek.[Dolgozó születési neve] AS [leánykori név], lkSzemélyek.[Anyja neve], lkSzemélyek.[Hivatali telefon] AS [telefon szám], lkSzemélyek.[Hivatali email] AS [e-mail], lkSzemélyek.[Állandó lakcím] AS lakcím, "" AS jogosítvány, "" AS [katonai szolgálat], Trim(ffsplit([FEOR],"-",1)) AS [FEOR kód], Trim(ffsplit([FEOR],"-",2)) AS [FEOR név], "" AS [foglalkozásegészségügyi osztály], "" AS [fizikai megterhelés], "Budapest Fõváros Kormányhivatala" AS [cég teljes neve], "BFKH" AS [cég rövid neve], lkSzemélyek.[Munkavégzés helye - megnevezés] AS [telephely neve], lkSzemélyek.[Munkavégzés helye - cím] AS [telephely címe], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS [munkaviszony kezdete], lkSzemélyek.[Orvosi vizsgálat idõpontja] AS [alkalmassági vizsgálat dátuma], lkSzemélyek.[Orvosi vizsgálat következõ idõpontja] AS [alkalmassági vizsgálat érvényesség], lkSzemélyek.[Orvosi vizsgálat típusa] AS [alkalmassági vizsgálat típus], lkSzemélyek.[Orvosi vizsgálat eredménye] AS [alkalmassági vizsgálat eredmény], lkSzemélyek.[Orvosi vizsgálat észrevételek] AS [alkalmassági vizsgálat korlázotás]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lkMunkábajárásTávolsága01
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], tIrányítószámokKoordináták.dblSzélesség AS LakSzél, tIrányítószámokKoordináták.dblHosszúság AS LakHossz, tIrányítószámokKoordináták_1.dblSzélesség AS MunkSzél, tIrányítószámokKoordináták_1.dblHosszúság AS MunkHossz, GetDistance([Lakszél],[Lakhossz],[MunkSzél],[MunkHossz]) AS Távolság
FROM tIrányítószámokKoordináták AS tIrányítószámokKoordináták_1 INNER JOIN (lkMunkahelycímek INNER JOIN ((lkLakcímek INNER JOIN tIrányítószámokKoordináták ON lkLakcímek.Irsz = tIrányítószámokKoordináták.Irsz) INNER JOIN lkSzemélyek ON lkLakcímek.Adójel = lkSzemélyek.Adójel) ON lkMunkahelycímek.Adójel = lkSzemélyek.Adójel) ON tIrányítószámokKoordináták_1.Irsz = lkMunkahelycímek.Irsz
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY GetDistance([Lakszél],[Lakhossz],[MunkSzél],[MunkHossz]) DESC;

#/#/#/
lkMunkahelycímek
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.[Munkavégzés helye - megnevezés], lkSzemélyek.[Munkavégzés helye - cím], IIf(IsNumeric(Left(Nz([Munkavégzés helye - cím],""),1)),Left(Nz([Munkavégzés helye - cím],""),4)*1,0) AS Irsz
FROM lkSzemélyek;

#/#/#/
lkMunkahelyCímNélküliek
#/#/
SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Munkavégzés helye - cím], lkSzemélyek.[Szervezeti egység kódja], Replace(IIf(IsNull([lkSzemélyek].[Szint 4 szervezeti egység név]),[lkSzemélyek].[Szint 3 szervezeti egység név] & "",[lkSzemélyek].[Szint 4 szervezeti egység név] & ""),"Budapest Fõváros Kormányhivatala ","BFKH ") AS Fõosztály, lkSzemélyek.[Szint 5 szervezeti egység név] AS Osztály, lkSzemélyek.Adójel, "https://nexonport.kh.gov.hu/menu/hrm/szemelyiKarton/index?szemelyAzonosito=" & [azNexon] & "&r=13" AS Link
FROM lkSzemélyek LEFT JOIN kt_azNexon_Adójel ON lkSzemélyek.tSzemélyek.Adójel=kt_azNexon_Adójel.Adójel
WHERE (((lkSzemélyek.[Munkavégzés helye - cím]) Is Null) AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Státusz típusa]) Is Not Null));

#/#/#/
lkMunkahelyCímNélküliek_Statisztika
#/#/
SELECT lkMunkahelyCímNélküliek.Fõosztály, Count(lkMunkahelyCímNélküliek.Link) AS db
FROM lkMunkahelyCímNélküliek
GROUP BY lkMunkahelyCímNélküliek.Fõosztály;

#/#/#/
lkMunkavégzés helye - cím nélkül
#/#/
SELECT lkSzemélyek.[Munkavégzés helye - megnevezés], Nü([Munkavégzés helye - cím],"") AS Kif1, Count(lkSzemélyek.Adójel) AS CountOfAdójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="álláshely"))
GROUP BY lkSzemélyek.[Munkavégzés helye - megnevezés], Nü([Munkavégzés helye - cím],"")
HAVING (((Nü([Munkavégzés helye - cím],""))=""));

#/#/#/
lkMunkaviszonyHosszaKimutatáshoz01
#/#/
SELECT Year([Jogviszony vége (kilépés dátuma)]) AS [Utolsó év], DateDiff("d",[Jogviszony kezdete (belépés dátuma)],[Jogviszony vége (kilépés dátuma)])/365.25 AS [Eltöltött évek], tSzemélyek.Adójel
FROM tSzemélyek
WHERE (((Year([Jogviszony vége (kilépés dátuma)]))<>1899));

#/#/#/
lkMunkaviszonyHosszaKimutatáshoz01 naponta
#/#/
SELECT Year([Jogviszony vége (kilépés dátuma)]) AS [Utolsó év], DateDiff("d",[Jogviszony kezdete (belépés dátuma)],[Jogviszony vége (kilépés dátuma)])/7 AS [Eltöltött hetek], tSzemélyek.Adójel
FROM tSzemélyek
WHERE (((Year([Jogviszony vége (kilépés dátuma)]))<>1899));

#/#/#/
lkMunkaviszonyHosszaKimutatáshoz02
#/#/
TRANSFORM Count(lkMunkaviszonyHosszaKimutatáshoz01.Adójel) AS Darabszám
SELECT lkMunkaviszonyHosszaKimutatáshoz01.[Utolsó év]
FROM lkMunkaviszonyHosszaKimutatáshoz01
GROUP BY lkMunkaviszonyHosszaKimutatáshoz01.[Utolsó év]
PIVOT Int([Eltöltött évek]);

#/#/#/
lkMunkaviszonyHosszaKimutatáshoz02 naponta
#/#/
TRANSFORM Count([lkMunkaviszonyHosszaKimutatáshoz01 naponta].Adójel) AS Darabszám
SELECT Int([Eltöltött hetek]) AS [Hetek száma]
FROM [lkMunkaviszonyHosszaKimutatáshoz01 naponta]
GROUP BY Int([Eltöltött hetek])
PIVOT [lkMunkaviszonyHosszaKimutatáshoz01 naponta].[Utolsó év];

#/#/#/
lkMunkaviszonyosokBesorolásaFõosztályOsztály
#/#/
SELECT lkSzemélyek.[Státusz kódja], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], IIf([Besorolási  fokozat (KT)] Is Null,[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés],[Besorolási  fokozat (KT)]) AS Besorolás
FROM lkSzemélyek INNER JOIN tSzervezet ON lkSzemélyek.[Státusz kódja] = tSzervezet.[Szervezetmenedzsment kód]
WHERE (((lkSzemélyek.[KIRA jogviszony jelleg])="munkaviszony") And ((lkSzemélyek.[Státusz neve])="álláshely") And ((tSzervezet.[Érvényesség kezdete])<=Date()) And ((IIf(tszervezet.[Érvényesség vége]=0,#1/1/3000#,tszervezet.[Érvényesség vége]))>=Date()))
ORDER BY IIf([Besorolási  fokozat (KT)] Is Null,[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés],[Besorolási  fokozat (KT)]), lkSzemélyek.BFKH, lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkNapok01
#/#/
SELECT ([évek].[Sorszám])+2000 AS Év, Napok.Sorszám AS Nap, DateSerial([Év],1,1+[Nap]-1) AS Dátum
FROM lkSorszámok AS Napok, lkSorszámok AS Évek
WHERE évek.Sorszám+2000 Between 2019 And Year(Date()) And Napok.Sorszám<367;

#/#/#/
lkNapok02
#/#/
SELECT lkNapok01.Év, lkNapok01.Nap, lkNapok01.Dátum INTO tNapok03
FROM lkNapok01
WHERE (((Year([Dátum]))=[Év]));

#/#/#/
lkNemOrvosÁlláshelyekenDolgozóOrvosok
#/#/
SELECT "" AS Sorszám, 789235 AS [PIR törzsszám], lkSzemélyek.[Státusz kódja] AS [az álláshely ÁNYR azonosító száma], Nü([Dolgozó teljes neve],"üres") AS [a kormánytisztviselõ neve], lkSzemélyek.adójel AS [adóazonosító jele (10 karakter)], lkSzemélyek.[Születési idõ], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS [a belépés dátuma], lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS [a heti munkaidõ tartama], "igen" AS [rendelkezik orvos végzettséggel], "?" AS [egészségügyi alapnyilvántartási száma], lkSzemélyek.[KIRA feladat megnevezés] AS [a kormánytisztviselõ feladatköre], IIf([Besorolási  fokozat (KT)] Like "*osztály*",[Besorolási  fokozat (KT)],"nincs") AS [a kormánytisztviselõ vezetõi besorolása], IIf(Nz([Státuszkód],"-")="-",False,True) AS [Orvos álláshely], lkIlletményTörténet.[Havi illetmény] AS [a Kit szerinti bruttó illetménye 2024 június hónapban], lkIlletményTörténet.[Besorolási fokozat megnevezése:] AS [a Kit szerinti besorolási fokozata 2024 június hónapban], lkSzemélyek.[Besorolási  fokozat (KT)] AS [a Kit szerinti bruttó illetménye 2024 július hónapban], lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)] AS [a Kit szerinti besorolási fokozata 2024 július hónapban], lkÁlláshelyekHaviból.Fõoszt, lkÁlláshelyekHaviból.Osztály, lkSzemélyek.FEOR, lkIlletményTörténet.hatálya, lkSzemélyek.[Iskolai végzettség neve]
FROM lkIlletményTörténet RIGHT JOIN (lkOrvosiÁlláshelyek RIGHT JOIN (lkÁlláshelyekHaviból LEFT JOIN lkSzemélyek ON lkÁlláshelyekHaviból.[Álláshely azonosító] = lkSzemélyek.[Státusz kódja]) ON lkOrvosiÁlláshelyek.Státuszkód = lkSzemélyek.[Státusz kódja]) ON lkIlletményTörténet.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.FEOR) Like "*orvos*" And (lkSzemélyek.FEOR) Not Like "*rvosi laboratóriumi asszisztens") AND ((lkIlletményTörténet.hatálya)=#6/30/2024#) AND ((lkSzemélyek.[státusz neve])="Álláshely") AND ((lkOrvosiÁlláshelyek.Státuszkód) Is Null)) OR (((lkIlletményTörténet.hatálya)=#6/30/2024#) AND ((lkSzemélyek.[Iskolai végzettség neve]) Like "*orvos*") AND ((lkSzemélyek.[státusz neve])="Álláshely") AND ((lkOrvosiÁlláshelyek.Státuszkód) Is Null)) OR (((lkIlletményTörténet.hatálya)=#6/30/2024#) AND ((lkSzemélyek.[Iskolai végzettség neve]) Like "*járvány*" And (lkSzemélyek.[Iskolai végzettség neve])<>"közegészségügyi - járványügyi ellenõr" And (lkSzemélyek.[Iskolai végzettség neve])<>"közegészségügyi - járványügyi felügyelõ") AND ((lkSzemélyek.[státusz neve])="Álláshely") AND ((lkOrvosiÁlláshelyek.Státuszkód) Is Null));

#/#/#/
lkNemOrvosÁlláshelyekenDolgozóOrvosokEllenõrzésbe
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Státusz kódja] AS ÁNYR, Nü([Dolgozó teljes neve],"üres") AS Név, lkSzemélyek.adójel AS Adóazonosító, lkSzemélyek.[KIRA feladat megnevezés] AS [KIRA feladat], lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.FEOR, lkSzemélyek.[Iskolai végzettség neve], kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN (lkOrvosiÁlláshelyek RIGHT JOIN lkSzemélyek ON lkOrvosiÁlláshelyek.Státuszkód = lkSzemélyek.[Státusz kódja]) ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.FEOR) Like "*orvos*" And (lkSzemélyek.FEOR) Not Like "*rvosi laboratóriumi asszisztens") AND ((lkSzemélyek.[státusz neve])="Álláshely") AND ((lkOrvosiÁlláshelyek.Státuszkód) Is Null)) OR (((lkSzemélyek.[Iskolai végzettség neve]) Like "*orvos*") AND ((lkSzemélyek.[státusz neve])="Álláshely") AND ((lkOrvosiÁlláshelyek.Státuszkód) Is Null)) OR (((lkSzemélyek.[Iskolai végzettség neve]) Like "*járvány*" And (lkSzemélyek.[Iskolai végzettség neve])<>"közegészségügyi - járványügyi ellenõr" And (lkSzemélyek.[Iskolai végzettség neve])<>"közegészségügyi - járványügyi felügyelõ") AND ((lkSzemélyek.[státusz neve])="Álláshely") AND ((lkOrvosiÁlláshelyek.Státuszkód) Is Null));

#/#/#/
lkNépegészségügyiDolgozók
#/#/
SELECT lkJárásiKormányKözpontosítottUnió.Adóazonosító, lkJárásiKormányKözpontosítottUnió.Név, lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás], lkJárásiKormányKözpontosítottUnió.Neme AS [Dolgozó neme 1 férfi 2 nõ], IIf([Járási Hivatal] Like "*kerületi*",[Járási Hivatal],"Megyei szint") AS [Megyei szint], Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS Fõosztály, lkJárásiKormányKözpontosítottUnió.Osztály, lkJárásiKormányKözpontosítottUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkJárásiKormányKözpontosítottUnió.[Ellátott feladat], lkJárásiKormányKözpontosítottUnió.Kinevezés, lkJárásiKormányKözpontosítottUnió.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], lkJárásiKormányKözpontosítottUnió.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], lkJárásiKormányKözpontosítottUnió.[Heti munkaórák száma], lkJárásiKormányKözpontosítottUnió.[Betöltés aránya], lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat kód:], lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat megnevezése:], lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító], lkJárásiKormányKözpontosítottUnió.[Havi illetmény], lkJárásiKormányKözpontosítottUnió.[Eu finanszírozott], lkJárásiKormányKözpontosítottUnió.[Illetmény forrása], lkJárásiKormányKözpontosítottUnió.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], lkJárásiKormányKözpontosítottUnió.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], lkJárásiKormányKözpontosítottUnió.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], lkJárásiKormányKözpontosítottUnió.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], lkJárásiKormányKözpontosítottUnió.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], lkJárásiKormányKözpontosítottUnió.[Képesítést adó végzettség], Nz([Adóazonosító],0)*1 AS Adójel, "" AS [Járási hivatal neve]
FROM lkJárásiKormányKözpontosítottUnió
WHERE (((IIf([Járási Hivatal] Like "*kerületi*",[Járási Hivatal],"Megyei szint")) Like "*XXI.*") AND ((lkJárásiKormányKözpontosítottUnió.[Ellátott feladat]) Like "népe*")) OR (((Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH")) Like "Népeg*")) OR (((lkJárásiKormányKözpontosítottUnió.Osztály) Like "Népeg*"));

#/#/#/
lkNépegészségügyiDolgozókAdatbekérõ
#/#/
SELECT lkNépegészségügyiDolgozók.Adójel, lkNépegészségügyiDolgozók.Név, lkNépegészségügyiDolgozók.Fõosztály, lkNépegészségügyiDolgozók.Osztály, "" AS [Védõnõ?], "" AS [Vezetõ védõnõ?], lkNépegészségügyiDolgozók.Adóazonosító
FROM lkNépegészségügyiDolgozók
WHERE (((lkNépegészségügyiDolgozók.Adóazonosító) Is Not Null And (lkNépegészségügyiDolgozók.Adóazonosító)<>""))
ORDER BY lkNépegészségügyiDolgozók.Fõosztály, lkNépegészségügyiDolgozók.Osztály, lkNépegészségügyiDolgozók.Név;

#/#/#/
lkNevek_IFB_részére
#/#/
SELECT tSzemélyek.[Dolgozó teljes neve], tSzervezetiEgységek.Fõosztály, tSzervezetiEgységek.Osztály, tSzemélyek.azonosító
FROM tSzemélyek LEFT JOIN tSzervezetiEgységek ON tSzemélyek.[Szervezeti egység kódja] = tSzervezetiEgységek.[Szervezeti egység kódja]
WHERE (((tSzemélyek.azonosító) In (Select azSzemély FROM alkSzemélyek_csak_az_utolsó_elõfordulások)) AND ((tSzemélyek.[Tartós távollét típusa]) Is Null) AND ((tSzemélyek.[Szervezeti egység kódja]) Is Not Null And (tSzemélyek.[Szervezeti egység kódja]) Not Like "*MEGB*") AND ((tSzemélyek.[Státusz kódja]) Like "S-*"));

#/#/#/
lkNevekÉsFiktívTörzsszámok
#/#/
SELECT tUtónevek.Keresztnév, CalcStrNumber([Keresztnév]) AS Érték
FROM tUtónevek;

#/#/#/
lkNevekGyakoriságSzerint
#/#/
SELECT lkSorszámok.Sorszám, lkUtónevekGyakorisága.Keresztnév
FROM lkUtónevekGyakorisága, lkSorszámok
ORDER BY lkUtónevekGyakorisága.Keresztnév, lkSorszámok.Sorszám;

#/#/#/
lkNevekOltáshoz
#/#/
SELECT tNevekOltáshoz.Azonosító, tNevekOltáshoz.Fõosztály, tNevekOltáshoz.Osztály, tNevekOltáshoz.Oltandók, drhátra([Oltandók]) AS DolgTeljNeve
FROM tNevekOltáshoz;

#/#/#/
lkNevekSzámokkal
#/#/
SELECT DISTINCT Nü([lkszemélyek].[Fõosztály],[lkKilépõUnió].[Fõosztály]) AS Fõosztály, Nü([lkSzemélyek].[Osztály],[lkKilépõUnió].[Osztály]) AS Osztály, zárojeltelenítõ([Dolgozó teljes neve]) AS [Dolgozó neve], zárojeltelenítõ([Dolgozó születési neve]) AS [Születési név], zárojeltelenítõ([Anyja neve]) AS [Anyja születési neve], "Személyi karton / Személyes adatok / Alap adatok / SZEMÉLYNÉV ADATOK -> A születési névben, a viselt névben vagy az anyja nevében számok szerepelnek" AS Megjegyzés, kt_azNexon_Adójel02.NLink AS NLink
FROM lkKilépõUnió RIGHT JOIN (lkSzemélyek LEFT JOIN kt_azNexon_Adójel02 ON lkSzemélyek.Adójel = kt_azNexon_Adójel02.Adójel) ON lkKilépõUnió.Adójel = lkSzemélyek.Adójel
WHERE (((zárojeltelenítõ([Dolgozó teljes neve])) Like "*[0-9]*")) OR (((zárojeltelenítõ([Dolgozó születési neve])) Like "*[0-9]*")) OR (((zárojeltelenítõ([Anyja neve])) Like "*[0-9]*"));

#/#/#/
lkNevekTajOltáshoz01
#/#/
SELECT lkNevekOltáshoz.Fõosztály, lkNevekOltáshoz.Osztály, lkNevekOltáshoz.DolgTeljNeve, lkSzemélyek.[TAJ szám], [Születési hely] & ", " & [Születési idõ] AS [szül hely \ idõ], lkSzemélyek.[Anyja neve], lkSzemélyek.[Állandó lakcím], lkNevekOltáshoz.Oltandók, lkSzemélyek.[Hivatali email]
FROM lkSzemélyek RIGHT JOIN lkNevekOltáshoz ON lkSzemélyek.[Dolgozó teljes neve]=lkNevekOltáshoz.Oltandók
WHERE (((lkSzemélyek.[TAJ szám]) Is Not Null));

#/#/#/
lkNevekTajOltáshoz02
#/#/
SELECT lkNevekOltáshoz.Fõosztály, lkNevekOltáshoz.Osztály, lkNevekOltáshoz.DolgTeljNeve, lkSzemélyek.[TAJ szám], [Születési hely] & ", " & [Születési idõ] AS [szül hely \ idõ], lkSzemélyek.[Anyja neve], lkSzemélyek.[Állandó lakcím], lkNevekOltáshoz.Oltandók, lkSzemélyek.[Hivatali email]
FROM lkNevekOltáshoz LEFT JOIN lkSzemélyek ON lkNevekOltáshoz.DolgTeljNeve=lkSzemélyek.[Dolgozó teljes neve]
WHERE (((lkSzemélyek.[TAJ szám]) Is Not Null));

#/#/#/
lkNevekTajOltáshoz03
#/#/
SELECT DISTINCT Unió.Fõosztály, Unió.Osztály, Unió.DolgTeljNeve, Unió.[TAJ szám], Unió.[szül hely \ idõ], Unió.[Anyja neve], Unió.[Állandó lakcím], Unió.Oltandók, *
FROM (SELECT  lkNevekTajOltáshoz02.*
FROM lkNevekTajOltáshoz02
UNION SELECT lkNevekTajOltáshoz01.*
FROM  lkNevekTajOltáshoz01
)  AS Unió;

#/#/#/
lkNevekTajOltáshoz04
#/#/
SELECT tNevekOltáshoz.Azonosító, Nz(tNevekOltáshoz.Fõosztály,"") AS Fõosztály_, Nz(tNevekOltáshoz.Osztály,"") AS Osztály_, Trim(Replace(tNevekOltáshoz.[Oltandók],"dr.","")) AS Név, tNevekOltáshoz.Oltandók
FROM tNevekOltáshoz LEFT JOIN lkNevekTajOltáshoz03 ON tNevekOltáshoz.Oltandók=lkNevekTajOltáshoz03.Oltandók
WHERE (((lkNevekTajOltáshoz03.Oltandók) Is Null));

#/#/#/
lkNevekTajOltáshoz05
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[dolgozó teljes neve] AS DolgTeljNév, lkSzemélyek.[TAJ szám], [Születési hely] & ", " & [Születési idõ] AS [szül hely \ idõ], lkSzemélyek.[Anyja neve], lkSzemélyek.[Állandó lakcím], lkNevekTajOltáshoz04.Oltandók, lkSzemélyek.[Hivatali email]
FROM lkSzemélyek RIGHT JOIN lkNevekTajOltáshoz04 ON (lkSzemélyek.Fõosztály=lkNevekTajOltáshoz04.Fõosztály_) AND (lkSzemélyek.Osztály=lkNevekTajOltáshoz04.Osztály_)
WHERE (((lkSzemélyek.[dolgozó teljes neve]) Like "*" & [Név] & "*" Or (lkSzemélyek.[dolgozó teljes neve]) Like "*" & [Oltandók] & "*"));

#/#/#/
lkNevekTajOltáshoz06
#/#/
SELECT lkNevekTajOltáshoz03.*
FROM lkNevekTajOltáshoz03
UNION SELECT lkNevekTajOltáshoz05.*
FROM lkNevekTajOltáshoz05;

#/#/#/
lkNevekTajOltáshoz07
#/#/
SELECT tNevekOltáshoz.Azonosító, tNevekOltáshoz.Fõosztály, tNevekOltáshoz.Osztály, tNevekOltáshoz.Oltandók
FROM tNevekOltáshoz LEFT JOIN lkNevekTajOltáshoz06 ON tNevekOltáshoz.Oltandók = lkNevekTajOltáshoz06.Oltandók
WHERE (((lkNevekTajOltáshoz06.Oltandók) Is Null));

#/#/#/
lkNevekTöbbSzóközzel
#/#/
SELECT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Dolgozó születési neve], lkSzemélyek.[Anyja neve], "Személyi karton / Személyes adatok / Alap adatok / SZEMÉLYNÉV ADATOK vagy SZÜLETÉSI ADATOK -> A születési, a viselt, vagy az anyja nevében túl sok szóköz található, mivel egyet a rendszer automatikusan hozzátesz. A kötõjelek elõtt és után nem kell szóköz." AS Megjegyzés, kt_azNexon_Adójel02.NLink AS NLink
FROM lkSzemélyek LEFT JOIN kt_azNexon_Adójel02 ON lkSzemélyek.Adójel = kt_azNexon_Adójel02.Adójel
WHERE (((lkSzemélyek.[Dolgozó teljes neve]) Like "*  *" Or (lkSzemélyek.[Dolgozó teljes neve]) Like "*- *" Or (lkSzemélyek.[Dolgozó teljes neve]) Like "* -*") AND ((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)])<Date())) OR (((lkSzemélyek.[Dolgozó születési neve]) Like "*  *") AND ((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)])<Date())) OR (((lkSzemélyek.[Dolgozó születési neve]) Like "*- *") AND ((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)])<Date())) OR (((lkSzemélyek.[Dolgozó születési neve]) Like "* -*") AND ((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)])<Date())) OR (((lkSzemélyek.[Anyja neve]) Like "*  *") AND ((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)])<Date())) OR (((lkSzemélyek.[Anyja neve]) Like "* -*") AND ((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)])<Date())) OR (((lkSzemélyek.[Anyja neve]) Like "*- *") AND ((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)])<Date()));

#/#/#/
lkNexonForrásÖsszevetés
#/#/
SELECT tNexonForrás.[Forrás Személy azon#], kt_azNexon_Adójel02.azNexon, lkSzemélyek.Törzsszám, lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés, lkSzemélyek.[Jogviszony vége (kilépés dátuma)] AS Kilépés, lkSzemélyek.[Státusz neve], lkSzemélyek.Fõosztály
FROM (kt_azNexon_Adójel02 LEFT JOIN tNexonForrás ON kt_azNexon_Adójel02.azNexon = tNexonForrás.[NEXON személy ID]) INNER JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((tNexonForrás.[NEXON személy ID]) Is Null) AND ((lkSzemélyek.[Jogviszony vége (kilépés dátuma)])>=Now())) OR (((tNexonForrás.[NEXON személy ID]) Is Null) AND ((lkSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Null) AND ((lkSzemélyek.[Státusz neve])<>"Jegyzõ")) OR (((tNexonForrás.[NEXON személy ID]) Is Not Null))
ORDER BY IIf(IsNull([Nexon személy ID]),0,1), lkSzemélyek.[Jogviszony vége (kilépés dátuma)];

#/#/#/
lkNõkLétszáma01
#/#/
SELECT DISTINCT lkSzemélyek.Adójel, 1 AS fõ, Abs([Tartós távollét típusa] Is Null) AS TTnélkül
FROM lkSzemélyek
WHERE (lkSzemélyek.Neme="Nõ" AND lkSzemélyek.[Státusz neve]="Álláshely");

#/#/#/
lkNõkLétszáma02
#/#/
SELECT 2 AS Sor, "Nõk létszáma:" AS Adat, Sum(lkNõkLétszáma01.fõ) AS Érték, Sum(lkNõkLétszáma01.TTnélkül) AS NemTT
FROM lkNõkLétszáma01
GROUP BY 2, "Nõk létszáma:";

#/#/#/
lkNõkLétszáma6ÉvAlattiGyermekkel
#/#/
SELECT 3 AS Sor, "Nõk létszáma 6 év alatti gyermekkel:" AS Adat, Sum(fõ) AS Érték, Sum([TTnélkül]) AS NemTT
FROM (SELECT DISTINCT lkHozzátartozók.[Dolgozó adóazonosító jele], 1 AS fõ, Abs([Tartós távollét típusa] Is Null) AS TTnélkül FROM lkHozzátartozók INNER JOIN lkSzemélyek ON lkHozzátartozók.Adójel = lkSzemélyek.Adójel WHERE lkSzemélyek.Neme="Nõ" And lkSzemélyek.[Státusz neve]="Álláshely" And lkHozzátartozók.[Születési idõ]>DateSerial(Year(Now())-6,Month(Now()),Day(Now())) And (lkHozzátartozók.[Kapcsolat jellege]="Gyermek" Or lkHozzátartozók.[Kapcsolat jellege]="Nevelt (mostoha)" Or lkHozzátartozók.[Kapcsolat jellege]="Örökbe fogadott"))  AS allekérdezésEgyedi;

#/#/#/
lkNyelvtudásOsztályonként
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, Sum([Nyelvtudás Angol]="IGEN") AS Angol, Sum([Nyelvtudás Arab]="IGEN") AS Arab, Sum([Nyelvtudás Bolgár]="IGEN") AS Bolgár, Sum([Nyelvtudás Cigány]="IGEN") AS Cigány, Sum([Nyelvtudás Cigány (lovári)]="IGEN") AS [Cigány (lovári)], Sum([Nyelvtudás Cseh]="IGEN") AS Cseh, Sum([Nyelvtudás Eszperantó]="IGEN") AS Eszperantó, Sum([Nyelvtudás Finn]="IGEN") AS Finn, Sum([Nyelvtudás Francia]="IGEN") AS Francia, Sum([Nyelvtudás Héber]="IGEN") AS Héber, Sum([Nyelvtudás Holland]="IGEN") AS Holland, Sum([Nyelvtudás Horvát]="IGEN") AS Horvát, Sum([Nyelvtudás Japán]="IGEN") AS Japán, Sum([Nyelvtudás Jelnyelv]="IGEN") AS Jelnyelv, Sum([Nyelvtudás Kínai]="IGEN") AS Kínai, Sum([Nyelvtudás Latin]="IGEN") AS Latin, Sum([Nyelvtudás Lengyel]="IGEN") AS Lengyel, Sum([Nyelvtudás Német]="IGEN") AS Német, Sum([Nyelvtudás Norvég]="IGEN") AS Norvég, Sum([Nyelvtudás Olasz]="IGEN") AS Olasz, Sum([Nyelvtudás Orosz]="IGEN") AS Orosz, Sum([Nyelvtudás Portugál]="IGEN") AS Portugál, Sum([Nyelvtudás Román]="IGEN") AS Román, Sum([Nyelvtudás Spanyol]="IGEN") AS Spanyol, Sum([Nyelvtudás Szerb]="IGEN") AS Szerb, Sum([Nyelvtudás Szlovák]="IGEN") AS Szlovák, Sum([Nyelvtudás Szlovén]="IGEN") AS Szlovén, Sum([Nyelvtudás Török]="IGEN") AS Török, Sum([Nyelvtudás Újgörög]="IGEN") AS Újgörög, Sum([Nyelvtudás Ukrán]="IGEN") AS Ukrán
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
GROUP BY lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.BFKH, lkSzemélyek.[Státusz neve]
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkNyugdíjazandóDolgozók
#/#/
SELECT lkSzemélyek.[Dolgozó teljes neve], DateSerial(Year(Nz([Születési idõ],#1/1/1900#))+65,Month(Nz([Születési idõ],#1/1/1900#)),Day(Nz([Születési idõ],#1/1/1900#))) AS [Nyugdíjkorhatárt betölti], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.Besorolás2
FROM lkSzemélyek
WHERE (((DateSerial(Year(Nz([Születési idõ],#1/1/1900#))+65,Month(Nz([Születési idõ],#1/1/1900#)),Day(Nz([Születési idõ],#1/1/1900#)))) Between Date() And DateAdd("m",18,Date())) AND ((lkSzemélyek.[Státusz neve])="álláshely"))
ORDER BY DateSerial(Year(Nz([Születési idõ],#1/1/1900#))+65,Month(Nz([Születési idõ],#1/1/1900#)),Day(Nz([Születési idõ],#1/1/1900#))), Month([Születési idõ]);

#/#/#/
lkNyugdíjazandóDolgozókHavonta
#/#/
SELECT Year(IIf([Nyugdíjkorhatárt betölti]<Date(),Date(),[Nyugdíjkorhatárt betölti])) & "." & IIf(Len(Month(IIf([Nyugdíjkorhatárt betölti]<Date(),Date(),[Nyugdíjkorhatárt betölti])))<2,0,"") & Month(IIf([Nyugdíjkorhatárt betölti]<Date(),Date(),[Nyugdíjkorhatárt betölti])) AS Év_hónap, Count(lkNyugdíjazandóDolgozók.[Dolgozó teljes neve]) AS Fõ
FROM lkNyugdíjazandóDolgozók
GROUP BY Year(IIf([Nyugdíjkorhatárt betölti]<Date(),Date(),[Nyugdíjkorhatárt betölti])) & "." & IIf(Len(Month(IIf([Nyugdíjkorhatárt betölti]<Date(),Date(),[Nyugdíjkorhatárt betölti])))<2,0,"") & Month(IIf([Nyugdíjkorhatárt betölti]<Date(),Date(),[Nyugdíjkorhatárt betölti]));

#/#/#/
lkNyugdíjazandóDolgozókNõk40
#/#/
SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Születési idõ], DateSerial(Year(Nz([Születési idõ],#1/1/1900#))+65,Month(Nz([Születési idõ],#1/1/1900#)),Day(Nz([Születési idõ],#1/1/1900#))) AS [65_ életévét betölti], DateSerial(Year(Nz([Születési idõ],#1/1/1900#))+58,Month(Nz([Születési idõ],#1/1/1900#)),Day(Nz([Születési idõ],#1/1/1900#))) AS [58_ életévét betölti], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.Besorolás2 AS Besorolás, lkSzemélyek.[Jogviszony típusa / jogviszony típus] AS Jogviszony, lkSzemélyek.Neme, Year(Date())-ffsplit(Nz([Szolgálati elismerésre jogosultság / Jubileumi jutalom kezdõ dát],Year(Date())),".",1)*1 AS [Szolgálati évek]
FROM lkSzemélyek LEFT JOIN lkSzolgálatiIdõElismerés ON lkSzemélyek.Adójel=lkSzolgálatiIdõElismerés.Adójel
WHERE (((DateSerial(Year(Nz([Születési idõ],#1/1/1900#))+58,Month(Nz([Születési idõ],#1/1/1900#)),Day(Nz([Születési idõ],#1/1/1900#)))) Between Date() And DateAdd("m",18,Date())) AND ((lkSzemélyek.Neme)="nõ") AND ((lkSzemélyek.[Státusz neve])="álláshely") AND (("Keressük azokat a nõket, akik az 58. születésnapjukat a következõ 18 hónapban töltik be.")=True)) OR (((DateSerial(Year(Nz([Születési idõ],#1/1/1900#))+65,Month(Nz([Születési idõ],#1/1/1900#)),Day(Nz([Születési idõ],#1/1/1900#))))>Date()) AND ((DateSerial(Year(Nz([Születési idõ],#1/1/1900#))+58,Month(Nz([Születési idõ],#1/1/1900#)),Day(Nz([Születési idõ],#1/1/1900#))))<Date()) AND ((lkSzemélyek.Neme)="nõ") AND ((lkSzemélyek.[Státusz neve])="álláshely") AND (("Keressük azokat a nõket, akik még nem töltötték be a 65. életévüket, de az 58. már igen.")=True))
ORDER BY Year([Születési idõ])+58, Month([Születési idõ]);

#/#/#/
lkNyugdíjazandóDolgozókNõk40Havonta
#/#/
SELECT Year(IIf([58_ életévét betölti]<Date(),Date(),[58_ életévét betölti])) & "." & IIf(Len(Month(IIf([58_ életévét betölti]<Date(),Date(),[58_ életévét betölti])))<2,0,"") & Month(IIf([58_ életévét betölti]<Date(),Date(),[58_ életévét betölti])) AS Hónapok, Count(lkNyugdíjazandóDolgozókNõk40.[Dolgozó teljes neve]) AS Létszám
FROM lkNyugdíjazandóDolgozókNõk40
GROUP BY Year(IIf([58_ életévét betölti]<Date(),Date(),[58_ életévét betölti])) & "." & IIf(Len(Month(IIf([58_ életévét betölti]<Date(),Date(),[58_ életévét betölti])))<2,0,"") & Month(IIf([58_ életévét betölti]<Date(),Date(),[58_ életévét betölti]));

#/#/#/
lkNyugdíjazandóVezetõk
#/#/
SELECT Year([Születési idõ])+65 AS Év, Format([Születési idõ],"mmmm") AS Hó, Format([születési idõ],"dd") AS Nap, lkMindenVezetõ.[Dolgozó teljes neve] AS Név, lkMindenVezetõ.Fõosztály, lkMindenVezetõ.Osztály, lkMindenVezetõ.Besorolás2 AS Besorolás
FROM lkMindenVezetõ
WHERE (((lkMindenVezetõ.[Születési idõ]) Between DateAdd("yyyy",-61,Date()) And DateAdd("yyyy",-65,Date())))
ORDER BY lkMindenVezetõ.[Születési idõ], lkMindenVezetõ.BFKH;

#/#/#/
lkNyugdíjazottÉsNyugdíjazandóVezetõkKétDátumKözött01
#/#/
SELECT lkMindenKilépettVezetõ.Adójel, lkMindenKilépettVezetõ.Név, lkMindenKilépettVezetõ.Fõosztály, lkMindenKilépettVezetõ.Osztály, lkMindenKilépettVezetõ.[Besorolási fokozat megnevezése:], lkMindenKilépettVezetõ.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva], lkMindenKilépettVezetõ.Kilépés AS [Kilépés dátuma]
FROM lkMindenKilépettVezetõ
WHERE (((lkMindenKilépettVezetõ.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva])="A kormánytisztviselõ kérelmére a társadalombiztosítási nyugellátásról szóló 1997. évi LXXXI. tv. 18. § (2a) bekezdésében foglalt feltétel fennállása miatt [Kit. 107. § (2) bek. e) pont, 105. § (1) bekezdés c]") AND ((lkMindenKilépettVezetõ.Kilépés) Between [a Kilépés legkorábbi dátuma] And [A Kilépés legkésõbbi dátuma])) OR (((lkMindenKilépettVezetõ.Kilépés)>=DateSerial(Year([születési dátum])+65,Month([Születési dátum]),Day([Születési dátum])-1) And (lkMindenKilépettVezetõ.Kilépés) Between [a Kilépés legkorábbi dátuma] And [A Kilépés legkésõbbi dátuma]));

#/#/#/
lkNyugdíjazottÉsNyugdíjazandóVezetõkKétDátumKözött02
#/#/
SELECT lkMindenVezetõ.Adójel, lkMindenVezetõ.[Dolgozó teljes neve], lkMindenVezetõ.Fõosztály, lkMindenVezetõ.Osztály, lkMindenVezetõ.[Ellátott feladat] AS [Besorolási fokozat], "" AS Jogvmegsz, lkMindenVezetõ.[Öregségi nyugdíj korhatár] AS [Kilépés dátuma]
FROM lkMindenVezetõ
WHERE (((lkMindenVezetõ.[Öregségi nyugdíj korhatár])>[A Kilépés legkorábbi dátuma] And (lkMindenVezetõ.[Öregségi nyugdíj korhatár])<[A Kilépés legkésõbbi dátuma] And (lkMindenVezetõ.[Öregségi nyugdíj korhatár])<=IIf([Kilépés]=0,#1/1/3000#,[kilépés])));

#/#/#/
lkNyugdíjazottÉsNyugdíjazandóVezetõkKétDátumKözött03
#/#/
SELECT DISTINCT lkNyugdíjazottÉsNyugdíjazandóVezetõkKétDátumKözött01.*
FROM lkNyugdíjazottÉsNyugdíjazandóVezetõkKétDátumKözött01
UNION SELECT lkNyugdíjazottÉsNyugdíjazandóVezetõkKétDátumKözött02.*
FROM  lkNyugdíjazottÉsNyugdíjazandóVezetõkKétDátumKözött02;

#/#/#/
lkororszukrányNyelvvizsgák20240912
#/#/
SELECT Nz([Dolgozó azonosító],0)*1 AS Adójel, tOroszUkránNyelvvizsgák20240912.*
FROM tOroszUkránNyelvvizsgák20240912;

#/#/#/
lkoroszukránVégzettség
#/#/
SELECT DISTINCT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Hivatali email], lkSzemélyek.[Hivatali telefon], lkVégzettségek.[Végzettség neve]
FROM lkVégzettségek INNER JOIN lkSzemélyek ON lkVégzettségek.Adójel = lkSzemélyek.Adójel
WHERE (((lkVégzettségek.[Végzettség neve]) Like "*" & [idegen_nyelv] & "*"));

#/#/#/
lkoroszukránNyelvtudásSzemélytörzsbõl
#/#/
SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Hivatali email], lkSzemélyek.[Hivatali telefon], lkororszukrányNyelvvizsgák20240912.[Nyelv neve], lkororszukrányNyelvvizsgák20240912.[Nyelvvizsga foka], lkororszukrányNyelvvizsgák20240912.[Nyelvvizsga típusa], lkSzemélyek.[Státusz neve]
FROM lkororszukrányNyelvvizsgák20240912 LEFT JOIN lkSzemélyek ON lkororszukrányNyelvvizsgák20240912.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Nyelvtudás Orosz])<>"") AND ((lkSzemélyek.[Státusz neve])="álláshely")) OR (((lkSzemélyek.[Nyelvtudás Ukrán])<>"") AND ((lkSzemélyek.[Státusz neve])="álláshely"));

#/#/#/
lkOrvosÁlláshelyekenDolgozók
#/#/
SELECT lkOrvosiÁlláshelyekSorszáma.Sor AS Sorszám, 789235 AS [PIR törzsszám], lkÁlláshelyekHaviból.[Álláshely azonosító] AS [az álláshely ÁNYR azonosító száma], Nü([Dolgozó teljes neve],"üres") AS [a kormánytisztviselõ neve], lkSzemélyek.adójel AS [adóazonosító jele (10 karakter)], lkSzemélyek.[Születési idõ], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS [a belépés dátuma], lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS [a heti munkaidõ tartama], IIf(IsNull([Dolgozó teljes neve]),"","igen") AS [rendelkezik orvos végzettséggel], lkOrvosokAdatai.NyilvántartásiSzám AS [egészségügyi alapnyilvántartási száma], lkSzemélyek.[KIRA feladat megnevezés] AS [a kormánytisztviselõ feladatköre], IIf([Besorolási  fokozat (KT)] Like "*osztály*",[Besorolási  fokozat (KT)],"nincs") AS [a kormánytisztviselõ vezetõi besorolása], IIf(Nz([Státuszkód],"-")="-",False,True) AS [Orvos álláshely], lkIlletményTörténet.[Havi illetmény] AS [a Kit szerinti bruttó illetménye 2024 június hónapban], lkIlletményTörténet.[Besorolási fokozat megnevezése:] AS [a Kit szerinti besorolási fokozata 2024 június hónapban], lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)] AS [a Kit szerinti illetménye 2024 július hónapban], lkÁlláshelyekHaviból.Fõoszt, lkÁlláshelyekHaviból.Osztály, lkSzemélyek.FEOR, lkSzemélyek.[Iskolai végzettség neve], lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Besorolási  fokozat (KT)], lkOrvosokAdatai.EszmeiIdõKezdete, DateDiff("yyyy",[EszmeiIdõKezdete],Now()) AS ÉvekSzáma, lkOrvosokAdatai.EszjtvBesorolásSzerintiIlletmény
FROM lkOrvosokAdatai RIGHT JOIN (lkOrvosiÁlláshelyekSorszáma RIGHT JOIN ((lkIlletményTörténet RIGHT JOIN lkSzemélyek ON lkIlletményTörténet.Adójel = lkSzemélyek.Adójel) RIGHT JOIN (lkOrvosiÁlláshelyek RIGHT JOIN lkÁlláshelyekHaviból ON lkOrvosiÁlláshelyek.Státuszkód = lkÁlláshelyekHaviból.[Álláshely azonosító]) ON lkSzemélyek.[Státusz kódja] = lkOrvosiÁlláshelyek.Státuszkód) ON lkOrvosiÁlláshelyekSorszáma.Státuszkód = lkOrvosiÁlláshelyek.Státuszkód) ON lkOrvosokAdatai.Adójel = lkSzemélyek.Adójel
WHERE (((lkOrvosiÁlláshelyek.Státuszkód) Is Not Null) AND ((lkSzemélyek.[státusz neve])="Álláshely" Or (lkSzemélyek.[státusz neve]) Is Null) AND ((lkIlletményTörténet.hatálya)=#6/30/2024# Or (lkIlletményTörténet.hatálya) Is Null));

#/#/#/
lkOrvosÁlláshelyekenDolgozókEllenõrzésbe
#/#/
SELECT lkOrvosÁlláshelyekenDolgozók.Név, lkOrvosÁlláshelyekenDolgozók.[az álláshely ÁNYR azonosító száma], lkOrvosÁlláshelyekenDolgozók.Fõoszt, lkOrvosÁlláshelyekenDolgozók.Osztály, lkOrvosÁlláshelyekenDolgozók.[Iskolai végzettség neve], lkOrvosÁlláshelyekenDolgozók.[KIRA feladat megnevezés], lkOrvosÁlláshelyekenDolgozók.FEOR, lkOrvosÁlláshelyekenDolgozók.[Besorolási  fokozat (KT)]
FROM lkOrvosÁlláshelyekenDolgozók;

#/#/#/
lkOrvosÁlláshelyekenDolgozókKEHI01
#/#/
SELECT lkOrvosÁlláshelyekenDolgozók.Sorszám, lkOrvosÁlláshelyekenDolgozók.[PIR törzsszám], lkOrvosÁlláshelyekenDolgozók.[az álláshely ÁNYR azonosító száma], lkOrvosÁlláshelyekenDolgozók.[a kormánytisztviselõ neve], lkOrvosÁlláshelyekenDolgozók.[adóazonosító jele (10 karakter)], lkOrvosÁlláshelyekenDolgozók.[Születési idõ], lkOrvosÁlláshelyekenDolgozók.[a belépés dátuma], lkOrvosÁlláshelyekenDolgozók.[a heti munkaidõ tartama], lkOrvosÁlláshelyekenDolgozók.[rendelkezik orvos végzettséggel], lkOrvosÁlláshelyekenDolgozók.[egészségügyi alapnyilvántartási száma], lkOrvosÁlláshelyekenDolgozók.[a kormánytisztviselõ feladatköre], lkOrvosÁlláshelyekenDolgozók.[a kormánytisztviselõ vezetõi besorolása], lkOrvosÁlláshelyekenDolgozók.[Orvos álláshely], lkOrvosÁlláshelyekenDolgozók.[a Kit szerinti bruttó illetménye 2024 június hónapban], lkOrvosÁlláshelyekenDolgozók.[a Kit szerinti besorolási fokozata 2024 június hónapban], lkOrvosÁlláshelyekenDolgozók.[a Kit szerinti bruttó illetménye 2024 június hónapban], lkOrvosÁlláshelyekenDolgozók.Fõoszt, lkOrvosÁlláshelyekenDolgozók.Osztály, lkOrvosÁlláshelyekenDolgozók.FEOR, lkOrvosÁlláshelyekenDolgozók.[Iskolai végzettség neve], lkOrvosÁlláshelyekenDolgozók.[KIRA feladat megnevezés], lkOrvosÁlláshelyekenDolgozók.Név, lkOrvosÁlláshelyekenDolgozók.[Besorolási  fokozat (KT)], lkOrvosÁlláshelyekenDolgozók.EszmeiIdõKezdete, lkOrvosÁlláshelyekenDolgozók.ÉvekSzáma, EszjtvBesorolásiKategóriák.EszjtvBesorolásiKategóriák, lkOrvosÁlláshelyekenDolgozók.EszjtvBesorolásSzerintiIlletmény
FROM lkOrvosÁlláshelyekenDolgozók, EszjtvBesorolásiKategóriák
WHERE (((EszjtvBesorolásiKategóriák.Max)>=[ÉvekSzáma]) AND ((EszjtvBesorolásiKategóriák.Min)<=[ÉvekSzáma]));

#/#/#/
lkOrvosÁlláshelyekenDolgozókKEHI02
#/#/
SELECT lkOrvosÁlláshelyekenDolgozók.Sorszám, lkOrvosÁlláshelyekenDolgozók.[PIR törzsszám], lkOrvosÁlláshelyekenDolgozók.[az álláshely ÁNYR azonosító száma], lkOrvosÁlláshelyekenDolgozók.[a kormánytisztviselõ neve], lkOrvosÁlláshelyekenDolgozók.[adóazonosító jele (10 karakter)], lkOrvosÁlláshelyekenDolgozók.[Születési idõ], lkOrvosÁlláshelyekenDolgozók.[a belépés dátuma], lkOrvosÁlláshelyekenDolgozók.[a heti munkaidõ tartama], lkOrvosÁlláshelyekenDolgozók.[rendelkezik orvos végzettséggel], lkOrvosÁlláshelyekenDolgozók.[egészségügyi alapnyilvántartási száma], lkOrvosÁlláshelyekenDolgozók.[a kormánytisztviselõ feladatköre], lkOrvosÁlláshelyekenDolgozók.[a kormánytisztviselõ vezetõi besorolása], lkOrvosÁlláshelyekenDolgozók.[Orvos álláshely], lkOrvosÁlláshelyekenDolgozók.[a Kit szerinti bruttó illetménye 2024 június hónapban], lkOrvosÁlláshelyekenDolgozók.[a Kit szerinti besorolási fokozata 2024 június hónapban], lkOrvosÁlláshelyekenDolgozók.[a Kit szerinti illetménye 2024 július hónapban], lkOrvosÁlláshelyekenDolgozók.Fõoszt, lkOrvosÁlláshelyekenDolgozók.Osztály, lkOrvosÁlláshelyekenDolgozók.FEOR, lkOrvosÁlláshelyekenDolgozók.[Iskolai végzettség neve], lkOrvosÁlláshelyekenDolgozók.[KIRA feladat megnevezés], lkOrvosÁlláshelyekenDolgozók.Név, lkOrvosÁlláshelyekenDolgozók.[Besorolási  fokozat (KT)], lkOrvosÁlláshelyekenDolgozók.EszmeiIdõKezdete, lkOrvosÁlláshelyekenDolgozók.ÉvekSzáma, "" AS EszjtvBesorolásiKategóriák, 0 AS EszjtvBesorolásSzerintiIlletmény
FROM lkOrvosÁlláshelyekenDolgozók
WHERE (((lkOrvosÁlláshelyekenDolgozók.[a kormánytisztviselõ neve])="üres"));

#/#/#/
lkOrvosÁlláshelyekenDolgozókKEHI03
#/#/
SELECT ÜresekÉsKategóriázottak.*, *
FROM (SELECT lkOrvosÁlláshelyekenDolgozókKEHI02.*
from lkOrvosÁlláshelyekenDolgozókKEHI02 union
SELECT lkOrvosÁlláshelyekenDolgozókKEHI01.*
FROM lkOrvosÁlláshelyekenDolgozókKEHI01)  AS ÜresekÉsKategóriázottak;

#/#/#/
lkOrvosÁlláshelyekenDolgozóNemOrvosokEllenõrzésbe
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.[Státusz kódja] AS ÁNYR, lkSzemélyek.[KIRA feladat megnevezés] AS [KIRA feladat], lkSzemélyek.FEOR, lkSzemélyek.[Iskolai végzettség neve], kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN (lkSzemélyek RIGHT JOIN lkOrvosiÁlláshelyek ON lkSzemélyek.[Státusz kódja] = lkOrvosiÁlláshelyek.Státuszkód) ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Iskolai végzettség neve]) Not Like "*orvos*") AND ((([lkSzemélyek].[FEOR]) Like "*orvos*" And ([lkSzemélyek].[FEOR]) Not Like "*rvosi laboratóriumi asszisztens")=False) AND ((([lkSzemélyek].[Iskolai végzettség neve]) Like "*járvány*" And ([lkSzemélyek].[Iskolai végzettség neve])<>"közegészségügyi - járványügyi ellenõr" And ([lkSzemélyek].[Iskolai végzettség neve])<>"közegészségügyi - járványügyi felügyelõ")=False) AND ((lkSzemélyek.[státusz neve])="Álláshely"));

#/#/#/
lkOrvosÁlláshelyekrõlJelentés
#/#/
SELECT lkOrvosÁlláshelyekenDolgozók.Név, lkOrvosÁlláshelyekenDolgozók.Státuszkód, lkOrvosÁlláshelyekenDolgozók.Fõoszt, lkOrvosÁlláshelyekenDolgozók.Osztály, lkOrvosÁlláshelyekenDolgozók.[Iskolai végzettség neve], lkOrvosÁlláshelyekenDolgozók.[KIRA feladat megnevezés], lkOrvosÁlláshelyekenDolgozók.FEOR, lkOrvosÁlláshelyekenDolgozók.[Besorolási  fokozat (KT)], lkOrvosÁlláshelyekenDolgozók.Szint, lkOrvosÁlláshelyekenDolgozók.tisztifõorvos, lkOrvosÁlláshelyekenDolgozók.helyettes, lkOrvosÁlláshelyekenDolgozók.[közegészség-, vagy járványügyi], lkOrvosÁlláshelyekenDolgozók.Egészségbiztosítási, lkOrvosÁlláshelyekenDolgozók.Rehabilitációs, [lkOrvosok].[Státusz kódja] Is Not Null AS Orvos
FROM (lkOrvosÁlláshelyekenDolgozók LEFT JOIN lkOrvosok ON lkOrvosÁlláshelyekenDolgozók.Státuszkód = lkOrvosok.[Státusz kódja]) LEFT JOIN lkSzemélyek ON lkOrvosÁlláshelyekenDolgozók.Adójel = lkSzemélyek.Adójel;

#/#/#/
lkOrvosiAlkalmasságiVizsgálatElõzõHónap
#/#/
SELECT lkSzemélyek.[TAJ szám], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Orvosi vizsgálat idõpontja]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Orvosi vizsgálat idõpontja]) Between DateSerial(Year(Now()),Month(Now())-1,1) And DateSerial(Year(Now()),Month(Now()),0)))
ORDER BY lkSzemélyek.BFKH, lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkOrvosiÁlláshelyek
#/#/
SELECT tOrvosiÁlláshelyek.azOrvosiÁlláshely, tOrvosiÁlláshelyek.[alaplétszámba tartozó orvosi  álláshely azonosítója] AS Státuszkód, tOrvosiÁlláshelyek.HatályKezdet AS [Utolsó hatály], tOrvosiÁlláshelyek.HatályVég
FROM tOrvosiÁlláshelyek
WHERE (((tOrvosiÁlláshelyek.HatályVég) Is Null) AND (("Eredetileg ez volt:(Select Max(Hatály) From [tOrvosiÁlláshelyek] as tmp Where [tOrvosiÁlláshelyek].[alaplétszámba tartozó orvosi  álláshely azonosítója]=tmp.[alaplétszámba tartozó orvosi  álláshely azonosítója])")<>""));

#/#/#/
lkOrvosiÁlláshelyekSorszáma
#/#/
SELECT (Select count([Státuszkód]) From lkOrvosiÁlláshelyek as Tmp Where Tmp.[Státuszkód]>=lkOrvosiÁlláshelyek.[Státuszkód]) AS Sor, lkOrvosiÁlláshelyek.Státuszkód
FROM lkOrvosiÁlláshelyek
ORDER BY lkOrvosiÁlláshelyek.Státuszkód DESC;

#/#/#/
lkOrvosiVizsgálatHumán
#/#/
SELECT Month([Jogviszony kezdete (belépés dátuma)]) AS [Belépés hónapja], IIf([Orvosi vizsgálat következõ idõpontja]<DateAdd("m",1,DateSerial(Year(Now()),Month(Now()),1))-1,"Lejáró","") AS Lejárók, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[TAJ szám], lkSzemélyek.[Hivatali email], lkSzemélyek.[Hivatali mobil], lkSzemélyek.[Születési idõ], lkSzemélyek.[Születési hely], lkSzemélyek.[Anyja neve], lkSzemélyek.Neme, lkSzemélyek.[Állandó lakcím], lkSzemélyek.[Szervezeti egység neve], lkSzemélyek.[Orvosi vizsgálat idõpontja], lkSzemélyek.[Orvosi vizsgálat típusa], lkSzemélyek.[Orvosi vizsgálat eredménye], lkSzemélyek.[Orvosi vizsgálat észrevételek], lkSzemélyek.[Orvosi vizsgálat következõ idõpontja], lkSzemélyek.[Tartós távollét típusa]
FROM lkSzemélyek
GROUP BY Month([Jogviszony kezdete (belépés dátuma)]), IIf([Orvosi vizsgálat következõ idõpontja]<DateAdd("m",1,DateSerial(Year(Now()),Month(Now()),1))-1,"Lejáró",""), lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[TAJ szám], lkSzemélyek.[Hivatali email], lkSzemélyek.[Hivatali mobil], lkSzemélyek.[Születési idõ], lkSzemélyek.[Születési hely], lkSzemélyek.[Anyja neve], lkSzemélyek.Neme, lkSzemélyek.[Állandó lakcím], lkSzemélyek.[Szervezeti egység neve], lkSzemélyek.[Orvosi vizsgálat idõpontja], lkSzemélyek.[Orvosi vizsgálat típusa], lkSzemélyek.[Orvosi vizsgálat eredménye], lkSzemélyek.[Orvosi vizsgálat észrevételek], lkSzemélyek.[Orvosi vizsgálat következõ idõpontja], lkSzemélyek.[Tartós távollét típusa]
HAVING (((lkSzemélyek.[Szervezeti egység neve]) Like "*humán*"));

#/#/#/
lkOrvosiVizsgálatTeljesÁllomány
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Dolgozó születési neve] AS [Születési név], lkSzemélyek.[Születési idõ], lkSzemélyek.[Születési hely], lkSzemélyek.[TAJ szám], lkSzemélyek.[Orvosi vizsgálat idõpontja], lkSzemélyek.[Orvosi vizsgálat következõ idõpontja], lkSzemélyek.[Hivatali email], IIf([tartós távollét típusa] Is Not Null,"TT","") AS TT, lkSzemélyek.[Jogviszony vége (kilépés dátuma)] AS [Kilépés dátuma]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkOrvosiVizsgálatTeljesÁllomány_EgészségügyiSzolgáltatóAdataival
#/#/
SELECT lkOrvosiVizsgálatTeljesÁllomány.Fõosztály, lkOrvosiVizsgálatTeljesÁllomány.Osztály, lkOrvosiVizsgálatTeljesÁllomány.Név, lkOrvosiVizsgálatTeljesÁllomány.[Születési név], lkOrvosiVizsgálatTeljesÁllomány.[Születési idõ], lkOrvosiVizsgálatTeljesÁllomány.[Születési hely], lkOrvosiVizsgálatTeljesÁllomány.[TAJ szám], IIf([Kilépés dátuma]<DateSerial(Year(Now()),Month(Now())+4,1)-1 And (Nz([Orvosi vizsgálat következõ idõpontja],0)<Now() And Nz([TT],"")<>"TT") Or (Nz([Lejárat dátuma],"")<>"" And Nz([Lejárat dátuma],0)<Now()),"Lejárt","") AS Lejárt_e, lkOrvosiVizsgálatTeljesÁllomány.[Orvosi vizsgálat következõ idõpontja], lkOrvosiVizsgálatTeljesÁllomány.[Hivatali email], lkOrvosiVizsgálatTeljesÁllomány.TT, lkOrvosiVizsgálatTeljesÁllomány.[Kilépés dátuma], lkEgészségügyiSzolgáltatóAdataiUnió.Munkakör, lkEgészségügyiSzolgáltatóAdataiUnió.[Vizsgálat típusa], lkEgészségügyiSzolgáltatóAdataiUnió.[Lejárat dátuma], lkEgészségügyiSzolgáltatóAdataiUnió.Korlátozás, lkEgészségügyiSzolgáltatóAdataiUnió.[Vizsgálat eredménye], lkEgészségügyiSzolgáltatóAdataiUnió.[Vizsgálat Dátuma]
FROM lkEgészségügyiSzolgáltatóAdataiUnió RIGHT JOIN lkOrvosiVizsgálatTeljesÁllomány ON lkEgészségügyiSzolgáltatóAdataiUnió.TAJ = lkOrvosiVizsgálatTeljesÁllomány.[TAJ szám]
WHERE (((True)<>False))
ORDER BY IIf([Kilépés dátuma]<DateSerial(Year(Now()),Month(Now())+4,1)-1 And (Nz([Orvosi vizsgálat következõ idõpontja],0)<Now() And Nz([TT],"")<>"TT") Or (Nz([Lejárat dátuma],"")<>"" And Nz([Lejárat dátuma],0)<Now()),"Lejárt","") DESC , lkOrvosiVizsgálatTeljesÁllomány.[Orvosi vizsgálat következõ idõpontja];

#/#/#/
lkOrvosiVizsgálatTeljesÁllomány_munkahelyStatisztika01
#/#/
SELECT IIf([Munkavégzés helye - cím] Is Null Or [Munkavégzés helye - cím]="",[Munkavégzés helye - megnevezés],[Munkavégzés helye - cím]) AS Cím, lkOrvosiVizsgálatTeljesÁllomány_EgészségügyiSzolgáltatóAdataival.[TAJ szám], Irsz([Cím])*1 AS irsz, kerület([irsz]) AS Kerület, IIf(Kerület([irsz]) Between 1 And 3 Or kerület([irsz]) Between 11 And 12 Or kerület([irsz])=22,"Buda","Pest") AS Oldal
FROM lkOrvosiVizsgálatTeljesÁllomány_EgészségügyiSzolgáltatóAdataival INNER JOIN lkSzemélyek ON lkOrvosiVizsgálatTeljesÁllomány_EgészségügyiSzolgáltatóAdataival.[TAJ szám] = lkSzemélyek.[TAJ szám]
WHERE (((lkOrvosiVizsgálatTeljesÁllomány_EgészségügyiSzolgáltatóAdataival.Lejárt_e)="Lejárt"))
ORDER BY lkOrvosiVizsgálatTeljesÁllomány_EgészségügyiSzolgáltatóAdataival.[TAJ szám] DESC;

#/#/#/
lkOrvosiVizsgálatTeljesÁllomány_telephelyenként
#/#/
SELECT lkOrvosiVizsgálatTeljesÁllomány_munkahelyStatisztika01.Cím, Count(lkOrvosiVizsgálatTeljesÁllomány_munkahelyStatisztika01.[TAJ szám]) AS Létszám
FROM lkOrvosiVizsgálatTeljesÁllomány_munkahelyStatisztika01
GROUP BY lkOrvosiVizsgálatTeljesÁllomány_munkahelyStatisztika01.Cím;

#/#/#/
lkOrvosiVizsgálatTeljesÁllomány_városrészenként
#/#/
SELECT lkOrvosiVizsgálatTeljesÁllomány_munkahelyStatisztika01.Oldal, lkOrvosiVizsgálatTeljesÁllomány_munkahelyStatisztika01.Kerület, Count(lkOrvosiVizsgálatTeljesÁllomány_munkahelyStatisztika01.[TAJ szám]) AS Létszám
FROM lkOrvosiVizsgálatTeljesÁllomány_munkahelyStatisztika01
GROUP BY lkOrvosiVizsgálatTeljesÁllomány_munkahelyStatisztika01.Oldal, lkOrvosiVizsgálatTeljesÁllomány_munkahelyStatisztika01.Kerület;

#/#/#/
lkOrvosok
#/#/
SELECT IIf([Dolgozó teljes neve] Is Null,"üres",[Dolgozó teljes neve]) AS Név, lkSzemélyek.[Státusz kódja], lkÁlláshelyekHaviból.Fõoszt, lkÁlláshelyekHaviból.Osztály, lkSzemélyek.[Iskolai végzettség neve], lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.FEOR, lkSzemélyek.[Besorolási  fokozat (KT)], IIf([Fõoszt] Like "*kerületi*","járás","vármegye") AS Szint, "" AS tisztifõorvos, "" AS helyettes, IIf([fõoszt] Like "*népegészség*" Or [Osztály] Like "*népegészség*","igen","") AS [közegészség-, vagy járványügyi], IIf([fõoszt] Like "*Egészségbizt*","igen","") AS Egészségbiztosítási, IIf([osztály]="Rehabilitációs Szakértõi Osztály 2." Or [osztály]="Rehabilitációs Szakértõi Osztály 3.","igen","") AS Rehabilitációs, IIf(Nz([Státuszkód],"-")="-",False,True) AS [Orvos álláshely], lkSzemélyek.[Jogfolytonos idõ kezdete], lkSzemélyek.Adójel
FROM lkOrvosiÁlláshelyek RIGHT JOIN (lkÁlláshelyekHaviból LEFT JOIN lkSzemélyek ON lkÁlláshelyekHaviból.[Álláshely azonosító] = lkSzemélyek.[Státusz kódja]) ON lkOrvosiÁlláshelyek.Státuszkód = lkSzemélyek.[Státusz kódja]
WHERE (((lkÁlláshelyekHaviból.Fõoszt) Like "Rehab*" Or (lkÁlláshelyekHaviból.Fõoszt) Like "Népeg*" Or (lkÁlláshelyekHaviból.Fõoszt) Like "Egész*") AND ((lkSzemélyek.FEOR) Like "*orvos*") AND ((lkSzemélyek.[státusz neve])="Álláshely")) OR (((lkÁlláshelyekHaviból.Fõoszt) Like "Rehab*" Or (lkÁlláshelyekHaviból.Fõoszt) Like "Népeg*" Or (lkÁlláshelyekHaviból.Fõoszt) Like "Egész*") AND ((lkSzemélyek.[KIRA feladat megnevezés]) Like "*orvos*" And (lkSzemélyek.[KIRA feladat megnevezés])<>"Fõosztályvezetõi feladatok (több szakmai területet magában foglaló szervezeti egységeknél, ha nem fõállatorvos vagy tisztifõorvos)")) OR (((lkÁlláshelyekHaviból.Osztály) Like "Népeg*") AND ((lkSzemélyek.FEOR) Like "*orvos*")) OR (((lkÁlláshelyekHaviból.Osztály) Like "Népeg*") AND ((lkSzemélyek.[KIRA feladat megnevezés]) Like "*orvos*" And (lkSzemélyek.[KIRA feladat megnevezés])<>"Fõosztályvezetõi feladatok (több szakmai területet magában foglaló szervezeti egységeknél, ha nem fõállatorvos vagy tisztifõorvos)")) OR (((lkSzemélyek.[Iskolai végzettség neve]) Like "*orvos*")) OR (((lkSzemélyek.[Iskolai végzettség neve]) Like "*járvány*" And (lkSzemélyek.[Iskolai végzettség neve])<>"közegészségügyi - járványügyi ellenõr" And (lkSzemélyek.[Iskolai végzettség neve])<>"közegészségügyi - járványügyi felügyelõ"));

#/#/#/
lkOrvosokAdatai
#/#/
SELECT tOrvosokAdatai.azOrvos, tOrvosokAdatai.Adójel, tOrvosokAdatai.EszmeiIdõKezdete, tOrvosokAdatai.ÉvekSzáma, tOrvosokAdatai.EszjtvBesorolásSzerintiIlletmény, tOrvosokAdatai.NyilvántartásiSzám
FROM tOrvosokAdatai
WHERE (((tOrvosokAdatai.OrvosHatályVége) Is Null));

#/#/#/
lkOsztályokFeladatkörönkéntiLétszáma
#/#/
SELECT [lkÁlláshelyek(havi)_1].Fõosztály, [lkÁlláshelyek(havi)_1].Osztály, [lkÁlláshelyek(havi)_1].Feladatkör, Sum(IIf([Állapot]="betöltött",1,0)) AS Betöltött, Sum(IIf([Állapot]="betöltött",0,1)) AS Üres
FROM [lkÁlláshelyek(havi)] AS [lkÁlláshelyek(havi)_1]
GROUP BY [lkÁlláshelyek(havi)_1].Fõosztály, [lkÁlláshelyek(havi)_1].Osztály, [lkÁlláshelyek(havi)_1].Feladatkör, [lkÁlláshelyek(havi)_1].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
ORDER BY bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]);

#/#/#/
lkOsztályonkéntiÁlláshelyekÁNYR
#/#/
SELECT lk_Fõosztály_Osztály_tSzervezet.bfkhkód, Nz([Dolgozó teljes neve],"üres álláshely") AS Név, lk_Fõosztály_Osztály_tSzervezet.Fõoszt, lk_Fõosztály_Osztály_tSzervezet.Osztály, lkÁlláshelyek.[Álláshely besorolási kategóriája] AS [Álláshely besorolása], lkÁlláshelyek.[Álláshely azonosító], Nz([Szerzõdés/Kinevezés típusa],"határozatlan") AS [Álláshely hatálya], IIf(Nz([Tartós távollét típusa],"")="","Nem","Igen") AS [Tartós távollévõ], lkSzemélyek.[Jogviszony típusa / jogviszony típus] AS [Jogviszony típusa], lkÁlláshelyek.[Álláshely típusa], lkSzemélyek.[Jogviszony vége (kilépés dátuma)] AS [KIlépés dátuma]
FROM lk_Fõosztály_Osztály_tSzervezet RIGHT JOIN (lkSzemélyek RIGHT JOIN lkÁlláshelyek ON lkSzemélyek.[Státusz kódja] = lkÁlláshelyek.[Álláshely azonosító]) ON (lk_Fõosztály_Osztály_tSzervezet.Osztály = lkÁlláshelyek.Oszt) AND (lk_Fõosztály_Osztály_tSzervezet.Fõoszt = lkÁlláshelyek.Fõoszt);

#/#/#/
lkOsztályonkéntiÁlláshelyekÁNYR - azonosak keresése
#/#/
SELECT lkOsztályonkéntiÁlláshelyekÁNYR.[Álláshely azonosító], lkOsztályonkéntiÁlláshelyekÁNYR.Fõoszt
FROM lkOsztályonkéntiÁlláshelyekÁNYR
WHERE (((lkOsztályonkéntiÁlláshelyekÁNYR.[Álláshely azonosító]) In (SELECT [Álláshely azonosító] FROM [lkOsztályonkéntiÁlláshelyekÁNYR] As Tmp GROUP BY [Álláshely azonosító] HAVING Count(*)>1 )))
ORDER BY lkOsztályonkéntiÁlláshelyekÁNYR.[Álláshely azonosító];

#/#/#/
lkOsztályvezetõiÁlláshelyek
#/#/
SELECT lkSzervezetekSzemélyekbõl.bfkh, lkSzervezetÁlláshelyek.SzervezetKód, lkSzervezetekSzemélyekbõl.Fõosztály, lkSzervezetekSzemélyekbõl.Osztály, lkSzervezetÁlláshelyek.álláshely, lkSzervezetÁlláshelyek.[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés], lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.[Vezetõi beosztás megnevezése], lkSzemélyek.[Vezetõi megbízás típusa], lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)] AS Illetmény, lkSzemélyek.[Tartós távollét típusa], lkSzemélyek.[Tartós távollét vége], lkSzemélyek.[Tartós távollét tervezett vége], kt_azNexon_Adójel02.NLink
FROM (lkSzervezetekSzemélyekbõl RIGHT JOIN (lkSzervezetÁlláshelyek LEFT JOIN lkSzemélyek ON lkSzervezetÁlláshelyek.Álláshely = lkSzemélyek.[Státusz kódja]) ON lkSzervezetekSzemélyekbõl.[Szervezeti egység kódja] = lkSzervezetÁlláshelyek.SzervezetKód) LEFT JOIN kt_azNexon_Adójel02 ON lkSzemélyek.Adójel = kt_azNexon_Adójel02.Adójel
WHERE (((lkSzemélyek.[Besorolási  fokozat (KT)])="Osztályvezetõ") AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkSzemélyek.[Vezetõi megbízás típusa])="Osztályvezetõ") AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkSzemélyek.[Vezetõi beosztás megnevezése])="Osztályvezetõ") AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkSzervezetÁlláshelyek.[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés])="osztályvezetõ"))
ORDER BY lkSzervezetekSzemélyekbõl.bfkh;

#/#/#/
lkOsztályvezetõiÁlláshelyekElsõKinevezésDátumával
#/#/
SELECT lkOsztályvezetõiÁlláshelyek.bfkh, lkOsztályvezetõiÁlláshelyek.SzervezetKód, lkOsztályvezetõiÁlláshelyek.Fõosztály, lkOsztályvezetõiÁlláshelyek.Osztály, lkOsztályvezetõiÁlláshelyek.álláshely, Nz([Dolgozó teljes neve],"Betöltetlen") AS Név, lkOsztályvezetõiÁlláshelyek.Illetmény, lkElsõOsztályvezetõvéSorolásDátuma.[MinOfVáltozás dátuma]
FROM lkElsõOsztályvezetõvéSorolásDátuma RIGHT JOIN (kt_azNexon_Adójel02 RIGHT JOIN lkOsztályvezetõiÁlláshelyek ON kt_azNexon_Adójel02.NLink = lkOsztályvezetõiÁlláshelyek.NLink) ON lkElsõOsztályvezetõvéSorolásDátuma.Adójel = kt_azNexon_Adójel02.Adójel;

#/#/#/
lkÖregkoriNyugdíjazásÉsTT
#/#/
SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, Year([Születési idõ])+65 AS [Öregkori nyugdíjazás éve], lkSzemélyek.[Jogviszony vége (kilépés dátuma)], lkSzemélyek.[Tartós távollét típusa], lkSzemélyek.[Tartós távollét kezdete], lkSzemélyek.[Tartós távollét vége], lkSzemélyek.[Tartós távollét tervezett vége]
FROM lkSzemélyek
WHERE (((lkSzemélyek.Fõosztály) Like "* V. ker*") AND ((Year([Születési idõ])+65) Between Year(Date()) And Year(Date())+1)) OR (((lkSzemélyek.Fõosztály) Like "* II. ker*") AND ((Year([Születési idõ])+65) Between Year(Date()) And Year(Date())+1)) OR (((lkSzemélyek.Fõosztály) Like "* IX. ker*") AND ((Year([Születési idõ])+65) Between Year(Date()) And Year(Date())+1)) OR (((lkSzemélyek.Fõosztály) Like "* V. ker*") AND ((lkSzemélyek.[Tartós távollét kezdete]) Is Not Null)) OR (((lkSzemélyek.Fõosztály) Like "* II. ker*") AND ((lkSzemélyek.[Tartós távollét kezdete]) Is Not Null)) OR (((lkSzemélyek.Fõosztály) Like "* IX. ker*") AND ((lkSzemélyek.[Tartós távollét kezdete]) Is Not Null))
ORDER BY Year([Születési idõ])+65, Bfkh([Szervezeti egység kódja]), lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkÖsszesÁlláshely
#/#/
SELECT [Álláshely azonosító], Mezõ4, [Besorolási fokozat megnevezése:], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Besorolási fokozat kód:], "A" as Jelleg, Mezõ14 as BetöltésAránya
                      FROM Járási_állomány
                      
                  UNION SELECT [Álláshely azonosító], Mezõ4, [Besorolási fokozat megnevezése:], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Besorolási fokozat kód:], "A" as Jelleg, Mezõ14 as BetöltésAránya
                      FROM Kormányhivatali_állomány
                    
                   UNION SELECT [Álláshely azonosító], Mezõ4, [Besorolási fokozat megnevezése:], [Nexon szótárelemnek megfelelõ szervezeti egység azonosító], [Besorolási fokozat kód:], "K" as Jelleg, Mezõ13 as BetöltésAránya
                      FROM Központosítottak;

#/#/#/
lkÖsszesJogviszonyIdõtartamSzemélyek
#/#/
SELECT tSzemélyek.Adójel, Sum(Nü([Jogviszony vége (kilépés dátuma)],Date())-[Jogviszony kezdete (belépés dátuma)]+1) AS ÖsszIdõtartam
FROM tSzemélyek
WHERE (((tSzemélyek.[Jogviszony típusa / jogviszony típus])="Kormányzati szolgálati jogviszony") AND ((Nü([Jogviszony vége (kilépés dátuma)],Date())-[Jogviszony kezdete (belépés dátuma)]+1)>0)) OR (((tSzemélyek.[Jogviszony típusa / jogviszony típus])="Hivatásos állományú") AND ((Nü([Jogviszony vége (kilépés dátuma)],Date())-[Jogviszony kezdete (belépés dátuma)]+1)>0))
GROUP BY tSzemélyek.Adójel;

#/#/#/
lkÖsszetettLétszámStatisztika01
#/#/
SELECT TTvel.Sor, TTvel.Adat, TTvel.Érték AS [Tartósan távollévõkkel], TTvel.nemTT AS [Tartósan távollévõk nélkül]
FROM (SELECT Sor, Adat, Érték, nemTT
FROM lkRészmunkaidõsökLétszáma
UNION ALL
SELECT Sor, Adat, Érték, nemTT
FROM lkNõkLétszáma6ÉvAlattiGyermekkel
UNION ALL
SELECT Sor, Adat, Érték, nemTT
FROM lkNõkLétszáma02
UNION ALL
SELECT Sor, Adat, Érték, nemTT
FROM lkDolgozókLétszáma18ÉvAlattiGyermekkel
UNION ALL
SELECT Sor, Adat, Érték, nemTT
FROM lk55ÉletévüketBetöltöttekLétszáma
UNION ALL
SELECT Sor, Adat, Érték, nemTT
FROM lk25ÉletévüketBeNemTöltöttekLétszáma
UNION ALL
SELECT Sor, Adat, Érték, nemTT
FROM lkBetöltöttLétszám
)  AS TTvel
ORDER BY TTvel.Sor;

#/#/#/
lkÖsszetettLétszámStatisztika02
#/#/
SELECT lkÖsszetettLétszámStatisztika01.Sor, lkÖsszetettLétszámStatisztika01.Adat, lkÖsszetettLétszámStatisztika01.[Tartósan távollévõkkel], lkÖsszetettLétszámStatisztika01.[Tartósan távollévõkkel]/(SELECT COUNT(Adójel) 
        FROM lkSzemélyek 
        WHERE [Státusz neve] = "Álláshely"
    ) AS ArányTávollévõkkel, lkÖsszetettLétszámStatisztika01.[Tartósan távollévõk nélkül], lkÖsszetettLétszámStatisztika01.[Tartósan távollévõk nélkül]/((SELECT COUNT(Adójel) 
            FROM lkSzemélyek 
            WHERE [Státusz neve] = "Álláshely"
        )-(SELECT COUNT([Tartós távollét típusa]) 
            FROM lkSzemélyek 
            WHERE [Státusz neve] = "Álláshely"
        )) AS ArányTávollévõkNélkül
FROM lkÖsszetettLétszámStatisztika01;

#/#/#/
lkÖsszKerületbõlKilépettekHavonta
#/#/
SELECT "Mind" AS Kerület, DateSerial(Year([Jogviszony megszûnésének, megszüntetésének idõpontja]),Month([Jogviszony megszûnésének, megszüntetésének idõpontja])+1,1)-1 AS Tárgyhó, Sum(1) AS Fõ
FROM lkKilépõUnió
WHERE (((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva]) Not Like "*létre*") AND ((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja]) Between #7/1/2023# And #7/31/2024#) AND ((lkKilépõUnió.[Megyei szint VAGY Járási Hivatal]) Like "Budapest Fõváros Kormányhivatala *"))
GROUP BY "Mind", DateSerial(Year([Jogviszony megszûnésének, megszüntetésének idõpontja]),Month([Jogviszony megszûnésének, megszüntetésének idõpontja])+1,1)-1;

#/#/#/
lkÖsszKerületiBetöltöttLétszám01
#/#/
SELECT Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS [Kerületi hivatal], tHaviJelentésHatálya1.hatálya, Sum(IIf([Mezõ4]="üres állás",0,1)) AS [Betöltött létszám], Sum(IIf([Mezõ4]="üres állás",1,0)) AS Üres
FROM tHaviJelentésHatálya1 INNER JOIN tJárási_állomány ON tHaviJelentésHatálya1.hatályaID = tJárási_állomány.hatályaID
GROUP BY Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH"), tHaviJelentésHatálya1.hatálya
HAVING (((tHaviJelentésHatálya1.hatálya) Between #7/1/2023# And #7/31/2024#));

#/#/#/
lkÖsszKerületiBetöltöttLétszám02
#/#/
SELECT "Mind" AS [Kerületi hivatal], lkÖsszKerületiBetöltöttLétszám01.hatálya, Sum(lkÖsszKerületiBetöltöttLétszám01.[Betöltött létszám]) AS Betöltött, Sum(lkÖsszKerületiBetöltöttLétszám01.Üres) AS Üresek, [Betöltött]+[Üresek] AS Engedélyezett
FROM lkÖsszKerületiBetöltöttLétszám01
GROUP BY "Mind", lkÖsszKerületiBetöltöttLétszám01.hatálya;

#/#/#/
lkÖsszKerületiKimutatás
#/#/
SELECT lkÖsszKerületiBetöltöttLétszám02.[Kerületi hivatal], lkÖsszKerületiBetöltöttLétszám02.hatálya, lkÖsszKerületiBetöltöttLétszám02.Betöltött, lkÖsszKerületiBetöltöttLétszám02.Üresek, lkÖsszKerületiBetöltöttLétszám02.Engedélyezett, lkÖsszKerületbõlKilépettekHavonta.Fõ AS Kilépettek
FROM lkÖsszKerületbõlKilépettekHavonta RIGHT JOIN lkÖsszKerületiBetöltöttLétszám02 ON lkÖsszKerületbõlKilépettekHavonta.Tárgyhó = lkÖsszKerületiBetöltöttLétszám02.hatálya;

#/#/#/
lkPGFtábla
#/#/
SELECT [adóazonosító jel]*1 AS Adójel, tPGFtábla.*
FROM tPGFtábla;

#/#/#/
lkpróba
#/#/
SELECT *
FROM lkEngedélyezettésLétszámKimenet02
WHERE ((([Fõosztály]) Like 'Nyugd*' Or ([Fõosztály]) Like "Egész*")) OR ((([Fõosztály]) Like "* V.*"))
ORDER BY Fõosztály, [Oszt];

#/#/#/
lkpróbaidõsKilépõkSzámaÉvente2b
#/#/
SELECT lkpróbaidõsKilépõkSzámaÉventeHavonta.Év, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta.[Kilépõk száma]) AS Kilépõk
FROM lkpróbaidõsKilépõkSzámaÉventeHavonta
GROUP BY lkpróbaidõsKilépõkSzámaÉventeHavonta.Év;

#/#/#/
lkpróbaidõsKilépõkSzámaÉventeHavonta
#/#/
SELECT Year([JogviszonyVége]) AS Év, Month([JogviszonyVége]) AS Hó, Count(lkSzemélyekMind.Azonosító) AS [Kilépõk száma]
FROM lkSzemélyekMind
WHERE (((lkSzemélyekMind.[KIRA jogviszony jelleg]) Like "Kormányzati*" Or (lkSzemélyekMind.[KIRA jogviszony jelleg])="Munkaviszony") AND ((lkSzemélyekMind.JogviszonyVége) Is Not Null Or (lkSzemélyekMind.JogviszonyVége)<>"") AND ((lkSzemélyekMind.[HR kapcsolat megszûnés módja (Kilépés módja)]) Like "*próbaidõ*") AND ((Year([JogviszonyVége]))>=2019 And (Year([JogviszonyVége]))<=Year(Now())))
GROUP BY Year([JogviszonyVége]), Month([JogviszonyVége])
ORDER BY Year([JogviszonyVége]), Month([JogviszonyVége]);

#/#/#/
lkpróbaidõsKilépõkSzámaÉventeHavonta2
#/#/
SELECT lkpróbaidõsKilépõkSzámaÉventeHavonta.Év, IIf([Hó]=1,[Kilépõk száma],0) AS 1, IIf([Hó]=2,[Kilépõk száma],0) AS 2, IIf([Hó]=3,[Kilépõk száma],0) AS 3, IIf([Hó]=4,[Kilépõk száma],0) AS 4, IIf([Hó]=5,[Kilépõk száma],0) AS 5, IIf([Hó]=6,[Kilépõk száma],0) AS 6, IIf([Hó]=7,[Kilépõk száma],0) AS 7, IIf([Hó]=8,[Kilépõk száma],0) AS 8, IIf([Hó]=9,[Kilépõk száma],0) AS 9, IIf([Hó]=10,[Kilépõk száma],0) AS 10, IIf([Hó]=12,[Kilépõk száma],0) AS 11, IIf([Hó]=12,[Kilépõk száma],0) AS 12
FROM lkpróbaidõsKilépõkSzámaÉventeHavonta;

#/#/#/
lkpróbaidõsKilépõkSzámaÉventeHavonta3
#/#/
SELECT lkpróbaidõsKilépõkSzámaÉventeHavonta2.Év AS Év, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta2.[1]) AS 01, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta2.[2]) AS 02, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta2.[3]) AS 03, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta2.[4]) AS 04, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta2.[5]) AS 05, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta2.[6]) AS 06, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta2.[7]) AS 07, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta2.[8]) AS 08, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta2.[9]) AS 09, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta2.[10]) AS 10, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta2.[11]) AS 11, Sum(lkpróbaidõsKilépõkSzámaÉventeHavonta2.[12]) AS 12, lkpróbaidõsKilépõkSzámaÉvente2b.Kilépõk AS Összesen
FROM lkpróbaidõsKilépõkSzámaÉventeHavonta2 INNER JOIN lkpróbaidõsKilépõkSzámaÉvente2b ON lkpróbaidõsKilépõkSzámaÉventeHavonta2.Év = lkpróbaidõsKilépõkSzámaÉvente2b.Év
GROUP BY lkpróbaidõsKilépõkSzámaÉventeHavonta2.Év, lkpróbaidõsKilépõkSzámaÉvente2b.Kilépõk;

#/#/#/
lkPróbaidõVégeNincsKitöltve
#/#/
SELECT DISTINCT IIf(Nz([lkszemélyek].[Fõosztály],"")="",[Mezõ5],[lkszemélyek].[Fõosztály]) AS Fõosztály, IIf([lkszemélyek].[Osztály]="",[Mezõ6],[lkszemélyek].[Osztály]) AS Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN (lkSzemélyek LEFT JOIN lkKilépõk ON lkSzemélyek.[Adóazonosító jel] = lkKilépõk.Adóazonosító) ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Státusz neve])="álláshely") AND ((lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége]) Is Null) AND ((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)])>Date()-200))
ORDER BY IIf(Nz([lkszemélyek].[Fõosztály],"")="",[Mezõ5],[lkszemélyek].[Fõosztály]);

#/#/#/
lkProjektekHaviTörténetbõl
#/#/
SELECT DISTINCT tKözpontosítottak.[Adóazonosító], tKözpontosítottak.[Projekt megnevezése]
FROM tHaviJelentésHatálya1 INNER JOIN tKözpontosítottak ON tHaviJelentésHatálya1.hatályaID = tKözpontosítottak.hatályaID
WHERE (((Len([Projekt megnevezése]))>0));

#/#/#/
lkReferensek
#/#/
SELECT kt_azNexon_Adójel02.azNexon, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Osztály, lkSzemélyek.[Hivatali email], lkSzemélyek.[Hivatali telefon], IIf([KIRA feladat megnevezés] Like "*osztály*" Or [Besorolási  fokozat (KT)] Like "*osztály*",True,False) AS Vezetõ, IIf(IsNull((Select NexonAz From tReferensekTerületNélkül as t Where [kt_azNexon_Adójel].[azNexon]=t.NexonAz)),True,False) AS VanTerülete, IIf(Nz([Tartós távollét típusa],False)<>False,True,False) AS TT
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.Fõosztály) Like "Humán*") AND ((lkSzemélyek.[KIRA feladat megnevezés]) Like "humán*" Or (lkSzemélyek.[KIRA feladat megnevezés]) Like "*osztály*"))
ORDER BY lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkReferensekFõosztályok
#/#/
SELECT tReferensekFõosztályok.azRef, tReferensekFõosztályok.Fõosztály, tReferensekFõosztályok.bfkhFõosztály, tReferensekFõosztályok.Referens, 1/(Select count(azRef) from tReferensekFõosztályok as Tmp Where Tmp.Fõosztály=tReferensekFõosztályok.Fõosztály) AS Arány, tReferensekFõosztályok.azNexon, tReferensekFõosztályok.Osztály, tReferensekFõosztályok.bfkhOsztály, tReferensekFõosztályok.Telefon, tReferensekFõosztályok.Szoba, tReferensekFõosztályok.azSzoba
FROM tReferensekFõosztályok;

#/#/#/
lkReferensekreJutóÁlláshelyekSzáma
#/#/
SELECT lkReferensekFõosztályok.Referens, Sum(IIf([Születési év \ üres állás]="üres állás",1,0)*[Betöltés aránya]*[Arány]) AS Üres, Sum(IIf([Születési év \ üres állás]="üres állás",0,1)*[Betöltés aránya]*[Arány]) AS Betöltött, Sum([Betöltés aránya]*[Arány]) AS [Összes álláshely]
FROM lkJárásiKormányKözpontosítottUnió INNER JOIN lkReferensekFõosztályok ON lkJárásiKormányKözpontosítottUnió.Fõosztály = lkReferensekFõosztályok.Fõosztály
GROUP BY lkReferensekFõosztályok.Referens;

#/#/#/
lkRégiHibákIntézkedésekSegédûrlaphoz
#/#/
SELECT ktRégiHibákIntézkedések.HASH, ktRégiHibákIntézkedések.azIntézkedések, tIntézkedések.azIntFajta, tIntézkedések.IntézkedésDátuma, tIntézkedések.Hivatkozás
FROM tIntézkedések INNER JOIN ktRégiHibákIntézkedések ON tIntézkedések.azIntézkedések = ktRégiHibákIntézkedések.azIntézkedések
ORDER BY tIntézkedések.IntézkedésDátuma;

#/#/#/
lkRégiHibákUtolsóIntézkedés
#/#/
SELECT ktRégiHibákIntézkedések.azIntézkedések, ktRégiHibákIntézkedések.HASH, tIntézkedések.azIntFajta
FROM tIntézkedésFajták INNER JOIN (tIntézkedések INNER JOIN ktRégiHibákIntézkedések ON tIntézkedések.azIntézkedések = ktRégiHibákIntézkedések.azIntézkedések) ON tIntézkedésFajták.azIntFajta = tIntézkedések.azIntFajta
WHERE (((ktRégiHibákIntézkedések.rögzítésDátuma)=(Select Max([tmp].[rögzítésDátuma]) 
FROM [ktRégiHibákIntézkedések] as Tmp 
Where Tmp.[HASH] = [ktRégiHibákIntézkedések].[HASH] 
Group By Tmp.Hash)));

#/#/#/
lkRégiHibákÛrlaphoz
#/#/
SELECT tRégiHibák.[Elsõ mezõ], Szétbontó([Második mezõ],[lekérdezésNeve]) AS Hiba, tRégiHibák.[Elsõ Idõpont], tRégiHibák.[Utolsó Idõpont]
FROM tRégiHibák
WHERE (((tRégiHibák.lekérdezésNeve) Is Not Null));

#/#/#/
lkRégiHibákÛrlapRekordforrása
#/#/
SELECT tRégiHibák.[Elsõ mezõ], ktRégiHibákIntézkedések.HASH, ktRégiHibákIntézkedések.azIntézkedések, tRégiHibák.lekérdezésNeve, IIf([Utolsó Idõpont]=(select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve <>"lkÜresÁlláshelyekÁllapotfelmérõ" And lekérdezésneve <>"lkFontosHiányzóAdatok02") Or (select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve ="lkFontosHiányzóAdatok02"),1,2) AS V
FROM tRégiHibák LEFT JOIN ktRégiHibákIntézkedések ON tRégiHibák.[Elsõ mezõ] = ktRégiHibákIntézkedések.HASH
WHERE (((tRégiHibák.lekérdezésNeve) Like "*" & [Ûrlapok]![ûRégiHibákIntézkedések]![Keresõ] & "*") AND ((IIf([Utolsó Idõpont]=(select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve <>"lkÜresÁlláshelyekÁllapotfelmérõ" And lekérdezésneve <>"lkFontosHiányzóAdatok02") Or (select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve ="lkFontosHiányzóAdatok02"),1,2))=IIf([Ûrlapok]![ûRégiHibákIntézkedések]![FennállE]=3,1,[Ûrlapok]![ûRégiHibákIntézkedések]![FennállE]) Or (IIf([Utolsó Idõpont]=(select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve <>"lkÜresÁlláshelyekÁllapotfelmérõ" And lekérdezésneve <>"lkFontosHiányzóAdatok02") Or (select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve ="lkFontosHiányzóAdatok02"),1,2))=IIf([Ûrlapok]![ûRégiHibákIntézkedések]![FennállE]=3,2,[Ûrlapok]![ûRégiHibákIntézkedések]![FennállE]))) OR (((ktRégiHibákIntézkedések.HASH) Like "*" & [Ûrlapok]![ûRégiHibákIntézkedések]![Keresõ] & "*") AND ((IIf([Utolsó Idõpont]=(select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve <>"lkÜresÁlláshelyekÁllapotfelmérõ" And lekérdezésneve <>"lkFontosHiányzóAdatok02") Or (select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve ="lkFontosHiányzóAdatok02"),1,2))=IIf([Ûrlapok]![ûRégiHibákIntézkedések]![FennállE]=3,1,[Ûrlapok]![ûRégiHibákIntézkedések]![FennállE]) Or (IIf([Utolsó Idõpont]=(select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve <>"lkÜresÁlláshelyekÁllapotfelmérõ" And lekérdezésneve <>"lkFontosHiányzóAdatok02") Or (select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve ="lkFontosHiányzóAdatok02"),1,2))=IIf([Ûrlapok]![ûRégiHibákIntézkedések]![FennállE]=3,2,[Ûrlapok]![ûRégiHibákIntézkedések]![FennállE]))) OR (((IIf([Utolsó Idõpont]=(select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve <>"lkÜresÁlláshelyekÁllapotfelmérõ" And lekérdezésneve <>"lkFontosHiányzóAdatok02") Or (select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve ="lkFontosHiányzóAdatok02"),1,2))=IIf([Ûrlapok]![ûRégiHibákIntézkedések]![FennállE]=3,1,[Ûrlapok]![ûRégiHibákIntézkedések]![FennállE]) Or (IIf([Utolsó Idõpont]=(select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve <>"lkÜresÁlláshelyekÁllapotfelmérõ" And lekérdezésneve <>"lkFontosHiányzóAdatok02") Or (select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve ="lkFontosHiányzóAdatok02"),1,2))=IIf([Ûrlapok]![ûRégiHibákIntézkedések]![FennállE]=3,2,[Ûrlapok]![ûRégiHibákIntézkedések]![FennállE])) AND ((tRégiHibák.[Második mezõ]) Like "*" & [Ûrlapok]![ûRégiHibákIntézkedések]![Keresõ] & "*"));

#/#/#/
lkRehabilitációhozLista_TAJ_jogvVégeKezdete
#/#/
SELECT lkSzemélyek.[TAJ szám], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], lkSzemélyek.[Jogviszony vége (kilépés dátuma)], lkSzemélyek.[Jogviszony típusa / jogviszony típus]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Null Or (lkSzemélyek.[Jogviszony vége (kilépés dátuma)])>="#2023. 01. 01.#") AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus])="Kormányzati szolgálati jogviszony")) OR (((lkSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Null Or (lkSzemélyek.[Jogviszony vége (kilépés dátuma)])>="#2023. 01. 01.#") AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus])="Munkaviszony"));

#/#/#/
lkRészmunkaidõsökAránya01
#/#/
SELECT DISTINCT Unió.Tábla, tSzervezetiEgységek.Fõosztály, tSzervezetiEgységek.Osztály, Unió.Adóazonosító, Unió.[Álláshely azonosító], Unió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Unió.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], Unió.[Heti munkaórák száma], IIf([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] = "T"
		OR [Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] = "NYT", 1, 0) AS [Teljes munkaidõs], IIf([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] = "T"
		OR [Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ] = "NYT", 0, 1) AS Részmunkaidõs
FROM tSzervezetiEgységek RIGHT JOIN (SELECT "Kormányhivatali_állomány" AS Tábla
		,"Részmunkaidõsnek van jelölve, de teljes munkaidõben dolgozik." AS [Hibás érték]
		,Kormányhivatali_állomány.Adóazonosító
		,Kormányhivatali_állomány.[Álláshely azonosító]
		,Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
		,Kormányhivatali_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]
		,Kormányhivatali_állomány.[Heti munkaórák száma]
		,IIf(Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], 1) = "R"
			AND [Heti munkaórák száma] = 40, True, False) AS Hibás
	FROM Kormányhivatali_állomány
	
	UNION
	
	SELECT "Járási_állomány" AS Tábla
		,"Részmunkaidõsnek van jelölve, de teljes munkaidõben dolgozik." AS [Hibás érték]
		,Járási_állomány.Adóazonosító
		,Járási_állomány.[Álláshely azonosító]
		,Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
		,Járási_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]
		,Járási_állomány.[Heti munkaórák száma]
		,IIf(Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], 1) = "R"
			AND [Heti munkaórák száma] = 40, True, False) AS Hibás
	FROM Járási_állomány
	
	UNION
	
	SELECT "Kormányhivatali_állomány" AS Tábla
		,"Teljes munkaidõsnek van jelölve, de részmunkaidõben dolgozik." AS [Hibás érték]
		,Kormányhivatali_állomány.Adóazonosító
		,Kormányhivatali_állomány.[Álláshely azonosító]
		,Kormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
		,Kormányhivatali_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]
		,Kormányhivatali_állomány.[Heti munkaórák száma]
		,IIf(Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], 1) = "T"
			AND [Heti munkaórák száma] <> 40, True, False) AS Hibás
	FROM Kormányhivatali_állomány
	
	UNION
	
	SELECT "Járási_állomány" AS Tábla
		,"Teljes munkaidõsnek van jelölve, de részmunkaidõben dolgozik." AS [Hibás érték]
		,Járási_állomány.Adóazonosító
		,Járási_állomány.[Álláshely azonosító]
		,Járási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
		,Járási_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ]
		,Járási_állomány.[Heti munkaórák száma]
		,IIf(Right([Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], 1) = "T"
			AND [Heti munkaórák száma] <> 40, True, False) AS Hibás
	FROM Járási_állomány
	)  AS Unió ON tSzervezetiEgységek.[Szervezeti egység kódja] = Unió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
WHERE (((Len([Adóazonosító])) > "0"));

#/#/#/
lkRészmunkaidõsökAránya02
#/#/
SELECT lkRészmunkaidõsökAránya01.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkRészmunkaidõsökAránya01.Fõosztály, lkRészmunkaidõsökAránya01.Osztály, Sum(lkRészmunkaidõsökAránya01.[Teljes munkaidõs]) AS [Teljes munkaidõs létszám], Sum(lkRészmunkaidõsökAránya01.Részmunkaidõs) AS [Részmunkaidõs létszám]
FROM lkRészmunkaidõsökAránya01
GROUP BY lkRészmunkaidõsökAránya01.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkRészmunkaidõsökAránya01.Fõosztály, lkRészmunkaidõsökAránya01.Osztály;

#/#/#/
lkRészmunkaidõsökAránya03
#/#/
SELECT bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS [BFKH kód], lkRészmunkaidõsökAránya02.Fõosztály, lkRészmunkaidõsökAránya02.Osztály, lkRészmunkaidõsökAránya02.[Teljes munkaidõs létszám], lkRészmunkaidõsökAránya02.[Részmunkaidõs létszám], [Részmunkaidõs létszám]/[Teljes munkaidõs létszám] AS Aránya
FROM lkRészmunkaidõsökAránya02
ORDER BY bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]), [Részmunkaidõs létszám]/[Teljes munkaidõs létszám] DESC;

#/#/#/
lkRészmunkaidõsökLétszáma
#/#/
SELECT 7 AS Sor, "Részmunkaidõsök létszáma:" AS Adat, Sum([fõ]) AS Érték, Sum(TTnélkül) AS nemTT
FROM (SELECT DISTINCT lkSzemélyek.Adójel, 1 AS Fõ, Abs([Tartós távollét típusa] Is Null) AS TTnélkül FROM lkSzemélyek WHERE (((lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker])<>40)) and lkSzemélyek.[Státusz neve] = "Álláshely")  AS lista;

#/#/#/
lkRuházatiTámogatásraJogosultakLétszáma
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, Count(lkSzemélyek.Adójel) AS CountOfAdójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.Fõosztály) Like "BFKH*") AND ((lkSzemélyek.Osztály) Like "Kormányablak*") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null Or (lkSzemélyek.[Tartós távollét típusa])<>"Mentesítés felmentési / felmondási idõn belül") AND ((lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége]) Is Null Or (lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége])<Date()) AND ((DateAdd("m",30,dtátal([Tartós távollét kezdete]))<dtátal(Nü([Tartós távollét vége],[Tartós távollét tervezett vége])))=0) AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkSzemélyek.Fõosztály) Like "Központi*") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null Or (lkSzemélyek.[Tartós távollét típusa])<>"Mentesítés felmentési / felmondási idõn belül") AND ((lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége]) Is Null Or (lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége])<Date()) AND ((DateAdd("m",30,dtátal([Tartós távollét kezdete]))<dtátal(Nü([Tartós távollét vége],[Tartós távollét tervezett vége])))=0) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
GROUP BY lkSzemélyek.Fõosztály, lkSzemélyek.Osztály;

#/#/#/
lkRuházatiTámogatásraJogosultakListája
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Adójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.Fõosztály) Like "BFKH*") AND ((lkSzemélyek.Osztály) Like "Kormányablak*") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null Or (lkSzemélyek.[Tartós távollét típusa])<>"Mentesítés felmentési / felmondási idõn belül") AND ((lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége]) Is Null Or (lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége])<Date()) AND ((DateAdd("d",30,dtátal([Tartós távollét kezdete]))<dtátal(Nü([Tartós távollét vége],[Tartós távollét tervezett vége])))=0) AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkSzemélyek.Fõosztály) Like "Központi*") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null Or (lkSzemélyek.[Tartós távollét típusa])<>"Mentesítés felmentési / felmondási idõn belül") AND ((lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége]) Is Null Or (lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége])<Date()) AND ((DateAdd("d",30,dtátal([Tartós távollét kezdete]))<dtátal(Nü([Tartós távollét vége],[Tartós távollét tervezett vége])))=0) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH, lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkRuházatiTámogatásraJogosultakListájaMegjegyzésekkel
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Adójel, lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége] AS [Próbaidõ vége], IIf(Nü([Szerzõdés/Kinevezés - próbaidõ vége],0)<Date() Or [Szerzõdés/Kinevezés - próbaidõ vége] Is Null,"","Próbaidõs") & [Tartós távollét típusa] AS Megjegyzés
FROM lkSzemélyek
WHERE (((lkSzemélyek.Fõosztály) Like "BFKH*") AND ((lkSzemélyek.Osztály) Like "Kormányablak*") AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkSzemélyek.Fõosztály) Like "Központi*") AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH, lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkSávosBérStatisztika01
#/#/
SELECT tBesorolás_átalakító.Sorrend, lk_Állománytáblákból_Illetmények.BesorolásHavi, Min([Illetmény]/[Heti munkaórák száma]*40) AS Bérmin, Max([Illetmény]/[Heti munkaórák száma]*40) AS Bérmax
FROM tBesorolás_átalakító INNER JOIN lk_Állománytáblákból_Illetmények ON tBesorolás_átalakító.[Az álláshely jelölése] = lk_Állománytáblákból_Illetmények.BesorolásHavi
WHERE (((lk_Állománytáblákból_Illetmények.BesorolásHavi) Is Not Null))
GROUP BY tBesorolás_átalakító.Sorrend, lk_Állománytáblákból_Illetmények.BesorolásHavi;

#/#/#/
lkSávosBérStatisztika02a
#/#/
SELECT lkSávosBérStatisztika01.Sorrend, lkSorszámok.Sorszám, lkSávosBérStatisztika01.Bérmin, lkSávosBérStatisztika01.Bérmax, ([Bérmax]-[Bérmin])/10 AS Egység, [Bérmin]+(([Sorszám]-1)*([Bérmax]-[Bérmin])/10) AS Sávalj, [Bérmin]+([Sorszám]*([Bérmax]-[Bérmin])/10) AS Sávtetõ
FROM lkSávosBérStatisztika01, lkSorszámok
WHERE (((lkSorszámok.Sorszám)<11) AND ((([Bérmax]-[Bérmin])/10)<>0))
ORDER BY lkSávosBérStatisztika01.Sorrend, lkSorszámok.Sorszám;

#/#/#/
lkSávosBérStatisztika02b
#/#/
SELECT lkSávosBérStatisztika01.BesorolásHavi, lkSávosBérStatisztika01.Sorrend, lkSorszámok.Sorszám, lkSávosBérStatisztika01.Bérmin, lkSávosBérStatisztika01.Bérmax, ([Bérmax]-[Bérmin])/10 AS Egység, [Bérmin]+([Sorszám]*([Bérmax]-[Bérmin])/10) AS Sávtetõ
FROM lkSávosBérStatisztika01, lkSorszámok
WHERE (((lkSorszámok.Sorszám)<11) AND ((([Bérmax]-[Bérmin])/10)<>0))
ORDER BY lkSávosBérStatisztika01.BesorolásHavi, lkSávosBérStatisztika01.Sorrend, lkSorszámok.Sorszám;

#/#/#/
lkSávosBérStatisztika03a
#/#/
SELECT lkSávosBérStatisztika02a.Sorrend, lkSávosBérStatisztika02a.Sorszám, lk_Állománytáblákból_Illetmények.Adójel, lk_Állománytáblákból_Illetmények.[Álláshely azonosító], lk_Állománytáblákból_Illetmények.Név, lk_Állománytáblákból_Illetmények.Fõosztály, lk_Állománytáblákból_Illetmények.Osztály, lk_Állománytáblákból_Illetmények.BesorolásHavi, [Illetmény]/[Heti munkaórák száma]*40 AS Bér, lk_Állománytáblákból_Illetmények.TávollétJogcíme, bfkh([Szervezetkód]) AS Bfkh
FROM lkSávosBérStatisztika02a INNER JOIN lk_Állománytáblákból_Illetmények ON (lkSávosBérStatisztika02a.Sávalj <= lk_Állománytáblákból_Illetmények.Illetmény) AND (lkSávosBérStatisztika02a.Sávtetõ >= lk_Állománytáblákból_Illetmények.Illetmény)
ORDER BY bfkh([Szervezetkód]);

#/#/#/
lkSofõrök
#/#/
SELECT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.FEOR, lkSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker], lkSzemélyek.[Kerekített 100 %-os illetmény (eltérített)]
FROM lkSzemélyek
WHERE (((lkSzemélyek.FEOR)="8416 - Személygépkocsi-vezetõ") AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Null)) OR (((lkSzemélyek.[Dolgozó teljes neve])="Kovács Tibor")) OR (((lkSzemélyek.[Dolgozó teljes neve])="Döbrei Lajos"));

#/#/#/
lkSorszámok
#/#/
SELECT ([Ten1].[N]+[Ten10].[N]*10+[Ten100].[N]*100)+1 AS Sorszám
FROM (SELECT DISTINCT Abs([id] Mod 10) AS N FROM MSysObjects)  AS Ten1, (SELECT DISTINCT Abs([id] Mod 10) AS N FROM MSysObjects)  AS Ten10, (SELECT DISTINCT Abs([id] Mod 10) AS N FROM MSysObjects)  AS Ten100;

#/#/#/
lkStatisztikaiLétszám
#/#/
SELECT lkLétszámokNevezetesNapokon01.KiemeltNapok, Sum(lkLétszámokNevezetesNapokon01.SumOfLétszám) AS SumOfSumOfLétszám
FROM lkLétszámokNevezetesNapokon01
GROUP BY lkLétszámokNevezetesNapokon01.KiemeltNapok;

#/#/#/
lkSzakterületiAdatszolgáltatáshoz
#/#/
SELECT tSzakterületSzervezet.[Szakterületi adatszolgáltatás], Sum(IIf([Születési év \ üres állás]="üres állás",0,1)) AS Betöltött, Sum(IIf([Születési év \ üres állás]="üres állás",1,0)) AS Üres, Sum(1) AS Összes
FROM tSzakterületSzervezet INNER JOIN lkJárásiKormányKözpontosítottUnió ON (tSzakterületSzervezet.Osztály = lkJárásiKormányKözpontosítottUnió.Osztály) AND (tSzakterületSzervezet.Fõosztály = lkJárásiKormányKözpontosítottUnió.[Járási Hivatal])
GROUP BY tSzakterületSzervezet.[Szakterületi adatszolgáltatás];

#/#/#/
lkSzemélyek
#/#/
SELECT tSzemélyek.*, Replace(Nz(IIf(IsNull([tSzemélyek].[Szint 6 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 5 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 7 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység név]),[tSzemélyek].[Szint 2 szervezeti egység név] & "",[tSzemélyek].[Szint 3 szervezeti egység név] & ""),[tSzemélyek].[Szint 4 szervezeti egység név] & ""),[tSzemélyek].[Szint 7 szervezeti egység név] & ""),[tSzemélyek].[Szint 5 szervezeti egység név] & ""),[tSzemélyek].[Szint 6 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") & "" AS Fõosztály, Replace(Nz(IIf(IsNull([tSzemélyek].[Szint 6 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 5 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 7 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység kód]),[tSzemélyek].[Szint 2 szervezeti egység kód] & "",[tSzemélyek].[Szint 3 szervezeti egység kód] & ""),[tSzemélyek].[Szint 4 szervezeti egység kód] & ""),[tSzemélyek].[Szint 7 szervezeti egység kód] & ""),[tSzemélyek].[Szint 5 szervezeti egység kód] & ""),[tSzemélyek].[Szint 6 szervezeti egység kód] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") AS FõosztályKód, IIf([fõosztály]=[Szint 7 szervezeti egység név],"",[Szint 7 szervezeti egység név] & "") AS Osztály, Replace(Nz([Munkavégzés helye - cím],"")," .",".") AS MunkavégzésCíme, tSzemélyek.[besorolási  fokozat (KT)] AS Besorolás, Replace(Nz([tszemélyek].[Besorolási  fokozat (KT)],Nz([tBesorolásÁtalakítóEltérõBesoroláshoz].[Besorolási  fokozat (KT)],"")),"/ ","") AS Besorolás2, bfkh(Nz([szervezeti egység kódja],0)) AS BFKH, Replace([Feladatkör],"Lezárt_","") AS Feladat, Nz([Iskolai végzettség foka],"-") AS VégzettségFok, tSzemélyek.[Születési idõ] AS SzületésiIdeje, lkÁlláshelyek.jel2, dtátal([Jogviszony vége (kilépés dátuma)]) AS KilépésDátuma, Nz([tSzemélyek].[TAJ szám],0)*1 AS TAJ, [Törzsszám]*1 AS SzámTörzsSzám
FROM (tSzemélyek LEFT JOIN lkÁlláshelyek ON tSzemélyek.[Státusz kódja] = lkÁlláshelyek.[Álláshely azonosító]) LEFT JOIN tBesorolásÁtalakítóEltérõBesoroláshoz ON lkÁlláshelyek.[Álláshely besorolási kategóriája] = tBesorolásÁtalakítóEltérõBesoroláshoz.[Álláshely besorolási kategóriája]
WHERE ((((SELECT Max(iif(Nz(Tmp.[Jogviszony vége (kilépés dátuma)],0)=0,#01/01/3000#,Tmp.[Jogviszony vége (kilépés dátuma)])) AS [MaxOfJogviszony sorszáma]         FROM tSzemélyek as Tmp         WHERE tSzemélyek.Adójel=Tmp.Adójel         GROUP BY Tmp.Adójel     ))=IIf(Nz([Jogviszony vége (kilépés dátuma)],0)=0,#1/1/3000#,[Jogviszony vége (kilépés dátuma)])))
ORDER BY tSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkSzemélyek230227
#/#/
SELECT tSzemélyek230227.*
FROM tSzemélyek230227
WHERE ((((SELECT Max(Tmp.[Jogviszony sorszáma]) AS [MaxOfJogviszony sorszáma]
        FROM tSzemélyek230227 as Tmp
        WHERE tSzemélyek230227.Adójel=Tmp.Adójel
        GROUP BY Tmp.Adójel
    ))=[tSzemélyek230227].[Jogviszony sorszáma]));

#/#/#/
lkSzemélyekAdottNapon
#/#/
SELECT tSzemélyek.*, Replace(Nz(IIf(IsNull([tSzemélyek].[Szint 6 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 5 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 7 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység név]),[tSzemélyek].[Szint 2 szervezeti egység név] & "",[tSzemélyek].[Szint 3 szervezeti egység név] & ""),[tSzemélyek].[Szint 4 szervezeti egység név] & ""),[tSzemélyek].[Szint 7 szervezeti egység név] & ""),[tSzemélyek].[Szint 5 szervezeti egység név] & ""),[tSzemélyek].[Szint 6 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") & "" AS Fõosztály, Replace(Nz(IIf(IsNull([tSzemélyek].[Szint 6 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 5 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 7 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység kód]),IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység kód]),[tSzemélyek].[Szint 2 szervezeti egység kód] & "",[tSzemélyek].[Szint 3 szervezeti egység kód] & ""),[tSzemélyek].[Szint 4 szervezeti egység kód] & ""),[tSzemélyek].[Szint 7 szervezeti egység kód] & ""),[tSzemélyek].[Szint 5 szervezeti egység kód] & ""),[tSzemélyek].[Szint 6 szervezeti egység kód] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") AS FõosztályKód, IIf([fõosztály]=[Szint 7 szervezeti egység név],"",[Szint 7 szervezeti egység név] & "") AS Osztály, Replace(Nz([Munkavégzés helye - cím],"")," .",".") AS MunkavégzésCíme, tSzemélyek.[besorolási  fokozat (KT)] AS Besorolás, Replace(Nz([tszemélyek].[Besorolási  fokozat (KT)],Nz([tBesorolásÁtalakítóEltérõBesoroláshoz].[Besorolási  fokozat (KT)],"")),"/ ","") AS Besorolás2, bfkh(Nz([szervezeti egység kódja],0)) AS BFKH, Replace([Feladatkör],"Lezárt_","") AS Feladat, Nz([Iskolai végzettség foka],"-") AS VégzettségFok, tSzemélyek.[Születési idõ] AS SzületésiIdeje, lkÁlláshelyek.jel2, dtátal([Jogviszony vége (kilépés dátuma)]) AS KilépésDátuma, Nz([tSzemélyek].[TAJ szám],0)*1 AS TAJ, [Törzsszám]*1 AS SzámTörzsSzám
FROM (tSzemélyek LEFT JOIN lkÁlláshelyek ON tSzemélyek.[Státusz kódja] = lkÁlláshelyek.[Álláshely azonosító]) LEFT JOIN tBesorolásÁtalakítóEltérõBesoroláshoz ON lkÁlláshelyek.[Álláshely besorolási kategóriája] = tBesorolásÁtalakítóEltérõBesoroláshoz.[Álláshely besorolási kategóriája]
WHERE (((dtátal([Jogviszony kezdete (belépés dátuma)]))<=dtátal(Nz([Keresett dátum],Date()))) AND ((dtátal(IIf(Nz([Jogviszony vége (kilépés dátuma)],0)=0,#1/1/3000#,[Jogviszony vége (kilépés dátuma)])))>=dtátal(Nz([Keresett dátum],Date()))))
ORDER BY tSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkSzemélyekÉsNexonAz
#/#/
SELECT lkSzemélyek.*, kt_azNexon_Adójel02.azNexon, kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel=lkSzemélyek.Adójel;

#/#/#/
lkSzemélyekFõosztályOsztályLink
#/#/
SELECT lkSzemélyekÉsKilépõkUnió.Adójel, lkSzemélyekÉsKilépõkUnió.Fõosztály, lkSzemélyekÉsKilépõkUnió.Osztály, "https://nexonport.kh.gov.hu/menu/hrm/szemelyiKarton/index?szemelyAzonosito=" & [azNexon] & "&r=13" AS NexonLink, kt_azNexon_Adójel02.Név
FROM (SELECT tSzemélyek.Adójel,  Replace(Nz(IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység név]),[tSzemélyek].[Szint 2 szervezeti egység név] & "",[tSzemélyek].[Szint 3 szervezeti egység név] & ""),[tSzemélyek].[Szint 4 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") AS Fõosztály, tSzemélyek.[Szint 5 szervezeti egység név] AS Osztály FROM tSzemélyek WHERE (((tSzemélyek.[státusz neve])="Álláshely")) UNION SELECT  [Adóazonosító]*1 AS Adójel, IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, tKilépõkUnió.mezõ6 AS Osztály FROM   tKilépõkUnió UNION SELECT  [Adóazonosító]*1 AS Adójel, IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, lkKilépõk.mezõ6 AS Osztály FROM   lkKilépõk  )  AS lkSzemélyekÉsKilépõkUnió LEFT JOIN kt_azNexon_Adójel02 ON lkSzemélyekÉsKilépõkUnió.Adójel = kt_azNexon_Adójel02.Adójel;

#/#/#/
lkSzemélyekFõosztÉsÖsszesen
#/#/
SELECT UNIÓ.sor, UNIÓ.Fõosztály, Sum(UNIÓ.FõosztályiLétszám) AS FõosztályiLétszám, UNIÓ.FõosztKód, Sum(UNIÓ.KözpontosítottLétszám) AS KözpontosítottLétszám
FROM (SELECT 1 AS sor, lkSzemélyek.Fõosztály, Count(lkSzemélyek.Adójel) AS FõosztályiLétszám, Bfkh([lkSzemélyek].[FõosztályKód]) AS FõosztKód, 0 AS KözpontosítottLétszám
FROM lkSzemélyek
WHERE lkSzemélyek.[Státusz neve]="Álláshely" AND lkSzemélyek.[Státusz típusa] Like "Szervezeti alaplétszám"
GROUP BY lkSzemélyek.Fõosztály, Bfkh([lkSzemélyek].[FõosztályKód]), lkSzemélyek.[Státusz neve], lkSzemélyek.[Státusz típusa]
UNION
SELECT 1 as sor, lkSzemélyek.Fõosztály, 0 AS FõosztályiLétszám, Bfkh([lkSzemélyek].[FõosztályKód]) as FõosztKód, Count(lkSzemélyek.Adójel) as KözpontosítottLétszám
    FROM lkSzemélyek 
       WHERE lkSzemélyek.[Státusz neve]="Álláshely" AND lkSzemélyek.[Státusz típusa] Like "Központosított állomány"
       GROUP BY lkSzemélyek.Fõosztály, lkSzemélyek.[Státusz neve], Bfkh([lkSzemélyek].[FõosztályKód])
  UNION SELECT 2 as sor, "Összesen:" as Fõosztály, Count(lkSzemélyek.Adójel) AS CountOfAdójel , "BFKH.99" as FõosztKód, 0 AS KözpontosítottLétszám
    FROM lkSzemélyek 
       WHERE lkSzemélyek.[Státusz neve]="Álláshely" AND lkSzemélyek.[Státusz típusa] Like "Szervezeti alaplétszám"
       GROUP BY lkSzemélyek.[Státusz neve], "BFKH.99"
  UNION SELECT 2 as sor, "Összesen:" as Fõosztály, 0 AS CountOfAdójel , "BFKH.99" as FõosztKód, Count(lkSzemélyek.Adójel) AS KözpontosítottLétszám
    FROM lkSzemélyek 
       WHERE lkSzemélyek.[Státusz neve]="Álláshely" AND lkSzemélyek.[Státusz típusa] Like "Központosított állomány"
       GROUP BY lkSzemélyek.[Státusz neve], "BFKH.99")  AS UNIÓ
GROUP BY UNIÓ.sor, UNIÓ.Fõosztály, UNIÓ.FõosztKód
ORDER BY UNIÓ.sor;

#/#/#/
lkSzemélyekMind
#/#/
SELECT tSzemélyek.Azonosító, tSzemélyek.Adójel, tSzemélyek.[Dolgozó teljes neve], tSzemélyek.[Dolgozó születési neve], tSzemélyek.[Születési idõ], tSzemélyek.[Születési hely], tSzemélyek.[Anyja neve], tSzemélyek.Neme, tSzemélyek.Törzsszám, tSzemélyek.[Egyedi azonosító], tSzemélyek.[Adóazonosító jel], tSzemélyek.[TAJ szám], tSzemélyek.[Ügyfélkapu kód], tSzemélyek.[Elsõdleges állampolgárság], tSzemélyek.[Személyi igazolvány száma], tSzemélyek.[Személyi igazolvány érvényesség kezdete], tSzemélyek.[Személyi igazolvány érvényesség vége], tSzemélyek.[Nyelvtudás Angol], tSzemélyek.[Nyelvtudás Arab], tSzemélyek.[Nyelvtudás Bolgár], tSzemélyek.[Nyelvtudás Cigány], tSzemélyek.[Nyelvtudás Cigány (lovári)], tSzemélyek.[Nyelvtudás Cseh], tSzemélyek.[Nyelvtudás Eszperantó], tSzemélyek.[Nyelvtudás Finn], tSzemélyek.[Nyelvtudás Francia], tSzemélyek.[Nyelvtudás Héber], tSzemélyek.[Nyelvtudás Holland], tSzemélyek.[Nyelvtudás Horvát], tSzemélyek.[Nyelvtudás Japán], tSzemélyek.[Nyelvtudás Jelnyelv], tSzemélyek.[Nyelvtudás Kínai], tSzemélyek.[Nyelvtudás Latin], tSzemélyek.[Nyelvtudás Lengyel], tSzemélyek.[Nyelvtudás Német], tSzemélyek.[Nyelvtudás Norvég], tSzemélyek.[Nyelvtudás Olasz], tSzemélyek.[Nyelvtudás Orosz], tSzemélyek.[Nyelvtudás Portugál], tSzemélyek.[Nyelvtudás Román], tSzemélyek.[Nyelvtudás Spanyol], tSzemélyek.[Nyelvtudás Szerb], tSzemélyek.[Nyelvtudás Szlovák], tSzemélyek.[Nyelvtudás Szlovén], tSzemélyek.[Nyelvtudás Török], tSzemélyek.[Nyelvtudás Újgörög], tSzemélyek.[Nyelvtudás Ukrán], tSzemélyek.[Orvosi vizsgálat idõpontja], tSzemélyek.[Orvosi vizsgálat típusa], tSzemélyek.[Orvosi vizsgálat eredménye], tSzemélyek.[Orvosi vizsgálat észrevételek], tSzemélyek.[Orvosi vizsgálat következõ idõpontja], tSzemélyek.[Erkölcsi bizonyítvány száma], tSzemélyek.[Erkölcsi bizonyítvány dátuma], tSzemélyek.[Erkölcsi bizonyítvány eredménye], tSzemélyek.[Erkölcsi bizonyítvány kérelem azonosító], tSzemélyek.[Erkölcsi bizonyítvány közügyektõl eltiltva], tSzemélyek.[Erkölcsi bizonyítvány jármûvezetéstõl eltiltva], tSzemélyek.[Erkölcsi bizonyítvány intézkedés alatt áll], tSzemélyek.[Munkaköri leírások (csatolt dokumentumok fájlnevei)], tSzemélyek.[Egyéb HR dokumentumok (csatolt dokumentumok fájlnevei)], tSzemélyek.[Kormányhivatal rövid neve], tSzemélyek.[Szervezeti egység kódja], tSzemélyek.[Szervezeti egység neve], tSzemélyek.[Szervezeti munkakör neve], tSzemélyek.[Vezetõi megbízás típusa], tSzemélyek.[Státusz kódja], tSzemélyek.[Státusz költséghelyének kódja], tSzemélyek.[Státusz költséghelyének neve ], tSzemélyek.[Létszámon felül létrehozott státusz], tSzemélyek.[Státusz típusa], tSzemélyek.[Státusz neve], tSzemélyek.[Többes betöltés], tSzemélyek.[Vezetõ neve], tSzemélyek.[Vezetõ adóazonosító jele], tSzemélyek.[Vezetõ email címe], tSzemélyek.[Állandó lakcím], tSzemélyek.[Tartózkodási lakcím], tSzemélyek.[Levelezési cím_], tSzemélyek.[Öregségi nyugdíj-korhatár elérésének idõpontja (dátum)], tSzemélyek.Nyugdíjas, tSzemélyek.[Nyugdíj típusa], tSzemélyek.[Nyugdíjas korú továbbfoglalkoztatási engedéllyel rendelkezik], tSzemélyek.[Megváltozott munkaképesség], tSzemélyek.[Önkéntes tartalékos katona], tSzemélyek.[Utolsó vagyonnyilatkozat leadásának dátuma], tSzemélyek.[Vagyonnyilatkozat nyilvántartási száma], tSzemélyek.[Következõ vagyonnyilatkozat esedékessége], tSzemélyek.[Nemzetbiztonsági ellenõrzés dátuma], tSzemélyek.[Védett állományba tartozó munkakör], tSzemélyek.[Vezetõi megbízás típusa1], tSzemélyek.[Vezetõi beosztás megnevezése], tSzemélyek.[Vezetõi beosztás (megbízás) kezdete], tSzemélyek.[Vezetõi beosztás (megbízás) vége], tSzemélyek.[Iskolai végzettség foka], tSzemélyek.[Iskolai végzettség neve], tSzemélyek.[Alapvizsga kötelezés dátuma], tSzemélyek.[Alapvizsga letétel tényleges határideje], tSzemélyek.[Alapvizsga mentesség], tSzemélyek.[Alapvizsga mentesség oka], tSzemélyek.[Szakvizsga kötelezés dátuma], tSzemélyek.[Szakvizsga letétel tényleges határideje], tSzemélyek.[Szakvizsga mentesség], tSzemélyek.[Foglalkozási viszony], tSzemélyek.[Foglalkozási viszony statisztikai besorolása], tSzemélyek.[Dolgozó szerzõdéses/kinevezéses munkaköre / kinevezési okmányban], tSzemélyek.[Beosztástervezés helyszínek], tSzemélyek.[Beosztástervezés tevékenységek], tSzemélyek.[Részleges távmunka szerzõdés kezdete], tSzemélyek.[Részleges távmunka szerzõdés vége], tSzemélyek.[Részleges távmunka szerzõdés intervalluma], tSzemélyek.[Részleges távmunka szerzõdés mértéke], tSzemélyek.[Részleges távmunka szerzõdés helyszíne], tSzemélyek.[Részleges távmunka szerzõdés helyszíne 2], tSzemélyek.[Részleges távmunka szerzõdés helyszíne 3], tSzemélyek.[Egyéni túlóra keret megállapodás kezdete], tSzemélyek.[Egyéni túlóra keret megállapodás vége], tSzemélyek.[Egyéni túlóra keret megállapodás mértéke], tSzemélyek.[KIRA feladat azonosítója - intézmény prefix-szel ellátva], tSzemélyek.[KIRA feladat azonosítója], tSzemélyek.[KIRA feladat megnevezés], tSzemélyek.[Osztott munkakör], tSzemélyek.[Funkciócsoport: kód-megnevezés], tSzemélyek.[Funkció: kód-megnevezés], tSzemélyek.[Dolgozó költséghelyének kódja], tSzemélyek.[Dolgozó költséghelyének neve], tSzemélyek.Feladatkör, tSzemélyek.[Elsõdleges feladatkör], tSzemélyek.Feladatok, tSzemélyek.FEOR, tSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó napi óraker], tSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker], tSzemélyek.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker], tSzemélyek.[Szerzõdés/Kinevezés típusa], tSzemélyek.Iktatószám, tSzemélyek.[Szerzõdés/kinevezés verzió_érvényesség kezdete], tSzemélyek.[Szerzõdés/kinevezés verzió_érvényesség vége], tSzemélyek.[Határozott idejû _szerzõdés/kinevezés lejár], tSzemélyek.[Szerzõdés dokumentum (csatolt dokumentumok fájlnevei)], tSzemélyek.[Megjegyzés (pl# határozott szerzõdés/kinevezés oka)], tSzemélyek.[Munkavégzés helye - megnevezés], tSzemélyek.[Munkavégzés helye - cím], tSzemélyek.[Jogviszony típusa / jogviszony típus], tSzemélyek.[Jogviszony sorszáma], tSzemélyek.[KIRA jogviszony jelleg], tSzemélyek.[Kölcsönbe adó cég], tSzemélyek.[Teljesítményértékelés - Értékelõ személy], tSzemélyek.[Teljesítményértékelés - Érvényesség kezdet], tSzemélyek.[Teljesítményértékelés - Értékelt idõszak kezdet], tSzemélyek.[Teljesítményértékelés - Értékelt idõszak vége], tSzemélyek.[Teljesítményértékelés dátuma], tSzemélyek.[Teljesítményértékelés - Beállási százalék], tSzemélyek.[Teljesítményértékelés - Pontszám], tSzemélyek.[Teljesítményértékelés - Megjegyzés], tSzemélyek.[Dolgozói jellemzõk], tSzemélyek.[Fizetési osztály (KA)/ Pedagógusi fokozat (KA pedagógus)/besorol], tSzemélyek.[Besorolási  fokozat (KT)], tSzemélyek.[Jogfolytonos idõ kezdete], tSzemélyek.[Jogviszony kezdete (belépés dátuma)], tSzemélyek.[Jogviszony vége (kilépés dátuma)], dtÁtal([Jogviszony vége (kilépés dátuma)]) AS JogviszonyVége, tSzemélyek.[Utolsó munkában töltött nap], tSzemélyek.[Kezdeményezés dátuma], tSzemélyek.[Hatályossá válik], tSzemélyek.[HR kapcsolat megszûnés módja (Kilépés módja)], tSzemélyek.[HR kapcsolat megszûnes indoka (Kilépés indoka)], tSzemélyek.Indokolás, tSzemélyek.[Következõ munkahely], tSzemélyek.[MT: Felmondási idõ kezdete KJT, KTTV: Felmentési idõ kezdete], tSzemélyek.[Felmondási idõ vége (MT) Felmentési idõ vége (KJT, KTTV)], tSzemélyek.[Munkavégzés alóli mentesítés kezdete (KJT, KTTV) Felmentési idõ ], tSzemélyek.[Munkavégzés alóli mentesítés vége (KJT, KTTV) Felmentési idõ vég], tSzemélyek.[Tartós távollét típusa], tSzemélyek.[Tartós távollét kezdete], tSzemélyek.[Tartós távollét vége], tSzemélyek.[Tartós távollét tervezett vége], tSzemélyek.[Helyettesített dolgozó neve], tSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége], tSzemélyek.[Utalási cím], tSzemélyek.[Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)], tSzemélyek.[Garantált bérminimumra történõ kiegészítés], tSzemélyek.Kerekítés, tSzemélyek.[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérít], tSzemélyek.[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (el], tSzemélyek.[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérítés nélküli)], tSzemélyek.[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérítés nél], tSzemélyek.[Egyéb pótlék - összeg (eltérítés nélküli)], tSzemélyek.[Illetmény összesen kerekítés nélkül (eltérítés nélküli)], tSzemélyek.[Kerekített 100 %-os illetmény (eltérítés nélküli)], tSzemélyek.[Eltérítés %], tSzemélyek.[Alapilletmény / Munkabér / Megbízási díj (eltérített)], tSzemélyek.[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérí1], tSzemélyek.[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (e1], tSzemélyek.[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérített)], tSzemélyek.[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérített)], tSzemélyek.[Egyéb pótlék - összeg (eltérített)], tSzemélyek.[Illetmény összesen kerekítés nélkül (eltérített)], tSzemélyek.[Kerekített 100 %-os illetmény (eltérített)], tSzemélyek.[További munkavégzés helye 1 Teljes munkaidõ %-a], tSzemélyek.[További munkavégzés helye 2 Teljes munkaidõ %-a], tSzemélyek.[KT: Kerekített 100 %-os illetmény (eltérített) + Helyettesítési ], tSzemélyek.[Szint 1 szervezeti egység név], tSzemélyek.[Szint 1 szervezeti egység kód], tSzemélyek.[Szint 2 szervezeti egység név], tSzemélyek.[Szint 2 szervezeti egység kód], tSzemélyek.[Szint 3 szervezeti egység név], tSzemélyek.[Szint 3 szervezeti egység kód], tSzemélyek.[Szint 6 szervezeti egység név], tSzemélyek.[Szint 6 szervezeti egység kód], tSzemélyek.[Szint 7 szervezeti egység név], tSzemélyek.[Szint 7 szervezeti egység kód], tSzemélyek.[AD egyedi azonosító], tSzemélyek.[Hivatali email], tSzemélyek.[Hivatali mobil], tSzemélyek.[Hivatali telefon], tSzemélyek.[Hivatali telefon mellék], tSzemélyek.Iroda, tSzemélyek.[Otthoni e-mail], tSzemélyek.[Otthoni mobil], tSzemélyek.[Otthoni telefon], tSzemélyek.[További otthoni mobil], Replace(Nz(IIf(IsNull([tSzemélyek].[Szint 6 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 5 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 7 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység név]),[tSzemélyek].[Szint 2 szervezeti egység név] & "",[tSzemélyek].[Szint 3 szervezeti egység név] & ""),[tSzemélyek].[Szint 4 szervezeti egység név] & ""),[tSzemélyek].[Szint 7 szervezeti egység név] & ""),[tSzemélyek].[Szint 5 szervezeti egység név] & ""),[tSzemélyek].[Szint 6 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") & "" AS Fõosztály
FROM tSzemélyek;

#/#/#/
lkSzemélyekVégzettségeinekSzáma
#/#/
SELECT lkVégzettségek.Adójel, Count(lkVégzettségek.Azonosító) AS VégzettségeinekASzáma
FROM lkVégzettségek
GROUP BY lkVégzettségek.Adójel;

#/#/#/
lkSzemélykeresõ
#/#/
SELECT tSzemélyek.[Dolgozó teljes neve], Replace(Nz(IIf(IsNull([tSzemélyek].[Szint 6 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 5 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 7 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek].[Szint 3 szervezeti egység név]),[tSzemélyek].[Szint 2 szervezeti egység név] & "",[tSzemélyek].[Szint 3 szervezeti egység név] & ""),[tSzemélyek].[Szint 4 szervezeti egység név] & ""),[tSzemélyek].[Szint 7 szervezeti egység név] & ""),[tSzemélyek].[Szint 5 szervezeti egység név] & ""),[tSzemélyek].[Szint 6 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") & "" AS Fõosztály, IIf([fõosztály]=[Szint 7 szervezeti egység név],"",[Szint 7 szervezeti egység név] & "") AS Osztály, tSzemélyek.[Születési idõ], tSzemélyek.[Születési hely], tSzemélyek.[Anyja neve], tSzemélyek.[Státusz kódja], tSzemélyek.[Státusz neve], tSzemélyek.[KIRA jogviszony jelleg], tSzemélyek.[Besorolási  fokozat (KT)], tSzemélyek.[Kerekített 100 %-os illetmény (eltérített)], tSzemélyek.[Iskolai végzettség foka], tSzemélyek.[Iskolai végzettség neve], tSzemélyek.[Jogviszony sorszáma], tSzemélyek.Azonosító, kt_azNexon_Adójel02.azNexon, kt_azNexon_Adójel02.NLink, tSzemélyek.Adójel
FROM kt_azNexon_Adójel02 RIGHT JOIN tSzemélyek ON kt_azNexon_Adójel02.Adójel = tSzemélyek.Adójel
WHERE (((tSzemélyek.[Dolgozó teljes neve]) Like "*" & [Ûrlapok]![ûSzemélykeresõ]![Keresõ] & "*"));

#/#/#/
lkSzemélyTelephelyek
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.[Munkavégzés helye - cím], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Tartós távollét típusa] AS [Tartós távollét jogcíme], lkSzemélyek.[Jogviszony vége (kilépés dátuma)] AS [Kilépés dátuma], lkSzemélyek.BFKH, lkSzemélyek.[Munkavégzés helye - cím] AS TelephelyCíme
FROM lkSzemélyek
WHERE (((lkSzemélyek.BFKH) Is Not Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH, lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkSzervezetÁlláshelyek
#/#/
SELECT DISTINCT tSzervezet.OSZLOPOK, tSzervezet.[Szervezetmenedzsment kód] AS Álláshely, Choose([tSzervezet]![Szervezeti egységének szintje],[tSzervezet]![Szint1 - kód],[tSzervezet]![Szint2 - kód],[tSzervezet]![Szint3 - kód],[tSzervezet]![Szint4 - kód],[tSzervezet]![Szint5 - kód],[tSzervezet]![Szint6 - kód],[tSzervezet]![Szint7 - kód],[tSzervezet]![Szint8 - kód]) AS SzervezetKód, IIf(InStr(1,[OSZLOPOK],"betöltött")>0,True,False) AS Betöltött, tSzervezet.[Vezetõi státusz], tSzervezet.[Státusz típusa], tSzervezet.[Státusz betöltési óraszáma], tSzervezet.[Státusz betöltési FTE], tSzervezet.[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés], tSzervezet.[Érvényesség kezdete], tSzervezet.[Érvényesség vége], tSzervezet.[Szint3 - leírás], tSzervezet.[Szint4 - leírás], tSzervezet.[Szint5 - leírás], tSzervezet.[Szint6 - leírás], tSzervezet.[Szint7 - leírás]
FROM tSzervezet
WHERE (((tSzervezet.OSZLOPOK) Like "Státusz (*") AND ((tSzervezet.[Szervezetmenedzsment kód]) Like "S-*"));

#/#/#/
lkSzervezetekSzemélyekbõl
#/#/
SELECT DISTINCT bfkh(Nz([Szervezeti egység kódja],1)) AS bfkh, lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null))
ORDER BY bfkh(Nz([Szervezeti egység kódja],1));

#/#/#/
lkSzervezetenkénti létszámadatok01
#/#/
SELECT lkHaviLétszám.BFKHKód, lkHaviLétszám.Fõosztály, lkHaviLétszám.Osztály, lkHaviLétszám.[Betöltött létszám], [TT]*-1 AS TTLétszám, 0 AS HatározottLétszám, 0 AS Korr
FROM lkHaviLétszám
WHERE ((([lkHaviLétszám].[jelleg])="A"))
GROUP BY lkHaviLétszám.BFKHKód, lkHaviLétszám.Fõosztály, lkHaviLétszám.Osztály, lkHaviLétszám.[Betöltött létszám], [TT]*-1;

#/#/#/
lkSzervezetenkénti létszámadatok02
#/#/
SELECT AlaplétszámUnió.BFKHKód, AlaplétszámUnió.Fõosztály, AlaplétszámUnió.Osztály, Sum(AlaplétszámUnió.[Betöltött létszám]) AS [SumOfBetöltött létszám], Sum(AlaplétszámUnió.TTLétszám) AS SumOfTTLétszám, Sum(AlaplétszámUnió.HatározottLétszám) AS SumOfHatározottLétszám, Sum(AlaplétszámUnió.Korr) AS SumOfKorr
FROM (SELECT [lkSzervezetenkénti létszámadatok01].*
FROM [lkSzervezetenkénti létszámadatok01]

UNION
SELECT lkHatározottak_TTH_OsztályonkéntiLétszám.*
FROM   lkHatározottak_TTH_OsztályonkéntiLétszám)  AS AlaplétszámUnió
GROUP BY AlaplétszámUnió.BFKHKód, AlaplétszámUnió.Fõosztály, AlaplétszámUnió.Osztály;

#/#/#/
lkSzervezetenkéntiLétszámadatok03
#/#/
SELECT [lkSzervezetenkénti létszámadatok02].Fõosztály, [lkSzervezetenkénti létszámadatok02].Osztály, [SumofBetöltött létszám]+[SumofTTLétszám]+[SumofHatározottLétszám]+[SumofKorr] AS Létszám
FROM [lkSzervezetenkénti létszámadatok02]
ORDER BY bfkh([BFKHKód]);

#/#/#/
lkSzervezetiÁlláshelyek
#/#/
SELECT tSzervezeti.OSZLOPOK, bfkh(Nz([tSzervezeti].[Szülõ szervezeti egységének kódja],"")) AS SzervezetKód, tSzervezeti.[Szülõ szervezeti egységének kódja], tSzervezeti.[Szervezetmenedzsment kód] AS ÁlláshelyAzonosító, IIf([Szervezeti egységének szintje]=7 And [Szint3 - kód]="",[Szülõ szervezeti egységének kódja],IIf([Szint6 - kód]="",IIf([Szint5 - kód]="",IIf([Szint4 - kód]="",IIf([Szint3 - kód]="",[Szint2 - kód],[Szint3 - kód]),[Szint4 - kód]),[Szint5 - kód]),[Szint6 - kód])) AS FõosztályKód, tSzervezeti.[Megnevezés szótárelem kódja], tSzervezeti.Név, tSzervezeti.[Érvényesség kezdete], tSzervezeti.[Érvényesség vége], tSzervezeti.[Költséghely kód], tSzervezeti.[Költséghely megnevezés], tSzervezeti.[Szervezeti egységének szintje], tSzervezeti.[Szülõ szervezeti egységének kódja], tSzervezeti.[Szervezeti egységének megnevezése], tSzervezeti.[Szervezeti egységének vezetõje], tSzervezeti.[Szervezeti egységének vezetõjének azonosítója], tSzervezeti.[A költséghely eltér a szervezeti egységének költséghelytõl?], tSzervezeti.[Szervezeti munkakörének kódja], tSzervezeti.[Szervezeti munkakörének megnevezése], tSzervezeti.[A költséghely eltér a szervezeti munkakörének költséghelyétõl?], tSzervezeti.[Vezetõi státusz], tSzervezeti.[Helyettes vezetõ-e], tSzervezeti.[Tervezett betöltési adatok - Jogviszony típus], tSzervezeti.[Tervezett betöltési adatok - Kulcsszám kód], tSzervezeti.[Tervezett betöltési adatok - Kulcsszám megnevezés], tSzervezeti.[Tervezett betöltési adatok - Elõmeneteli fokozat kód], tSzervezeti.[Tervezett betöltési adatok - Elõmeneteli fokozat megnevezés], tSzervezeti.[Pályáztatás határideje], tSzervezeti.[Vezetõi beosztás KT], tSzervezeti.[Pályáztatás alatt áll], tSzervezeti.Megjegyzés, tSzervezeti.[Státusz engedélyezett óraszáma], tSzervezeti.[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)], tSzervezeti.[Átmeneti óraszám], tSzervezeti.[Átmeneti létszám (FTE)], tSzervezeti.[Közzétett hierarchiában megjelenítendõ], tSzervezeti.[Asszisztens státusz], tSzervezeti.[Létszámon felül létrehozott státusz], tSzervezeti.[Státusz típusa], tSzervezeti.[Státusz betöltési óraszáma], tSzervezeti.[Státusz betöltési FTE], tSzervezeti.[Státusz betöltési óraszáma minusz státusz engedélyezett óraszáma], tSzervezeti.[Státusz betöltési FTE minusz státusz engedélyezett FTE], tSzervezeti.[Mióta betöltetlen a státusz (dátum)], tSzervezeti.[Hány napja betöltetlen (munkanap, alapnaptár alapján)], tSzervezeti.[Szint1 - kód], tSzervezeti.[Szint1 - leírás], tSzervezeti.[Szint2 - kód], tSzervezeti.[Szint2 - leírás], tSzervezeti.[Szint3 - kód], tSzervezeti.[Szint3 - leírás], tSzervezeti.[Szint4 - kód], tSzervezeti.[Szint4 - leírás], tSzervezeti.[Szint5 - kód], tSzervezeti.[Szint5 - leírás], tSzervezeti.[Szint6 - kód], tSzervezeti.[Szint6 - leírás], tSzervezeti.[Szint7 - kód], tSzervezeti.[Szint7 - leírás], tSzervezeti.[Szint8 - kód], tSzervezeti.[Szint8 - leírás], Replace(Choose(IIf([Szervezeti egységének szintje]>6,IIf([tSzervezeti].[Szint6 - leírás]="",5,6),[Szervezeti egységének szintje]),[tSzervezeti].[Szint1 - leírás],[tSzervezeti].[Szint2 - leírás],[tSzervezeti].[Szint3 - leírás],[tSzervezeti].[Szint4 - leírás],[tSzervezeti].[Szint5 - leírás],[tSzervezeti].[Szint6 - leírás]) & IIf([tSzervezeti].[Szint7 - kód]="BFKH.1.7.",[tSzervezeti].[Szint7 - leírás],""),"Budapest Fõváros Kormányhivatala","BFKH") AS Fõosztály, IIf([tSzervezeti].[Szint7 - kód]="BFKH.1.7.","",[tSzervezeti].[Szint7 - leírás]) AS Osztály
FROM tSzervezeti
WHERE (((tSzervezeti.[Szervezetmenedzsment kód]) Like "S-*") AND ((tSzervezeti.[Érvényesség kezdete])<=Date()) AND ((tSzervezeti.[Érvényesség vége])>=Date() Or (tSzervezeti.[Érvényesség vége])=0));

#/#/#/
lkSzervezetiÁlláshelyek - azonosak keresése
#/#/
SELECT First(lkSzervezetiÁlláshelyek.ÁlláshelyAzonosító) AS [ÁlláshelyAzonosító Mezõ], Count(lkSzervezetiÁlláshelyek.ÁlláshelyAzonosító) AS AzonosakSzáma
FROM lkSzervezetiÁlláshelyek
GROUP BY lkSzervezetiÁlláshelyek.ÁlláshelyAzonosító
HAVING (((Count(lkSzervezetiÁlláshelyek.ÁlláshelyAzonosító))>1));

#/#/#/
lkSzervezetiBetöltések
#/#/
SELECT tSzervezeti.OSZLOPOK, tSzervezeti.[Szervezetmenedzsment kód], IIf([Szervezeti egységének szintje]=7 And [Szint3 - kód]="",[Szülõ szervezeti egységének kódja],IIf([Szint6 - kód]="",IIf([Szint5 - kód]="",IIf([Szint4 - kód]="",IIf([Szint3 - kód]="",[Szint2 - kód],[Szint3 - kód]),[Szint4 - kód]),[Szint5 - kód]),[Szint6 - kód])) AS FõosztályKód, tSzervezeti.[HR kapcsolat sorszáma], tSzervezeti.Név, tSzervezeti.[Érvényesség kezdete], tSzervezeti.[Érvényesség vége], tSzervezeti.[Költséghely kód], tSzervezeti.[Költséghely megnevezés], tSzervezeti.[Szervezeti egységének szintje], tSzervezeti.[Szülõ szervezeti egységének kódja], tSzervezeti.[Szervezeti egységének megnevezése], tSzervezeti.[Szervezeti egységének vezetõje], tSzervezeti.[Szervezeti egységének vezetõjének azonosítója], tSzervezeti.[A költséghely eltér a szervezeti egységének költséghelytõl?], tSzervezeti.[Szervezeti munkakörének kódja], tSzervezeti.[Szervezeti munkakörének megnevezése], tSzervezeti.[A költséghely eltér a szervezeti munkakörének költséghelyétõl?], tSzervezeti.[Státuszbetöltéssel rendelkezik a kilépést követõen?], tSzervezeti.[Közzétett hierarchiában megjelenítendõ], tSzervezeti.[Helyettesítés mértéke (%)], tSzervezeti.[Helyettesítési díj (%)], tSzervezeti.[Státuszának kódja], tSzervezeti.[Státuszának neve], tSzervezeti.[Státuszának az engedélyezett óraszáma], tSzervezeti.[Státusz engedélyezett FTE (üzleti paraméter szerint számolva)], tSzervezeti.[Aktuális betöltés óraszáma], tSzervezeti.[Aktuális betöltés FTE], tSzervezeti.[Státuszának költséghely kódja], tSzervezeti.[Státuszának költséghely megnevezése], tSzervezeti.[A költséghely eltér a státuszának költséghelyétõl?], tSzervezeti.[A Bér F6 besorolási szint eltér a szervezeti munkakörének Bér F6], tSzervezeti.[Státuszbetöltés típusa], tSzervezeti.[Inaktív állományba kerülés oka], tSzervezeti.[Tartós távollét kezdete], tSzervezeti.[Tartós távollét számított kezdete], tSzervezeti.[Tartós távollét vége], tSzervezeti.[Tartós távollét típusa], tSzervezeti.Elsõdleges, tSzervezeti.[Státusz vizualizációjában elõször megjelenítendõ], tSzervezeti.[Betöltõ szerzõdéses/kinevezéses munkakörének kódja], tSzervezeti.[Betöltõ szerzõdéses/kinevezéses munkakörének neve], tSzervezeti.[Szervezeti munkakör eltér a szerzõdéses/kinevezéses munkakörtõl], tSzervezeti.[Betöltõ közvetlen vezetõje], tSzervezeti.[Betöltõ közvetlen vezetõjének azonosítója], tSzervezeti.[Szint1 - kód], tSzervezeti.[Szint1 - leírás], tSzervezeti.[Szint2 - kód], tSzervezeti.[Szint2 - leírás], tSzervezeti.[Szint3 - kód], tSzervezeti.[Szint3 - leírás], tSzervezeti.[Szint4 - kód], tSzervezeti.[Szint4 - leírás], tSzervezeti.[Szint5 - kód], tSzervezeti.[Szint5 - leírás], tSzervezeti.[Szint6 - kód], tSzervezeti.[Szint6 - leírás], tSzervezeti.[Szint7 - kód], tSzervezeti.[Szint7 - leírás], tSzervezeti.[Szint8 - kód], tSzervezeti.[Szint8 - leírás], tSzervezeti.[HRM-ben lévõ költséghely kód besorolási adat], tSzervezeti.[HRM-ben lévõ költséghely megnevezés besorolási adat], tSzervezeti.[A Költséghely érvényességének kezdete], tSzervezeti.[HRM-ben lévõ FEOR besorolási adat], tSzervezeti.[A FEOR érvényességének kezdete], tSzervezeti.[A FEOR érvényességének vége], tSzervezeti.[HRM-ben lévõ Munkakör besorolási adat], tSzervezeti.[A Munkakör érvényességének kezdete]
FROM tSzervezeti
WHERE (((tSzervezeti.OSZLOPOK)="Státusz betöltés") AND ((tSzervezeti.[Érvényesség kezdete])<=Date()) AND ((tSzervezeti.[Érvényesség vége])>=Date() Or (tSzervezeti.[Érvényesség vége])=0) AND ((tSzervezeti.[Státuszának kódja]) Like "S-*") AND ((tSzervezeti.[Státuszbetöltés típusa])<>"Helyettes"));

#/#/#/
lkSzervezetiBetöltések - azonosak keresése
#/#/
SELECT First(lkSzervezetiBetöltések.[Státuszának kódja]) AS [Státuszának kódja Mezõ], Count(lkSzervezetiBetöltések.[Státuszának kódja]) AS AzonosakSzáma
FROM lkSzervezetiBetöltések
GROUP BY lkSzervezetiBetöltések.[Státuszának kódja]
HAVING (((Count(lkSzervezetiBetöltések.[Státuszának kódja]))>1));

#/#/#/
lkSzervezetiEgységekLegnagyobbLétszámúTelephelyei
#/#/
SELECT lkTelephelyekLétszáma.BFKH, lkTelephelyekLétszáma.Fõosztály, lkTelephelyekLétszáma.Osztály, lkTelephelyekLétszáma.Cím
FROM lkTelephelyekLétszáma INNER JOIN (SELECT Tmp.BFKH, Max(Tmp.Létszám) AS MaxOfLétszám FROM lkTelephelyekLétszáma AS Tmp GROUP BY Tmp.BFKH)  AS TMP1 ON (lkTelephelyekLétszáma.BFKH = TMP1.BFKH) AND (lkTelephelyekLétszáma.Létszám = TMP1.MaxOfLétszám);

#/#/#/
lkSzervezetiStatisztika01
#/#/
SELECT Replace(Replace([OSZLOPOK],"Szervezeti egység összesen (",""),")","") AS [Szervezeti egység neve], tSzervezet.[Betöltött státuszok száma (db)], tSzervezet.[Betöltetlen státuszok száma (db)]
FROM tSzervezet
WHERE (((tSzervezet.OSZLOPOK) Like "Szervezeti egység összesen (*"));

#/#/#/
lkSzervezetiVezetõkListája01
#/#/
SELECT tSzervezet.[Szervezetmenedzsment kód] AS [BFKH kód], tSzervezet.Név, lkSzemélyek.[KIRA feladat megnevezés], tSzervezet.[Szervezeti egység vezetõje], lkSzemélyek.[Besorolási  fokozat (KT)] AS Besorolása, lkSzemélyek.[Hivatali email], lkSzemélyek.[Hivatali mobil], lkSzemélyek.[Hivatali telefon], lkSzemélyek.[Hivatali telefon mellék], tTelefonkonyv.[Külsõ vezetékes telefonszám], tTelefonkonyv.[Belsõ vezetékes telefonszám], tTelefonkonyv.Mobiltelefonszám, tTelefonkonyv.[Külsõ fax szám], tTelefonkonyv.[Belsõ fax szám], tTelefonkonyv.[Levelezési cím], tTelefonkonyv.Emelet, tTelefonkonyv.Szobaszám, tTelefonkonyv.Város, tTelefonkonyv.Irányítószám, tTelefonkonyv.Település, tTelefonkonyv.Utca, tTelefonkonyv.Épület, lkSzemélyek.[Munkavégzés helye - cím]
FROM tSzervezet, lkSzemélyek, tTelefonkonyv
WHERE (((lkSzemélyek.[Hivatali email])=tTelefonkonyv.[E-mail cím]) And ((tSzervezet.[Szervezeti egység vezetõjének azonosítója])=lkSzemélyek.[Adóazonosító jel]) And ((tSzervezet.OSZLOPOK)="Szervezeti egység"))
ORDER BY bfkh([Szervezetmenedzsment kód]);

#/#/#/
lkSzervezetiVezetõkListája02
#/#/
SELECT lkSzervezetiVezetõkListája01.[BFKH kód], lkSzervezetiVezetõkListája01.Név, lkSzervezetiVezetõkListája01.[KIRA feladat megnevezés] AS Feladat, lkSzervezetiVezetõkListája01.[Szervezeti egység vezetõje], lkSzervezetiVezetõkListája01.Besorolása, lkSzervezetiVezetõkListája01.[Hivatali email], Nü(telefonszámjavító([lkSzervezetiVezetõkListája01]![Hivatali telefon]),telefonszámjavító([Külsõ vezetékes telefonszám])) AS HivataliVezetékes, telefonszámjavító([Hivatali mobil]) AS HivataliMobil, lkSzervezetiVezetõkListája01.[Munkavégzés helye - cím]
FROM lkSzervezetiVezetõkListája01;

#/#/#/
lkSzervezetSzemélyek
#/#/
SELECT tSzervezet.*, [Szervezetmenedzsment kód]*1 AS Adójel
FROM tSzervezet
WHERE (((tSzervezet.OSZLOPOK)="Státusz betöltés"));

#/#/#/
lkSzóközöket_tartalmazó_szervek
#/#/
SELECT DISTINCT tSzemélyek.[Szint 1 szervezeti egység név] AS SzervNév, [Szervezeti egység kódja] As Kód
FROM tSzemélyek
WHERE tSzemélyek.[Szint 1 szervezeti egység név] Like "*  *"
UNION
SELECT DISTINCT  tSzemélyek.[Szint 2 szervezeti egység név], [Szervezeti egység kódja]
FROM tSzemélyek
WHERE tSzemélyek.[Szint 2 szervezeti egység név] Like "*  *"
UNION
SELECT DISTINCT  tSzemélyek.[Szint 3 szervezeti egység név], [Szervezeti egység kódja]
FROM tSzemélyek
WHERE tSzemélyek.[Szint 3 szervezeti egység név]  Like "*  *"
UNION
SELECT DISTINCT  tSzemélyek.[Szint 4 szervezeti egység név], [Szervezeti egység kódja]
FROM tSzemélyek
WHERE tSzemélyek.[Szint 4 szervezeti egység név] Like "*  *"
UNION
SELECT DISTINCT  tSzemélyek.[Szint 5 szervezeti egység név], [Szervezeti egység kódja]
FROM tSzemélyek
WHERE tSzemélyek.[Szint 5 szervezeti egység név] Like "*  *"
UNION SELECT DISTINCT  tSzemélyek.[Szint 6 szervezeti egység név], [Szervezeti egység kódja]
FROM tSzemélyek
WHERE tSzemélyek.[Szint 6 szervezeti egység név] Like "*  *";

#/#/#/
lkSzolgálatiIdõElismerés
#/#/
SELECT tSzolgálatiIdõElsimerés.[Szolgálati elismerésre jogosultság / Jubileumi jutalom kezdõ dát] AS SzolgIdKezd, bfkh(Nz([Szervezeti egység kód],0)) AS Kif1, [Azonosító]*1 AS Adójel, tSzolgálatiIdõElsimerés.*
FROM tSzolgálatiIdõElsimerés
WHERE (((tSzolgálatiIdõElsimerés.Azonosító)<>"" Or (tSzolgálatiIdõElsimerés.Azonosító) Is Not Null))
ORDER BY bfkh(Nz([Szervezeti egység kód],0));

#/#/#/
lkSzolgálatiIdõElsimerés
#/#/
SELECT tSzolgálatiIdõElsimerés.[Szolgálati elismerésre jogosultság / Jubileumi jutalom kezdõ dát] AS SzolgIdKezd, bfkh(Nz([Szervezeti egység kód],0)) AS Kif1, [Azonosító]*1 AS Adójel, tSzolgálatiIdõElsimerés.*
FROM tSzolgálatiIdõElsimerés
WHERE ((([tSzolgálatiIdõElsimerés].[Azonosító])<>"" Or ([tSzolgálatiIdõElsimerés].[Azonosító]) Is Not Null))
ORDER BY bfkh(Nz([Szervezeti egység kód],0));

#/#/#/
lkszületésiévésNem
#/#/
SELECT lkSzemélyek.Adójel, Year([Születési idõ]) AS [Szül év], IIf([Neme]="Férfi",1,2) AS Nem
FROM lkSzemélyek;

#/#/#/
lkTáblanevek
#/#/
SELECT MSysObjects.Name, MSysObjects.Flags
FROM MSysObjects
WHERE (((MSysObjects.Type)=1) AND ((MSysObjects.Flags)=0)) OR (((MSysObjects.Type)=5))
ORDER BY MSysObjects.Type, MSysObjects.Name;

#/#/#/
lkTartósTávollétEltérésÁnyrNexon
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Státusz kódja], lkSzemélyek.[Tartós távollét típusa] AS Nexon, lkÁlláshelyek.[Álláshely státusza] AS Ányr, kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN (lkSzemélyek LEFT JOIN lkÁlláshelyek ON lkSzemélyek.[Státusz kódja] = lkÁlláshelyek.[Álláshely azonosító]) ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lkÁlláshelyek.[Álláshely státusza]) Not Like "*betöltött*" And (lkÁlláshelyek.[Álláshely státusza])<>"betöltetlen") AND ((lkSzemélyek.[Státusz neve])="álláshely")) OR (((lkSzemélyek.[Tartós távollét típusa]) Is Not Null And (lkSzemélyek.[Tartós távollét típusa])<>"CSED" And (lkSzemélyek.[Tartós távollét típusa])<>"Mentesítés felmentési / felmondási idõn belül") AND ((lkÁlláshelyek.[Álláshely státusza]) Not Like "*tartós*") AND ((lkSzemélyek.[Státusz neve])="álláshely"))
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkTartósTávollévõkAdottÉvben
#/#/
SELECT lkSzemélyek.[Szint 3 szervezeti egység név], lkSzemélyek.[Szint 4 szervezeti egység név], lkSzemélyek.[Szint 5 szervezeti egység név], lkSzemélyek.[Tartós távollét kezdete], lkSzemélyek.[Tartós távollét vége], lkSzemélyek.[Tartós távollét tervezett vége]
FROM lkSzemélyek
WHERE (((Year(dtátal(2022))) Between Year(dtátal([tartós távollét kezdete])) And IIf(Nz([tartós távollét vége],"")="",IIf(Nz([tartós távollét tervezett vége],"")="",Year(dtátal(3000)),Year(dtátal([tartós távollét tervezett vége]))),Year(dtátal([tartós távollét vége])))) AND ((Nz([Tartós távollét kezdete],""))<>""))
ORDER BY lkSzemélyek.[Szint 4 szervezeti egység név];

#/#/#/
lkTelefonszámMinták
#/#/
SELECT lkSzemélyek.[Hivatali telefon], feltöltõ(lkSzemélyek.[Hivatali telefon]) AS Tel
FROM lkSzemélyek
WHERE lkSzemélyek.[Hivatali telefon] Is Not Null
UNION SELECT lkSzemélyek.[Hivatali mobil],feltöltõ(lkSzemélyek.[Hivatali mobil])
FROM lkSzemélyek
WHERE lkSzemélyek.[Hivatali mobil] Is Not Null and
"UNION
SELECT lkSzemélyek.[Otthoni mobil],feltöltõ(lkSzemélyek.[Otthoni mobil])
FROM lkSzemélyek
WHERE lkSzemélyek.[Otthoni mobil] Is Not Null
UNION
SELECT lkSzemélyek.[Otthoni telefon],feltöltõ(lkSzemélyek.[Otthoni telefon])
FROM lkSzemélyek
WHERE lkSzemélyek.[Otthoni telefon] Is Not Null
UNION
SELECT lkSzemélyek.[További otthoni mobil],Feltöltõ(lkSzemélyek.[További otthoni mobil])
FROM lkSzemélyek
WHERE lkSzemélyek.[További otthoni mobil] Is Not Null";

#/#/#/
lkTelephelyCímek
#/#/
SELECT DISTINCT lkTelephelyek.Sorszám, lkTelephelyek.Cím_Személyek
FROM lkTelephelyek;

#/#/#/
lkTelephelyCímEllenõrzés
#/#/
SELECT lkSzervezetiEgységekLegnagyobbLétszámúTelephelyei.Fõosztály, lkSzervezetiEgységekLegnagyobbLétszámúTelephelyei.Osztály, Replace(Nz([Cím],"")," .",".") AS [Szervezet címe], lkSzemélyek.MunkavégzésCíme, kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 INNER JOIN (lkSzervezetiEgységekLegnagyobbLétszámúTelephelyei INNER JOIN lkSzemélyek ON lkSzervezetiEgységekLegnagyobbLétszámúTelephelyei.BFKH = lkSzemélyek.BFKH) ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((Replace(Nz([Cím],"")," .","."))<>"") AND ((lkSzemélyek.[Státusz neve])="álláshely") AND (([MunkavégzésCíme]=Replace(Nz([lkSzervezetiEgységekLegnagyobbLétszámúTelephelyei].[Cím],"")," .","."))=False))
ORDER BY lkSzervezetiEgységekLegnagyobbLétszámúTelephelyei.Fõosztály;

#/#/#/
lkTelephelyEgyMegadottFõosztályra
#/#/
SELECT lkSzemélyek.MunkavégzésCíme, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, kt_azNexon_Adójel.NLink
FROM kt_azNexon_Adójel INNER JOIN lkSzemélyek ON kt_azNexon_Adójel.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.Fõosztály) Like "*" & [A keresendõ fõosztály neve, vagy a nevének a részlete:] & "*"))
ORDER BY lkSzemélyek.MunkavégzésCíme;

#/#/#/
lkTelephelyek
#/#/
SELECT tTelephelyek230301.Sorszám, tTelephelyek230301.Irsz, tTelephelyek230301.Város, tTelephelyek230301.Cím, tTelephelyek230301.Tulajdonos, tTelephelyek230301.Üzemeltetõ, IIf(Nz([Nexon cím],"")="",([Irsz] & " " & [Város] & ", " & IIf(Left([Irsz],1)=1,num2num(Mid([Irsz],2,2),10,99) & ". kerület, ","") & [Cím]),[Nexon cím]) AS Cím_Személyek, tTelephelyek230301.[Nexon cím]
FROM tTelephelyek230301;

#/#/#/
lkTelephelyekCímNélkül
#/#/
SELECT DISTINCT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Munkavégzés helye - megnevezés], lkSzemélyek.[Munkavégzés helye - cím], Count(lkSzemélyek.Adójel) AS CountOfAdójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Munkavégzés helye - cím]) Is Null)) OR (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((Len([Munkavégzés helye - cím]))<3))
GROUP BY lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Munkavégzés helye - megnevezés], lkSzemélyek.[Munkavégzés helye - cím];

#/#/#/
lkTelephelyekenDolgozók
#/#/
SELECT lkSzemélyTelephelyek.[Szervezeti egység kódja], lkSzemélyTelephelyek.Fõosztály, lkSzemélyTelephelyek.Osztály, lkTelephelyek.Sorszám, lkSzemélyTelephelyek.[Dolgozó teljes neve], lkTelephelyek.Irsz, lkTelephelyek.Város, lkTelephelyek.Cím, lkTelephelyek.Tulajdonos, lkTelephelyek.Üzemeltetõ, 1 AS Létszám
FROM lkTelephelyek RIGHT JOIN lkSzemélyTelephelyek ON lkTelephelyek.Cím_Személyek=lkSzemélyTelephelyek.TelephelyCíme
ORDER BY bfkh([Szervezeti egység kódja]);

#/#/#/
lkTelephelyekLétszáma
#/#/
SELECT lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, IIf(Len([Munkavégzés helye - cím])<2,[Munkavégzés helye - megnevezés],[Munkavégzés helye - cím]) AS Cím, Count(lkSzemélyek.Adójel) AS Létszám
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
GROUP BY lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, IIf(Len([Munkavégzés helye - cím])<2,[Munkavégzés helye - megnevezés],[Munkavégzés helye - cím]);

#/#/#/
lkTelephelyenkéntiLétszám2
#/#/
SELECT lkSzemélyek.[Munkavégzés helye - megnevezés], lkSzemélyek.[Munkavégzés helye - cím], Count(lkSzemélyek.Azonosító) AS [Létszám (fõ)]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Jogviszony vége (kilépés dátuma)])>Date()-1 Or (lkSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Null Or (lkSzemélyek.[Jogviszony vége (kilépés dátuma)])=0))
GROUP BY lkSzemélyek.[Munkavégzés helye - megnevezés], lkSzemélyek.[Munkavégzés helye - cím]
ORDER BY Count(lkSzemélyek.Azonosító) DESC;

#/#/#/
lkTelephelyenkéntiLétszámSzervezetenként
#/#/
SELECT lkSzemélyTelephelyek.[Munkavégzés helye - cím] AS Telephely, lkSzemélyTelephelyek.Fõosztály, Count(lkSzemélyTelephelyek.adójel) AS Létszám
FROM lkSzemélyTelephelyek
GROUP BY lkSzemélyTelephelyek.[Munkavégzés helye - cím], lkSzemélyTelephelyek.Fõosztály;

#/#/#/
lkTelephelyenkéntiOsztályonkéntiLétszám
#/#/
SELECT lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.MunkavégzésCíme, Count(lkSzemélyek.Adójel) AS Létszám
FROM lkSzemélyek
WHERE (((lkSzemélyek.MunkavégzésCíme) Is Not Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
GROUP BY lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.MunkavégzésCíme
ORDER BY lkSzemélyek.BFKH, Count(lkSzemélyek.Adójel) DESC;

#/#/#/
lktJárási_állomány
#/#/
SELECT tJárási_állomány.Sorszám, tJárási_állomány.Név, tJárási_állomány.Adóazonosító, tJárási_állomány.Mezõ4 AS [Születési év \ üres állás], tJárási_állomány.Mezõ5 AS Neme, Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS [Járási Hivatal_], tJárási_állomány.Mezõ7 AS Osztály, tJárási_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], tJárási_állomány.Mezõ9 AS [Ellátott feladat], tJárási_állomány.Mezõ10 AS Kinevezés, tJárási_állomány.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], tJárási_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], tJárási_állomány.[Heti munkaórák száma], tJárási_állomány.Mezõ14 AS [Betöltés aránya], tJárási_állomány.[Besorolási fokozat kód:], tJárási_állomány.[Besorolási fokozat megnevezése:], tJárási_állomány.[Álláshely azonosító], tJárási_állomány.Mezõ18 AS [Havi illetmény], tJárási_állomány.Mezõ19 AS [Eu finanszírozott], tJárási_állomány.Mezõ20 AS [Illetmény forrása], tJárási_állomány.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], tJárási_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], tJárási_állomány.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], tJárási_állomány.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], tJárási_állomány.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], tJárási_állomány.Mezõ26 AS [Képesítést adó végzettség], tJárási_állomány.Mezõ27 AS KAB, tJárási_állomány.[KAB 001-3** Branch ID], tJárási_állomány.hatályaID, tJárási_állomány.azJárásiSor
FROM tJárási_állomány;

#/#/#/
lktKormányhivatali_állomány
#/#/
SELECT tKormányhivatali_állomány.Sorszám, tKormányhivatali_állomány.Név, tKormányhivatali_állomány.Adóazonosító, tKormányhivatali_állomány.Mezõ4 AS [Születési év \ üres állás], tKormányhivatali_állomány.Mezõ5 AS Neme, tKormányhivatali_állomány.Mezõ6 AS Fõosztály, tKormányhivatali_állomány.Mezõ7 AS Osztály, tKormányhivatali_állomány.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], tKormányhivatali_állomány.Mezõ9 AS [Ellátott feladat], tKormányhivatali_állomány.Mezõ10 AS Kinevezés, tKormányhivatali_állomány.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], tKormányhivatali_állomány.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], tKormányhivatali_állomány.[Heti munkaórák száma], tKormányhivatali_állomány.Mezõ14 AS [Betöltés aránya], tKormányhivatali_állomány.[Besorolási fokozat kód:], tKormányhivatali_állomány.[Besorolási fokozat megnevezése:], tKormányhivatali_állomány.[Álláshely azonosító], tKormányhivatali_állomány.Mezõ18 AS [Havi illetmény], tKormányhivatali_állomány.Mezõ19 AS [Eu finanszírozott], tKormányhivatali_állomány.Mezõ20 AS [Illetmény forrása], tKormányhivatali_állomány.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], tKormányhivatali_állomány.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], tKormányhivatali_állomány.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], tKormányhivatali_állomány.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], tKormányhivatali_állomány.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], tKormányhivatali_állomány.Mezõ26 AS [Képesítést adó végzettség], tKormányhivatali_állomány.Mezõ27 AS KAB, tKormányhivatali_állomány.[KAB 001-3** Branch ID], tKormányhivatali_állomány.hatályaID, tKormányhivatali_állomány.azKormányhivataliSor
FROM tKormányhivatali_állomány;

#/#/#/
lktKormányhivataliRekordokSzáma
#/#/
SELECT lktKormányhivatali_állomány.hatályaID, tHaviJelentésHatálya1.hatálya, Count(lktKormányhivatali_állomány.[Álláshely azonosító]) AS [CountOfÁlláshely azonosító]
FROM lktKormányhivatali_állomány INNER JOIN tHaviJelentésHatálya1 ON lktKormányhivatali_állomány.hatályaID = tHaviJelentésHatálya1.hatályaID
GROUP BY lktKormányhivatali_állomány.hatályaID, tHaviJelentésHatálya1.hatálya
ORDER BY tHaviJelentésHatálya1.hatálya;

#/#/#/
lktKözpontosítottak
#/#/
SELECT tKözpontosítottak.Sorszám, tKözpontosítottak.Név, tKözpontosítottak.Adóazonosító, tKözpontosítottak.Mezõ4 AS [Születési év \ üres állás], "" AS Nem, Replace(IIf([Megyei szint VAGY Járási Hivatal]="Megyei szint",[tKözpontosítottak].[Mezõ6],[Megyei szint VAGY Járási Hivatal]),"Budapest Fõváros Kormányhivatala ","BFKH ") AS Fõoszt, tKözpontosítottak.Mezõ7 AS Osztály, tKözpontosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], tKözpontosítottak.Mezõ10 AS [Ellátott feladat], tKözpontosítottak.Mezõ11 AS Kinevezés, "SZ" AS [Feladat jellege], tKözpontosítottak.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], 0 AS [Heti munkaórák száma], 1 AS [Betöltés aránya], tKözpontosítottak.[Besorolási fokozat kód:], tKözpontosítottak.[Besorolási fokozat megnevezése:], tKözpontosítottak.[Álláshely azonosító], tKözpontosítottak.Mezõ17 AS [Havi illetmény], "" AS [Eu finanszírozott], "" AS [Illetmény forrása], "" AS [Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], tKözpontosítottak.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], tKözpontosítottak.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], tKözpontosítottak.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], "" AS [Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], "" AS [Képesítést adó végzettség], "" AS KAB, "" AS [KAB 001-3** Branch ID], tKözpontosítottak.hatályaID, tKözpontosítottak.azKözpontosítottakSor
FROM tKözpontosítottak;

#/#/#/
lktKSZDR - azonosak keresése
#/#/
SELECT First(tKSZDR.[Adóazonosító jel]) AS [Adóazonosító jel Mezõ], Count(tKSZDR.[Adóazonosító jel]) AS AzonosakSzáma
FROM tKSZDR
GROUP BY tKSZDR.[Adóazonosító jel]
HAVING (((Count(tKSZDR.[Adóazonosító jel]))>1));

#/#/#/
lkTmpEgyesMunkakörökFõosztályaiLétszám
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, Count(lkSzemélyek.Adójel) AS Létszám
FROM tTmpEgyesMunkakörökFõosztályai INNER JOIN lkSzemélyek ON tTmpEgyesMunkakörökFõosztályai.Fõosztály = lkSzemélyek.FõosztályKód
WHERE (((lkSzemélyek.[KIRA feladat megnevezés]) Not Like "*titkársági*") AND ((tTmpEgyesMunkakörökFõosztályai.Fõosztály)=[lkSzemélyek].[Fõosztálykód]) AND ((lkSzemélyek.Osztály) Like [tTmpEgyesMunkakörökFõosztályai].[Osztály]))
GROUP BY lkSzemélyek.Fõosztály, lkSzemélyek.Osztály;

#/#/#/
lkTovábbfoglalkoztatottak
#/#/
SELECT lkSzemélyek.Adójel, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Szerzõdés/kinevezés verzió_érvényesség vége], lkSzemélyek.[Határozott idejû _szerzõdés/kinevezés lejár], lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva], lkSzemélyek.[Jogviszony típusa / jogviszony típus], lkSzemélyek.[Születési idõ], lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.Feladatkör
FROM lkKilépõUnió INNER JOIN lkSzemélyek ON lkKilépõUnió.Adójel = lkSzemélyek.Adójel
WHERE (((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja])<[Jogviszony kezdete (belépés dátuma)]) AND ((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva])="A kormánytisztviselõ kérelmére a társadalombiztosítási nyugellátásról szóló 1997. évi LXXXI. tv. 18. § (2a) bekezdésében foglalt feltétel fennállása miatt [Kit. 107. § (2) bek. e) pont, 105. § (1) bekezdés c]") AND ((lkSzemélyek.[Státusz neve])="Álláshely")) OR (((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja])<[Jogviszony kezdete (belépés dátuma)]) AND ((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Születési idõ])<#5/17/1959#))
ORDER BY lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkTörvényességiFelügyeletiÁlláshely
#/#/
SELECT lkSzemélyek.Fõosztály, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[Jogviszony típusa / jogviszony típus], ffsplit([Elsõdleges feladatkör],"-",2) AS Feladatkör, lkSzemélyek.[Státusz kódja], lkSzemélyek.[Besorolási  fokozat (KT)]
FROM lkSzemélyek INNER JOIN tTmp ON lkSzemélyek.[Státusz kódja] = tTmp.F1;

#/#/#/
lkTörzsszám_Szervezeti_egység
#/#/
SELECT [Törzsszám]*1 AS Törzsszám_, lkFõosztályok.Fõosztály, lkSzemélyek.[Szint 5 szervezeti egység név] AS Osztály, Max(lkSzemélyek.[Jogviszony sorszáma]) AS [MaxOfJogviszony sorszáma]
FROM lkSzemélyek INNER JOIN lkFõosztályok ON lkSzemélyek.[Szervezeti egység kódja] = lkFõosztályok.[Szervezeti egység kódja]
GROUP BY [Törzsszám]*1, lkFõosztályok.Fõosztály, lkSzemélyek.[Szint 5 szervezeti egység név];

#/#/#/
lkTT21_22_23
#/#/
SELECT TT21_22_23.Fõosztály, TT21_22_23.Osztály, Sum(TT21_22_23.TTLétszám2021) AS SumOfTTLétszám2021, Sum(TT21_22_23.TTLétszám2022) AS SumOfTTLétszám2022, Sum(TT21_22_23.TTLétszám2023) AS SumOfTTLétszám2023, Sum(TT21_22_23.Létszám2023) AS SumOfLétszám2023
FROM (SELECT lkTTLétszámFõosztályonkéntOsztályonként2021.Fõosztály, lkTTLétszámFõosztályonkéntOsztályonként2021.Osztály, lkTTLétszámFõosztályonkéntOsztályonként2021.TTLétszám2021, lkTTLétszámFõosztályonkéntOsztályonként2021.TTLétszám2022, lkTTLétszámFõosztályonkéntOsztályonként2021.TTLétszám2023, 0 as Létszám2023
FROM lkTTLétszámFõosztályonkéntOsztályonként2021
UNION
SELECT
lkTTLétszámFõosztályonkéntOsztályonként2022.Fõosztály, lkTTLétszámFõosztályonkéntOsztályonként2022.Osztály, lkTTLétszámFõosztályonkéntOsztályonként2022.TTLétszám2021, lkTTLétszámFõosztályonkéntOsztályonként2022.TTLétszám2022, lkTTLétszámFõosztályonkéntOsztályonként2022.TTLétszám2023, 0 as Létszám2023
FROM lkTTLétszámFõosztályonkéntOsztályonként2022
UNION
SELECT lkTTLétszámFõosztályonkéntOsztályonként2023.Fõosztály, lkTTLétszámFõosztályonkéntOsztályonként2023.Osztály, lkTTLétszámFõosztályonkéntOsztályonként2023.TTLétszám2021, lkTTLétszámFõosztályonkéntOsztályonként2023.TTLétszám2022, lkTTLétszámFõosztályonkéntOsztályonként2023.TTLétszám2023, 0 as Létszám2023
FROM lkTTLétszámFõosztályonkéntOsztályonként2023
UNION
SELECT lkLétszámFõosztályonkéntOsztályonként20230101.Fõosztály, lkLétszámFõosztályonkéntOsztályonként20230101.Osztály, lkLétszámFõosztályonkéntOsztályonként20230101.TTLétszám2021, lkLétszámFõosztályonkéntOsztályonként20230101.TTLétszám2022, 0 as TTLétszám2023, SumOfLétszám2023
FROM lkLétszámFõosztályonkéntOsztályonként20230101)  AS TT21_22_23
GROUP BY TT21_22_23.Fõosztály, TT21_22_23.Osztály;

#/#/#/
lkTTLétszámFõosztályonkéntOsztályonként2021
#/#/
SELECT Replace(Nz(IIf(IsNull([tSzemélyek20210101].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek20210101].[Szint 3 szervezeti egység név]),[tSzemélyek20210101].[Szint 2 szervezeti egység név] & "",[tSzemélyek20210101].[Szint 3 szervezeti egység név] & ""),[tSzemélyek20210101].[Szint 4 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") & "" AS Fõosztály, [Szint 5 szervezeti egység név] & "" AS Osztály, Sum(IIf(Nz([Tartós távollét típusa],"")="",0,1)) AS TTLétszám2021, Sum(0) AS TTLétszám2022, Sum(0) AS TTLétszám2023
FROM tSzemélyek20210101
WHERE (((tSzemélyek20210101.[Státusz neve])="Álláshely"))
GROUP BY Replace(Nz(IIf(IsNull([tSzemélyek20210101].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek20210101].[Szint 3 szervezeti egység név]),[tSzemélyek20210101].[Szint 2 szervezeti egység név] & "",[tSzemélyek20210101].[Szint 3 szervezeti egység név] & ""),[tSzemélyek20210101].[Szint 4 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") & "", [Szint 5 szervezeti egység név] & "";

#/#/#/
lkTTLétszámFõosztályonkéntOsztályonként2022
#/#/
SELECT Replace(Nz(IIf(IsNull([tSzemélyek20220101].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek20220101].[Szint 3 szervezeti egység név]),[tSzemélyek20220101].[Szint 2 szervezeti egység név] & "",[tSzemélyek20220101].[Szint 3 szervezeti egység név] & ""),[tSzemélyek20220101].[Szint 4 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") & "" AS Fõosztály, [Szint 5 szervezeti egység név] & "" AS Osztály, Sum(0) AS TTLétszám2021, Sum(IIf(Nz([Tartós távollét típusa],"")="",0,1)) AS TTLétszám2022, Sum(0) AS TTLétszám2023
FROM tSzemélyek20220101
WHERE (((tSzemélyek20220101.[Státusz neve])="Álláshely"))
GROUP BY Replace(Nz(IIf(IsNull([tSzemélyek20220101].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek20220101].[Szint 3 szervezeti egység név]),[tSzemélyek20220101].[Szint 2 szervezeti egység név] & "",[tSzemélyek20220101].[Szint 3 szervezeti egység név] & ""),[tSzemélyek20220101].[Szint 4 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") & "", [Szint 5 szervezeti egység név] & "";

#/#/#/
lkTTLétszámFõosztályonkéntOsztályonként2023
#/#/
SELECT Replace(Nz(IIf(IsNull([tSzemélyek20230101].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek20230101].[Szint 3 szervezeti egység név]),[tSzemélyek20230101].[Szint 2 szervezeti egység név] & "",[tSzemélyek20230101].[Szint 3 szervezeti egység név] & ""),[tSzemélyek20230101].[Szint 4 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") & "" AS Fõosztály, [Szint 5 szervezeti egység név] & "" AS Osztály, Sum(0) AS TTLétszám2021, Sum(0) AS TTLétszám2022, Sum(IIf(Nz([Tartós távollét típusa],"")="",0,1)) AS TTLétszám2023, Sum(1) AS Létszám2023
FROM tSzemélyek20230101
WHERE (((tSzemélyek20230101.[Státusz neve])="Álláshely"))
GROUP BY Replace(Nz(IIf(IsNull([tSzemélyek20230101].[Szint 4 szervezeti egység név]),IIf(IsNull([tSzemélyek20230101].[Szint 3 szervezeti egység név]),[tSzemélyek20230101].[Szint 2 szervezeti egység név] & "",[tSzemélyek20230101].[Szint 3 szervezeti egység név] & ""),[tSzemélyek20230101].[Szint 4 szervezeti egység név] & ""),""),"Budapest Fõváros Kormányhivatala ","BFKH ") & "", [Szint 5 szervezeti egység név] & "";

#/#/#/
lkTTvége01
#/#/
SELECT Year(IIf(dtÁtal([Tartós távollét vége])=1,dtÁtal([Tartós távollét tervezett vége]),dtÁtal([Tartós távollét vége]))) AS VégeÉv, Month(IIf(dtÁtal([Tartós távollét vége])=1,dtÁtal([Tartós távollét tervezett vége]),dtÁtal([Tartós távollét vége]))) AS VégeHó, 1 AS Létszám, lkSzemélyek.Azonosító, IIf(dtÁtal([Tartós távollét vége])=1,dtÁtal([Tartós távollét tervezett vége]),dtÁtal([Tartós távollét vége])) AS Dátum
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) AND ((lkSzemélyek.[Tartós távollét típusa]) Is Not Null));

#/#/#/
lkTTvége012024
#/#/
SELECT lkTTvége01.VégeHó, 0 AS 2026_év, lkTTvége01.Létszám AS 2024_év, 0 AS 2025_év
FROM lkTTvége01
WHERE (((lkTTvége01.Dátum) Between #1/1/2024# And #12/31/2024#));

#/#/#/
lkTTvége012025
#/#/
SELECT lkTTvége01.VégeHó, 0 AS 2026_év, 0 AS 2024_év, lkTTvége01.Létszám AS 2025_év
FROM lkTTvége01
WHERE (((lkTTvége01.Dátum) Between #1/1/2025# And #12/31/2025#));

#/#/#/
lkTTvége012026
#/#/
SELECT lkTTvége01.VégeHó, lkTTvége01.Létszám AS 2026_év, 0 AS 2024_év, 0 AS 2025_év
FROM lkTTvége01
WHERE (((lkTTvége01.Dátum) Between #1/1/2026# And #12/31/2026#));

#/#/#/
lkTTvége02
#/#/
SELECT *
FROM lkTTvége012026
UNION all
SELECT *
FROM lkTTvége012024
UNION ALL SELECT *
FROM lkTTvége012025;

#/#/#/
lkTTvége03
#/#/
SELECT tHónapok.hónap AS [Tartós távollét vége], Sum(lkTTvége02.[2024_év]) AS [2024 év], Sum(lkTTvége02.[2025_év]) AS [2025 év], Sum([2026_év]) AS [2026 év]
FROM tHónapok INNER JOIN lkTTvége02 ON tHónapok.Azonosító = lkTTvége02.VégeHó
GROUP BY tHónapok.hónap, lkTTvége02.VégeHó
ORDER BY lkTTvége02.VégeHó;

#/#/#/
lkÚjBelépõKépzés
#/#/
SELECT (Select count(Tmp.Azonosító) From lkSzemélyek as Tmp Where Tmp.[Jogviszony típusa / jogviszony típus]<=lkSzemélyek.[Jogviszony típusa / jogviszony típus] and Tmp.[Jogviszony kezdete (belépés dátuma)]<=lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] And Tmp.[Dolgozó teljes neve]<=lkSzemélyek.[Dolgozó teljes neve]) AS Sorszám, lkSzemélyek.[Jogviszony típusa / jogviszony típus] AS Jogviszony, lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.Fõosztály, lkSzemélyek.[Hivatali email] AS [E-mail cím], lkSzemélyek.Adójel AS [Adóazonosító jel], [Születési hely] & ", " & [Születési idõ] AS [Születési hely dátum], lkSzemélyek.[Anyja neve], lkSzemélyek.[TAJ szám], lkKilépõk.[Jogviszony megszûnésének, megszüntetésének idõpontja], lkSzemélyek.[Jogviszony vége (kilépés dátuma)] AS Kilépés, lkSzemélyek.[Jogfolytonos idõ kezdete], lkSzemélyek.[Szerzõdés/Kinevezés - próbaidõ vége], lkSzemélyek.Nyugdíjas, lkSzemélyek.[Nyugdíj típusa], lkSzemélyek.[Nyugdíjas korú továbbfoglalkoztatási engedéllyel rendelkezik]
FROM lkKilépõk RIGHT JOIN lkSzemélyek ON lkKilépõk.Adóazonosító = lkSzemélyek.[Adóazonosító jel]
WHERE (((lkSzemélyek.[Jogviszony típusa / jogviszony típus])="Kormányzati szolgálati jogviszony" Or (lkSzemélyek.[Jogviszony típusa / jogviszony típus])="Munkaviszony") AND ((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)])>=#11/1/2022#) AND ((lkSzemélyek.[Jogviszony vége (kilépés dátuma)])>="#2023. 05. 15.#" Or (lkSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Null))
ORDER BY lkSzemélyek.[Jogviszony típusa / jogviszony típus], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkUtolsóBesorolás
#/#/
SELECT lkBesorolásiEredményadatok.*
FROM lkBesorolásiEredményadatok
WHERE (((lkBesorolásiEredményadatok.[Változás dátuma])=(select max(a.[Változás dátuma]) from lkBesorolásiEredményadatok as a where a.[Adóazonosító jel] = lkBesorolásiEredményadatok.[Adóazonosító jel])));

#/#/#/
lkUtolsóBesorolásAktíve
#/#/
SELECT lkUtolsóBesorolás.[Adóazonosító jel], lkSzemélyek.[Dolgozó teljes neve]
FROM lkUtolsóBesorolás INNER JOIN lkSzemélyek ON lkUtolsóBesorolás.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"));

#/#/#/
lkUtónevek
#/#/
SELECT UtónevekBesorolásiból.Keresztnév INTO tUtónevek
FROM (SELECT  ffsplit([Utónév]," ",1) AS Keresztnév
FROM lkBesorolásiEredményadatok
UNION
SELECT  ffsplit([Utónév]," ",2) AS Kif1
FROM lkBesorolásiEredményadatok)  AS UtónevekBesorolásiból;

#/#/#/
lkUtónevekGyakorisága
#/#/
SELECT Találatok.Keresztnév, Count(lkSzemélyek.[Adóazonosító jel]) AS [CountOfAdóazonosító jel]
FROM (SELECT [Keresztnév], * FROM lkSzemélyek INNER JOIN tUtónevek ON [lkSzemélyek].[Dolgozó Teljes Neve] like "* "&[tUtónevek].[Keresztnév]&" *")  AS Találatok
GROUP BY Találatok.Keresztnév;

#/#/#/
lkUtónevekNemekkel
#/#/
SELECT UtónevekBesorolásiból.Keresztnév, UtónevekBesorolásiból.Neme INTO tUtónevekNemekkel
FROM (SELECT ffsplit([Utónév]," ",1) AS Keresztnév, lkSzemélyek.Neme
FROM lkSzemélyek RIGHT JOIN lkBesorolásiEredményadatok ON lkSzemélyek.[Adóazonosító jel] = lkBesorolásiEredményadatok.[Adóazonosító jel]
UNION
SELECT ffsplit([Utónév]," ",2) AS Keresztnév, lkSzemélyek.Neme
FROM lkSzemélyek RIGHT JOIN lkBesorolásiEredményadatok ON lkSzemélyek.[Adóazonosító jel] = lkBesorolásiEredményadatok.[Adóazonosító jel]
)  AS UtónevekBesorolásiból;

#/#/#/
lkUtónévtárbanNemSzereplõUtónevek
#/#/
SELECT tUtónevek.Keresztnév, Right([Keresztnév],2)="né" AS Kif1
FROM tUtónevek LEFT JOIN tÖsszesUtónév ON tUtónevek.Keresztnév = tÖsszesUtónév.Utónév
WHERE (((tÖsszesUtónév.Utónév) Is Null) AND ((Right([Keresztnév],2)="né")=False));

#/#/#/
lkÜresÁlláshelyek
#/#/
SELECT lkJárásiKormányKözpontosítottUnió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS [Fõosztály\Hivatal], lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító], lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat megnevezése:], lkJárásiKormányKözpontosítottUnió.Jelleg, lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás] AS Mezõ4, lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat kód:], lkJárásiKormányKözpontosítottUnió.Kinevezés AS [Megüresedés dátuma], DateDiff("m",[Kinevezés],Now()) AS [Megüresedéstõl eltelt hónapok], TextToMD5Hex([Álláshely azonosító]) AS Hash
FROM lkJárásiKormányKözpontosítottUnió
WHERE (((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás]) Like "üres*"))
ORDER BY Bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]);

#/#/#/
lkÜresÁlláshelyek_Alaplétszám
#/#/
SELECT Unió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Szint5 - leírás] & [Szint6 - leírás] AS [Fõosztály\Hivatal], Unió.[Álláshely azonosító], Unió.[Besorolási fokozat megnevezése:]
FROM tSzervezeti RIGHT JOIN (SELECT [Álláshely azonosító], Mezõ4, [Besorolási fokozat megnevezése:], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Besorolási fokozat kód:]                       FROM Járási_állomány                       WHERE [Besorolási fokozat kód:] like "ÜÁ*"           UNION SELECT [Álláshely azonosító], Mezõ4, [Besorolási fokozat megnevezése:], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Besorolási fokozat kód:]                       FROM Kormányhivatali_állomány                       WHERE (((Kormányhivatali_állomány.[Besorolási fokozat kód:]) like "ÜÁ*"))    )  AS Unió ON tSzervezeti.[Szervezetmenedzsment kód] = Unió.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
ORDER BY Bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]);

#/#/#/
lkÜresÁlláshelyek001
#/#/
SELECT lkJárásiKormányKözpontosítottUnió.[Járási Hivatal] AS [Fõosztály\Hivatal], lkJárásiKormányKözpontosítottUnió.Osztály, lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító], lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat megnevezése:], lkHaviJelentésHatálya.hatálya
FROM lkJárásiKormányKözpontosítottUnió, lkHaviJelentésHatálya
WHERE (((lkJárásiKormányKözpontosítottUnió.[Születési év \ üres állás]) Like "üres*"));

#/#/#/
lkÜresÁlláshelyek002
#/#/
SELECT IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, lkBelépõkTeljes.Mezõ6 AS Osztály, lkBelépõkTeljes.[Álláshely azonosító], lkBelépõkTeljes.[Besorolási fokozat megnevezése:], lkBelépõkTeljes.[Jogviszony kezdõ dátuma]
FROM lkBelépõkTeljes
WHERE (((lkBelépõkTeljes.[Jogviszony kezdõ dátuma]) Between Date() And IIf(Day(Now()) Between 2 And 15,DateSerial(Year(Date()),Month(Date()),15),DateSerial(Year(Date()),Month(Date())+1,1))));

#/#/#/
lkÜresÁlláshelyek003
#/#/
SELECT tKilépõkUnió.Fõosztály, tKilépõkUnió.Osztály, tKilépõkUnió.[Álláshely azonosító], tKilépõkUnió.[Besorolási fokozat megnevezése:], tKilépõkUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja]
FROM tKilépõkUnió
WHERE (((tKilépõkUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja]) Between Date() And IIf(Day(Now()) Between 2 And 15,DateSerial(Year(Date()),Month(Date()),15),DateSerial(Year(Date()),Month(Date())+1,1))));

#/#/#/
lkÜresÁlláshelyek004
#/#/
SELECT IIf([lkÜresÁlláshelyek002].[Fõosztály] Is Null,[lkÜresÁlláshelyek001].[Fõosztály\Hivatal],[lkÜresÁlláshelyek002].[Fõosztály]) AS Fõosztálya, IIf([lkÜresÁlláshelyek002].[osztály] Is Null,[lkÜresÁlláshelyek001].[Osztály],[lkÜresÁlláshelyek002].[osztály]) AS Osztálya, IIf([lkÜresÁlláshelyek002].[Álláshely azonosító] Is Null,[lkÜresÁlláshelyek001].[Álláshely azonosító],[lkÜresÁlláshelyek002].[Álláshely azonosító]) AS Álláshely, IIf([lkÜresÁlláshelyek002].[Besorolási fokozat megnevezése:] Is Null,[lkÜresÁlláshelyek001].[Besorolási fokozat megnevezése:],[lkÜresÁlláshelyek002].[Besorolási fokozat megnevezése:]) AS Besorolás, IIf([lkÜresÁlláshelyek002].[Álláshely azonosító] Is Null,[lkÜresÁlláshelyek001].[hatálya],[lkÜresÁlláshelyek002].[Jogviszony kezdõ dátuma]) AS Dátum
FROM lkÜresÁlláshelyek001 LEFT JOIN lkÜresÁlláshelyek002 ON lkÜresÁlláshelyek001.[Álláshely azonosító] = lkÜresÁlláshelyek002.[Álláshely azonosító]
WHERE (((lkÜresÁlláshelyek002.[Álláshely azonosító]) Is Null));

#/#/#/
lkÜresÁlláshelyek005
#/#/
SELECT DISTINCT [004És002].Fõosztálya, [004És002].Osztálya, [004És002].Álláshely, [004És002].Dátum, [004És002].Besorolás, TextToMD5Hex([Álláshely]) AS Hash, *
FROM (SELECT *
FROM lkÜresÁlláshelyek004
UNION SELECT *
FROM  lkÜresÁlláshelyek003)  AS 004És002
ORDER BY [004És002].Dátum;

#/#/#/
lkÜresÁlláshelyekÁllapotfelmérõ
#/#/
SELECT lkÜresÁlláshelyek.[Fõosztály\Hivatal], lkÜresÁlláshelyek.[Álláshely azonosító], lkÜresÁlláshelyek.[Besorolási fokozat megnevezése:], IIf(dtátal([DeliveredDate])=0,"",dtátal([DeliveredDate])) AS [Legutóbbi állapot ideje], Nz([VisszajelzésSzövege],"Nincs folyamatban") AS [Legutóbbi állapot]
FROM (tVisszajelzésTípusok RIGHT JOIN lkÜzenetekVisszajelzések ON tVisszajelzésTípusok.VisszajelzésKód = lkÜzenetekVisszajelzések.VisszajelzésKód) RIGHT JOIN lkÜresÁlláshelyek ON lkÜzenetekVisszajelzések.Hash = lkÜresÁlláshelyek.Hash
WHERE (((lkÜzenetekVisszajelzések.DeliveredDate)=(Select Max([DeliveredDate]) FROM [lkÜzenetekVisszajelzések] as Tmp Where [lkÜzenetekVisszajelzések].Hash=Tmp.hash) Or (lkÜzenetekVisszajelzések.DeliveredDate) Is Null))
ORDER BY lkÜresÁlláshelyek.[Fõosztály\Hivatal], lkÜresÁlláshelyek.[Álláshely azonosító];

#/#/#/
lkÜresÁlláshelyekEredetiÁllapot
#/#/
SELECT 182 AS azÜzenet, TextToMD5Hex([ÁNYR]) AS Hash, tVisszajelzésTípusok.VisszajelzésKód
FROM tVisszajelzésTípusok RIGHT JOIN ÁnyrÉsVálaszok240815 ON tVisszajelzésTípusok.VisszajelzésSzövege = ÁnyrÉsVálaszok240815.Állapot
WHERE (((tVisszajelzésTípusok.VisszajelzésKód) Is Not Null));

#/#/#/
lkÜresÁlláshelyekÉrkezettVisszajelzésekFõosztályonként
#/#/
SELECT Számlálás.[Fõosztály\Hivatal], Számlálás.[Érkezett válasz], Számlálás.[Nem érkezett válasz], Számlálás.Összesen, *
FROM (SELECT lkÜresÁlláshelyekÁllapotfelmérõ.[Fõosztály\Hivatal], Sum(IIf([Legutóbbi állapot ideje]=DateSerial(Year(Now()),Month(Now()),Day(Now())),1,0)) AS [Érkezett válasz], Sum(IIf([Legutóbbi állapot ideje]<>DateSerial(Year(Now()),Month(Now()),Day(Now())),1,0)) AS [Nem érkezett válasz], Sum(1) as Összesen
FROM lkÜresÁlláshelyekÁllapotfelmérõ
GROUP BY lkÜresÁlláshelyekÁllapotfelmérõ.[Fõosztály\Hivatal])  AS Számlálás
WHERE (((Számlálás.[Érkezett válasz])=0));

#/#/#/
lküresÁlláshelyekHaviból01
#/#/
SELECT lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító], lkJárásiKormányKözpontosítottUnió.Kinevezés, IIf([Születési év \ üres állás]="üres állás",True,False) AS Üres, IIf([Kinevezés]<Date(),True,False) AS Korábbi, IIf([Kinevezés]>Date(),True,False) AS Késõbbi, [Kinevezés]=Date() AS Mai, Switch([Üres] And [Korábbi],"üres",[üres] And [késõbbi],"betöltött",[üres] And [mai],"üres",Not [üres] And [Mai],"betöltött",Not [üres] And [korábbi],"betöltött",Not [üres] And [késõbbi],"üres") AS Állapot
FROM lkJárásiKormányKözpontosítottUnió;

#/#/#/
lkÜresÁlláshelyekNemVezetõ
#/#/
SELECT lkÜresÁlláshelyek.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkÜresÁlláshelyek.[Fõosztály\Hivatal], lkÜresÁlláshelyek.[Álláshely azonosító], lkÜresÁlláshelyek.[Besorolási fokozat megnevezése:], lkÜresÁlláshelyek.[Besorolási fokozat kód:], lkÜresÁlláshelyek.Jelleg
FROM lkÜresÁlláshelyek
WHERE (((lkÜresÁlláshelyek.[Besorolási fokozat kód:]) Not Like "*Ov*" And (lkÜresÁlláshelyek.[Besorolási fokozat kód:]) Not Like "*Jhv*" And (lkÜresÁlláshelyek.[Besorolási fokozat kód:]) Not Like "*ig." And (lkÜresÁlláshelyek.[Besorolási fokozat kód:])<>"Fsp."));

#/#/#/
lkÜresÁlláshelyekStatisztika
#/#/
SELECT Statisztika.Jelleg, Statisztika.[CountOfÁlláshely azonosító] AS Létszám
FROM (SELECT "Összes:" AS Jelleg, Count(lkÜresÁlláshelyek.[Álláshely azonosító]) AS [CountOfÁlláshely azonosító], 1 AS Sorszám
FROM lkÜresÁlláshelyekÁllapotfelmérõ INNER JOIN (lkÜresÁlláshelyek INNER JOIN tBesorolás_átalakító ON lkÜresÁlláshelyek.[Besorolási fokozat kód:] = tBesorolás_átalakító.[Az álláshely jelölése]) ON lkÜresÁlláshelyekÁllapotfelmérõ.[Álláshely azonosító] = lkÜresÁlláshelyek.[Álláshely azonosító]

union SELECT "Központosított:" AS Jelleg, Count(lkÜresÁlláshelyek.[Álláshely azonosító]) AS [CountOfÁlláshely azonosító], 2 AS Sorszám
FROM lkÜresÁlláshelyekÁllapotfelmérõ INNER JOIN (lkÜresÁlláshelyek INNER JOIN tBesorolás_átalakító ON lkÜresÁlláshelyek.[Besorolási fokozat kód:] = tBesorolás_átalakító.[Az álláshely jelölése]) ON lkÜresÁlláshelyekÁllapotfelmérõ.[Álláshely azonosító] = lkÜresÁlláshelyek.[Álláshely azonosító]
WHERE (((lkÜresÁlláshelyek.Jelleg)="K"))

union SELECT "Alaplétszám:" AS Jelleg, Count(lkÜresÁlláshelyek.[Álláshely azonosító]) AS [CountOfÁlláshely azonosító], 3 AS Sorszám
FROM lkÜresÁlláshelyekÁllapotfelmérõ INNER JOIN (lkÜresÁlláshelyek INNER JOIN tBesorolás_átalakító ON lkÜresÁlláshelyek.[Besorolási fokozat kód:] = tBesorolás_átalakító.[Az álláshely jelölése]) ON lkÜresÁlláshelyekÁllapotfelmérõ.[Álláshely azonosító] = lkÜresÁlláshelyek.[Álláshely azonosító]
WHERE (((lkÜresÁlláshelyek.jelleg)="A"))

union SELECT "Vezetõk:" AS Jelleg, Count(lkÜresÁlláshelyek.[Álláshely azonosító]) AS [CountOfÁlláshely azonosító], 4 AS Sorszám
FROM lkÜresÁlláshelyekÁllapotfelmérõ INNER JOIN (lkÜresÁlláshelyek INNER JOIN tBesorolás_átalakító ON lkÜresÁlláshelyek.[Besorolási fokozat kód:] = tBesorolás_átalakító.[Az álláshely jelölése]) ON lkÜresÁlláshelyekÁllapotfelmérõ.[Álláshely azonosító] = lkÜresÁlláshelyek.[Álláshely azonosító]
WHERE (((tBesorolás_átalakító.Vezetõ)=Yes) AND ((lkÜresÁlláshelyek.Jelleg)="A"))

union SELECT "Netto üres:" AS Jelleg, Count(lkÜresÁlláshelyek.[Álláshely azonosító]) AS [CountOfÁlláshely azonosító], 5 AS Sorszám
FROM lkÜresÁlláshelyekÁllapotfelmérõ INNER JOIN (lkÜresÁlláshelyek INNER JOIN tBesorolás_átalakító ON lkÜresÁlláshelyek.[Besorolási fokozat kód:] = tBesorolás_átalakító.[Az álláshely jelölése]) ON lkÜresÁlláshelyekÁllapotfelmérõ.[Álláshely azonosító] = lkÜresÁlláshelyek.[Álláshely azonosító]
WHERE (((lkÜresÁlláshelyekÁllapotfelmérõ.[Legutóbbi állapot])="Nincs folyamatban" Or (lkÜresÁlláshelyekÁllapotfelmérõ.[Legutóbbi állapot])="Pályázat kiírva")) )  AS Statisztika
ORDER BY Statisztika.Sorszám;

#/#/#/
lkÜresÁlláshelyekVezetõ
#/#/
SELECT lkÜresÁlláshelyek.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkÜresÁlláshelyek.[Fõosztály\Hivatal], lkÁlláshelyek.Osztály, lkÜresÁlláshelyek.[Álláshely azonosító], lkÁlláshelyek.[Álláshely besorolási kategóriája], lkÁlláshelyek.rang, lkÜresÁlláshelyek.Jelleg, lkÁlláshelyek.[Álláshely státusza], lkÁlláshelyek.[Hatályosság kezdete] AS [Mióta üres ÁNYR], lkÜresÁlláshelyek.[Megüresedés dátuma] AS [Mióta üres Nexon], Date()-[Hatályosság kezdete] AS [Hány napja üres ÁNYR], Date()-[Hatályosság kezdete] AS [Hány napja üres NEXON]
FROM lkÜresÁlláshelyek RIGHT JOIN lkÁlláshelyek ON lkÜresÁlláshelyek.[Álláshely azonosító] = lkÁlláshelyek.[Álláshely azonosító]
WHERE (((lkÁlláshelyek.[Álláshely státusza])="betöltetlen - tartósan távollévõ" Or (lkÁlláshelyek.[Álláshely státusza])="betöltetlen") AND ((lkÜresÁlláshelyek.[Besorolási fokozat kód:]) Like "*Ov*" Or (lkÜresÁlláshelyek.[Besorolási fokozat kód:]) Like "*Jhv*" Or (lkÜresÁlláshelyek.[Besorolási fokozat kód:]) Like "*ig." Or (lkÜresÁlláshelyek.[Besorolási fokozat kód:])="fsp."));

#/#/#/
lkÜresÁlláshelyekVisszajelzésekStatisztika0
#/#/
SELECT lkÜresÁlláshelyekÁllapotfelmérõ.[Fõosztály\Hivatal], Sum(IIf([Legutóbbi állapot ideje]>=DateAdd("d",-5,dtÁtal(Now())),1,0)) AS [Érkezett válasz], Sum(IIf(Nz([Legutóbbi állapot ideje],0)<DateAdd("d",-5,dtÁtal(Now())),1,0)) AS [Nem érkezett válasz], Sum(1) AS Összesen
FROM lkÜresÁlláshelyekÁllapotfelmérõ
GROUP BY lkÜresÁlláshelyekÁllapotfelmérõ.[Fõosztály\Hivatal];

#/#/#/
lkÜresÁlláshelyekVisszajelzésekStatisztikaA
#/#/
SELECT Switch([érkezett válasz]=0,"Egy válasz sem érkezett",[Érkezett válasz]<[Összesen],"Még nem érkezett meg minden válasz",[Érkezett válasz]=[Összesen],"Minden válasz megérkezett") AS Kategória, Sum(1) AS db
FROM lkÜresÁlláshelyekVisszajelzésekStatisztika0 AS Számlálás
GROUP BY Switch([érkezett válasz]=0,"Egy válasz sem érkezett",[Érkezett válasz]<[Összesen],"Még nem érkezett meg minden válasz",[Érkezett válasz]=[Összesen],"Minden válasz megérkezett");

#/#/#/
lkÜresÁlláshelyekVisszajelzésekStatisztikaB
#/#/
SELECT Válaszok.Kategória AS Kategória, Válaszok.[Nem érkezett válasz] AS Érték
FROM (SELECT 1 AS Sorszám, "Még meg nem érkezett válaszok száma" AS Kategória, Sum(lkÜresÁlláshelyekVisszajelzésekStatisztika0.[Nem érkezett válasz]) AS [Nem érkezett válasz]
FROM lkÜresÁlláshelyekVisszajelzésekStatisztika0
GROUP BY "Még meg nem érkezett válaszok száma"
UNION SELECT 2 AS Sorszám, "Beérkezett válaszok száma" AS Kategória, Sum(lkÜresÁlláshelyekVisszajelzésekStatisztika0.[Érkezett válasz]) as [Érkezett válasz]
FROM lkÜresÁlláshelyekVisszajelzésekStatisztika0
GROUP BY "Beérkezett válaszok száma"
 )  AS Válaszok
ORDER BY Válaszok.Sorszám;

#/#/#/
lkÜresÁlláshelyJelentés
#/#/
SELECT bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) AS BFKH, lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító] AS ÁNYR, lkJárásiKormányKözpontosítottUnió.[járási hivatal] AS [szervezeti egység/kerületi hivatal], lkJárásiKormányKözpontosítottUnió.Osztály, IIf([Születési év \ üres állás]="üres állás","üres","") AS [Nexon szerint], lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat megnevezése:] AS Besorolás, lkÜresÁlláshelyekExcel.Feladatkör, lkÜresÁlláshelyekExcel.Állapot
FROM lkÜresÁlláshelyekExcel RIGHT JOIN lkJárásiKormányKözpontosítottUnió ON lkÜresÁlláshelyekExcel.státusz = lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító]
WHERE (((IIf([Születési év \ üres állás]="üres állás","üres",""))="üres"))
ORDER BY bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]);

#/#/#/
lkÜresÁlláshelyKimutatáshoz
#/#/
SELECT Álláshelyek.[Álláshely azonosító], IIf(Nz([Dolgozó teljes neve],"")="","Betöltetlen","Betöltött") AS Állapot, lkSzemélyek.[Dolgozó teljes neve] AS [Betöltõ neve], lkSzemélyek.[Jogviszony kezdete (belépés dátuma)] AS Belépés
FROM lkSzemélyek RIGHT JOIN Álláshelyek ON lkSzemélyek.[Státusz kódja]=Álláshelyek.[Álláshely azonosító]
ORDER BY Álláshelyek.[Álláshely azonosító];

#/#/#/
lkÜresÁllásLegutolsóVisszajelzés
#/#/
SELECT lkÜresÁlláshelyek.[Álláshely azonosító], Nz([VisszajelzésSzövege],"") AS [Legutóbbi állapot]
FROM (tVisszajelzésTípusok RIGHT JOIN lkÜzenetekVisszajelzések ON tVisszajelzésTípusok.VisszajelzésKód = lkÜzenetekVisszajelzések.VisszajelzésKód) RIGHT JOIN lkÜresÁlláshelyek ON lkÜzenetekVisszajelzések.Hash = lkÜresÁlláshelyek.Hash
WHERE (((lkÜzenetekVisszajelzések.DeliveredDate)=(Select Max([DeliveredDate]) FROM [lkÜzenetekVisszajelzések] as Tmp Where [lkÜzenetekVisszajelzések].Hash=Tmp.hash) Or (lkÜzenetekVisszajelzések.DeliveredDate) Is Null))
ORDER BY lkÜresÁlláshelyek.[Álláshely azonosító];

#/#/#/
lkÜresSzervezetiEgységek
#/#/
SELECT tSzervezeti.OSZLOPOK, tSzervezeti.[Betöltött státuszok száma (db)], tSzervezeti.[Betöltetlen státuszok száma (db)]
FROM tSzervezeti
WHERE (((tSzervezeti.OSZLOPOK) Like "Szervezeti egység összesen*") AND ((tSzervezeti.[Betöltött státuszok száma (db)])=0));

#/#/#/
lkÜzenetekVisszajelzések
#/#/
SELECT tBejövõVisszajelzések.*, tBejövõÜzenetek.*
FROM tBejövõÜzenetek INNER JOIN tBejövõVisszajelzések ON tBejövõÜzenetek.azÜzenet = tBejövõVisszajelzések.azÜzenet;

#/#/#/
lkÜzenetekVisszajelzések01
#/#/
SELECT curr.Hash, curr.SenderEmailAddress, curr.DeliveredDate, tVisszajelzésTípusok.VisszajelzésKód, tVisszajelzésTípusok.VisszajelzésSzövege, curr.Hatály
FROM lkÜzenetekVisszajelzések AS curr INNER JOIN tVisszajelzésTípusok ON curr.VisszajelzésKód = tVisszajelzésTípusok.VisszajelzésKód
WHERE curr.Hash = [AzonosítóHASH]
    AND (
        curr.SenderEmailAddress <> 
        (SELECT TOP 1 prev.SenderEmailAddress 
         FROM lkÜzenetekVisszajelzések AS prev
         WHERE prev.Hash = curr.Hash 
           AND prev.azVisszajelzés < curr.azVisszajelzés
         ORDER BY prev.azVisszajelzés DESC)
        OR curr.VisszajelzésKód <> 
        (SELECT TOP 1 prev.VisszajelzésKód 
         FROM lkÜzenetekVisszajelzések AS prev
         WHERE prev.Hash = curr.Hash 
           AND prev.azVisszajelzés < curr.azVisszajelzés
         ORDER BY prev.azVisszajelzés DESC)
        OR curr.Hatály <> 
        (SELECT TOP 1 prev.Hatály 
         FROM lkÜzenetekVisszajelzések AS prev
         WHERE prev.Hash = curr.Hash 
           AND prev.azVisszajelzés < curr.azVisszajelzés
         ORDER BY prev.azVisszajelzés DESC)
        OR (SELECT TOP 1 prev.azVisszajelzés 
            FROM lkÜzenetekVisszajelzések AS prev
            WHERE prev.Hash = curr.Hash 
              AND prev.azVisszajelzés < curr.azVisszajelzés
            ORDER BY prev.azVisszajelzés DESC) IS NULL
    )
ORDER BY curr.Hash, curr.DeliveredDate;

#/#/#/
lkVárosKerületenkéntiFõosztályonkéntiLétszám01
#/#/
SELECT lkVárosOldalankéntiLétszám01.Fõosztály, IIf(Left([irsz],1)=1,Right([irsz],2)*1,"Egyéb") AS Kerület, Sum(lkVárosOldalankéntiLétszám01.fõ) AS Létszám
FROM lkVárosOldalankéntiLétszám01
GROUP BY lkVárosOldalankéntiLétszám01.Fõosztály, IIf(Left([irsz],1)=1,Right([irsz],2)*1,"Egyéb");

#/#/#/
lkVárosKerületenkéntiFõosztályonkéntiLétszám02
#/#/
TRANSFORM Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám01.Létszám) AS SumOfLétszám
SELECT lkVárosKerületenkéntiFõosztályonkéntiLétszám01.Fõosztály
FROM lkVárosKerületenkéntiFõosztályonkéntiLétszám01
GROUP BY lkVárosKerületenkéntiFõosztályonkéntiLétszám01.Fõosztály
PIVOT lkVárosKerületenkéntiFõosztályonkéntiLétszám01.Kerület in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,"egyéb");

#/#/#/
lkVárosKerületenkéntiFõosztályonkéntiLétszám03
#/#/
SELECT "Összesen:" AS Fõosztály, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[1]) AS SumOf1, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[2]) AS SumOf2, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[3]) AS SumOf3, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[4]) AS SumOf4, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[5]) AS SumOf5, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[6]) AS SumOf6, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[7]) AS SumOf7, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[8]) AS SumOf8, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[9]) AS SumOf9, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[10]) AS SumOf10, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[11]) AS SumOf11, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[12]) AS SumOf12, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[13]) AS SumOf13, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[14]) AS SumOf14, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[15]) AS SumOf15, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[16]) AS SumOf16, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[17]) AS SumOf17, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[18]) AS SumOf18, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[19]) AS SumOf19, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[20]) AS SumOf20, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[21]) AS SumOf21, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[22]) AS SumOf22, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.[23]) AS SumOf23, Sum(lkVárosKerületenkéntiFõosztályonkéntiLétszám02.egyéb) AS SumOfegyéb
FROM lkVárosKerületenkéntiFõosztályonkéntiLétszám02
GROUP BY "Összesen:";

#/#/#/
lkVárosKerületenkéntiFõosztályonkéntiLétszám04
#/#/
SELECT *
FROM (SELECT 1 as sor, lkVárosKerületenkéntiFõosztályonkéntiLétszám02.*
FROM lkVárosKerületenkéntiFõosztályonkéntiLétszám02
UNION
SELECT 2 as sor, lkVárosKerületenkéntiFõosztályonkéntiLétszám03.*
FROM  lkVárosKerületenkéntiFõosztályonkéntiLétszám03)  AS 02ÉS03;

#/#/#/
lkVárosKerületenkéntiFõosztályonkéntiLétszám05
#/#/
SELECT lkVárosKerületenkéntiFõosztályonkéntiLétszám04.*, lkFõosztályonkéntiBetöltöttLétszám.FõosztályiLétszám AS Összesen
FROM lkFõosztályonkéntiBetöltöttLétszám INNER JOIN lkVárosKerületenkéntiFõosztályonkéntiLétszám04 ON lkFõosztályonkéntiBetöltöttLétszám.Fõosztály=lkVárosKerületenkéntiFõosztályonkéntiLétszám04.Fõosztály;

#/#/#/
lkVárosKerületenkéntiLétszám
#/#/
SELECT lkVárosOldalankéntiLétszám01.Kerület, Sum(lkVárosOldalankéntiLétszám01.fõ) AS SumOffõ
FROM lkVárosOldalankéntiLétszám01
GROUP BY lkVárosOldalankéntiLétszám01.Kerület;

#/#/#/
lkVárosOldalankéntiFõosztályonkéntLétszám
#/#/
SELECT lkVárosOldalankéntiLétszám01.Oldal, lkVárosOldalankéntiLétszám01.Fõosztály, Sum(lkVárosOldalankéntiLétszám01.fõ) AS SumOffõ
FROM lkVárosOldalankéntiLétszám01
GROUP BY lkVárosOldalankéntiLétszám01.Oldal, lkVárosOldalankéntiLétszám01.Fõosztály;

#/#/#/
lkVárosOldalankéntiLétszám01
#/#/
SELECT Mid(Replace([FõosztályKód],"BFKH.1.",""),1,InStr(1,Replace([FõosztályKód],"BFKH.1.",""),".")-1) AS Sor, lkSzemélyek.Fõosztály, lkSzemélyek.[Munkavégzés helye - cím], Irsz([Munkavégzés helye - cím])*1 AS irsz, kerület([irsz]) AS Kerület, IIf(Kerület([irsz]) Between 1 And 3 Or kerület([irsz]) Between 11 And 12 Or kerület([irsz])=22,"Buda","Pest") AS Oldal, 1 AS fõ
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.Fõosztály;

#/#/#/
lkVárosOldalankéntiLétszám02
#/#/
SELECT lkVárosOldalankéntiLétszám01.Oldal, Sum(lkVárosOldalankéntiLétszám01.fõ) AS Létszám
FROM lkVárosOldalankéntiLétszám01
GROUP BY lkVárosOldalankéntiLétszám01.Oldal;

#/#/#/
lkVédõnõk00
#/#/
SELECT tVédõnõk.Adójel, tVédõnõk.Dátum, tVédõnõk.Védõnõ, tVédõnõk.[Vezetõ védõnõ], tVédõnõk.CsVSz, [tVédõnõk].[Adójel] & "" AS Adóazonosító, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Jogviszony vége (kilépés dátuma)]
FROM tVédõnõk INNER JOIN lkSzemélyek ON tVédõnõk.Adójel = lkSzemélyek.Adójel;

#/#/#/
lkVédõnõk01
#/#/
SELECT lkNépegészségügyiDolgozók.Adójel, "Budapest Fõváros Kormányhivatala" AS Kormányhivatal, 0 AS Sorszám, lkNépegészségügyiDolgozók.Név, lkVédõnõk00.Adóazonosító, lkNépegészségügyiDolgozók.[Születési év \ üres állás], lkNépegészségügyiDolgozók.[Megyei szint], lkNépegészségügyiDolgozók.Fõosztály, lkNépegészségügyiDolgozók.Osztály, lkNépegészségügyiDolgozók.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkNépegészségügyiDolgozók.[Ellátott feladat], lkNépegészségügyiDolgozók.Kinevezés, lkNépegészségügyiDolgozók.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], lkNépegészségügyiDolgozók.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], lkNépegészségügyiDolgozók.[Heti munkaórák száma], lkNépegészségügyiDolgozók.[Betöltés aránya], lkNépegészségügyiDolgozók.[Besorolási fokozat kód:], lkNépegészségügyiDolgozók.[Besorolási fokozat megnevezése:], lkNépegészségügyiDolgozók.[Álláshely azonosító], lkNépegészségügyiDolgozók.[Havi illetmény], lkNépegészségügyiDolgozók.[Eu finanszírozott], lkNépegészségügyiDolgozók.[Illetmény forrása], lkNépegészségügyiDolgozók.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], lkNépegészségügyiDolgozók.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], lkNépegészségügyiDolgozók.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], lkNépegészségügyiDolgozók.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], lkNépegészségügyiDolgozók.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], lkNépegészségügyiDolgozók.[Képesítést adó végzettség], IIf([Megyei szint]<>"Megyei szint",[Megyei szint],"") AS [Járási hivatal neve], lkVédõnõk00.Védõnõ, lkVédõnõk00.[Vezetõ védõnõ], lkVédõnõk00.CsVSz
FROM lkVédõnõk00 INNER JOIN lkNépegészségügyiDolgozók ON lkVédõnõk00.Adóazonosító = lkNépegészségügyiDolgozók.Adóazonosító;

#/#/#/
lkVédõnõk02
#/#/
SELECT lkVédõnõk01.Adójel, lkVédõnõk01.Kormányhivatal, (Select Count(Tmp.Adójel) From lkVédõnõk01 as Tmp Where Tmp.Adójel<=lkVédõnõk01.Adójel) AS Sorszám, lkVédõnõk01.Név, lkVédõnõk01.Adóazonosító, lkVédõnõk01.[Születési év \ üres állás], lkVédõnõk01.[Megyei szint], lkVédõnõk01.Fõosztály, lkVédõnõk01.Osztály, lkVédõnõk01.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkVédõnõk01.[Ellátott feladat], lkVédõnõk01.Kinevezés, lkVédõnõk01.[Feladat jellege: szakmai (SZ) / funkcionális (F) feladatellátás;], lkVédõnõk01.[Foglalkoztatási forma teljes (T) / részmunkaidõs (R), nyugdíjas ], lkVédõnõk01.[Heti munkaórák száma], lkVédõnõk01.[Betöltés aránya], lkVédõnõk01.[Besorolási fokozat kód:], lkVédõnõk01.[Besorolási fokozat megnevezése:], lkVédõnõk01.[Álláshely azonosító], lkVédõnõk01.[Havi illetmény], lkVédõnõk01.[Eu finanszírozott], lkVédõnõk01.[Illetmény forrása], lkVédõnõk01.[Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], lkVédõnõk01.[Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], lkVédõnõk01.[Foglalkoztatás idõtartama Határozatlan (HL) / Határozott (HT)], lkVédõnõk01.[Legmagasabb iskolai végzettség 1=8 osztály; 2=érettségi; 3=fõis], lkVédõnõk01.[Ügyfélszolgálati munkatárs (1) ügyfélszolgálati háttér munkatárs], lkVédõnõk01.[Képesítést adó végzettség], lkVédõnõk01.[Járási hivatal neve], lkVédõnõk01.Védõnõ, lkVédõnõk01.[Vezetõ védõnõ], lkVédõnõk01.CsVSz
FROM lkVédõnõk01;

#/#/#/
lkVégzettségek
#/#/
SELECT [Dolgozó azonosító]*1 AS Adójel, tVégzettségek.*
FROM tVégzettségek;

#/#/#/
lkVégzettségekMaxSzáma
#/#/
SELECT Max(lkSzemélyekVégzettségeinekSzáma.VégzettségeinekASzáma) AS MaxOfVégzettségeinekASzáma
FROM lkSzemélyekVégzettségeinekSzáma;

#/#/#/
lkVezetõk
#/#/
SELECT DISTINCT lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Hivatali email], lkSzemélyek.[Hivatali telefon], lkSzemélyek.BFKH, lkSzemélyek.Besorolás2
FROM lkSzemélyek INNER JOIN tBesorolás_átalakító ON lkSzemélyek.Besorolás2 = tBesorolás_átalakító.Besorolási_fokozat
WHERE (((lkSzemélyek.[Státusz neve])="álláshely") AND ((tBesorolás_átalakító.Vezetõ)=Yes))
ORDER BY lkSzemélyek.BFKH;

#/#/#/
lkVezetõkTartósTávolléten
#/#/
SELECT lkSzemélyek.Fõosztály AS Fõosztály, lkSzemélyek.Osztály AS Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkSzemélyek.Besorolás2 AS Besorolás, lkSzemélyek.[Vezetõi beosztás megnevezése] AS Beosztás, lkSzemélyek.[Tartós távollét típusa] AS [Távollét típusa], kt_azNexon_Adójel02.NLink AS NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Vezetõi beosztás megnevezése])="fõispán") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Not Null) AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null)) OR (((lkSzemélyek.[Vezetõi beosztás megnevezése]) Like "*igazgató*") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Not Null) AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null)) OR (((lkSzemélyek.Besorolás2) Like "*igazgató*") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Not Null) AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null)) OR (((lkSzemélyek.Besorolás2)="fõispán") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Not Null) AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null)) OR (((lkSzemélyek.[Vezetõi beosztás megnevezése])="osztályvezetõ") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Not Null) AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null)) OR (((lkSzemélyek.Besorolás2)="osztályvezetõ") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Not Null) AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null)) OR (((lkSzemélyek.[Vezetõi beosztás megnevezése]) Like "*kerületi*") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Not Null) AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null)) OR (((lkSzemélyek.Besorolás2) Like "fõosztály*") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Not Null) AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null)) OR (((lkSzemélyek.[Vezetõi beosztás megnevezése]) Like "fõosztály*") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Not Null) AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null)) OR (((lkSzemélyek.Besorolás2) Like "*kerületi*") AND ((lkSzemélyek.[Tartós távollét típusa]) Is Not Null) AND ((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null))
ORDER BY bfkh(Nz([Szervezeti egység kódja],"-"));

#/#/#/
lkVIIKerületbeBelépõk
#/#/
SELECT lkBelépõkUnió.[Megyei szint VAGY Járási Hivatal] AS Kerület, lkBelépõkUnió.Név, lkBelépõkUnió.[Jogviszony kezdõ dátuma]
FROM lkBelépõkUnió
WHERE (((lkBelépõkUnió.[Megyei szint VAGY Járási Hivatal])="Budapest Fõváros Kormányhivatala VII. Kerületi Hivatala") AND ((lkBelépõkUnió.[Jogviszony kezdõ dátuma]) Between #7/1/2023# And #7/31/2024#));

#/#/#/
lkVIIKerületbõlKilépettekHavonta
#/#/
SELECT lkKilépõUnió.[Megyei szint VAGY Járási Hivatal] AS Kerület, DateSerial(Year([Jogviszony megszûnésének, megszüntetésének idõpontja]),Month([Jogviszony megszûnésének, megszüntetésének idõpontja])+1,1)-1 AS Tárgyhó, Sum(1) AS Fõ
FROM lkKilépõUnió
WHERE (((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének oka: jogszabályi hiva]) Not Like "*létre*") AND ((lkKilépõUnió.[Jogviszony megszûnésének, megszüntetésének idõpontja]) Between #7/1/2023# And #7/31/2024#))
GROUP BY lkKilépõUnió.[Megyei szint VAGY Járási Hivatal], DateSerial(Year([Jogviszony megszûnésének, megszüntetésének idõpontja]),Month([Jogviszony megszûnésének, megszüntetésének idõpontja])+1,1)-1
HAVING (((lkKilépõUnió.[Megyei szint VAGY Járási Hivatal])="Budapest Fõváros Kormányhivatala VII. Kerületi Hivatala"));

#/#/#/
lkVIIKerületiBetöltöttLétszám01
#/#/
SELECT Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH") AS [Kerületi hivatal], tHaviJelentésHatálya1.hatálya, Sum(IIf([Mezõ4]="üres állás",0,1)) AS [Betöltött létszám], Sum(IIf([Mezõ4]="üres állás",1,0)) AS Üres
FROM tHaviJelentésHatálya1 INNER JOIN tJárási_állomány ON tHaviJelentésHatálya1.hatályaID = tJárási_állomány.hatályaID
GROUP BY Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH"), tHaviJelentésHatálya1.hatálya
HAVING (((Replace([Járási Hivatal],"Budapest Fõváros Kormányhivatala","BFKH"))="BFKH VII. Kerületi Hivatala") AND ((tHaviJelentésHatálya1.hatálya) Between #7/1/2023# And #7/31/2024#));

#/#/#/
lkVIIKerületiBetöltöttLétszám02
#/#/
SELECT lkVIIKerületiBetöltöttLétszám01.[Kerületi hivatal], lkVIIKerületiBetöltöttLétszám01.hatálya, lkVIIKerületiBetöltöttLétszám01.[Betöltött létszám], lkVIIKerületiBetöltöttLétszám01.Üres, [Betöltött létszám]+[Üres] AS Engedélyezett
FROM lkVIIKerületiBetöltöttLétszám01;

#/#/#/
lkVIIKerületiKimutatás
#/#/
SELECT lkVIIKerületiBetöltöttLétszám02.[Kerületi hivatal], lkVIIKerületiBetöltöttLétszám02.hatálya, lkVIIKerületiBetöltöttLétszám02.[Betöltött létszám], lkVIIKerületiBetöltöttLétszám02.Üres, lkVIIKerületiBetöltöttLétszám02.Engedélyezett, Nz([Fõ],0) AS Kilépettek
FROM lkVIIKerületbõlKilépettekHavonta RIGHT JOIN lkVIIKerületiBetöltöttLétszám02 ON lkVIIKerületbõlKilépettekHavonta.Tárgyhó = lkVIIKerületiBetöltöttLétszám02.hatálya;

#/#/#/
lkVirtuálisKormányablak
#/#/
SELECT drhátra(zárojeltelenítõ([Dolgozó teljes neve])) AS [Dolgozó neve], lkSzemélyek.[Dolgozó születési neve], lkSzemélyek.[Anyja neve], [Születési hely] & ", " & [Születési idõ] AS [Születési hely, idõ], IIf(Len(Nz([Tartózkodási lakcím],""))<15,[Állandó lakcím],[Tartózkodási lakcím]) AS Lakhely, lkSzemélyek.[Adóazonosító jel], lkSzemélyek.[TAJ szám], ffsplit([Utalási cím],"|",2) AS Számlaszám, lkSzemélyek.[Hivatali email], IIf(Nz([Hivatali telefon],"")="",[Hivatali telefon mellék],[Hivatali telefon]) AS [Hivatali telefonszám], lkSzemélyek.[Szint 1 szervezeti egység név], "Budapest" AS [Igazgatási szerv székhelye], lkSzemélyek.[Vezetõ neve], [Fõosztály] & "/" & [Osztály] AS [Fõosztály, osztály], lkSzemélyek.[Illetmény összesen kerekítés nélkül (eltérítés nélküli)], lkSzemélyek.[Státusz kódja], lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.FEOR, lkSzemélyek.Feladatkör
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Null Or (lkSzemélyek.[Jogviszony vége (kilépés dátuma)])>Date()) AND ((lkSzemélyek.Fõosztály) Not Like "*fõosztály*"))
ORDER BY lkSzemélyek.FõosztályKód, lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkVirtuálisKormányablakPárosítani
#/#/
SELECT drhátra(zárojeltelenítõ([Dolgozó teljes neve])) AS [Dolgozó neve], lkSzemélyek.[Dolgozó születési neve], lkSzemélyek.[Anyja neve], [Születési hely] & ", " & [Születési idõ] AS [Születési hely, idõ], IIf(Len(Nz([Tartózkodási lakcím],""))<15,[Állandó lakcím],[Tartózkodási lakcím]) AS Lakhely, lkSzemélyek.[Adóazonosító jel], lkSzemélyek.[TAJ szám], ffsplit([Utalási cím],"|",2) AS Számlaszám, lkSzemélyek.[Hivatali email], IIf(Nz([Hivatali telefon],"")="",[Hivatali telefon mellék],[Hivatali telefon]) AS [Hivatali telefonszám], lkSzemélyek.[Szint 1 szervezeti egység név], "Budapest" AS [Igazgatási szerv székhelye], lkSzemélyek.[Vezetõ neve], [Fõosztály] & "/" & [Osztály] AS [Fõosztály, osztály], lkSzemélyek.[Illetmény összesen kerekítés nélkül (eltérítés nélküli)], lkSzemélyek.[Státusz kódja], lkSzemélyek.[Besorolási  fokozat (KT)], lkSzemélyek.FEOR, lkSzemélyek.Feladatkör
FROM lkSzemélyek
WHERE (((lkSzemélyek.Fõosztály) Like "*kerületi hivatal*") AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.FõosztályKód, lkSzemélyek.[Dolgozó teljes neve];

#/#/#/
lkVirtuálisKormányablakPárosítva
#/#/
SELECT tVirtuálisKormányablak.Kerület, tVirtuálisKormányablak.[Célfeladattal megbízott személy családi és utóneve], lkVirtuálisKormányablak.[Dolgozó neve], lkVirtuálisKormányablak.[Dolgozó születési neve], lkVirtuálisKormányablak.[Anyja neve], lkVirtuálisKormányablak.[Születési hely, idõ], lkVirtuálisKormányablak.Lakhely, lkVirtuálisKormányablak.[Adóazonosító jel], lkVirtuálisKormányablak.[TAJ szám], lkVirtuálisKormányablak.Számlaszám, lkVirtuálisKormányablak.[Hivatali email], lkVirtuálisKormányablak.[Hivatali telefonszám], lkVirtuálisKormányablak.[Szint 1 szervezeti egység név], lkVirtuálisKormányablak.[Igazgatási szerv székhelye], lkVirtuálisKormányablak.[Vezetõ neve], lkVirtuálisKormányablak.[Fõosztály, osztály], lkVirtuálisKormányablak.[Illetmény összesen kerekítés nélkül (eltérítés nélküli)], lkVirtuálisKormányablak.[Státusz kódja], lkVirtuálisKormányablak.[Besorolási  fokozat (KT)], lkVirtuálisKormányablak.FEOR, lkVirtuálisKormányablak.Feladatkör
FROM tVirtuálisKormányablak LEFT JOIN lkVirtuálisKormányablak ON tVirtuálisKormányablak.[Célfeladattal megbízott személy családi és utóneve] = lkVirtuálisKormányablak.[Dolgozó neve];

#/#/#/
lkVisszajelzésekKezelése
#/#/
SELECT tBejövõÜzenetek.*, tBejövõVisszajelzések.*, tRégiHibák.lekérdezésNeve, tVisszajelzésTípusok.VisszajelzésSzövege, tRégiHibák.[Elsõ Idõpont] AS [Fennállás kezdete]
FROM tBejövõÜzenetek INNER JOIN ((tRégiHibák INNER JOIN tBejövõVisszajelzések ON tRégiHibák.[Elsõ mezõ] = tBejövõVisszajelzések.Hash) INNER JOIN tVisszajelzésTípusok ON tBejövõVisszajelzések.VisszajelzésKód = tVisszajelzésTípusok.VisszajelzésKód) ON tBejövõÜzenetek.azÜzenet = tBejövõVisszajelzések.azÜzenet
WHERE (((tRégiHibák.[Utolsó Idõpont])=(select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve <>"lkÜresÁlláshelyekÁllapotfelmérõ" And lekérdezésneve <>"lkFontosHiányzóAdatok02") Or (tRégiHibák.[Utolsó Idõpont])=(select max([utolsó idõpont]) from tRégiHibák where lekérdezésneve ="lkFontosHiányzóAdatok02")));

#/#/#/
lkVisszajelzésTörténete
#/#/
SELECT lkÜzenetekVisszajelzések.Hash, lkÜzenetekVisszajelzések.SenderEmailAddress, tVisszajelzésTípusok.VisszajelzésKód, tVisszajelzésTípusok.VisszajelzésSzövege, lkÜzenetekVisszajelzések.DeliveredDate
FROM lkÜzenetekVisszajelzések INNER JOIN tVisszajelzésTípusok ON lkÜzenetekVisszajelzések.VisszajelzésKód = tVisszajelzésTípusok.VisszajelzésKód
WHERE (((lkÜzenetekVisszajelzések.Hash)="15ee45f6766e93397131c751708f6847" Or (lkÜzenetekVisszajelzések.Hash)="Like [AzonosítóHASH]"))
ORDER BY lkÜzenetekVisszajelzések.Hash, lkÜzenetekVisszajelzések.DeliveredDate;

#/#/#/
lkXVIkerületi_költözés
#/#/
SELECT lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.tSzemélyek.Adójel, lkSzemélyek.[TAJ szám], lkSzemélyek.[Dolgozó születési neve], lkSzemélyek.[Születési idõ], lkSzemélyek.[Születési hely], lkSzemélyek.[Anyja neve], Replace([Állandó lakcím],"Magyarország, ","") AS Lakcím, lkSzemélyek.[Munkavégzés helye - cím] AS [Nexon szerinti munkahely], "" AS [Ügyintézõ neve], "" AS [Ügyintézõ tel], "" AS [Ügyintézõ email]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Szervezeti egység kódja])="BFKH.1.2.16.4." Or (lkSzemélyek.[Szervezeti egység kódja])="BFKH.1.2.16.2." Or (lkSzemélyek.[Szervezeti egység kódja])="BFKH.1.2.16.1."));

#/#/#/
MSyslkLekérdezésekTípusai
#/#/
SELECT DISTINCT MSysObjects.Name AS queryName
FROM (MSysQueries INNER JOIN MSysObjects ON MSysQueries.ObjectId=MSysObjects.Id) LEFT JOIN (SELECT * FROM MSysQueries WHERE Attribute=5)  AS src ON MSysQueries.ObjectId=src.ObjectId
WHERE (((MSysObjects.Name)>"~z") And ((Mid("SelectMakTblAppendUpdateDeleteXtab  AltTblPassThUnion ",(msysqueries!Flag-1)*6+1,6))="SELECT" Or (Mid("SelectMakTblAppendUpdateDeleteXtab  AltTblPassThUnion ",(msysqueries!Flag-1)*6+1,6))="XTab") And ((MSysQueries.Attribute)=1))
ORDER BY MSysObjects.Name;

#/#/#/
mSyslkMezõnevek
#/#/
SELECT IIf([MSysQueries_1].[Name1] Is Null,[MSysQueries_1].[Expression],[MSysQueries_1].[Name1]) AS MezõNév, MSysObjects.Name AS QueryName, MSysQueries.Name1, MSysQueries.Attribute, MSysQueries.Flag, MSysQueries_1.Attribute, MSysQueries_1.Flag, MSysQueries.Expression, MSysQueries_1.Expression, MSysQueries.ObjectId
FROM (MSysObjects RIGHT JOIN MSysQueries ON MSysObjects.Id = MSysQueries.ObjectId) LEFT JOIN MSysQueries AS MSysQueries_1 ON MSysQueries.ObjectId = MSysQueries_1.ObjectId
WHERE (((MSysQueries.Attribute)=1) AND ((MSysQueries.Flag)=1 Or (MSysQueries.Flag)=6) AND ((MSysQueries_1.Attribute)=6) AND ((MSysQueries_1.Flag)=0 Or (MSysQueries_1.Flag)=1)) OR (((MSysQueries.Attribute)=0) AND ((MSysQueries_1.Attribute)=6) AND ((MSysQueries_1.Flag)=0 Or (MSysQueries_1.Flag)=1))
ORDER BY MSysObjects.Name, MSysQueries.ObjectId;

#/#/#/
Osztályvezetõk átlagilletménye
#/#/
SELECT lkOsztályvezetõiÁlláshelyek.[Besorolási  fokozat (KT)], Round(Avg([Illetmény])/100,0)*100 AS Átlagilletmény
FROM lkOsztályvezetõiÁlláshelyek
GROUP BY lkOsztályvezetõiÁlláshelyek.[Besorolási  fokozat (KT)];

#/#/#/
oz_lkBelépõk_Hiány2
#/#/
SELECT lkBelépõk_Hiány.[Személynév] AS Név, lkBelépõk_Hiány.[Adóazonosító] AS Adóazonosító, lkBelépõk_Hiány.[Szervezeti egység] AS Megyei_szint_VAGY_Járási_Hivatal, lkBelépõk_Hiány.[Szervezeti egység] AS Szervezeti_egységFõosztály_megnevezése, lkBelépõk_Hiány.[Szervezeti egység] AS Szervezeti_egységOsztály_megnevezése, lkBelépõk_Hiány.[Szervezeti egység] AS ÁNYR_SZERVEZETI_EGYSÉG_AZONOSÍTÓ, lkBelépõk_Hiány.[Ellátandó feladat] AS Ellátott_feladatok_megjelölésea_fõvárosi_és_megyei_kormányhi, lkBelépõk_Hiány.[Álláshely azonosító] AS Álláshely_azonosító, lkBelépõk_Hiány.[Kinevezés kezdete] AS Jogviszony_kezdõ_dátuma, lkBelépõk_Hiány.[Szerzõdés_kinevezés típusa] AS Foglalkoztatás_idõtartama_Határozatlan__HL____Határozott__HT_, lkBelépõk_Hiány.[Illetmény] AS Illetmény__Ft_hó_, lkBelépõk_Hiány.[-] AS Szervezti_alaplétszám__A_Központosított_álláshely__K_, lkBelépõk_Hiány.[Illetmény2] AS Illetmény754
FROM lkBelépõk_Hiány;

#/#/#/
oz_lkHatározottak_Hiány2
#/#/
SELECT lkHatározottak_Hiány.[Személynév] AS Tartós_távollévõ_neve, lkHatározottak_Hiány.[Adóazonosító] AS Adóazonosító_tt, lkHatározottak_Hiány.[Szervezeti egység] AS Megyei_szint_VAGY_Járási_Hivatal, lkHatározottak_Hiány.[Szervezeti egység] AS Szervezeti_egységFõosztály_megnevezése, lkHatározottak_Hiány.[Szervezeti egység] AS Szervezeti_egységOsztály_megnevezése, lkHatározottak_Hiány.[Szervezeti egység] AS ÁNYR_SZERVEZETI_EGYSÉG_AZONOSÍTÓ, lkHatározottak_Hiány.[Ellátandó feladat] AS Ellátott_feladatok_megjelölésea_fõvárosi_és_megyei_kormányhi, lkHatározottak_Hiány.[Álláshely azonosító] AS Álláshely_azonosító, lkHatározottak_Hiány.[Tartós távollét típusa] AS Tartós_távollévõ_esetén_a_távollét_jogcíme__CSED__GYED__GYES, lkHatározottak_Hiány.[Tartós távollét Érv.kezdete] AS Tartós_távollét_kezdete, lkHatározottak_Hiány.[Tartós távollét Érv.vége] AS Tartós_távollét_várható_vége, lkHatározottak_Hiány.[Illetmény] AS Tartósan_távollévõ_illetményének_teljes_összege, lkHatározottak_Hiány.[-] AS Tartós_távollévõ_álláshelyén_határozott_idõre_foglalkoztatot, lkHatározottak_Hiány.[Adóazonosító] AS Adóazonosító_tth, lkHatározottak_Hiány.[Szervezeti egység] AS Megyei_szint_VAGY_Járási_Hivatal164, lkHatározottak_Hiány.[Szervezeti egység] AS Szervezeti_egységFõosztály_megnevezése243, lkHatározottak_Hiány.[Szervezeti egység] AS Szervezeti_egységOsztály_megnevezése328, lkHatározottak_Hiány.[Szervezeti egység] AS ÁNYR_SZERVEZETI_EGYSÉG_AZONOSÍTÓ411, lkHatározottak_Hiány.[Ellátandó feladat] AS Ellátott_feladatok_megjelölésea_fõvárosi_és_megyei_kormányhi490, lkHatározottak_Hiány.[Álláshely azonosító] AS Álláshely_azonosító599, lkHatározottak_Hiány.[Hat.Idõ kezdete] AS Tartós_távollévõ_státuszán_foglalkoztatott_határozott_idejû_, lkHatározottak_Hiány.[Hat.Idõ lejárta] AS Tartós_távollévõ_státuszán_foglalkoztatott_határozott_idejû_1691, lkHatározottak_Hiány.[Illetmény] AS Tartós_távollévõ_státuszán_foglalkoztatott_illetményének_tel
FROM lkHatározottak_Hiány;

#/#/#/
oz_lkJárási_Hiány2
#/#/
SELECT lkJárási_Hiány.[Személynév] AS Név, lkJárási_Hiány.[Adóazonosító] AS Adóazonosító, lkJárási_Hiány.[Születési idõ] AS Születési_év__Üres_állás__Üres_állás, lkJárási_Hiány.[Nem] AS Dolgozó_neme1_férfi2_nõ, lkJárási_Hiány.[Szervezeti egység] AS Járási_Hivatal, lkJárási_Hiány.[Szervezeti egység] AS Szervezeti_egységOsztály_megnevezése, lkJárási_Hiány.[Szervezeti egység] AS ÁNYR_SZERVEZETI_EGYSÉG_AZONOSÍTÓ, lkJárási_Hiány.[Ellátandó feladat] AS Ellátott_feladatok_megjelölésea_fõvárosi_és_megyei_kormányhi, lkJárási_Hiány.[Kinevezés kezdete] AS Kinevezés_dátumaÁlláshely_megüresedésének_dátuma_most_elláto, lkJárási_Hiány.[Ellátandó feladat jellege] AS Feladat_jellege__szakmai__SZ____funkcionális__F__feladatellá, lkJárási_Hiány.[Foglalkozási viszony (Besorolás típusa)] AS Foglalkoztatási_forma_teljes__T____részmunkaidõs__R___nyugdí, lkJárási_Hiány.[Heti órakeret] AS Heti_munkaórák_száma, lkJárási_Hiány.[-] AS Álláshely_betöltésének_aránya_ésÜres_álláshely_betöltés_aránya, lkJárási_Hiány.[-] AS Besorolási_fokozat_kód_, lkJárási_Hiány.[Besorolási fokozat] AS Besorolási_fokozat_megnevezése_, lkJárási_Hiány.[Álláshely azonosító] AS Álláshely_azonosító, lkJárási_Hiány.[Illetmény] AS Havi_illetmény_teljes_összege__kerekítve__FT_, lkJárási_Hiány.[Szerzõdés_kinevezés típusa] AS Foglalkoztatás_idõtartama_Határozatlan__HL____Határozott__HT_, lkJárási_Hiány.[Legmagasabb fokú végzettsége] AS Legmagasabb_iskolai_végzettség_1_8__osztály__2_érettségi__3_, lkJárási_Hiány.[Képesítést adó végzettség] AS Képesítést_adó_végzettség_megnevezése__az_az_egy_ami_a_felad
FROM lkJárási_Hiány;

#/#/#/
oz_lkKilépõk_Hiány2
#/#/
SELECT lkKilépõk_Hiány.[Személynév] AS Név, lkKilépõk_Hiány.[Adóazonosító] AS Adóazonosító, lkKilépõk_Hiány.[Szervezeti egység] AS Megyei_szint_VAGY_Járási_Hivatal, lkKilépõk_Hiány.[Szervezeti egység] AS Szervezeti_egységFõosztály_megnevezése, lkKilépõk_Hiány.[Szervezeti egység] AS Szervezeti_egységOsztály_megnevezése, lkKilépõk_Hiány.[Szervezeti egység] AS ÁNYR_SZERVEZETI_EGYSÉG_AZONOSÍTÓ, lkKilépõk_Hiány.[Ellátandó feladat] AS Ellátott_feladatok_megjelölésea_fõvárosi_és_megyei_kormányhi, lkKilépõk_Hiány.[Álláshely azonosító] AS Álláshely_azonosító, lkKilépõk_Hiány.[Jogviszony megszûnés indoka] AS Jogviszony_megszûnésének__megszüntetésének_oka__jogszabályi_, lkKilépõk_Hiány.[Kinevezés kezdete] AS Jogviszony_kezdõ_dátuma, lkKilépõk_Hiány.[Kinevezés vége] AS Jogviszony_megszûnésének__megszüntetésének_idõpontja, lkKilépõk_Hiány.[Illetmény] AS Illetmény__Ft_hó_, lkKilépõk_Hiány.[-] AS Szervezti_alaplétszám__A_Központosított_álláshely__K_
FROM lkKilépõk_Hiány;

#/#/#/
oz_lkKormányhivatali_Hiány2
#/#/
SELECT lkKormányhivatali_Hiány.[Személynév] AS Név, lkKormányhivatali_Hiány.[Adóazonosító] AS Adóazonosító, lkKormányhivatali_Hiány.[Születési idõ] AS Születési_év__Üres_állás, lkKormányhivatali_Hiány.[Nem] AS Dolgozó_neme1_férfi2_nõ, lkKormányhivatali_Hiány.[Szervezeti egység] AS Szervezeti_egységFõosztály_megnevezése, lkKormányhivatali_Hiány.[Szervezeti egység] AS Szervezeti_egységOsztály_megnevezése, lkKormányhivatali_Hiány.[Szervezeti egység] AS ÁNYR_SZERVEZETI_EGYSÉG_AZONOSÍTÓ, lkKormányhivatali_Hiány.[Ellátandó feladat] AS Ellátott_feladatok_megjelölésea_fõvárosi_és_megyei_kormányhi, lkKormányhivatali_Hiány.[Kinevezés kezdete] AS Kinevezés_dátumaÁlláshely_megüresedésének_dátuma_most_elláto, lkKormányhivatali_Hiány.[Ellátandó feladat jellege] AS Feladat_jellege__szakmai__SZ____funkcionális__F__feladatellá, lkKormányhivatali_Hiány.[Foglalkozási viszony (Besorolás típusa)] AS Foglalkoztatási_forma_teljes__T____részmunkaidõs__R___nyugdí, lkKormányhivatali_Hiány.[Heti órakeret] AS Heti_munkaórák_száma, lkKormányhivatali_Hiány.[Álláshely azonosító] AS Álláshely_betöltésének_aránya_ésÜres_álláshely_betöltés_aránya, lkKormányhivatali_Hiány.[Besorolási fokozat] AS Besorolási_fokozat_megnevezése_, lkKormányhivatali_Hiány.[Álláshely azonosító] AS Álláshely_azonosító, lkKormányhivatali_Hiány.[Illetmény] AS Havi_illetmény_teljes_összege__kerekítve__FT_, lkKormányhivatali_Hiány.[Szerzõdés_kinevezés típusa] AS Foglalkoztatás_idõtartama_Határozatlan__HL____Határozott__HT_, lkKormányhivatali_Hiány.[Legmagasabb fokú végzettsége] AS Legmagasabb_iskolai_végzettség_1_8__osztály__2_érettségi__3_, lkKormányhivatali_Hiány.[Képesítést adó végzettség] AS Képesítést_adó_végzettség_megnevezése__az_az_egy_ami_a_felad
FROM lkKormányhivatali_Hiány;

#/#/#/
oz_lkKözpontosítottak_Hiány2
#/#/
SELECT lkKözpontosítottak_Hiány.[Személynév] AS Név, lkKözpontosítottak_Hiány.[Adóazonosító] AS Adóazonosító, lkKözpontosítottak_Hiány.[Születési idõ] AS Születési_év__Üres_állás, lkKözpontosítottak_Hiány.[Szervezeti egység] AS Megyei_szint_VAGY_Járási_Hivatal, lkKözpontosítottak_Hiány.[Szervezeti egység] AS Szervezeti_egységFõosztály_megnevezése, lkKözpontosítottak_Hiány.[Szervezeti egység] AS Szervezeti_egységOsztály_megnevezése, lkKözpontosítottak_Hiány.[Szervezeti egység] AS Nexon_szótárelemnek_megfelelõ_szervezeti_egység_azonosító, lkKözpontosítottak_Hiány.[Ellátandó feladat] AS Ellátott_feladatok_megjelölésea_fõvárosi_és_megyei_kormányhi, lkKözpontosítottak_Hiány.[Kinevezés kezdete] AS Kinevezés_dátumaÁlláshely_megüresedésének_dátuma_most_elláto, lkKözpontosítottak_Hiány.[Foglalkozási viszony (Besorolás típusa)] AS Foglalkoztatási_forma_teljes__T____részmunkaidõs__R___nyugdí, lkKözpontosítottak_Hiány.[-] AS Álláshely_betöltésének_aránya_ésÜres_álláshely_betöltés_aránya, lkKözpontosítottak_Hiány.[-] AS Besorolási_fokozat_kód_, lkKözpontosítottak_Hiány.[Besorolási fokozat] AS Besorolási_fokozat_megnevezése_, lkKözpontosítottak_Hiány.[Álláshely azonosító] AS Álláshely_azonosító, lkKözpontosítottak_Hiány.[Illetmény] AS Havi_illetmény_teljes_összege__kerekítve__FT_, lkKözpontosítottak_Hiány.[Szerzõdés_kinevezés típusa] AS Foglalkoztatás_idõtartama_Határozatlan__HL____Határozott__HT_, lkKözpontosítottak_Hiány.[Legmagasabb fokú végzettsége] AS Legmagasabb_iskolai_végzettség_1_8__osztály__2_érettségi__3_
FROM lkKözpontosítottak_Hiány;

#/#/#/
parlkEllenõrzõLekérdezések
#/#/
SELECT lkEllenõrzõLekérdezések3.Fejezetsorrend, lkEllenõrzõLekérdezések3.Leksorrend, lkEllenõrzõLekérdezések3.EllenõrzõLekérdezés, lkEllenõrzõLekérdezések3.LapNév, lkEllenõrzõLekérdezések3.Osztály, lkEllenõrzõLekérdezések3.Megjegyzés, lkEllenõrzõLekérdezések3.Táblacím, lkEllenõrzõLekérdezések3.vaneGraf, lkEllenõrzõLekérdezések3.azETípus, lkEllenõrzõLekérdezések3.Kimenet, lkEllenõrzõLekérdezések3.KellVisszajelzes, lkEllenõrzõLekérdezések3.azUnion, lkEllenõrzõLekérdezések3.TáblaMegjegyzés, lkEllenõrzõLekérdezések3.azHibaCsoport
FROM lkEllenõrzõLekérdezések3
WHERE (((lkEllenõrzõLekérdezések3.Osztály)=[qWhere]) AND ((lkEllenõrzõLekérdezések3.Kimenet)=True))
ORDER BY lkEllenõrzõLekérdezések3.Fejezetsorrend, lkEllenõrzõLekérdezések3.Leksorrend;

#/#/#/
Szervezeti egységek pivot
#/#/
PARAMETERS Üssél_egy_entert Long;
TRANSFORM First(lkFõosztályokOsztályokSorszámmal.Osztály) AS FirstOfOsztály
SELECT lkFõosztályokOsztályokSorszámmal.Fõosztály
FROM lkFõosztályokOsztályokSorszámmal
WHERE (((lkFõosztályokOsztályokSorszámmal.bfkhkód) Like "BFKH*"))
GROUP BY lkFõosztályokOsztályokSorszámmal.Fõosztály
PIVOT lkFõosztályokOsztályokSorszámmal.Sorsz In (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21);

#/#/#/
temp
#/#/
PARAMETERS [__Sorszám] Value;
SELECT DISTINCTROW *
FROM ktSzervezetTelephely AS lkTelephelyek
WHERE ((([__Sorszám])=[azTelephely]));

#/#/#/
tHaviJelentésHatálya
#/#/
SELECT tHaviJelentésHatálya1.*
FROM tHaviJelentésHatálya1;

#/#/#/
tJavítandóMezõnevek
#/#/
SELECT tJav_mezõk.azJavítandó, tJav_mezõk.tTáblák_azonosító, tJav_táblák.Tábla, tJav_táblák.Ellenõrzéshez, tJav_mezõk.azNexonMezõk, tJav_mezõk.Eredeti, tNexonMezõk.[nexon mezõ megnevezése] AS Import, tJav_mezõk.TáblánBelüliSorszáma, tJav_mezõk.NemKötelezõ, tJav_mezõk.NemKötelezõÜresÁlláshelyEsetén, tJav_táblák.SzervezetKód_mezõ, tJav_mezõk.Szöveg, tNexonMezõk.Megjegyzés AS Elérés, tJav_táblák.ÜresÁlláshelyMezõk
FROM tJav_táblák INNER JOIN (tJav_mezõk LEFT JOIN tNexonMezõk ON tJav_mezõk.azNexonMezõk = tNexonMezõk.azNexonMezõ) ON tJav_táblák.kód = tJav_mezõk.tTáblák_azonosító;

#/#/#/
tkDolgozókVégzettségeiFelsorolás01
#/#/
SELECT lkDolgozókVégzettségeiFelsorolás01.VégzettségeinekASzáma, lkDolgozókVégzettségeiFelsorolás01.Adójel, lkDolgozókVégzettségeiFelsorolás01.[Végzettség neve], lkDolgozókVégzettségeiFelsorolás01.Azonosítók INTO tDolgozókVégzettségeiFelsorolás01
FROM lkDolgozókVégzettségeiFelsorolás01;

#/#/#/
tkDolgozókVégzettségeiFelsorolás02
#/#/
SELECT lkDolgozókVégzettségeiFelsorolás02.Sorszám, lkDolgozókVégzettségeiFelsorolás02.VégzettségeinekASzáma, lkDolgozókVégzettségeiFelsorolás02.Adójel, lkDolgozókVégzettségeiFelsorolás02.[Végzettség neve] INTO tDolgozókVégzettségeiFelsorolás02
FROM lkDolgozókVégzettségeiFelsorolás02;

#/#/#/
tlk tNexonAzonosítók - azonosak keresése
#/#/
DELETE tNexonAzonosítók.Azonosító
FROM tNexonAzonosítók
WHERE (((tNexonAzonosítók.Azonosító) In (Select FirstOfAzonosító From [tNexonAzonosítók - azonosak keresése])));

#/#/#/
tmp01
#/#/
SELECT tSzemélyek_Import.Adójel AS Adójel, tSzemélyek_Import.[Dolgozó teljes neve] AS [Dolgozó teljes neve], tSzemélyek_Import.[Dolgozó születési neve] AS [Dolgozó születési neve], tSzemélyek_Import.[Születési idõ] AS [Születési idõ], tSzemélyek_Import.[Születési hely] AS [Születési hely], tSzemélyek_Import.[Anyja neve] AS [Anyja neve], tSzemélyek_Import.Neme AS Neme, tSzemélyek_Import.Törzsszám AS Törzsszám, tSzemélyek_Import.[Egyedi azonosító] AS [Egyedi azonosító], tSzemélyek_Import.[Adóazonosító jel] AS [Adóazonosító jel], tSzemélyek_Import.[TAJ szám] AS [TAJ szám], tSzemélyek_Import.[Ügyfélkapu kód] AS [Ügyfélkapu kód], tSzemélyek_Import.[Elsõdleges állampolgárság] AS [Elsõdleges állampolgárság], tSzemélyek_Import.[Személyi igazolvány száma] AS [Személyi igazolvány száma], tSzemélyek_Import.[Személyi igazolvány érvényesség kezdete] AS [Személyi igazolvány érvényesség kezdete], tSzemélyek_Import.[Személyi igazolvány érvényesség vége] AS [Személyi igazolvány érvényesség vége], tSzemélyek_Import.[Nyelvtudás Angol] AS [Nyelvtudás Angol], tSzemélyek_Import.[Nyelvtudás Arab] AS [Nyelvtudás Arab], tSzemélyek_Import.[Nyelvtudás Bolgár] AS [Nyelvtudás Bolgár], tSzemélyek_Import.[Nyelvtudás Cigány] AS [Nyelvtudás Cigány], tSzemélyek_Import.[Nyelvtudás Cigány (lovári)] AS [Nyelvtudás Cigány (lovári)], tSzemélyek_Import.[Nyelvtudás Cseh] AS [Nyelvtudás Cseh], tSzemélyek_Import.[Nyelvtudás Eszperantó] AS [Nyelvtudás Eszperantó], tSzemélyek_Import.[Nyelvtudás Finn] AS [Nyelvtudás Finn], tSzemélyek_Import.[Nyelvtudás Francia] AS [Nyelvtudás Francia], tSzemélyek_Import.[Nyelvtudás Héber] AS [Nyelvtudás Héber], tSzemélyek_Import.[Nyelvtudás Holland] AS [Nyelvtudás Holland], tSzemélyek_Import.[Nyelvtudás Horvát] AS [Nyelvtudás Horvát], tSzemélyek_Import.[Nyelvtudás Japán] AS [Nyelvtudás Japán], tSzemélyek_Import.[Nyelvtudás Jelnyelv] AS [Nyelvtudás Jelnyelv], tSzemélyek_Import.[Nyelvtudás Kínai] AS [Nyelvtudás Kínai], tSzemélyek_Import.[Nyelvtudás Latin] AS [Nyelvtudás Latin], tSzemélyek_Import.[Nyelvtudás Lengyel] AS [Nyelvtudás Lengyel], tSzemélyek_Import.[Nyelvtudás Német] AS [Nyelvtudás Német], tSzemélyek_Import.[Nyelvtudás Norvég] AS [Nyelvtudás Norvég], tSzemélyek_Import.[Nyelvtudás Olasz] AS [Nyelvtudás Olasz], tSzemélyek_Import.[Nyelvtudás Orosz] AS [Nyelvtudás Orosz], tSzemélyek_Import.[Nyelvtudás Portugál] AS [Nyelvtudás Portugál], tSzemélyek_Import.[Nyelvtudás Román] AS [Nyelvtudás Román], tSzemélyek_Import.[Nyelvtudás Spanyol] AS [Nyelvtudás Spanyol], tSzemélyek_Import.[Nyelvtudás Szerb] AS [Nyelvtudás Szerb], tSzemélyek_Import.[Nyelvtudás Szlovák] AS [Nyelvtudás Szlovák], tSzemélyek_Import.[Nyelvtudás Szlovén] AS [Nyelvtudás Szlovén], tSzemélyek_Import.[Nyelvtudás Török] AS [Nyelvtudás Török], tSzemélyek_Import.[Nyelvtudás Újgörög] AS [Nyelvtudás Újgörög], tSzemélyek_Import.[Nyelvtudás Ukrán] AS [Nyelvtudás Ukrán], tSzemélyek_Import.[Orvosi vizsgálat idõpontja] AS [Orvosi vizsgálat idõpontja], tSzemélyek_Import.[Orvosi vizsgálat típusa] AS [Orvosi vizsgálat típusa], tSzemélyek_Import.[Orvosi vizsgálat eredménye] AS [Orvosi vizsgálat eredménye], tSzemélyek_Import.[Orvosi vizsgálat észrevételek] AS [Orvosi vizsgálat észrevételek], tSzemélyek_Import.[Orvosi vizsgálat következõ idõpontja] AS [Orvosi vizsgálat következõ idõpontja], tSzemélyek_Import.[Erkölcsi bizonyítvány száma] AS [Erkölcsi bizonyítvány száma], tSzemélyek_Import.[Erkölcsi bizonyítvány dátuma] AS [Erkölcsi bizonyítvány dátuma], tSzemélyek_Import.[Erkölcsi bizonyítvány eredménye] AS [Erkölcsi bizonyítvány eredménye], tSzemélyek_Import.[Erkölcsi bizonyítvány kérelem azonosító] AS [Erkölcsi bizonyítvány kérelem azonosító], tSzemélyek_Import.[Erkölcsi bizonyítvány közügyektõl eltiltva] AS [Erkölcsi bizonyítvány közügyektõl eltiltva], tSzemélyek_Import.[Erkölcsi bizonyítvány jármûvezetéstõl eltiltva] AS [Erkölcsi bizonyítvány jármûvezetéstõl eltiltva], tSzemélyek_Import.[Erkölcsi bizonyítvány intézkedés alatt áll] AS [Erkölcsi bizonyítvány intézkedés alatt áll], tSzemélyek_Import.[Munkaköri leírások (csatolt dokumentumok fájlnevei)] AS [Munkaköri leírások (csatolt dokumentumok fájlnevei)], tSzemélyek_Import.[Egyéb HR dokumentumok (csatolt dokumentumok fájlnevei)] AS [Egyéb HR dokumentumok (csatolt dokumentumok fájlnevei)], tSzemélyek_Import.[Kormányhivatal rövid neve] AS [Kormányhivatal rövid neve], tSzemélyek_Import.[Szervezeti egység kódja] AS [Szervezeti egység kódja], tSzemélyek_Import.[Szervezeti egység neve] AS [Szervezeti egység neve], tSzemélyek_Import.[Szervezeti munkakör neve] AS [Szervezeti munkakör neve], tSzemélyek_Import.[Vezetõi megbízás típusa] AS [Vezetõi megbízás típusa], tSzemélyek_Import.[Státusz kódja] AS [Státusz kódja], tSzemélyek_Import.[Státusz költséghelyének kódja] AS [Státusz költséghelyének kódja], tSzemélyek_Import.[Státusz költséghelyének neve ] AS [Státusz költséghelyének neve ], tSzemélyek_Import.[Létszámon felül létrehozott státusz] AS [Létszámon felül létrehozott státusz], tSzemélyek_Import.[Státusz típusa] AS [Státusz típusa], tSzemélyek_Import.[Státusz neve] AS [Státusz neve], tSzemélyek_Import.[Többes betöltés] AS [Többes betöltés], tSzemélyek_Import.[Vezetõ neve] AS [Vezetõ neve], tSzemélyek_Import.[Vezetõ adóazonosító jele] AS [Vezetõ adóazonosító jele], tSzemélyek_Import.[Vezetõ email címe] AS [Vezetõ email címe], tSzemélyek_Import.[Állandó lakcím] AS [Állandó lakcím], tSzemélyek_Import.[Tartózkodási lakcím] AS [Tartózkodási lakcím], tSzemélyek_Import.[Levelezési cím_] AS [Levelezési cím_], tSzemélyek_Import.[Öregségi nyugdíj-korhatár elérésének idõpontja (dátum)] AS [Öregségi nyugdíj-korhatár elérésének idõpontja (dátum)], tSzemélyek_Import.Nyugdíjas AS Nyugdíjas, tSzemélyek_Import.[Nyugdíj típusa] AS [Nyugdíj típusa], tSzemélyek_Import.[Nyugdíjas korú továbbfoglalkoztatási engedéllyel rendelkezik] AS [Nyugdíjas korú továbbfoglalkoztatási engedéllyel rendelkezik], tSzemélyek_Import.[Megváltozott munkaképesség] AS [Megváltozott munkaképesség], tSzemélyek_Import.[Önkéntes tartalékos katona] AS [Önkéntes tartalékos katona], tSzemélyek_Import.[Utolsó vagyonnyilatkozat leadásának dátuma] AS [Utolsó vagyonnyilatkozat leadásának dátuma], tSzemélyek_Import.[Vagyonnyilatkozat nyilvántartási száma] AS [Vagyonnyilatkozat nyilvántartási száma], tSzemélyek_Import.[Következõ vagyonnyilatkozat esedékessége] AS [Következõ vagyonnyilatkozat esedékessége], tSzemélyek_Import.[Nemzetbiztonsági ellenõrzés dátuma] AS [Nemzetbiztonsági ellenõrzés dátuma], tSzemélyek_Import.[Védett állományba tartozó munkakör] AS [Védett állományba tartozó munkakör], tSzemélyek_Import.[Vezetõi megbízás típusa1] AS [Vezetõi megbízás típusa1], tSzemélyek_Import.[Vezetõi beosztás megnevezése] AS [Vezetõi beosztás megnevezése], tSzemélyek_Import.[Vezetõi beosztás (megbízás) kezdete] AS [Vezetõi beosztás (megbízás) kezdete], tSzemélyek_Import.[Vezetõi beosztás (megbízás) vége] AS [Vezetõi beosztás (megbízás) vége], tSzemélyek_Import.[Iskolai végzettség foka] AS [Iskolai végzettség foka], tSzemélyek_Import.[Iskolai végzettség neve] AS [Iskolai végzettség neve], tSzemélyek_Import.[Alapvizsga kötelezés dátuma] AS [Alapvizsga kötelezés dátuma], tSzemélyek_Import.[Alapvizsga letétel tényleges határideje] AS [Alapvizsga letétel tényleges határideje], tSzemélyek_Import.[Alapvizsga mentesség] AS [Alapvizsga mentesség], tSzemélyek_Import.[Alapvizsga mentesség oka] AS [Alapvizsga mentesség oka], tSzemélyek_Import.[Szakvizsga kötelezés dátuma] AS [Szakvizsga kötelezés dátuma], tSzemélyek_Import.[Szakvizsga letétel tényleges határideje] AS [Szakvizsga letétel tényleges határideje], tSzemélyek_Import.[Szakvizsga mentesség] AS [Szakvizsga mentesség], tSzemélyek_Import.[Foglalkozási viszony] AS [Foglalkozási viszony], tSzemélyek_Import.[Foglalkozási viszony statisztikai besorolása] AS [Foglalkozási viszony statisztikai besorolása], tSzemélyek_Import.[Dolgozó szerzõdéses/kinevezéses munkaköre / kinevezési okmányban] AS [Dolgozó szerzõdéses/kinevezéses munkaköre / kinevezési okmányban], tSzemélyek_Import.[Beosztástervezés helyszínek] AS [Beosztástervezés helyszínek], tSzemélyek_Import.[Beosztástervezés tevékenységek] AS [Beosztástervezés tevékenységek], tSzemélyek_Import.[Részleges távmunka szerzõdés kezdete] AS [Részleges távmunka szerzõdés kezdete], tSzemélyek_Import.[Részleges távmunka szerzõdés vége] AS [Részleges távmunka szerzõdés vége], tSzemélyek_Import.[Részleges távmunka szerzõdés intervalluma] AS [Részleges távmunka szerzõdés intervalluma], tSzemélyek_Import.[Részleges távmunka szerzõdés mértéke] AS [Részleges távmunka szerzõdés mértéke], tSzemélyek_Import.[Részleges távmunka szerzõdés helyszíne] AS [Részleges távmunka szerzõdés helyszíne], tSzemélyek_Import.[Részleges távmunka szerzõdés helyszíne 2] AS [Részleges távmunka szerzõdés helyszíne 2], tSzemélyek_Import.[Részleges távmunka szerzõdés helyszíne 3] AS [Részleges távmunka szerzõdés helyszíne 3], tSzemélyek_Import.[Egyéni túlóra keret megállapodás kezdete] AS [Egyéni túlóra keret megállapodás kezdete], tSzemélyek_Import.[Egyéni túlóra keret megállapodás vége] AS [Egyéni túlóra keret megállapodás vége], tSzemélyek_Import.[Egyéni túlóra keret megállapodás mértéke] AS [Egyéni túlóra keret megállapodás mértéke], tSzemélyek_Import.[KIRA feladat azonosítója - intézmény prefix-szel ellátva] AS [KIRA feladat azonosítója - intézmény prefix-szel ellátva], tSzemélyek_Import.[KIRA feladat azonosítója] AS [KIRA feladat azonosítója], tSzemélyek_Import.[KIRA feladat megnevezés] AS [KIRA feladat megnevezés], tSzemélyek_Import.[Osztott munkakör] AS [Osztott munkakör], tSzemélyek_Import.[Funkciócsoport: kód-megnevezés] AS [Funkciócsoport: kód-megnevezés], tSzemélyek_Import.[Funkció: kód-megnevezés] AS [Funkció: kód-megnevezés], tSzemélyek_Import.[Dolgozó költséghelyének kódja] AS [Dolgozó költséghelyének kódja], tSzemélyek_Import.[Dolgozó költséghelyének neve] AS [Dolgozó költséghelyének neve], tSzemélyek_Import.Feladatkör AS Feladatkör, tSzemélyek_Import.[Elsõdleges feladatkör] AS [Elsõdleges feladatkör], tSzemélyek_Import.Feladatok AS Feladatok, tSzemélyek_Import.FEOR AS FEOR, tSzemélyek_Import.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó napi óraker] AS [Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó napi óraker], tSzemélyek_Import.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker] AS [Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó heti óraker], tSzemélyek_Import.[Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker] AS [Elméleti (szerzõdés/kinevezés szerinti) ledolgozandó havi óraker], tSzemélyek_Import.[Szerzõdés/Kinevezés típusa] AS [Szerzõdés/Kinevezés típusa], tSzemélyek_Import.Iktatószám AS Iktatószám, tSzemélyek_Import.[Szerzõdés/kinevezés verzió_érvényesség kezdete] AS [Szerzõdés/kinevezés verzió_érvényesség kezdete], tSzemélyek_Import.[Szerzõdés/kinevezés verzió_érvényesség vége] AS [Szerzõdés/kinevezés verzió_érvényesség vége], tSzemélyek_Import.[Határozott idejû _szerzõdés/kinevezés lejár] AS [Határozott idejû _szerzõdés/kinevezés lejár], tSzemélyek_Import.[Szerzõdés dokumentum (csatolt dokumentumok fájlnevei)] AS [Szerzõdés dokumentum (csatolt dokumentumok fájlnevei)], tSzemélyek_Import.[Megjegyzés (pl# határozott szerzõdés/kinevezés oka)] AS [Megjegyzés (pl# határozott szerzõdés/kinevezés oka)], tSzemélyek_Import.[Munkavégzés helye - megnevezés] AS [Munkavégzés helye - megnevezés], tSzemélyek_Import.[Munkavégzés helye - cím] AS [Munkavégzés helye - cím], tSzemélyek_Import.[Jogviszony típusa / jogviszony típus] AS [Jogviszony típusa / jogviszony típus], tSzemélyek_Import.[Jogviszony sorszáma] AS [Jogviszony sorszáma], tSzemélyek_Import.[KIRA jogviszony jelleg] AS [KIRA jogviszony jelleg], tSzemélyek_Import.[Kölcsönbe adó cég] AS [Kölcsönbe adó cég], tSzemélyek_Import.[Teljesítményértékelés - Értékelõ személy] AS [Teljesítményértékelés - Értékelõ személy], tSzemélyek_Import.[Teljesítményértékelés - Érvényesség kezdet] AS [Teljesítményértékelés - Érvényesség kezdet], tSzemélyek_Import.[Teljesítményértékelés - Értékelt idõszak kezdet] AS [Teljesítményértékelés - Értékelt idõszak kezdet], tSzemélyek_Import.[Teljesítményértékelés - Értékelt idõszak vége] AS [Teljesítményértékelés - Értékelt idõszak vége], tSzemélyek_Import.[Teljesítményértékelés dátuma] AS [Teljesítményértékelés dátuma], tSzemélyek_Import.[Teljesítményértékelés - Beállási százalék] AS [Teljesítményértékelés - Beállási százalék], tSzemélyek_Import.[Teljesítményértékelés - Pontszám] AS [Teljesítményértékelés - Pontszám], tSzemélyek_Import.[Teljesítményértékelés - Megjegyzés] AS [Teljesítményértékelés - Megjegyzés], tSzemélyek_Import.[Dolgozói jellemzõk] AS [Dolgozói jellemzõk], tSzemélyek_Import.[Fizetési osztály (KA)/ Pedagógusi fokozat (KA pedagógus)/besorol] AS [Fizetési osztály (KA)/ Pedagógusi fokozat (KA pedagógus)/besorol], tSzemélyek_Import.[Besorolási  fokozat (KT)] AS [Besorolási  fokozat (KT)], tSzemélyek_Import.[Jogfolytonos idõ kezdete] AS [Jogfolytonos idõ kezdete], tSzemélyek_Import.[Jogviszony kezdete (belépés dátuma)] AS [Jogviszony kezdete (belépés dátuma)], tSzemélyek_Import.[Jogviszony vége (kilépés dátuma)] AS [Jogviszony vége (kilépés dátuma)], tSzemélyek_Import.[Utolsó munkában töltött nap] AS [Utolsó munkában töltött nap], tSzemélyek_Import.[Kezdeményezés dátuma] AS [Kezdeményezés dátuma], tSzemélyek_Import.[Hatályossá válik] AS [Hatályossá válik], tSzemélyek_Import.[HR kapcsolat megszûnés módja (Kilépés módja)] AS [HR kapcsolat megszûnés módja (Kilépés módja)], tSzemélyek_Import.[HR kapcsolat megszûnes indoka (Kilépés indoka)] AS [HR kapcsolat megszûnes indoka (Kilépés indoka)], tSzemélyek_Import.Indokolás AS Indokolás, tSzemélyek_Import.[Következõ munkahely] AS [Következõ munkahely], tSzemélyek_Import.[MT: Felmondási idõ kezdete KJT, KTTV: Felmentési idõ kezdete] AS [MT: Felmondási idõ kezdete KJT, KTTV: Felmentési idõ kezdete], tSzemélyek_Import.[Felmondási idõ vége (MT) Felmentési idõ vége (KJT, KTTV)] AS [Felmondási idõ vége (MT) Felmentési idõ vége (KJT, KTTV)], tSzemélyek_Import.[Munkavégzés alóli mentesítés kezdete (KJT, KTTV) Felmentési idõ ] AS [Munkavégzés alóli mentesítés kezdete (KJT, KTTV) Felmentési idõ ], tSzemélyek_Import.[Munkavégzés alóli mentesítés vége (KJT, KTTV) Felmentési idõ vég] AS [Munkavégzés alóli mentesítés vége (KJT, KTTV) Felmentési idõ vég], tSzemélyek_Import.[Tartós távollét típusa] AS [Tartós távollét típusa], tSzemélyek_Import.[Tartós távollét kezdete] AS [Tartós távollét kezdete], tSzemélyek_Import.[Tartós távollét vége] AS [Tartós távollét vége], tSzemélyek_Import.[Tartós távollét tervezett vége] AS [Tartós távollét tervezett vége], tSzemélyek_Import.[Helyettesített dolgozó neve] AS [Helyettesített dolgozó neve], tSzemélyek_Import.[Szerzõdés/Kinevezés - próbaidõ vége] AS [Szerzõdés/Kinevezés - próbaidõ vége], tSzemélyek_Import.[Utalási cím] AS [Utalási cím], tSzemélyek_Import.[Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)] AS [Alapilletmény / Munkabér / Megbízási díj (eltérítés nélküli)], tSzemélyek_Import.[Garantált bérminimumra történõ kiegészítés] AS [Garantált bérminimumra történõ kiegészítés], tSzemélyek_Import.Kerekítés AS Kerekítés, tSzemélyek_Import.[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérít] AS [Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérít], tSzemélyek_Import.[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (el] AS [Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (el], tSzemélyek_Import.[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérítés nélküli)] AS [Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérítés nélküli)], tSzemélyek_Import.[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérítés nél] AS [Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérítés nél], tSzemélyek_Import.[Egyéb pótlék - összeg (eltérítés nélküli)] AS [Egyéb pótlék - összeg (eltérítés nélküli)], tSzemélyek_Import.[Illetmény összesen kerekítés nélkül (eltérítés nélküli)] AS [Illetmény összesen kerekítés nélkül (eltérítés nélküli)], tSzemélyek_Import.[Kerekített 100 %-os illetmény (eltérítés nélküli)] AS [Kerekített 100 %-os illetmény (eltérítés nélküli)], tSzemélyek_Import.[Eltérítés %] AS [Eltérítés %], tSzemélyek_Import.[Alapilletmény / Munkabér / Megbízási díj (eltérített)] AS [Alapilletmény / Munkabér / Megbízási díj (eltérített)], tSzemélyek_Import.[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérí1] AS [Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS % (eltérí1], tSzemélyek_Import.[Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (e1] AS [Egyéb pótlék, GARANTÁLT BÉRMINIMUMRA VALÓ KIEGÉSZÍTÉS összeg (e1], tSzemélyek_Import.[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérített)] AS [Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY % (eltérített)], tSzemélyek_Import.[Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérített)] AS [Egyéb pótlék, KEREKÍTÉSBÕL ADÓDÓ ILLETMÉNY összeg (eltérített)], tSzemélyek_Import.[Egyéb pótlék - összeg (eltérített)] AS [Egyéb pótlék - összeg (eltérített)], tSzemélyek_Import.[Illetmény összesen kerekítés nélkül (eltérített)] AS [Illetmény összesen kerekítés nélkül (eltérített)], tSzemélyek_Import.[Kerekített 100 %-os illetmény (eltérített)] AS [Kerekített 100 %-os illetmény (eltérített)], tSzemélyek_Import.[További munkavégzés helye 1 Teljes munkaidõ %-a] AS [További munkavégzés helye 1 Teljes munkaidõ %-a], tSzemélyek_Import.[További munkavégzés helye 2 Teljes munkaidõ %-a] AS [További munkavégzés helye 2 Teljes munkaidõ %-a], tSzemélyek_Import.[KT: Kerekített 100 %-os illetmény (eltérített) + Helyettesítési ] AS [KT: Kerekített 100 %-os illetmény (eltérített) + Helyettesítési ], tSzemélyek_Import.[Szint 1 szervezeti egység név] AS [Szint 1 szervezeti egység név], tSzemélyek_Import.[Szint 1 szervezeti egység kód] AS [Szint 1 szervezeti egység kód], tSzemélyek_Import.[Szint 2 szervezeti egység név] AS [Szint 2 szervezeti egység név], tSzemélyek_Import.[Szint 2 szervezeti egység kód] AS [Szint 2 szervezeti egység kód], tSzemélyek_Import.[Szint 3 szervezeti egység név] AS [Szint 3 szervezeti egység név], tSzemélyek_Import.[Szint 3 szervezeti egység kód] AS [Szint 3 szervezeti egység kód], tSzemélyek_Import.[Szint 4 szervezeti egység név] AS [Szint 4 szervezeti egység név], tSzemélyek_Import.[Szint 4 szervezeti egység kód] AS [Szint 4 szervezeti egység kód], tSzemélyek_Import.[Szint 5 szervezeti egység név] AS [Szint 5 szervezeti egység név], tSzemélyek_Import.[Szint 5 szervezeti egység kód] AS [Szint 5 szervezeti egység kód], tSzemélyek_Import.[AD egyedi azonosító] AS [AD egyedi azonosító], tSzemélyek_Import.[Hivatali email] AS [Hivatali email], tSzemélyek_Import.[Hivatali mobil] AS [Hivatali mobil], tSzemélyek_Import.[Hivatali telefon] AS [Hivatali telefon], tSzemélyek_Import.[Hivatali telefon mellék] AS [Hivatali telefon mellék], tSzemélyek_Import.Iroda AS Iroda, tSzemélyek_Import.[Otthoni e-mail] AS [Otthoni e-mail], tSzemélyek_Import.[Otthoni mobil] AS [Otthoni mobil], tSzemélyek_Import.[Otthoni telefon] AS [Otthoni telefon], tSzemélyek_Import.[További otthoni mobil] AS [További otthoni mobil]
FROM tSzemélyek_Import;

#/#/#/
tmplkHiányzóKinevezésekDátumastb
#/#/
SELECT lkSzemélyek.Fõosztály, kt_azNexon_Adójel02.azNexon, lkSzemélyek.Adójel, lkSzemélyek.[Jogviszony kezdete (belépés dátuma)], tmpHiányzóKinevezésDátuma.Azonosító, kt_azNexon_Adójel02.azNexon, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.[KIRA feladat megnevezés], lkSzemélyek.Feladatkör, lkSzemélyek.[Elsõdleges feladatkör], lkSzemélyek.Feladatok, lkSzemélyek.[KIRA feladat azonosítója - intézmény prefix-szel ellátva], lkSzemélyek.[KIRA feladat azonosítója]
FROM kt_azNexon_Adójel02 INNER JOIN (tmpHiányzóKinevezésDátuma INNER JOIN lkSzemélyek ON tmpHiányzóKinevezésDátuma.F1 = lkSzemélyek.Adójel) ON kt_azNexon_Adójel02.Adójel = tmpHiányzóKinevezésDátuma.F1
WHERE (((lkSzemélyek.[Jogviszony kezdete (belépés dátuma)]) Between Date() And #5/13/2024#));

#/#/#/
tmplkNapokKilépõk
#/#/
SELECT [Fõosztály] & [Osztály] AS Kif1, tNapok03.Nap, Sum(tKiBelépõkLétszáma.Fõ) AS SumOfFõ
FROM tKiBelépõkLétszáma INNER JOIN tNapok03 ON tKiBelépõkLétszáma.Dátum = tNapok03.Dátum
WHERE (((tNapok03.Év)=2023))
GROUP BY [Fõosztály] & [Osztály], tNapok03.Nap;

#/#/#/
tNexonAzonosítók - azonosak keresése
#/#/
SELECT tNexonAzonosítók.[Személy azonosító], tNexonAzonosítók.[HR kapcsolat azonosító], First(tNexonAzonosítók.Azonosító) AS FirstOfAzonosító
FROM tNexonAzonosítók
GROUP BY tNexonAzonosítók.[Személy azonosító], tNexonAzonosítók.[HR kapcsolat azonosító]
HAVING (((tNexonAzonosítók.[Személy azonosító]) In (SELECT [Személy azonosító] FROM [tNexonAzonosítók] As Tmp GROUP BY [Személy azonosító],[HR kapcsolat azonosító] HAVING Count(*)>1  And [HR kapcsolat azonosító] = [tNexonAzonosítók].[HR kapcsolat azonosító])))
ORDER BY tNexonAzonosítók.[Személy azonosító], tNexonAzonosítók.[HR kapcsolat azonosító], First(tNexonAzonosítók.Azonosító) DESC;

#/#/#/
tSzemélyMezõk - azonosak keresése
#/#/
SELECT tSzemélyMezõk.Mezõnév, tSzemélyMezõk.Típus, tSzemélyMezõk.Az
FROM tSzemélyMezõk
WHERE (((tSzemélyMezõk.Mezõnév) In (SELECT [Mezõnév] FROM [tSzemélyMezõk] As Tmp GROUP BY [Mezõnév],[Típus] HAVING Count(*)>1  And [Típus] = [tSzemélyMezõk].[Típus])))
ORDER BY tSzemélyMezõk.Mezõnév, tSzemélyMezõk.Típus;

#/#/#/
tSzervezet
#/#/
SELECT tSzervezeti.*
FROM tSzervezeti;

#/#/#/
tSzervezetiEgységek - azonosak keresése
#/#/
SELECT tSzervezetiEgységek.[Szervezeti egység kódja], tSzervezetiEgységek.azSzervezet, tSzervezetiEgységek.Fõosztály, tSzervezetiEgységek.Osztály
FROM tSzervezetiEgységek
WHERE (((tSzervezetiEgységek.[Szervezeti egység kódja]) In (SELECT [Szervezeti egység kódja] FROM [tSzervezetiEgységek] As Tmp GROUP BY [Szervezeti egység kódja] HAVING Count(*)>1 )))
ORDER BY tSzervezetiEgységek.[Szervezeti egység kódja];

#/#/#/
xxx_01_azNexon_és_Adójel_a_tSzemélyek_táblához
#/#/
ALTER TABLE tSzemélyek
ADD COLUMN Adójel Double, azNexon Double;
#/#/#/
xxx_02_Adóazonosító_jel_Konv_Adójel
#/#/
UPDATE tSzemélyek SET tSzemélyek.Adójel = [Adóazonosító jel]*1;

#/#/#/
xxx_03_azNexon_frissítése_tk_Nexon-ból
#/#/
UPDATE kt_azNexon_Adójel INNER JOIN tSzemélyek ON kt_azNexon_Adójel.Adójel=tSzemélyek.Adójel SET tSzemélyek.azNexon = [kt_azNexon_Adójel].[azNexon];

