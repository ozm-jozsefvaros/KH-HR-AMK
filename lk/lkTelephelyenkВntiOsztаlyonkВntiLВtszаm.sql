SELECT lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.MunkavégzésCíme, Count(lkSzemélyek.Adójel) AS Létszám
FROM lkSzemélyek
WHERE (((lkSzemélyek.MunkavégzésCíme) Is Not Null) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
GROUP BY lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.MunkavégzésCíme
ORDER BY lkSzemélyek.BFKH, Count(lkSzemélyek.Adójel) DESC;
