SELECT nSelect([Ellen�rz�Lek�rdez�s]) AS db, tLek�rdez�sT�pusok.Oszt�ly, tLek�rdez�sT�pusok.LapN�v, tLek�rdez�sT�pusok.Megjegyz�s, tEllen�rz�Lek�rdez�sek.Ellen�rz�Lek�rdez�s, tUnionCsoportok.azUnion
FROM tUnionCsoportok RIGHT JOIN (tLek�rdez�sT�pusok RIGHT JOIN tEllen�rz�Lek�rdez�sek ON tLek�rdez�sT�pusok.azET�pus = tEllen�rz�Lek�rdez�sek.azET�pus) ON tUnionCsoportok.azUnion = tEllen�rz�Lek�rdez�sek.azUnion
ORDER BY tLek�rdez�sT�pusok.Oszt�ly, tLek�rdez�sT�pusok.LapN�v;
