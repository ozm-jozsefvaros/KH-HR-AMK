SELECT lk_Ellen�rz�s_03.F�oszt�ly, lk_Ellen�rz�s_03.Oszt�ly, lk_Ellen�rz�s_03.N�v, lk_Ellen�rz�s_03.[Hi�nyz� �rt�k], lk_Ellen�rz�s_03.[St�tusz k�d], lk_Ellen�rz�s_03.Megjegyz�s, "https://nexonport.kh.gov.hu/menu/hrm/szemelyiKarton/index?szemelyAzonosito=" & [azNexon] & "&r=13" AS Link
FROM kt_azNexon_Ad�jel02 INNER JOIN lk_Ellen�rz�s_03 ON kt_azNexon_Ad�jel02.NLink=lk_Ellen�rz�s_03.NLink
WHERE (((lk_Ellen�rz�s_03.[Hi�nyz� �rt�k])<>"Hivatali email" And (lk_Ellen�rz�s_03.[Hi�nyz� �rt�k])<>"Munkav�gz�s helye - c�m"));
