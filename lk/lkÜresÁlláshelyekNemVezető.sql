SELECT lk�res�ll�shelyek.[�NYR SZERVEZETI EGYS�G AZONOS�T�], lk�res�ll�shelyek.[F�oszt�ly\Hivatal], lk�res�ll�shelyek.[�ll�shely azonos�t�], lk�res�ll�shelyek.[Besorol�si fokozat megnevez�se:], lk�res�ll�shelyek.[Besorol�si fokozat k�d:], lk�res�ll�shelyek.Jelleg
FROM lk�res�ll�shelyek
WHERE (((lk�res�ll�shelyek.[Besorol�si fokozat k�d:]) Not Like "*Ov*" And (lk�res�ll�shelyek.[Besorol�si fokozat k�d:]) Not Like "*Jhv*" And (lk�res�ll�shelyek.[Besorol�si fokozat k�d:]) Not Like "*ig." And (lk�res�ll�shelyek.[Besorol�si fokozat k�d:])<>"Fsp."));
