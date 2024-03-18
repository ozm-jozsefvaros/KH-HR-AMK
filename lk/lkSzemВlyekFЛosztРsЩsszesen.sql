SELECT UNI�.sor, UNI�.F�oszt�ly, Sum(UNI�.F�oszt�lyiL�tsz�m) AS F�oszt�lyiL�tsz�m, UNI�.F�osztK�d, Sum(UNI�.K�zpontos�tottL�tsz�m) AS K�zpontos�tottL�tsz�m
FROM (SELECT 1 AS sor, lkSzem�lyek.F�oszt�ly, Count(lkSzem�lyek.Ad�jel) AS F�oszt�lyiL�tsz�m, Bfkh([lkSzem�lyek].[F�oszt�lyK�d]) AS F�osztK�d, 0 AS K�zpontos�tottL�tsz�m
FROM lkSzem�lyek
WHERE lkSzem�lyek.[St�tusz neve]="�ll�shely" AND lkSzem�lyek.[St�tusz t�pusa] Like "Szervezeti alapl�tsz�m"
GROUP BY lkSzem�lyek.F�oszt�ly, Bfkh([lkSzem�lyek].[F�oszt�lyK�d]), lkSzem�lyek.[St�tusz neve], lkSzem�lyek.[St�tusz t�pusa]
UNION
SELECT 1 as sor, lkSzem�lyek.F�oszt�ly, 0 AS F�oszt�lyiL�tsz�m, Bfkh([lkSzem�lyek].[F�oszt�lyK�d]) as F�osztK�d, Count(lkSzem�lyek.Ad�jel) as K�zpontos�tottL�tsz�m
    FROM lkSzem�lyek 
       WHERE lkSzem�lyek.[St�tusz neve]="�ll�shely" AND lkSzem�lyek.[St�tusz t�pusa] Like "K�zpontos�tott �llom�ny"
       GROUP BY lkSzem�lyek.F�oszt�ly, lkSzem�lyek.[St�tusz neve], Bfkh([lkSzem�lyek].[F�oszt�lyK�d])
  UNION SELECT 2 as sor, "�sszesen:" as F�oszt�ly, Count(lkSzem�lyek.Ad�jel) AS CountOfAd�jel , "BFKH.99" as F�osztK�d, 0 AS K�zpontos�tottL�tsz�m
    FROM lkSzem�lyek 
       WHERE lkSzem�lyek.[St�tusz neve]="�ll�shely" AND lkSzem�lyek.[St�tusz t�pusa] Like "Szervezeti alapl�tsz�m"
       GROUP BY lkSzem�lyek.[St�tusz neve], "BFKH.99"
  UNION SELECT 2 as sor, "�sszesen:" as F�oszt�ly, 0 AS CountOfAd�jel , "BFKH.99" as F�osztK�d, Count(lkSzem�lyek.Ad�jel) AS K�zpontos�tottL�tsz�m
    FROM lkSzem�lyek 
       WHERE lkSzem�lyek.[St�tusz neve]="�ll�shely" AND lkSzem�lyek.[St�tusz t�pusa] Like "K�zpontos�tott �llom�ny"
       GROUP BY lkSzem�lyek.[St�tusz neve], "BFKH.99")  AS UNI�
GROUP BY UNI�.sor, UNI�.F�oszt�ly, UNI�.F�osztK�d
ORDER BY UNI�.sor;
