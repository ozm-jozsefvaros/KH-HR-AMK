SELECT Ad�azonos�t�, [�NYR SZERVEZETI EGYS�G AZONOS�T�] AS SzervezetK�d, [�ll�shely azonos�t�], [Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h], [Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp], N�v
FROM J�r�si_�llom�ny
WHERE  [Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] <>""
UNION
SELECT Ad�azonos�t�, [�NYR SZERVEZETI EGYS�G AZONOS�T�] AS SzervezetK�d, [�ll�shely azonos�t�], [Garant�lt b�rminimumban r�szes�l (GB) / tart�s t�voll�v� nincs h], [Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp], N�v
FROM Korm�nyhivatali_�llom�ny
WHERE  [Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] <>""
UNION SELECT Ad�azonos�t�, [Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] AS SzervezetK�d, [�ll�shely azonos�t�], [Tart�s t�voll�v� nincs helyettese (TT)/ tart�s t�voll�v�nek van ], [Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp], N�v
FROM K�zpontos�tottak
WHERE  [Tart�s t�voll�v� eset�n a t�voll�t jogc�me (CSED, GYED, GYES, Tp] <>"";
