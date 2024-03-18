SELECT lkOsztályonkéntiÁlláshelyekÁNYR.[Álláshely azonosító], lkOsztályonkéntiÁlláshelyekÁNYR.Fõoszt
FROM lkOsztályonkéntiÁlláshelyekÁNYR
WHERE (((lkOsztályonkéntiÁlláshelyekÁNYR.[Álláshely azonosító]) In (SELECT [Álláshely azonosító] FROM [lkOsztályonkéntiÁlláshelyekÁNYR] As Tmp GROUP BY [Álláshely azonosító] HAVING Count(*)>1 )))
ORDER BY lkOsztályonkéntiÁlláshelyekÁNYR.[Álláshely azonosító];
