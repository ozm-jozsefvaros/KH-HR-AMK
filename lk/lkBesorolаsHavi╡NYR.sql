SELECT lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító], lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat kód:], lkÁlláshelyek.jel2 AS ÁNYRbõl, lkJárásiKormányKözpontosítottUnió.[Besorolási fokozat megnevezése:]
FROM lkJárásiKormányKözpontosítottUnió INNER JOIN lkÁlláshelyek ON lkJárásiKormányKözpontosítottUnió.[Álláshely azonosító] = lkÁlláshelyek.[Álláshely azonosító];
