SELECT DISTINCT Uni�.F�oszt�ly, Uni�.Oszt�ly, Uni�.DolgTeljNeve, Uni�.[TAJ sz�m], Uni�.[sz�l hely \ id�], Uni�.[Anyja neve], Uni�.[�lland� lakc�m], Uni�.Oltand�k, *
FROM (SELECT  lkNevekTajOlt�shoz02.*
FROM lkNevekTajOlt�shoz02
UNION SELECT lkNevekTajOlt�shoz01.*
FROM  lkNevekTajOlt�shoz01
)  AS Uni�;
