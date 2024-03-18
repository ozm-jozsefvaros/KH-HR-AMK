SELECT 1 as sor, Count(lkKABvizsgávalNemRendelkezõKABÜgyintézõk.Adójel) AS Létszám, Sum(IIf([Távollévõ]="IGEN",1,0)) AS [Tartós távollévõ], Létszám -[Tartós távollévõ] as Összesen
FROM lkKABvizsgávalNemRendelkezõKABÜgyintézõk
UNION
SELECT 2 as sor, Count(lkKABvizsgávalNemRendelkezõKABÜgyintézõk.Adójel) AS Létszám, Sum(IIf([Távollévõ]="IGEN",1,0)) AS [Tartós távollévõ], Létszám -[Tartós távollévõ]
FROM lkKABvizsgávalNemRendelkezõKABÜgyintézõk
WHERE (((lkKABvizsgávalNemRendelkezõKABÜgyintézõk.[Próbaidõ vége])<=#7/1/2024#))
UNION SELECT 3 as sor, Count(lkKABvizsgávalNemRendelkezõKABÜgyintézõk.Adójel) AS Létszám, Sum(IIf([Távollévõ]="IGEN",1,0)) AS [Tartós távollévõ], Létszám -[Tartós távollévõ]
FROM lkKABvizsgávalNemRendelkezõKABÜgyintézõk
WHERE (((lkKABvizsgávalNemRendelkezõKABÜgyintézõk.Belépés)>=#1/1/2022#) AND ((lkKABvizsgávalNemRendelkezõKABÜgyintézõk.[Próbaidõ vége])<=#7/1/2024#));
