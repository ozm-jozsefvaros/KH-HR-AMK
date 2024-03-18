INSERT INTO t__Ellenõrzés_02 ( Tábla, Hiányzó_érték, Adóazonosító, [Álláshely azonosító], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] )
SELECT lk_Ellenõrzés_01f_hiányzó_besorolás_megnevezés.Tábla, lk_Ellenõrzés_01f_hiányzó_besorolás_megnevezés.Hiányzó_érték, lk_Ellenõrzés_01f_hiányzó_besorolás_megnevezés.Adóazonosító, lk_Ellenõrzés_01f_hiányzó_besorolás_megnevezés.[Álláshely azonosító], lk_Ellenõrzés_01f_hiányzó_besorolás_megnevezés.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]
FROM lk_Ellenõrzés_01f_hiányzó_besorolás_megnevezés;
