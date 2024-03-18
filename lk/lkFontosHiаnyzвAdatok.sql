SELECT lk_Ellenõrzés_03.Fõosztály, lk_Ellenõrzés_03.Osztály, lk_Ellenõrzés_03.Név, lk_Ellenõrzés_03.[Hiányzó érték], lk_Ellenõrzés_03.[Státusz kód], lk_Ellenõrzés_03.Megjegyzés, "https://nexonport.kh.gov.hu/menu/hrm/szemelyiKarton/index?szemelyAzonosito=" & [azNexon] & "&r=13" AS Link
FROM kt_azNexon_Adójel02 INNER JOIN lk_Ellenõrzés_03 ON kt_azNexon_Adójel02.NLink=lk_Ellenõrzés_03.NLink
WHERE (((lk_Ellenõrzés_03.[Hiányzó érték])<>"Hivatali email" And (lk_Ellenõrzés_03.[Hiányzó érték])<>"Munkavégzés helye - cím"));
