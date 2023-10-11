SELECT Uni�.Ad�azonos�t�, Uni�.Illetm�ny, Uni�.[Heti munka�r�k sz�ma], Uni�.[�ll�shely azonos�t�], Uni�.N�v, Uni�.F�oszt�ly, Uni�.Oszt�ly, [Ad�azonos�t�]*1 AS Ad�jel, Uni�.T�voll�tJogc�me, Uni�.Szervezetk�d, Uni�.Besorol�sHavi
FROM (SELECT J�r�si_�llom�ny.Ad�azonos�t�, 
        J�r�si_�llom�ny.Mez�18 AS Illetm�ny, 
        [Heti munka�r�k sz�ma], 
        [�ll�shely azonos�t�], 
        N�v, 
        Replace([J�r�si hivatal],"Budapest F�v�ros Korm�nyhivatala ","BFKH ") as F�oszt�ly,
        Mez�7 as Oszt�ly,
        [Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] as T�voll�tJogc�me, 
        [�NYR SZERVEZETI EGYS�G AZONOS�T�] as Szervezetk�d,
        [Besorol�si fokozat k�d:] as Besorol�sHavi
    FROM J�r�si_�llom�ny
    WHERE Ad�azonos�t�  not like ""

    UNION SELECT Korm�nyhivatali_�llom�ny.Ad�azonos�t�, 
        Korm�nyhivatali_�llom�ny.Mez�18, 
        [Heti munka�r�k sz�ma], 
        [�ll�shely azonos�t�], 
        N�v, 
        Mez�6, 
        Mez�7, 
        [Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp], 
        [�NYR SZERVEZETI EGYS�G AZONOS�T�],
        [Besorol�si fokozat k�d:]
    FROM  Korm�nyhivatali_�llom�ny
    WHERE Ad�azonos�t�  not  like ""
    
    UNION SELECT K�zpontos�tottak.Ad�azonos�t�, 
        K�zpontos�tottak.Mez�17, 
        40 AS [Heti munka�r�k sz�ma], 
        [�ll�shely azonos�t�], 
        N�v, 
        Mez�7,
        [Projekt megnevez�se], 
        [Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp],
        [Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�],
        [Besorol�si fokozat k�d:]
    FROM  K�zpontos�tottak
    WHERE Ad�azonos�t�  not  like ""
)  AS Uni�;
