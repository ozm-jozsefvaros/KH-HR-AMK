SELECT "Budapest Fõváros Kormányhivatala" AS Kormányhivatal, lkKABÜgyintézõk.Adójel, lkKABÜgyintézõk.Hivatal, lkKABÜgyintézõk.Osztály, lkKABÜgyintézõk.Név, lkKABÜgyintézõk.[Ellátott feladat], lkKABÜgyintézõk.Belépés, lkKABÜgyintézõk.[Próbaidõ vége], lkKABÜgyintézõk.Távollévõ
FROM lkKABÜgyintézõk LEFT JOIN lkKABVizsgaÉsVégzettség ON lkKABÜgyintézõk.Adójel = lkKABVizsgaÉsVégzettség.Adójel
WHERE (((lkKABVizsgaÉsVégzettség.Adójel) Is Null));
