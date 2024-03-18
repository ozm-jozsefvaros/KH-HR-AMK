SELECT tKöltségvetéshezBesorolások.Sor, tKöltségvetéshezBesorolások.Besorolás, Count(lkKöltségvetéshezBesorolásonkéntiLétszám01.Adójel) AS [Betöltött létszám], Round([Betöltött létszám]*4838/(Select count(adójel) from lkKöltségvetéshezBesorolásonkéntiLétszám01)) AS Összlétszám
FROM tKöltségvetéshezBesorolások RIGHT JOIN lkKöltségvetéshezBesorolásonkéntiLétszám01 ON tKöltségvetéshezBesorolások.BesorolásSzemélytörzs = lkKöltségvetéshezBesorolásonkéntiLétszám01.Besorolás2
GROUP BY tKöltségvetéshezBesorolások.Sor, tKöltségvetéshezBesorolások.Besorolás;
