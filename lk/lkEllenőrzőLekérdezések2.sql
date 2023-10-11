SELECT tEllenõrzõLekérdezések.EllenõrzõLekérdezés, tLekérdezésTípusok.LapNév, tLekérdezésTípusok.Osztály, tLekérdezésTípusok.Megjegyzés, tEllenõrzõLekérdezések.Táblacím, Exists (select azEllenõrzõ from tGrafikonok Where tGrafikonok.azEllenõrzõ=tEllenõrzõLekérdezések.azEllenõrzõ) AS vaneGraf
FROM tLekérdezésTípusok INNER JOIN tEllenõrzõLekérdezések ON tLekérdezésTípusok.azETípus=tEllenõrzõLekérdezések.azETípus
WHERE (((tEllenõrzõLekérdezések.Kimenet)=True))
ORDER BY tLekérdezésTípusok.azETípus;
