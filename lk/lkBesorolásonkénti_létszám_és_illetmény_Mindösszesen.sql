SELECT Max([Rang_])+1 AS rangsor, "�sszesen: " AS Besorol�s, Round(Sum(lkBesorol�sonk�nti_l�tsz�m_�s_illetm�ny_�tlaggal.�sszilletm�ny)/100,0)*100 AS Mind�sszesen, Sum(lkBesorol�sonk�nti_l�tsz�m_�s_illetm�ny_�tlaggal.F�) AS �sszl�tsz�m, Round(Sum([�sszilletm�ny])/Sum([F�])/100,0)*100 AS �tlag, (SELECT Round(StDev([Illetm�ny �sszesen kerek�t�s n�lk�l (elt�r�tett)]/[Elm�leti (szerz�d�s/kinevez�s szerinti) ledolgozand� heti �raker]*40)/100,0)*100 AS [�tlagt�l val� elt�r�s]
FROM lkSzem�lyek LEFT JOIN �ll�shelyek ON lkSzem�lyek.[St�tusz k�dja] = �ll�shelyek.[�ll�shely azonos�t�]
WHERE (((lkSzem�lyek.[Szervezeti egys�g k�dja]) Is Not Null) AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"))) AS [�tlagt�l val� elt�r�s]
FROM lkBesorol�sonk�nti_l�tsz�m_�s_illetm�ny_�tlaggal
GROUP BY "�sszesen: ";
