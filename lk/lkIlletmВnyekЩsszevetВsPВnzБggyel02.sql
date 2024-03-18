SELECT DISTINCT lkIlletményekÖsszevetésPénzüggyel01.Fõosztály, lkIlletményekÖsszevetésPénzüggyel01.Osztály, lkIlletményekÖsszevetésPénzüggyel01.Név, lkIlletményekÖsszevetésPénzüggyel01.PGF, lkIlletményekÖsszevetésPénzüggyel01.NEXON, lkIlletményekÖsszevetésPénzüggyel01.[Heti óra], lkIlletményekÖsszevetésPénzüggyel01.[Nexon 40 óra], lkIlletményekÖsszevetésPénzüggyel01.Link AS NLink
FROM lkIlletményekÖsszevetésPénzüggyel01
WHERE (((lkIlletményekÖsszevetésPénzüggyel01.NEXON)<>[PGF]));
