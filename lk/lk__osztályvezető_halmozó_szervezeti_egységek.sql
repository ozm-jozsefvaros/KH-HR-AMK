SELECT �ll�shelyek.[3 szint], �ll�shelyek.[4 szint], �ll�shelyek.[5 szint], Count(�ll�shelyek.[�ll�shely azonos�t�]) AS [CountOf�ll�shely azonos�t�], 2 AS Sor
FROM �ll�shelyek
WHERE (((�ll�shelyek.[�ll�shely besorol�si kateg�ri�ja])="oszt�lyvezet�"))
GROUP BY �ll�shelyek.[3 szint], �ll�shelyek.[4 szint], �ll�shelyek.[5 szint], 2
HAVING (((Count(�ll�shelyek.[�ll�shely azonos�t�]))>1));
