SELECT strcount(Nz([Állandó lakcím],"")," ") AS Kif1, lkSzemélyek.[Státusz neve]
FROM lkSzemélyek
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY strcount(Nz([Állandó lakcím],"")," ") DESC;
