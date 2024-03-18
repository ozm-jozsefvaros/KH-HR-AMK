SELECT [Létszám és Meghagyottak].[meghagyásra kijelölt munkakörök megnevezése], Sum([Létszám és Meghagyottak].A) AS Összes, Sum([Létszám és Meghagyottak].B) AS Meghagyandók, Sum([Létszám és Meghagyottak].C) AS [Meg nem hagyandók]
FROM tMeghagyásraKijelöltMunkakörök RIGHT JOIN (SELECT lkFeladatkörönkéntiLétszám.*
  FROM lkFeladatkörönkéntiLétszám
  UNION
  SELECT lkFeladatkörönkéntiMeghagyottak.*
  FROM  lkFeladatkörönkéntiMeghagyottak
)  AS [Létszám és Meghagyottak] ON tMeghagyásraKijelöltMunkakörök.Feladatkörök = [Létszám és Meghagyottak].[meghagyásra kijelölt munkakörök megnevezése]
GROUP BY [Létszám és Meghagyottak].[meghagyásra kijelölt munkakörök megnevezése];
