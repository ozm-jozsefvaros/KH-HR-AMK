SELECT First(lkSzervezeti�ll�shelyek.�ll�shelyAzonos�t�) AS [�ll�shelyAzonos�t� Mez�], Count(lkSzervezeti�ll�shelyek.�ll�shelyAzonos�t�) AS AzonosakSz�ma
FROM lkSzervezeti�ll�shelyek
GROUP BY lkSzervezeti�ll�shelyek.�ll�shelyAzonos�t�
HAVING (((Count(lkSzervezeti�ll�shelyek.�ll�shelyAzonos�t�))>1));
