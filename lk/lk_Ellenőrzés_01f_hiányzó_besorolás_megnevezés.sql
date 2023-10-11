SELECT Uni�5t�bla.T�bla, Uni�5t�bla.Hi�nyz�_�rt�k, Uni�5t�bla.Ad�azonos�t�, Uni�5t�bla.[�ll�shely azonos�t�], Uni�5t�bla.[�NYR SZERVEZETI EGYS�G AZONOS�T�], [Ad�azonos�t�]*1 AS Ad�jel
FROM (SELECT J�r�si_�llom�ny.Ad�azonos�t�, J�r�si_�llom�ny.[�ll�shely azonos�t�], J�r�si_�llom�ny.[�NYR SZERVEZETI EGYS�G AZONOS�T�], "J�r�si_�llom�ny" as T�bla, "Besorol�si fokozat megnevez�se:" as Hi�nyz�_�rt�k, [Besorol�si fokozat megnevez�se:]
FROM J�r�si_�llom�ny

UNION
SELECT Korm�nyhivatali_�llom�ny.Ad�azonos�t�, Korm�nyhivatali_�llom�ny.[�ll�shely azonos�t�], Korm�nyhivatali_�llom�ny.[�NYR SZERVEZETI EGYS�G AZONOS�T�], "Korm�nyhivatali_�llom�ny" as T�bla, "Besorol�si fokozat megnevez�se:" as Hi�nyz�_�rt�k, [Besorol�si fokozat megnevez�se:]
FROM Korm�nyhivatali_�llom�ny

UNION
SELECT K�zpontos�tottak.Ad�azonos�t�, K�zpontos�tottak.[�ll�shely azonos�t�], K�zpontos�tottak.[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�], "K�zpontos�tottak" as T�bla, "Besorol�si fokozat megnevez�se:" as Hi�nyz�_�rt�k,  [Besorol�si fokozat megnevez�se:]
FROM   K�zpontos�tottak
WHERE '///--- T�r�ltem, mert a ki- �s bel�p�k t�bl�kb�l a jogviszony nem �llap�that� meg, de a munkaviszonyosokra nem j�n le adat
UNION
SELECT lkBel�p�k.Ad�azonos�t�, lkBel�p�k.[�ll�shely azonos�t�], lkBel�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�], "lkBel�p�k" as T�bla, "Besorol�si fokozat megnevez�se:" as Hi�nyz�_�rt�k, [Besorol�si fokozat megnevez�se:]
FROM lkBel�p�k

UNION
SELECT lkKil�p�k.Ad�azonos�t�, lkKil�p�k.[�ll�shely azonos�t�], lkKil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�], "lkKil�p�k" as T�bla, "Besorol�si fokozat megnevez�se:" as Hi�nyz�_�rt�k, [Besorol�si fokozat megnevez�se:]
FROM lkKil�p�k
---///'

)  AS Uni�5t�bla
WHERE (((Uni�5t�bla.[Besorol�si fokozat megnevez�se:]) Is Null Or (Uni�5t�bla.[Besorol�si fokozat megnevez�se:])="Error 2042"));
