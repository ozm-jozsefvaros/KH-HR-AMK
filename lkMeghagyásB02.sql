SELECT tMeghagy�sB01.F�oszt�lyK�d, tMeghagy�sB01.Sorrend AS Besorol�s, tMeghagy�sB01.Sz�m, tMeghagy�sB01.[St�tusz�nak k�dja], DCount("*","tMeghagy�sB01","F�oszt�lyK�d = '" & [F�oszt�lyK�d] & "' AND sorrend < " & [sorrend])+DCount("*","tMeghagy�sB01","F�oszt�lyK�d = '" & [F�oszt�lyK�d] & "' AND sorrend = " & [sorrend] & " AND Sz�m < " & [Sz�m])+1 AS Sorsz�m3
FROM tMeghagy�sB01
ORDER BY tMeghagy�sB01.F�oszt�lyK�d, tMeghagy�sB01.Sorrend, tMeghagy�sB01.Sz�m;
