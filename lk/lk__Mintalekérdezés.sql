SELECT 'J�r�si_�llom�ny' AS T�bla, "Ell�tott feladat" AS [Hi�nyz� �rt�k], J�r�si_�llom�ny.Ad�azonos�t�, J�r�si_�llom�ny.[�ll�shely azonos�t�], J�r�si_�llom�ny.[�NYR SZERVEZETI EGYS�G AZONOS�T�]
FROM J�r�si_�llom�ny
WHERE (((J�r�si_�llom�ny.Mez�9) Is Null Or (J�r�si_�llom�ny.Mez�9)="") AND ((J�r�si_�llom�ny.Mez�4)<>"�res �ll�s"));
