SELECT lkEllen�rz�Lek�rdez�sek2.Ellen�rz�Lek�rdez�s, Count(MSysQueries.Attribute) AS CountOfAttribute
FROM lkEllen�rz�Lek�rdez�sek2 INNER JOIN (MSysObjects INNER JOIN MSysQueries ON MSysObjects.Id = MSysQueries.ObjectId) ON lkEllen�rz�Lek�rdez�sek2.Ellen�rz�Lek�rdez�s = MSysObjects.Name
WHERE (((MSysQueries.Attribute)=6))
GROUP BY lkEllen�rz�Lek�rdez�sek2.Ellen�rz�Lek�rdez�s;
