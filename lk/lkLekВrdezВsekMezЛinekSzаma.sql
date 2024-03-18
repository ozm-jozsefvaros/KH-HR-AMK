SELECT lkEllenõrzõLekérdezések2.EllenõrzõLekérdezés, Count(MSysQueries.Attribute) AS CountOfAttribute
FROM lkEllenõrzõLekérdezések2 INNER JOIN (MSysObjects INNER JOIN MSysQueries ON MSysObjects.Id = MSysQueries.ObjectId) ON lkEllenõrzõLekérdezések2.EllenõrzõLekérdezés = MSysObjects.Name
WHERE (((MSysQueries.Attribute)=6))
GROUP BY lkEllenõrzõLekérdezések2.EllenõrzõLekérdezés;
