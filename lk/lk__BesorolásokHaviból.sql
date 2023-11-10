SELECT Havib�lBesorol�sok.Z�na, Havib�lBesorol�sok.[�ll�shely azonos�t�], Havib�lBesorol�sok.[Besorol�si fokozat k�d:], Havib�lBesorol�sok.[Besorol�si fokozat megnevez�se:], Replace(Replace([Besorol�si fokozat k�d:],"Mt.",""),"��.","") AS Jel, Nz([Ad�azonos�t�],0)*1 AS Ad�jel, bfkh([�NYR SZERVEZETI EGYS�G AZONOS�T�]) AS BFKH
FROM (SELECT J�r�si_�llom�ny.[�ll�shely azonos�t�]
, J�r�si_�llom�ny.[Besorol�si fokozat megnevez�se:]
, [Besorol�si fokozat k�d:]
, "Alapl�tsz�m" as Z�na
, Ad�azonos�t�
, [�NYR SZERVEZETI EGYS�G AZONOS�T�]
FROM  lkJ�r�si_�llom�ny
UNION
SELECT  Korm�nyhivatali_�llom�ny.[�ll�shely azonos�t�]
, Korm�nyhivatali_�llom�ny.[Besorol�si fokozat megnevez�se:]
, [Besorol�si fokozat k�d:]
, "Alapl�tsz�m" as Z�na
, Ad�azonos�t�
, [�NYR SZERVEZETI EGYS�G AZONOS�T�]
FROM  lkKorm�nyhivatali_�llom�ny
UNION
SELECT K�zpontos�tottak.[�ll�shely azonos�t�]
, K�zpontos�tottak.[Besorol�si fokozat megnevez�se:]
, [Besorol�si fokozat k�d:]
, "K�zpontos�tott" as Z�na
, Ad�azonos�t�
, [�NYR SZERVEZETI EGYS�G AZONOS�T�]
FROM lkK�zpontos�tottak
)  AS Havib�lBesorol�sok;
