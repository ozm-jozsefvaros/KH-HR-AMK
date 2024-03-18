SELECT DISTINCT lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Munkavégzés helye - megnevezés], lkSzemélyek.[Munkavégzés helye - cím], Count(lkSzemélyek.Adójel) AS CountOfAdójel
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((lkSzemélyek.[Munkavégzés helye - cím]) Is Null)) OR (((lkSzemélyek.[Státusz neve])="Álláshely") AND ((Len([Munkavégzés helye - cím]))<3))
GROUP BY lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Munkavégzés helye - megnevezés], lkSzemélyek.[Munkavégzés helye - cím];
