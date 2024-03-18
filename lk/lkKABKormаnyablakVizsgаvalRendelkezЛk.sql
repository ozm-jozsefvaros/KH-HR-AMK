SELECT lkK�zigazgat�siVizsga.Ad�jel, lkSzem�lyek.BFKH, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve] AS N�v, lkK�zigazgat�siVizsga.[Vizsga t�pusa], lkSzem�lyek.[Jogviszony kezdete (bel�p�s d�tuma)] AS Bel�p�s, lkK�zigazgat�siVizsga.[Vizsga let�tel terv hat�rideje], lkK�zigazgat�siVizsga.[Vizsga let�tel t�ny hat�rideje]
FROM lkK�zigazgat�siVizsga INNER JOIN lkSzem�lyek ON lkK�zigazgat�siVizsga.Ad�jel = lkSzem�lyek.Ad�jel
WHERE (((lkK�zigazgat�siVizsga.[Vizsga t�pusa])="KAB Korm�nyablak �gyint�z�i vizsg."))
ORDER BY lkSzem�lyek.BFKH;
