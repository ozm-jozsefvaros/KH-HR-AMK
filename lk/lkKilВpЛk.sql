SELECT Kil�p�k.Sorsz�m, Kil�p�k.N�v, Kil�p�k.Ad�azonos�t�, Kil�p�k.[Megyei szint VAGY J�r�si Hivatal], Kil�p�k.Mez�5, Kil�p�k.Mez�6, Kil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�], Kil�p�k.Mez�8, Kil�p�k.[Besorol�si fokozat k�d:], Kil�p�k.[Besorol�si fokozat megnevez�se:], Kil�p�k.[�ll�shely azonos�t�], Kil�p�k.[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hiva], Kil�p�k.[Jogviszony kezd� d�tuma], Kil�p�k.[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja], Kil�p�k.[V�gkiel�g�t�sre jogos�t� h�napok sz�ma], Kil�p�k.[Felment�si id� h�napok sz�ma], "-" AS �res, Kil�p�k.[Illetm�ny (Ft/h�)], [Ad�azonos�t�]*1 AS Ad�jel
FROM Kil�p�k;
