SELECT BeKilépõk.KilépésÉve AS Év, BeKilépõk.KilépésHava AS Hó, Sum(BeKilépõk.Belépõk) AS SumOfBelépõk, Sum(BeKilépõk.Kilépõk) AS SumOfKilépõk
FROM (SELECT Adóazonosító, lkKilépõk_Személyek01.KilépésÉve, lkKilépõk_Személyek01.KilépésHava, 0 As Belépõk, lkKilépõk_Személyek01.Létszám AS Kilépõk 
FROM lkKilépõk_Személyek01

UNION
SELECT Adóazonosító, lkBelépõk_Személyek01.BelépésÉve, lkBelépõk_Személyek01.BelépésHava, lkBelépõk_Személyek01.Létszám AS Belépõk, 0 as Kilépõk
FROM lkBelépõk_Személyek01

)  AS BeKilépõk
GROUP BY BeKilépõk.KilépésÉve, BeKilépõk.KilépésHava
HAVING ((([BeKilépõk].[KilépésÉve])>2018));
