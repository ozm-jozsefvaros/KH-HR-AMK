INSERT INTO t__Ellen�rz�s_02 ( T�bla, Hi�nyz�_�rt�k, Ad�azonos�t�, [�ll�shely azonos�t�], [�NYR SZERVEZETI EGYS�G AZONOS�T�], Ad�jel )
SELECT lk_Ellen�rz�s_01.T�bla, lk_Ellen�rz�s_01.Hi�nyz�_�rt�k, lk_Ellen�rz�s_01.Ad�azonos�t�, lk_Ellen�rz�s_01.[�ll�shely azonos�t�], lk_Ellen�rz�s_01.[�NYR SZERVEZETI EGYS�G AZONOS�T�], [Ad�azonos�t�]*1 AS Ad�jel
FROM lk_Ellen�rz�s_01;
