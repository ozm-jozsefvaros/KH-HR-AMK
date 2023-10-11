SELECT qry.Attribute, qry.Expression, qry.Flag, qry.LvExtra, qob.Name AS ObjectName, qry.Name1 AS columnName, qry.Name2 AS alias
FROM MSysQueries AS qry LEFT JOIN MSysObjects AS qob ON qry.ObjectId = qob.Id
ORDER BY qob.Name;
