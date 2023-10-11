SELECT Ellenõrzés.Fõosztály, Ellenõrzés.Osztály, Ellenõrzés.A_B AS [Hiba leírása], Ellenõrzés.Adójel, Ellenõrzés.Név, "" AS [Álláshely azonosító], kt_azNexon_Adójel.NLINK AS Link, "" AS Megjegyzés
FROM kt_azNexon_Adójel RIGHT JOIN (SELECT * FROM lk_Ellenõrzés_foglalkoztatás_02a_b  UNION ALL SELECT * FROM lk_Ellenõrzés_foglalkoztatás_02c_a  UNION ALL  SELECT * FROM lk_Ellenõrzés_foglalkoztatás_02d_c )  AS Ellenõrzés ON kt_azNexon_Adójel.Adójel = Ellenõrzés.Adójel
ORDER BY Ellenõrzés.Fõosztály;
