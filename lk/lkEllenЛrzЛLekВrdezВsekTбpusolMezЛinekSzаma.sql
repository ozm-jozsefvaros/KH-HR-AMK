SELECT lkEllen�rz�Lek�rdez�sek2.Ellen�rz�Lek�rdez�s, Count(tLek�rdez�sMez�T�pusok.Mez�Neve) AS CountOfMez�Neve
FROM lkEllen�rz�Lek�rdez�sek2 LEFT JOIN tLek�rdez�sMez�T�pusok ON lkEllen�rz�Lek�rdez�sek2.Ellen�rz�Lek�rdez�s = tLek�rdez�sMez�T�pusok.Lek�rdez�sNeve
GROUP BY lkEllen�rz�Lek�rdez�sek2.Ellen�rz�Lek�rdez�s;
