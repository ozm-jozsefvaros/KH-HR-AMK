SELECT DISTINCT �ll�shelyek.[4 szint], �ll�shelyek.[5 szint]
FROM �ll�shelyek
WHERE (((�ll�shelyek.[5 szint]) Not In (SELECT DISTINCT �ll�shelyek.[5 szint]
FROM �ll�shelyek
WHERE (((�ll�shelyek.[�ll�shely besorol�si kateg�ri�ja]) = "oszt�lyvezet�")))));
