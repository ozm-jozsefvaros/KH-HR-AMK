SELECT IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.[F�oszt�ly ill hivatal], IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.[<>], IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.[�ltal�nos iskola 8 oszt�ly], IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.[Egyetemi /fels�fok� (MA/MsC) vagy osztatlan k�pz_], IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.[�retts_biz_szakk�pes-vel,k�pes�t� biz_], IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.[�retts_biz_Szakk�p-vel,�retts_�p_�iskr-ben szakk�p], IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.[�retts�gi biz_ szakk�pes�t�s n�lk (pl: gimn_�r_)], IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.[Fels�okt-i (fels�fok�) szakk�pz�sben szerzett biz_], IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.[F�iskolai vagy fels�fok� alapk�pz�s (BA/BsC)okl_], IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.Gimn�zium, IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.Szakiskola, IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.[Szakk�pzetts�g �retts�gi bizony�tv�ny n�lk�l], IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.Szakk�z�piskola, IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.[Szakmunk�sk�pz� iskola], IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.Technikum
FROM (SELECT * ,0 as sor
FROM  lk_IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt
UNION

SELECT *, 1 as sor
FROM lk_IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesen
)  AS IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel
ORDER BY IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.sor, IskolaiV�gzetts�gMegoszl�sa_F�oszt�lyonk�nt�sszesennel.F�oszt�lyK�d;
