SELECT [Ad�azonos�t�]*1 AS Ad�jel, lk_�llom�nyt�bl�kb�l_Illetm�nyek.Illetm�ny, lk_�llom�nyt�bl�kb�l_Illetm�nyek.[Heti munka�r�k sz�ma], lk_�llom�nyt�bl�kb�l_Illetm�nyek.[�ll�shely azonos�t�], [Illetm�ny]/[Heti munka�r�k sz�ma]*40 AS Brutt�_b�r, IIf([Brutt�_b�r]<296400,Yes,No) AS Garant�lt_min_alatt
FROM lk_�llom�nyt�bl�kb�l_Illetm�nyek;
