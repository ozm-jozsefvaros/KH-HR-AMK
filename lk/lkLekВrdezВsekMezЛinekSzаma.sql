SELECT lkEllenőrzőLekérdezések2.EllenőrzőLekérdezés, Count(MSysQueries.Attribute) AS CountOfAttribute
FROM lkEllenőrzőLekérdezések2 INNER JOIN (MSysObjects INNER JOIN MSysQueries ON MSysObjects.Id = MSysQueries.ObjectId) ON lkEllenőrzőLekérdezések2.EllenőrzőLekérdezés = MSysObjects.Name
WHERE (((MSysQueries.Attribute)=6))
GROUP BY lkEllenőrzőLekérdezések2.EllenőrzőLekérdezés;
