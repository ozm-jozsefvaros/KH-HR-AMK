SELECT Trim(Replace(Replace(Replace([lkKil�p�Uni�].[F�oszt�ly],"Budapest F�v�ros Korm�nyhivatala","BFKH")," 20200229-ig",""),"Budapest F�v�rosKorm�nyhivatala","BFKH")) AS F�oszt�ly, Year([Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja]) AS �v, Month([Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja]) AS H�, 1 AS f�
FROM lkKil�p�Uni�
WHERE (((lkKil�p�Uni�.[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hiva]) Like "*pr�baid�*"));
