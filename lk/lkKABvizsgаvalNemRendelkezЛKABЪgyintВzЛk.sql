SELECT "Budapest F�v�ros Korm�nyhivatala" AS Korm�nyhivatal, lkKAB�gyint�z�k.Ad�jel, lkKAB�gyint�z�k.Hivatal, lkKAB�gyint�z�k.Oszt�ly, lkKAB�gyint�z�k.N�v, lkKAB�gyint�z�k.[Ell�tott feladat], lkKAB�gyint�z�k.Bel�p�s, lkKAB�gyint�z�k.[Pr�baid� v�ge], lkKAB�gyint�z�k.T�voll�v�
FROM lkKAB�gyint�z�k LEFT JOIN lkKABVizsga�sV�gzetts�g ON lkKAB�gyint�z�k.Ad�jel = lkKABVizsga�sV�gzetts�g.Ad�jel
WHERE (((lkKABVizsga�sV�gzetts�g.Ad�jel) Is Null));
