SELECT lk�res�ll�shelyek.[�NYR SZERVEZETI EGYS�G AZONOS�T�], lk�res�ll�shelyek.[F�oszt�ly\Hivatal], lk�res�ll�shelyek.[�ll�shely azonos�t�], lk�ll�shelyek.[�ll�shely besorol�si kateg�ri�ja], lk�ll�shelyek.rang, lk�res�ll�shelyek.Jelleg, lk�ll�shelyek.[�ll�shely st�tusza], lk�ll�shelyek.[Hat�lyoss�g kezdete] AS [Mi�ta �res �NYR], lk�res�ll�shelyek.[Meg�resed�s d�tuma] AS [Mi�ta �res Nexon], Date()-[Hat�lyoss�g kezdete] AS [H�ny napja �res �NYR], Date()-[Hat�lyoss�g kezdete] AS [H�ny napja �res NEXON]
FROM lk�res�ll�shelyek RIGHT JOIN lk�ll�shelyek ON lk�res�ll�shelyek.[�ll�shely azonos�t�] = lk�ll�shelyek.[�ll�shely azonos�t�]
WHERE (((lk�ll�shelyek.rang)<=6) AND ((lk�ll�shelyek.[�ll�shely st�tusza])="bet�ltetlen - tart�san t�voll�v�" Or (lk�ll�shelyek.[�ll�shely st�tusza])="bet�ltetlen") AND ((lk�res�ll�shelyek.[Besorol�si fokozat k�d:]) Like "*Ov*" Or (lk�res�ll�shelyek.[Besorol�si fokozat k�d:]) Like "*Jhv*" Or (lk�res�ll�shelyek.[Besorol�si fokozat k�d:]) Like "*ig." Or (lk�res�ll�shelyek.[Besorol�si fokozat k�d:])="fsp."));
