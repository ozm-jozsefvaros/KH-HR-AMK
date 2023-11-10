SELECT lk_Ellenõrzés_születésihely_kira01.Fõoszt AS Fõosztály, lk_Ellenõrzés_születésihely_kira01.Osztály AS Osztály, lk_Ellenõrzés_születésihely_kira01.[Dolgozó teljes neve] AS Név, lk_Ellenõrzés_születésihely_kira01.Hiba, lk_Ellenõrzés_születésihely_kira01.[Születés helye] AS [Születési hely], IIf([Javasolt] Like "*00*","-- nincs javaslat --",[Javasolt]) AS Javaslat, lk_Ellenõrzés_születésihely_kira01.NLink AS NLink
FROM lk_Ellenõrzés_születésihely_kira01
ORDER BY lk_Ellenõrzés_születésihely_kira01.bfkh;
