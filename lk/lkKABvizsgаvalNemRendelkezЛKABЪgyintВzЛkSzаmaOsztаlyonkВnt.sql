SELECT lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.Korm�nyhivatal, lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.Hivatal, lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.Oszt�ly, Count(lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.Ad�jel) AS CountOfAd�jel
FROM lkKABvizsg�valNemRendelkez�KAB�gyint�z�k
WHERE (((lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.T�voll�v�)="Nem"))
GROUP BY lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.Korm�nyhivatal, lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.Hivatal, lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.Oszt�ly;
