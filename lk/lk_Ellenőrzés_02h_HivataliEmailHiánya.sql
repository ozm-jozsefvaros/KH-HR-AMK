INSERT INTO t__Ellen�rz�s_02 ( T�bla, Hi�nyz�_�rt�k, Ad�azonos�t�, [�ll�shely azonos�t�], [�NYR SZERVEZETI EGYS�G AZONOS�T�], Ad�jel )
SELECT lk_Ellen�rz�s_01h_HivataliEmailHi�nya.T�bla, lk_Ellen�rz�s_01h_HivataliEmailHi�nya.Hi�nyz�_�rt�k, [Ad�jel] & "" AS Ad�azonos�t�, lk_Ellen�rz�s_01h_HivataliEmailHi�nya.[St�tusz k�dja], lk_Ellen�rz�s_01h_HivataliEmailHi�nya.[�NYR SZERVEZETI EGYS�G AZONOS�T�], lk_Ellen�rz�s_01h_HivataliEmailHi�nya.Ad�jel
FROM lk_Ellen�rz�s_01h_HivataliEmailHi�nya;
