SELECT lkR�szmunkaid�s�kAr�nya01.F�oszt�ly, Sum([Teljes munkaid�s]) AS [Teljes munkaid�s l�tsz�m], Sum(lkR�szmunkaid�s�kAr�nya01.R�szmunkaid�s) AS [R�szmunkaid�s l�tsz�m]
FROM lkR�szmunkaid�s�kAr�nya01
GROUP BY lkR�szmunkaid�s�kAr�nya01.F�oszt�ly;
