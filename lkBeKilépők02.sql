TRANSFORM Sum([SumOfBel�p�k]+[SumOfKil�p�k]) AS �sszeg
SELECT lkBeKil�p�k01.H�
FROM lkBeKil�p�k01
GROUP BY lkBeKil�p�k01.H�
PIVOT lkBeKil�p�k01.�v;
