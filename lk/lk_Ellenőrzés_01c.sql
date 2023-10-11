SELECT [01c].T�bla, [01c].Hi�nyz�_�rt�k, [01c].Ad�azonos�t�, [01c].[�ll�shely azonos�t�], [01c].[�NYR SZERVEZETI EGYS�G AZONOS�T�], [Ad�azonos�t�]*1 AS Ad�jel
FROM (SELECT 'lkKil�p�k' AS T�bla, 'N�v' AS Hi�nyz�_�rt�k, lkKil�p�k.[Ad�azonos�t�], lkKil�p�k.[�ll�shely azonos�t�], lkKil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkKil�p�k] 
WHERE ([lkKil�p�k].[N�v] Is Null OR [lkKil�p�k].[N�v]='') 
 UNION SELECT 'lkBel�p�k' AS T�bla, 'Illetm�ny (Ft/h�)' AS Hi�nyz�_�rt�k, lkBel�p�k.[Ad�azonos�t�], lkBel�p�k.[�ll�shely azonos�t�], lkBel�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkBel�p�k] 
WHERE ([lkBel�p�k].[Illetm�ny (Ft/h�)] Is Null ) 
 UNION SELECT 'lkBel�p�k' AS T�bla, 'Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)' AS Hi�nyz�_�rt�k, lkBel�p�k.[Ad�azonos�t�], lkBel�p�k.[�ll�shely azonos�t�], lkBel�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkBel�p�k] 
WHERE ([lkBel�p�k].[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] Is Null OR [lkBel�p�k].[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)]='') 
 UNION SELECT 'lkBel�p�k' AS T�bla, 'Jogviszony kezd� d�tuma' AS Hi�nyz�_�rt�k, lkBel�p�k.[Ad�azonos�t�], lkBel�p�k.[�ll�shely azonos�t�], lkBel�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkBel�p�k] 
WHERE ([lkBel�p�k].[Jogviszony kezd� d�tuma] Is Null ) 
 UNION SELECT 'lkBel�p�k' AS T�bla, '�ll�shely azonos�t�' AS Hi�nyz�_�rt�k, lkBel�p�k.[Ad�azonos�t�], lkBel�p�k.[�ll�shely azonos�t�], lkBel�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkBel�p�k] 
WHERE ([lkBel�p�k].[�ll�shely azonos�t�] Is Null OR [lkBel�p�k].[�ll�shely azonos�t�]='') 
 UNION SELECT 'lkBel�p�k' AS T�bla, 'Ell�tott feladatok megjel�l�se
a f�v�rosi �s megyei korm�nyhivatalok szervezeti �s m�k�d�si szab�lyzat�r�l sz�l� 3/2020. (II. 28.) MvM utas�t�s alapj�n' AS Hi�nyz�_�rt�k, lkBel�p�k.[Ad�azonos�t�], lkBel�p�k.[�ll�shely azonos�t�], lkBel�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkBel�p�k] 
WHERE ([lkBel�p�k].[Mez�8] Is Null OR [lkBel�p�k].[Mez�8]='') 
 UNION SELECT 'lkBel�p�k' AS T�bla, '�NYR SZERVEZETI EGYS�G AZONOS�T�' AS Hi�nyz�_�rt�k, lkBel�p�k.[Ad�azonos�t�], lkBel�p�k.[�ll�shely azonos�t�], lkBel�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkBel�p�k] 
WHERE ([lkBel�p�k].[�NYR SZERVEZETI EGYS�G AZONOS�T�] Is Null OR [lkBel�p�k].[�NYR SZERVEZETI EGYS�G AZONOS�T�]='') 
 UNION SELECT 'lkBel�p�k' AS T�bla, 'Szervezeti egys�g
Oszt�ly megnevez�se' AS Hi�nyz�_�rt�k, lkBel�p�k.[Ad�azonos�t�], lkBel�p�k.[�ll�shely azonos�t�], lkBel�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkBel�p�k] 
WHERE ([lkBel�p�k].[Mez�6] Is Null OR [lkBel�p�k].[Mez�6]='') 
 UNION SELECT 'lkBel�p�k' AS T�bla, 'Szervezeti egys�g
F�oszt�ly megnevez�se' AS Hi�nyz�_�rt�k, lkBel�p�k.[Ad�azonos�t�], lkBel�p�k.[�ll�shely azonos�t�], lkBel�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkBel�p�k] 
WHERE ([lkBel�p�k].[Mez�5] Is Null OR [lkBel�p�k].[Mez�5]='') 
 UNION SELECT 'lkBel�p�k' AS T�bla, 'Megyei szint VAGY J�r�si Hivatal' AS Hi�nyz�_�rt�k, lkBel�p�k.[Ad�azonos�t�], lkBel�p�k.[�ll�shely azonos�t�], lkBel�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkBel�p�k] 
WHERE ([lkBel�p�k].[Megyei szint VAGY J�r�si Hivatal] Is Null OR [lkBel�p�k].[Megyei szint VAGY J�r�si Hivatal]='')
)  AS 01c;
