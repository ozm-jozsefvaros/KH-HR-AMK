SELECT BudapestRomaiEsHiany.Fõosztály, BudapestRomaiEsHiany.Osztály, BudapestRomaiEsHiany.Név, BudapestRomaiEsHiany.Hiba, BudapestRomaiEsHiany.[Születési hely], BudapestRomaiEsHiany.Javaslat, BudapestRomaiEsHiany.NLink
FROM (SELECT
  lk_Ellenõrzés_születésihely_kira01.bfkh
, lk_Ellenõrzés_születésihely_kira01.Fõoszt AS Fõosztály
, lk_Ellenõrzés_születésihely_kira01.Osztály AS Osztály
, lk_Ellenõrzés_születésihely_kira01.[Dolgozó teljes neve] AS Név
, lk_Ellenõrzés_születésihely_kira01.Hiba
, lk_Ellenõrzés_születésihely_kira01.[Születés helye] AS [Születési hely]
, IIf([Javasolt] Like "*00*","-- nincs javaslat --",[Javasolt]) AS Javaslat
, lk_Ellenõrzés_születésihely_kira01.NLink AS NLink 
FROM lk_Ellenõrzés_születésihely_kira01
UNION
SELECT
  lk_Ellenõrzés_születésihely_kira01_hiány.bfkh
, lk_Ellenõrzés_születésihely_kira01_hiány.Fõoszt
, lk_Ellenõrzés_születésihely_kira01_hiány.Osztály
, lk_Ellenõrzés_születésihely_kira01_hiány.[Dolgozó teljes neve] as Név
, lk_Ellenõrzés_születésihely_kira01_hiány.Hiba
, lk_Ellenõrzés_születésihely_kira01_hiány.[Születési helye]
, "-- nincs javaslat --" as Javaslat
, lk_Ellenõrzés_születésihely_kira01_hiány.NLink
FROM lk_Ellenõrzés_születésihely_kira01_hiány
)  AS BudapestRomaiEsHiany
ORDER BY BudapestRomaiEsHiany.bfkh, BudapestRomaiEsHiany.Osztály, BudapestRomaiEsHiany.Név;
