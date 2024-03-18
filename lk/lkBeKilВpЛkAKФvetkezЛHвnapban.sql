SELECT KiBelépõk.Dátum, Sum(KiBelépõk.[Belépõk száma]) AS [Belépõk száma], Sum(KiBelépõk.[Kilépõk száma]) AS [Kilépõk száma], [Belépõk száma]-[Kilépõk száma] AS Mozgás
FROM (SELECT 
lkBelépõkSzáma.Dátum, lkBelépõkSzáma.[Belépõk száma], lkBelépõkSzáma.[Kilépõk száma]
FROM lkBelépõkSzáma
UNION SELECT
lkKilépõkSzáma.Dátum, lkKilépõkSzáma.[Belépõk száma], lkKilépõkSzáma.[Kilépõk száma]
FROM  lkKilépõkSzáma
)  AS KiBelépõk
GROUP BY KiBelépõk.Dátum, [Belépõk száma]-[Kilépõk száma];
