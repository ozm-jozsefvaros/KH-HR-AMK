SELECT tK�lts�gvet�shezBesorol�sok.Sor, tK�lts�gvet�shezBesorol�sok.Besorol�s, Count(lkK�lts�gvet�shezBesorol�sonk�ntiL�tsz�m01.Ad�jel) AS [Bet�lt�tt l�tsz�m], Round([Bet�lt�tt l�tsz�m]*4838/(Select count(ad�jel) from lkK�lts�gvet�shezBesorol�sonk�ntiL�tsz�m01)) AS �sszl�tsz�m
FROM tK�lts�gvet�shezBesorol�sok RIGHT JOIN lkK�lts�gvet�shezBesorol�sonk�ntiL�tsz�m01 ON tK�lts�gvet�shezBesorol�sok.Besorol�sSzem�lyt�rzs = lkK�lts�gvet�shezBesorol�sonk�ntiL�tsz�m01.Besorol�s2
GROUP BY tK�lts�gvet�shezBesorol�sok.Sor, tK�lts�gvet�shezBesorol�sok.Besorol�s;
