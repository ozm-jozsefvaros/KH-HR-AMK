SELECT lkSzemélyek.[TAJ szám], lkSzemélyek.[Dolgozó születési neve] AS [Születési név], lkSzemélyek.[Dolgozó teljes neve] AS [Házassági név], lkSzemélyek.[Anyja neve], lkSzemélyek.[Születési idõ], lkSzemélyek.[Születési hely], lkSzemélyek.[KIRA feladat megnevezés] AS munkakör
FROM lkSzemélyek RIGHT JOIN (tMeghagyás03 RIGHT JOIN tMeghagyásB02 ON tMeghagyás03.FõosztályKód = tMeghagyásB02.FõosztályKód) ON lkSzemélyek.[Státusz kódja] = tMeghagyásB02.[Státuszának kódja]
WHERE (((IIf([Sorszám3]<=([CountOfLétszám]-[Meghagyandók]),False,True))=True))
ORDER BY Bfkh(Nz([tMeghagyás03].[FõosztályKód],"BFKH.1.")), tMeghagyásB02.Sorszám3 DESC;
