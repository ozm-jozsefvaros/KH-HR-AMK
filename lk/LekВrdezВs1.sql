SELECT lkÁlláshelyek.[Álláshely azonosító], lkÁlláshelyek.Főoszt, lkÁlláshelyek.Oszt, lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító]
FROM lkJárásiKormányKözpontosítottUnió RIGHT JOIN lkÁlláshelyek ON lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító] = lkÁlláshelyek.[Álláshely azonosító];
