SELECT lk_Havib�l�ll�shelyek.T�bla AS Z�na, lk_Havib�l�ll�shelyek.[Az �ll�shely megynevez�se] AS Besorol�s_bemenet, lk_Havib�l�ll�shelyek.[�ll�shely sz�ma] AS Nexonban
FROM lk_Havib�l�ll�shelyek
WHERE (((lk_Havib�l�ll�shelyek.T�bla)="K�zpontos�tott"))
ORDER BY lk_Havib�l�ll�shelyek.Azonos�t�;
