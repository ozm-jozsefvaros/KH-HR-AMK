SELECT R�szmunkaid�sUni�.T�bla, R�szmunkaid�sUni�.Hi�nyz�_�rt�k, R�szmunkaid�sUni�.Ad�azonos�t�, R�szmunkaid�sUni�.[�ll�shely azonos�t�], R�szmunkaid�sUni�.[�NYR SZERVEZETI EGYS�G AZONOS�T�], [Ad�azonos�t�]*1 AS Ad�jel
FROM (SELECT "Korm�nyhivatali_�llom�ny" AS T�bla
, "R�szmunkaid�snek van jel�lve, de teljes munkaid�ben dolgozik." AS [Hi�nyz�_�rt�k]
, Korm�nyhivatali_�llom�ny.Ad�azonos�t�, Korm�nyhivatali_�llom�ny.[�ll�shely azonos�t�]
, Korm�nyhivatali_�llom�ny.[�NYR SZERVEZETI EGYS�G AZONOS�T�]
, Korm�nyhivatali_�llom�ny.[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ]
, Korm�nyhivatali_�llom�ny.[Heti munka�r�k sz�ma]
, IIf(Right([Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ],1)="R" And [Heti munka�r�k sz�ma]=40,True,False) AS Hib�s
FROM Korm�nyhivatali_�llom�ny
WHERE (((
IIf
             (Right([Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ],1)="R" 
     And [Heti munka�r�k sz�ma]=40
   ,True
   ,False))
=-1))
UNION
SELECT "J�r�si_�llom�ny" AS T�bla
, "R�szmunkaid�snek van jel�lve, de teljes munkaid�ben dolgozik." AS [Hib�s �rt�k]
, J�r�si_�llom�ny.Ad�azonos�t�
, J�r�si_�llom�ny.[�ll�shely azonos�t�]
, J�r�si_�llom�ny.[�NYR SZERVEZETI EGYS�G AZONOS�T�]
, J�r�si_�llom�ny.[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ]
, J�r�si_�llom�ny.[Heti munka�r�k sz�ma]
, IIf(Right([Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ],1)="R" And [Heti munka�r�k sz�ma]=40,True,False) AS Hib�s
FROM J�r�si_�llom�ny
WHERE (((
IIf
             (Right([Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ],1)="R" 
     And [Heti munka�r�k sz�ma]=40
   ,True
   ,False))
=-1))
UNION
SELECT "Korm�nyhivatali_�llom�ny" AS T�bla
, "Teljes munkaid�snek van jel�lve, de r�szmunkaid�ben dolgozik." AS [Hib�s �rt�k]
, Korm�nyhivatali_�llom�ny.Ad�azonos�t�, Korm�nyhivatali_�llom�ny.[�ll�shely azonos�t�]
, Korm�nyhivatali_�llom�ny.[�NYR SZERVEZETI EGYS�G AZONOS�T�]
, Korm�nyhivatali_�llom�ny.[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ]
, Korm�nyhivatali_�llom�ny.[Heti munka�r�k sz�ma]
, IIf(Right([Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ],1)="T" And [Heti munka�r�k sz�ma]<>40,True,False) AS Hib�s
FROM Korm�nyhivatali_�llom�ny
WHERE (((
IIf
             (Right([Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ],1)="T" 
     And [Heti munka�r�k sz�ma]<>40
   ,True
   ,False))
=-1))
UNION SELECT "J�r�si_�llom�ny" AS T�bla
, "Teljes munkaid�snek van jel�lve, de r�szmunkaid�ben dolgozik." AS [Hib�s �rt�k]
, J�r�si_�llom�ny.Ad�azonos�t�
, J�r�si_�llom�ny.[�ll�shely azonos�t�]
, J�r�si_�llom�ny.[�NYR SZERVEZETI EGYS�G AZONOS�T�]
, J�r�si_�llom�ny.[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ]
, J�r�si_�llom�ny.[Heti munka�r�k sz�ma]
, IIf(Right([Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ],1)="T" And [Heti munka�r�k sz�ma]<>40,True,False) AS Hib�s
FROM J�r�si_�llom�ny
WHERE (((
IIf
             (Right([Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ],1)="T" 
     And [Heti munka�r�k sz�ma]<>40
   ,True
   ,False))
=-1))
)  AS R�szmunkaid�sUni�;
