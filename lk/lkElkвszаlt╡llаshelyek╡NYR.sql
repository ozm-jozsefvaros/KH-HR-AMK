SELECT lkÁlláshelyekBelsõElosztásaFõosztályOsztály.Fõoszt AS [Engedély szerinti fõosztály], lkÁlláshelyek.Fõoszt AS [ÁNYR szerinti fõosztály], lkÁlláshelyekBelsõElosztásaFõosztályOsztály.[Álláshely azonosító]
FROM lkÁlláshelyek INNER JOIN lkÁlláshelyekBelsõElosztásaFõosztályOsztály ON lkÁlláshelyek.[Álláshely azonosító] = lkÁlláshelyekBelsõElosztásaFõosztályOsztály.[Álláshely azonosító]
WHERE (((lkÁlláshelyek.Fõoszt)<>[lkÁlláshelyekBelsõElosztásaFõosztályOsztály].[Fõoszt]));
