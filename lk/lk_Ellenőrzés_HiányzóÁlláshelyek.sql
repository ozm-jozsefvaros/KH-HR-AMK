SELECT �ll�shelyek.[�ll�shely azonos�t�], �ll�shelyek.[�ll�shely besorol�si kateg�ri�ja], �ll�shelyek.[�ll�shely t�pusa]
FROM lk�ll�shelyAzonos�t�kHavib�l LEFT JOIN �ll�shelyek ON lk�ll�shelyAzonos�t�kHavib�l.�ll�shely = �ll�shelyek.[�ll�shely azonos�t�]
WHERE (((�ll�shelyek.[�ll�shely azonos�t�]) Is Null));
