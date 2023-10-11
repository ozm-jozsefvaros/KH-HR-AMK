SELECT lk_Garantált_bérminimum_Illetmények.[Dolgozó teljes neve], lk_Garantált_bérminimum_Illetmények.[Álláshely azonosító], lkSzemélyek.[Státusz kódja], lkSzemélyek.[Besorolási  fokozat (KT)]
FROM lk_Garantált_bérminimum_Illetmények LEFT JOIN lkSzemélyek ON lk_Garantált_bérminimum_Illetmények.[Álláshely azonosító] = lkSzemélyek.[Státusz kódja]
WHERE (((lkSzemélyek.[Besorolási  fokozat (KT)]) Is Null));
