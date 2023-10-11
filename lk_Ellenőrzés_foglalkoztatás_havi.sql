SELECT Uni�.Ad�jel, Uni�.N�v, Uni�.[J�r�si Hivatal] AS F�oszt�ly, Uni�.Mez�7 AS Oszt�ly, Uni�.Foglalkoztat�s, Uni�.[Heti munka�r�k sz�ma], Uni�.[St�tusz t�pusa], Uni�.[�NYR SZERVEZETI EGYS�G AZONOS�T�], Uni�.Mez�4 AS [Sz�let�si �v], [Mez�10] AS Bel�p�s, *
FROM (SELECT J�r�si_�llom�ny.Ad�azonos�t� * 1 AS Ad�jel, J�r�si_�llom�ny.N�v, J�r�si_�llom�ny.[J�r�si Hivatal], J�r�si_�llom�ny.Mez�7, right(J�r�si_�llom�ny.[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ],1) AS Foglalkoztat�s, J�r�si_�llom�ny.[Heti munka�r�k sz�ma], "Szervezeti alapl�tsz�m" As [St�tusz t�pusa], [�NYR SZERVEZETI EGYS�G AZONOS�T�], Mez�4, mez�10
FROM J�r�si_�llom�ny
WHERE J�r�si_�llom�ny.Ad�azonos�t�  <>""
UNION
SELECT Korm�nyhivatali_�llom�ny.Ad�azonos�t� * 1 AS Ad�jel, Korm�nyhivatali_�llom�ny.N�v, Korm�nyhivatali_�llom�ny.Mez�6, Korm�nyhivatali_�llom�ny.Mez�7, right(Korm�nyhivatali_�llom�ny.[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ],1),Korm�nyhivatali_�llom�ny.[Heti munka�r�k sz�ma], "Szervezeti alapl�tsz�m" As [St�tusz t�pusa], [�NYR SZERVEZETI EGYS�G AZONOS�T�], Mez�4, Mez�10
FROM  Korm�nyhivatali_�llom�ny
WHERE Korm�nyhivatali_�llom�ny.Ad�azonos�t�  <>""
UNION SELECT K�zpontos�tottak.Ad�azonos�t� * 1 AS Ad�jel, K�zpontos�tottak.N�v, K�zpontos�tottak.Mez�6, K�zpontos�tottak.Mez�7, right(K�zpontos�tottak.[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ],1), 0 As [Heti munka�r�k sz�ma],"K�zpontos�tott �llom�ny" As [St�tusz t�pusa], [Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�], Mez�4, Mez�11
FROM   K�zpontos�tottak
WHERE  K�zpontos�tottak.Ad�azonos�t� <>"")  AS Uni�;
