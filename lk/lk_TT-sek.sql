SELECT Uni�.Ad�azonos�t�, Uni�.N�v, Uni�.[J�r�si Hivatal], Uni�.Oszt�ly, Uni�.Jogc�me, Uni�.Kinevez�s, bfkh([BFKHk�d]) AS bfkh, *
FROM (SELECT J�r�si_�llom�ny.Ad�azonos�t�, J�r�si_�llom�ny.N�v, J�r�si_�llom�ny.[J�r�si Hivatal], J�r�si_�llom�ny.Mez�7 as Oszt�ly, J�r�si_�llom�ny.[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] as Jogc�me, Mez�10 as Kinevez�s,[�NYR SZERVEZETI EGYS�G AZONOS�T�] as BFKHk�d
FROM J�r�si_�llom�ny
WHERE ((Len(J�r�si_�llom�ny.[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp])>"0"))
UNION
SELECT Korm�nyhivatali_�llom�ny.Ad�azonos�t�, Korm�nyhivatali_�llom�ny.N�v, Korm�nyhivatali_�llom�ny.Mez�6, Korm�nyhivatali_�llom�ny.Mez�7, Korm�nyhivatali_�llom�ny.[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp], Mez�10, [�NYR SZERVEZETI EGYS�G AZONOS�T�]
FROM  Korm�nyhivatali_�llom�ny
WHERE ((Len(Korm�nyhivatali_�llom�ny.[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp])>"0"))
UNION 
SELECT K�zpontos�tottak.Ad�azonos�t�, K�zpontos�tottak.N�v, K�zpontos�tottak.Mez�6, K�zpontos�tottak.Mez�7, K�zpontos�tottak.[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp],Mez�11, [Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�]
FROM   K�zpontos�tottak
WHERE ((Len(K�zpontos�tottak.[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp])>"0"))
)  AS Uni�;
