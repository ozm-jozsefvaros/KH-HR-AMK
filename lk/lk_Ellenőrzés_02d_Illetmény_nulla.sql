INSERT INTO t__Ellenõrzés_02 ( Tábla, Hiányzó_érték, Adóazonosító, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] )
SELECT lk_Ellenõrzés_01d_Illetmény_nulla.Tábla, lk_Ellenõrzés_01d_Illetmény_nulla.Hiányzó_érték, lk_Ellenõrzés_01d_Illetmény_nulla.Adójel AS Adóazonosító, lk_Ellenõrzés_01d_Illetmény_nulla.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM lk_Ellenõrzés_01d_Illetmény_nulla;
