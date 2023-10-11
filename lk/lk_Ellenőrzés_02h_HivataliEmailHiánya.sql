INSERT INTO t__Ellenõrzés_02 ( Tábla, Hiányzó_érték, Adóazonosító, [Álláshely azonosító], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Adójel )
SELECT lk_Ellenõrzés_01h_HivataliEmailHiánya.Tábla, lk_Ellenõrzés_01h_HivataliEmailHiánya.Hiányzó_érték, [Adójel] & "" AS Adóazonosító, lk_Ellenõrzés_01h_HivataliEmailHiánya.[Státusz kódja], lk_Ellenõrzés_01h_HivataliEmailHiánya.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lk_Ellenõrzés_01h_HivataliEmailHiánya.Adójel
FROM lk_Ellenõrzés_01h_HivataliEmailHiánya;
