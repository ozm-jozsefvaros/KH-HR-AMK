SELECT lkOszt�lyvezet�i�ll�shelyek.[Besorol�si  fokozat (KT)], Round(Avg([Illetm�ny])/100,0)*100 AS �tlagilletm�ny
FROM lkOszt�lyvezet�i�ll�shelyek
GROUP BY lkOszt�lyvezet�i�ll�shelyek.[Besorol�si  fokozat (KT)];
