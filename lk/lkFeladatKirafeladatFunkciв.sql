SELECT ktFeladatKirafeladatFunkci�.Azonos�t�, Nz([Feladat],"") AS Feladata, ktFeladatKirafeladatFunkci�.[KIRA feladat megnevez�s], Nz([Megnevez�s (magyar)],"-") AS Funkci�
FROM ktFeladatKirafeladatFunkci� LEFT JOIN tFunkci�k ON ktFeladatKirafeladatFunkci�.azFunkci� = tFunkci�k.azFunkci�;
