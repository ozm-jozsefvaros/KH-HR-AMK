INSERT INTO t__Ellenõrzés_02 ( Tábla, Hiányzó_érték, Adóazonosító, [Álláshely azonosító], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Adójel )
SELECT lk_Ellenõrzés_01.Tábla, lk_Ellenõrzés_01.Hiányzó_érték, lk_Ellenõrzés_01.Adóazonosító, lk_Ellenõrzés_01.[Álláshely azonosító], lk_Ellenõrzés_01.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [Adóazonosító]*1 AS Adójel
FROM lk_Ellenõrzés_01;
