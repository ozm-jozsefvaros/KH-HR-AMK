SELECT [lk�ll�shelyek(havi)_1].[�NYR SZERVEZETI EGYS�G AZONOS�T�], [lk�ll�shelyek(havi)_1].F�oszt�ly, [lk�ll�shelyek(havi)_1].Oszt�ly, [lk�ll�shelyek(havi)_1].Feladatk�r, Sum(IIf([�llapot]="bet�lt�tt",1,0)) AS Bet�lt�tt, Sum(IIf([�llapot]="bet�lt�tt",0,1)) AS �res
FROM [lk�ll�shelyek(havi)] AS [lk�ll�shelyek(havi)_1]
GROUP BY [lk�ll�shelyek(havi)_1].[�NYR SZERVEZETI EGYS�G AZONOS�T�], [lk�ll�shelyek(havi)_1].F�oszt�ly, [lk�ll�shelyek(havi)_1].Oszt�ly, [lk�ll�shelyek(havi)_1].Feladatk�r
ORDER BY bfkh([�NYR SZERVEZETI EGYS�G AZONOS�T�]);
