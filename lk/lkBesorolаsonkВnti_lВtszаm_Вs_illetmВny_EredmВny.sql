SELECT V�g�sszeggel.Rang_ AS Sorsz�m, V�g�sszeggel.Besorol�s AS Besorol�s, V�g�sszeggel.�sszilletm�ny AS �sszilletm�ny, V�g�sszeggel.F� AS F�, V�g�sszeggel.�tlag AS �tlag, V�g�sszeggel.[�tlagt�l val� elt�r�s (StDev)] AS [�tlagt�l val� elt�r�s (StDev)]
FROM (SELECT lkBesorol�sonk�nti_l�tsz�m_�s_illetm�ny_�tlaggal.*
FROM lkBesorol�sonk�nti_l�tsz�m_�s_illetm�ny_�tlaggal
UNION
SELECT lkBesorol�sonk�nti_l�tsz�m_�s_illetm�ny_Mind�sszesen.*
FROM lkBesorol�sonk�nti_l�tsz�m_�s_illetm�ny_Mind�sszesen
)  AS V�g�sszeggel
ORDER BY V�g�sszeggel.Rang_;
