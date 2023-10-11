SELECT Alapl�tsz�m.[j�r�si hivatal] AS [F�oszt�ly\hivatal], Alapl�tsz�m.Ad�azonos�t�, Alapl�tsz�m.N�v, Alapl�tsz�m.[�ll�shely azonos�t�], Alapl�tsz�m.[Besorol�si fokozat megnevez�se:], Alapl�tsz�m.[Heti munka�r�k sz�ma], Alapl�tsz�m.Mez�18, Round([Mez�18]/[Heti munka�r�k sz�ma]*40,0) AS [40 �r�ra vet�tett illetm�ny], IIf(InStr(1,[Besorol�si fokozat k�d:],"Mt."),"Mt.","Kit.") AS [Folgalkoztat�s jellege], Alapl�tsz�m.mez�4 AS Bet�lt�s
FROM (SELECT [j�r�si hivatal], J�r�si_�llom�ny.Ad�azonos�t�, N�v, J�r�si_�llom�ny.[�ll�shely azonos�t�], [Besorol�si fokozat megnevez�se:], J�r�si_�llom�ny.[Heti munka�r�k sz�ma], J�r�si_�llom�ny.Mez�18, [Besorol�si fokozat k�d:], mez�4
FROM J�r�si_�llom�ny
UNION
SELECT Mez�6,Korm�nyhivatali_�llom�ny.Ad�azonos�t�, N�v, [�ll�shely azonos�t�], Korm�nyhivatali_�llom�ny.[Besorol�si fokozat megnevez�se:], Korm�nyhivatali_�llom�ny.[Heti munka�r�k sz�ma], Korm�nyhivatali_�llom�ny.Mez�18, [Besorol�si fokozat k�d:], mez�4
FROM Korm�nyhivatali_�llom�ny

)  AS Alapl�tsz�m
WHERE (((Alapl�tsz�m.[Besorol�si fokozat megnevez�se:]) Like "*hivatali tan�csos*"));
