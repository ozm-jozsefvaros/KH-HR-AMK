SELECT L�tsz�mUni�.Sorsz�m, L�tsz�mUni�.N�v, L�tsz�mUni�.Ad�azonos�t�, L�tsz�mUni�.[Sz�let�si �v \ �res �ll�s], L�tsz�mUni�.Neme, L�tsz�mUni�.[J�r�si Hivatal], L�tsz�mUni�.Oszt�ly, L�tsz�mUni�.[�NYR SZERVEZETI EGYS�G AZONOS�T�], L�tsz�mUni�.[Ell�tott feladat], L�tsz�mUni�.Kinevez�s, L�tsz�mUni�.[Feladat jellege: szakmai (SZ) / funkcion�lis (F) feladatell�t�s;], L�tsz�mUni�.[Foglalkoztat�si forma teljes (T) / r�szmunkaid�s (R), nyugd�jas ], L�tsz�mUni�.[Heti munka�r�k sz�ma], L�tsz�mUni�.[Bet�lt�s ar�nya], L�tsz�mUni�.[Besorol�si fokozat k�d:], L�tsz�mUni�.[Besorol�si fokozat megnevez�se:], L�tsz�mUni�.[�ll�shely azonos�t�], L�tsz�mUni�.[Havi illetm�ny], L�tsz�mUni�.[Eu finansz�rozott], L�tsz�mUni�.[Illetm�ny forr�sa], L�tsz�mUni�.[Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h], L�tsz�mUni�.[Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp], L�tsz�mUni�.[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)], L�tsz�mUni�.[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is], L�tsz�mUni�.[�gyf�lszolg�lati munkat�rs (1) �gyf�lszolg�lati h�tt�r munkat�rs], L�tsz�mUni�.[K�pes�t�st ad� v�gzetts�g], L�tsz�mUni�.KAB, L�tsz�mUni�.[KAB 001-3** Branch ID]
FROM (SELECT *
FROM lkJ�r�si_�llom�ny
UNION SELECT *
FROM lkKorm�nyhivatali_�llom�ny
UNION SELECT *
FROM lkK�zpontos�tottak
)  AS L�tsz�mUni�;
