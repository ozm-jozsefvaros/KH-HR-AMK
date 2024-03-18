SELECT DISTINCT lkSzemélyek.BFKH, lkBesorolásiEredményadatok.Adójel, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve] AS Név, lkBesorolásiEredményadatok.[Utolsó besorolás dátuma]
FROM lkSzemélyek RIGHT JOIN lkBesorolásiEredményadatok ON lkSzemélyek.[Adóazonosító jel] = lkBesorolásiEredményadatok.[Adóazonosító jel]
WHERE (((lkBesorolásiEredményadatok.[Utolsó besorolás dátuma])<#12/1/2023#) AND ((lkSzemélyek.[Jogviszony típusa / jogviszony típus])="Kormányzati szolgálati jogviszony") AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH;
