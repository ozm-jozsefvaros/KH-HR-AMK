SELECT nSelect([EllenõrzõLekérdezés]) AS db, tLekérdezésTípusok.Osztály, tLekérdezésTípusok.LapNév, tLekérdezésTípusok.Megjegyzés, tEllenõrzõLekérdezések.EllenõrzõLekérdezés, tUnionCsoportok.azUnion
FROM tUnionCsoportok RIGHT JOIN (tLekérdezésTípusok RIGHT JOIN tEllenõrzõLekérdezések ON tLekérdezésTípusok.azETípus = tEllenõrzõLekérdezések.azETípus) ON tUnionCsoportok.azUnion = tEllenõrzõLekérdezések.azUnion
ORDER BY tLekérdezésTípusok.Osztály, tLekérdezésTípusok.LapNév;
