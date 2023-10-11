SELECT tMeghagyásB01.FõosztályKód, tMeghagyásB01.Sorrend AS Besorolás, tMeghagyásB01.Szám, tMeghagyásB01.[Státuszának kódja], DCount("*","tMeghagyásB01","FõosztályKód = '" & [FõosztályKód] & "' AND sorrend < " & [sorrend])+DCount("*","tMeghagyásB01","FõosztályKód = '" & [FõosztályKód] & "' AND sorrend = " & [sorrend] & " AND Szám < " & [Szám])+1 AS Sorszám3
FROM tMeghagyásB01
ORDER BY tMeghagyásB01.FõosztályKód, tMeghagyásB01.Sorrend, tMeghagyásB01.Szám;
