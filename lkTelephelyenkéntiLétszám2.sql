SELECT lkSzemélyek.[Munkavégzés helye - cím], Count(lkSzemélyek.Azonosító) AS [Létszám (fõ)]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Jogviszony vége (kilépés dátuma)])>Date()-1 Or (lkSzemélyek.[Jogviszony vége (kilépés dátuma)]) Is Null))
GROUP BY lkSzemélyek.[Munkavégzés helye - cím]
ORDER BY Count(lkSzemélyek.Azonosító) DESC;
