SELECT Count(DistinctlkLekérdezésekTípusokCsoportok.azUnion) AS AlLekérdezésCsoportokSzáma
FROM (SELECT DISTINCT lkLekérdezésekTípusokCsoportok.[azUnion] FROM lkLekérdezésekTípusokCsoportok WHERE (((lkLekérdezésekTípusokCsoportok.[azUnion]) Is Not Null)))  AS DistinctlkLekérdezésekTípusokCsoportok;
