SELECT DISTINCT KABVizga�sKABV�gzetts�gUni�.Ad�jel, KABVizga�sKABV�gzetts�gUni�.BFKH, KABVizga�sKABV�gzetts�gUni�.F�oszt�ly, KABVizga�sKABV�gzetts�gUni�.Oszt�ly, KABVizga�sKABV�gzetts�gUni�.N�v, KABVizga�sKABV�gzetts�gUni�.Bel�p�s
FROM (SELECT Ad�jel, lkKABKorm�nyablakV�gzetts�g�ek.BFKH, lkKABKorm�nyablakV�gzetts�g�ek.F�oszt�ly, lkKABKorm�nyablakV�gzetts�g�ek.Oszt�ly, lkKABKorm�nyablakV�gzetts�g�ek.N�v, lkKABKorm�nyablakV�gzetts�g�ek.Bel�p�s
FROM lkKABKorm�nyablakV�gzetts�g�ek
UNION
SELECT Ad�jel, lkKABKorm�nyablakVizsg�valRendelkez�k.BFKH, lkKABKorm�nyablakVizsg�valRendelkez�k.F�oszt�ly, lkKABKorm�nyablakVizsg�valRendelkez�k.Oszt�ly, lkKABKorm�nyablakVizsg�valRendelkez�k.N�v, lkKABKorm�nyablakVizsg�valRendelkez�k.Bel�p�s
FROM  lkKABKorm�nyablakVizsg�valRendelkez�k)  AS KABVizga�sKABV�gzetts�gUni�;
