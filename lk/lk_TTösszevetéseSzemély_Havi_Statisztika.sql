SELECT bfkh([Szervezeti egys�g k�dja]) AS BFKH, lk_TT�sszevet�seSzem�ly_Havi.[Szervezeti egys�g], Count(lk_TT�sszevet�seSzem�ly_Havi.Ad�jel) AS CountOfAd�jel
FROM lkF�oszt�lyok INNER JOIN lk_TT�sszevet�seSzem�ly_Havi ON lkF�oszt�lyok.F�oszt�ly=lk_TT�sszevet�seSzem�ly_Havi.[Szervezeti egys�g]
GROUP BY bfkh([Szervezeti egys�g k�dja]), lk_TT�sszevet�seSzem�ly_Havi.[Szervezeti egys�g];
