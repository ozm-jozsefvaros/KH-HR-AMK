SELECT [01a].T�bla, [01a].Hi�nyz�_�rt�k, [01a].Ad�azonos�t�, [01a].[�ll�shely azonos�t�], [01a].[�NYR SZERVEZETI EGYS�G AZONOS�T�], [Ad�azonos�t�]*1 AS ad�jel
FROM (SELECT 'lkKil�p�k' AS T�bla, 'Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja' AS Hi�nyz�_�rt�k, lkKil�p�k.[Ad�azonos�t�], lkKil�p�k.[�ll�shely azonos�t�], lkKil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkKil�p�k] 
WHERE ([lkKil�p�k].[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek id�pontja] Is Null ) 
 UNION SELECT 'lkKil�p�k' AS T�bla, 'Jogviszony kezd� d�tuma' AS Hi�nyz�_�rt�k, lkKil�p�k.[Ad�azonos�t�], lkKil�p�k.[�ll�shely azonos�t�], lkKil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkKil�p�k] 
WHERE ([lkKil�p�k].[Jogviszony kezd� d�tuma] Is Null ) 
 UNION SELECT 'lkKil�p�k' AS T�bla, 'Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hivatkoz�s sz�ma (�, bek., pontja)' AS Hi�nyz�_�rt�k, lkKil�p�k.[Ad�azonos�t�], lkKil�p�k.[�ll�shely azonos�t�], lkKil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkKil�p�k] 
WHERE ([lkKil�p�k].[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hiva] Is Null OR [lkKil�p�k].[Jogviszony megsz�n�s�nek, megsz�ntet�s�nek oka: jogszab�lyi hiva]='') 
 UNION SELECT 'lkKil�p�k' AS T�bla, '�ll�shely azonos�t�' AS Hi�nyz�_�rt�k, lkKil�p�k.[Ad�azonos�t�], lkKil�p�k.[�ll�shely azonos�t�], lkKil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkKil�p�k] 
WHERE ([lkKil�p�k].[�ll�shely azonos�t�] Is Null OR [lkKil�p�k].[�ll�shely azonos�t�]='') 
 UNION SELECT 'lkKil�p�k' AS T�bla, 'Ell�tott feladatok megjel�l�se
a f�v�rosi �s megyei korm�nyhivatalok szervezeti �s m�k�d�si szab�lyzat�r�l sz�l� 3/2020. (II. 28.) MvM utas�t�s alapj�n' AS Hi�nyz�_�rt�k, lkKil�p�k.[Ad�azonos�t�], lkKil�p�k.[�ll�shely azonos�t�], lkKil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkKil�p�k] 
WHERE ([lkKil�p�k].[Mez�8] Is Null OR [lkKil�p�k].[Mez�8]='') 
 UNION SELECT 'lkKil�p�k' AS T�bla, '�NYR SZERVEZETI EGYS�G AZONOS�T�' AS Hi�nyz�_�rt�k, lkKil�p�k.[Ad�azonos�t�], lkKil�p�k.[�ll�shely azonos�t�], lkKil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkKil�p�k] 
WHERE ([lkKil�p�k].[�NYR SZERVEZETI EGYS�G AZONOS�T�] Is Null OR [lkKil�p�k].[�NYR SZERVEZETI EGYS�G AZONOS�T�]='') 
 UNION SELECT 'lkKil�p�k' AS T�bla, 'Szervezeti egys�g
Oszt�ly megnevez�se' AS Hi�nyz�_�rt�k, lkKil�p�k.[Ad�azonos�t�], lkKil�p�k.[�ll�shely azonos�t�], lkKil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkKil�p�k] 
WHERE ([lkKil�p�k].[Mez�6] Is Null OR [lkKil�p�k].[Mez�6]='') 
 UNION SELECT 'lkKil�p�k' AS T�bla, 'Szervezeti egys�g
F�oszt�ly megnevez�se' AS Hi�nyz�_�rt�k, lkKil�p�k.[Ad�azonos�t�], lkKil�p�k.[�ll�shely azonos�t�], lkKil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkKil�p�k] 
WHERE ([lkKil�p�k].[Mez�5] Is Null OR [lkKil�p�k].[Mez�5]='') 
 UNION SELECT 'lkKil�p�k' AS T�bla, 'Megyei szint VAGY J�r�si Hivatal' AS Hi�nyz�_�rt�k, lkKil�p�k.[Ad�azonos�t�], lkKil�p�k.[�ll�shely azonos�t�], lkKil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkKil�p�k] 
WHERE ([lkKil�p�k].[Megyei szint VAGY J�r�si Hivatal] Is Null OR [lkKil�p�k].[Megyei szint VAGY J�r�si Hivatal]='') 
 UNION SELECT 'lkKil�p�k' AS T�bla, 'Ad�azonos�t�' AS Hi�nyz�_�rt�k, lkKil�p�k.[Ad�azonos�t�], lkKil�p�k.[�ll�shely azonos�t�], lkKil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkKil�p�k] 
WHERE ([lkKil�p�k].[Ad�azonos�t�] Is Null )
)  AS 01a;
