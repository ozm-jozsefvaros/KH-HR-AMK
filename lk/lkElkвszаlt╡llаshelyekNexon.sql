SELECT lkÁlláshelyekBelsõElosztásaFõosztályOsztály.Fõoszt AS [Engedély szerinti fõosztály], lkÁlláshelyekHaviból.Fõoszt, lkÁlláshelyekBelsõElosztásaFõosztályOsztály.[Álláshely azonosító]
FROM lkÁlláshelyekBelsõElosztásaFõosztályOsztály INNER JOIN lkÁlláshelyekHaviból ON lkÁlláshelyekBelsõElosztásaFõosztályOsztály.[Álláshely azonosító] = lkÁlláshelyekHaviból.[Álláshely azonosító]
WHERE (((lkÁlláshelyekHaviból.Fõoszt)<>[lkÁlláshelyekBelsõElosztásaFõosztályOsztály].[Fõoszt]));
