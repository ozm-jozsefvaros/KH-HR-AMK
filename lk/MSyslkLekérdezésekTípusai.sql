SELECT DISTINCT MSysObjects.Name AS queryName
FROM (MSysQueries INNER JOIN MSysObjects ON MSysQueries.ObjectId=MSysObjects.Id) LEFT JOIN (SELECT * FROM MSysQueries WHERE Attribute=5)  AS src ON MSysQueries.ObjectId=src.ObjectId
WHERE (((MSysObjects.Name)>"~z") And ((Mid("SelectMakTblAppendUpdateDeleteXtab  AltTblPassThUnion ",(msysqueries!Flag-1)*6+1,6))="SELECT" Or (Mid("SelectMakTblAppendUpdateDeleteXtab  AltTblPassThUnion ",(msysqueries!Flag-1)*6+1,6))="XTab") And ((MSysQueries.Attribute)=1))
ORDER BY MSysObjects.Name;
