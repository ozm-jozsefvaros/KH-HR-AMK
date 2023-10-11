SELECT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkBesorolásHelyettesek.Név AS [TT-s neve], lkBesorolásHelyettesek.Adójel AS [TT-s adójele], lkSzemélyek.[Tartós távollét típusa], [Családi név] & " " & [Utónév] AS [TTH-s neve], lkBesorolásHelyettesek.Kezdete1, lkBesorolásHelyettesek.Vége1, "https://nexonport.kh.gov.hu/menu/hrm/szemelyiKarton/index?szemelyAzonosito=" & [azNexon] & "&r=13" AS Link
FROM kt_azNexon_Adójel INNER JOIN (lkSzemélyek RIGHT JOIN lkBesorolásHelyettesek ON lkSzemélyek.[Dolgozó teljes neve]=lkBesorolásHelyettesek.Név) ON kt_azNexon_Adójel.Adójel=lkBesorolásHelyettesek.Adójel
WHERE (((lkSzemélyek.[Tartós távollét típusa]) Is Not Null))
ORDER BY lkBesorolásHelyettesek.Név, lkBesorolásHelyettesek.Kezdete1, lkBesorolásHelyettesek.Vége1;
