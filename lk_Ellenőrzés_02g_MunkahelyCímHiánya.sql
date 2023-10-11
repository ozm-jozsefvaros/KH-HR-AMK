INSERT INTO t__Ellenõrzés_02 ( Tábla, Adóazonosító, [Álláshely azonosító], [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], Adójel )
SELECT lk_Ellenõrzés_01g_MunkahelyCímHiánya.Tábla, lk_Ellenõrzés_01g_MunkahelyCímHiánya.Adóazonosító, lk_Ellenõrzés_01g_MunkahelyCímHiánya.[Álláshely azonosító], lk_Ellenõrzés_01g_MunkahelyCímHiánya.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], lk_Ellenõrzés_01g_MunkahelyCímHiánya.Adójel
FROM lk_Ellenõrzés_01g_MunkahelyCímHiánya;
