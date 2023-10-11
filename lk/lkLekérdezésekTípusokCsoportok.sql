SELECT nSelect([EllenõrzõLekérdezés]) AS db, tLekérdezésTípusok.Osztály, tLekérdezésTípusok.LapNév, tLekérdezésTípusok.Megjegyzés, tEllenõrzõLekérdezések.EllenõrzõLekérdezés, tUnionCsoportok.azUnion
FROM tLekérdezésTípusok RIGHT JOIN (tUnionCsoportok RIGHT JOIN tEllenõrzõLekérdezések ON tUnionCsoportok.azUnion=tEllenõrzõLekérdezések.azUnion) ON tLekérdezésTípusok.azETípus=tEllenõrzõLekérdezések.azETípus
ORDER BY tLekérdezésTípusok.Osztály, tLekérdezésTípusok.LapNév;
