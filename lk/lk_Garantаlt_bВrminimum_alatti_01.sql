SELECT [Ad�azonos�t�]*1 AS Ad�jel, lk_�llom�nyt�bl�kb�l_Illetm�nyek.Illetm�ny, lk_�llom�nyt�bl�kb�l_Illetm�nyek.[Heti munka�r�k sz�ma], lk_�llom�nyt�bl�kb�l_Illetm�nyek.[�ll�shely azonos�t�], [Illetm�ny]/IIf(Nz([Heti munka�r�k sz�ma],0)=0,0.00001,[Heti munka�r�k sz�ma])*40 AS Brutt�_b�r, IIf([Brutt�_b�r]<326000,Yes,No) AS Garant�lt_min_alatt
FROM lk_�llom�nyt�bl�kb�l_Illetm�nyek;
