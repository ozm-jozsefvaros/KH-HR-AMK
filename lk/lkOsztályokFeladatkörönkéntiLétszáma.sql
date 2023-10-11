SELECT [lkÁlláshelyek(havi)_1].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [lkÁlláshelyek(havi)_1].Fõosztály, [lkÁlláshelyek(havi)_1].Osztály, [lkÁlláshelyek(havi)_1].Feladatkör, Sum(IIf([Állapot]="betöltött",1,0)) AS Betöltött, Sum(IIf([Állapot]="betöltött",0,1)) AS Üres
FROM [lkÁlláshelyek(havi)] AS [lkÁlláshelyek(havi)_1]
GROUP BY [lkÁlláshelyek(havi)_1].[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ], [lkÁlláshelyek(havi)_1].Fõosztály, [lkÁlláshelyek(havi)_1].Osztály, [lkÁlláshelyek(havi)_1].Feladatkör
ORDER BY bfkh([ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]);
