SELECT MSysObjects.Name, MSysObjects.Flags
FROM MSysObjects
WHERE (((MSysObjects.Type)=1) AND ((MSysObjects.Flags)=0)) OR (((MSysObjects.Type)=5))
ORDER BY MSysObjects.Type, MSysObjects.Name;
