SELECT "Személyek vs. Szervezeti" AS Tábla, "A 'tartós távollét típusa': <üres>, ugyanakkor a 'Státuszbetöltés típusa': ""Inaktív""" AS Hiányzó_érték, lkSzemélyek.[Adóazonosító jel] AS Adóazonosító, lkSzemélyek.[Státusz kódja] AS [Álláshely azonosító], lkSzemélyek.[Szervezeti egység kódja] AS [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lkSzemélyek.Adójel
FROM lk_InaktívBetöltõkÉsÁlláshelyük RIGHT JOIN lkSzemélyek ON lk_InaktívBetöltõkÉsÁlláshelyük.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Tartós távollét típusa]) Is Null) AND ((lk_InaktívBetöltõkÉsÁlláshelyük.Adójel) Is Not Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
AND "####Az inaktív betöltõk között keresi meg azokat, akiknek a tartós távollét típusa mezõ a személytörzsben Null. #####";
