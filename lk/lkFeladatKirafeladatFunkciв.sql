SELECT ktFeladatKirafeladatFunkció.Azonosító, Nz([Feladat],"") AS Feladata, ktFeladatKirafeladatFunkció.[KIRA feladat megnevezés], Nz([Megnevezés (magyar)],"-") AS Funkció
FROM ktFeladatKirafeladatFunkció LEFT JOIN tFunkciók ON ktFeladatKirafeladatFunkció.azFunkció = tFunkciók.azFunkció;
