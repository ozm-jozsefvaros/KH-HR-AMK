SELECT tÁlláshelyekBelsőElosztásaFőosztályOsztály.azElosztás, Replace([Főosztály],"Budapest Főváros Kormányhivatala","BFKH") AS Főoszt, tÁlláshelyekBelsőElosztásaFőosztályOsztály.Osztály, tÁlláshelyekBelsőElosztásaFőosztályOsztály.[Álláshely azonosító], tÁlláshelyekBelsőElosztásaFőosztályOsztály.Hatály
FROM tÁlláshelyekBelsőElosztásaFőosztályOsztály
WHERE (((tÁlláshelyekBelsőElosztásaFőosztályOsztály.azElosztás)=(Select Top 1 azElosztás from [tÁlláshelyekBelsőElosztásaFőosztályOsztály] as tmp Where tmp.[Álláshely azonosító]=[tÁlláshelyekBelsőElosztásaFőosztályOsztály].[Álláshely azonosító] Order By  tmp.hatály Desc)));
