SELECT lkF�oszt�lyok.[Szervezeti egys�g k�dja], lkIlletm�nyN�vel�shezAdatok01.F�oszt�ly, Sum(lkIlletm�nyN�vel�shezAdatok01.f�) AS [F�oszt�lyi l�tsz�m]
FROM lkF�oszt�lyok INNER JOIN lkIlletm�nyN�vel�shezAdatok01 ON lkF�oszt�lyok.F�oszt�ly=lkIlletm�nyN�vel�shezAdatok01.F�oszt�ly
GROUP BY lkF�oszt�lyok.[Szervezeti egys�g k�dja], lkIlletm�nyN�vel�shezAdatok01.F�oszt�ly;
