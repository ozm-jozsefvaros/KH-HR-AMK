SELECT Ellen�rz�s.F�oszt�ly, Ellen�rz�s.Oszt�ly, Ellen�rz�s.A_B AS [Hiba le�r�sa], Ellen�rz�s.Ad�jel, Ellen�rz�s.N�v, "" AS [�ll�shely azonos�t�], kt_azNexon_Ad�jel.NLINK AS Link, "" AS Megjegyz�s
FROM kt_azNexon_Ad�jel RIGHT JOIN (SELECT * FROM lk_Ellen�rz�s_foglalkoztat�s_02a_b  UNION ALL SELECT * FROM lk_Ellen�rz�s_foglalkoztat�s_02c_a  UNION ALL  SELECT * FROM lk_Ellen�rz�s_foglalkoztat�s_02d_c )  AS Ellen�rz�s ON kt_azNexon_Ad�jel.Ad�jel = Ellen�rz�s.Ad�jel
ORDER BY Ellen�rz�s.F�oszt�ly;
