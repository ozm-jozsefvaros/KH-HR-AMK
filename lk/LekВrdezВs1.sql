SELECT lkÁlláshelyek.[Álláshely azonosító], lkÁlláshelyek.Fõoszt, lkÁlláshelyek.Oszt, lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító]
FROM lkJárásiKormányKözpontosítottUnió RIGHT JOIN lkÁlláshelyek ON lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító] = lkÁlláshelyek.[Álláshely azonosító];
