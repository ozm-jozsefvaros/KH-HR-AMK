SELECT DISTINCT lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkIlletm�nyekP�.N�v, lkIlletm�nyekP�.[Ad�azonos�t� jel], lkIlletm�nyekP�.[�tsorol�s �sszesen] AS PGF, lkSzem�lyek.[Kerek�tett 100 %-os illetm�ny (elt�r�tett)] AS NEXON, lkSzem�lyek.[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker] AS [Heti �ra], [Nexon]/[Heti �ra]*40 AS [Nexon 40 �ra], kt_azNexon_Ad�jel.Nlink AS Link, lkSzem�lyek.[St�tusz t�pusa], lkIlletm�nyekP�.[Jogviszony, juttat�s t�pusa]
FROM (lkIlletm�nyekP� LEFT JOIN lkSzem�lyek ON lkIlletm�nyekP�.[Ad�azonos�t� jel] = lkSzem�lyek.Ad�jel) LEFT JOIN kt_azNexon_Ad�jel ON lkSzem�lyek.Ad�jel = kt_azNexon_Ad�jel.Ad�jel
WHERE (((lkSzem�lyek.[St�tusz t�pusa]) Is Not Null) AND ((lkIlletm�nyekP�.[Jogviszony, juttat�s t�pusa])=20 Or (lkIlletm�nyekP�.[Jogviszony, juttat�s t�pusa])=6 Or (lkIlletm�nyekP�.[Jogviszony, juttat�s t�pusa])=18));
