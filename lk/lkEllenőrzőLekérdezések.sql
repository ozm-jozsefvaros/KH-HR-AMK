SELECT tEllen�rz�Lek�rdez�sek.azEllen�rz�, tEllen�rz�Lek�rdez�sek.Ellen�rz�Lek�rdez�s, tEllen�rz�Lek�rdez�sek.azET�pus, tLek�rdez�sT�pusok.T�pusNeve, tEllen�rz�Lek�rdez�sek.Kimenet
FROM tLek�rdez�sT�pusok INNER JOIN tEllen�rz�Lek�rdez�sek ON tLek�rdez�sT�pusok.azET�pus = tEllen�rz�Lek�rdez�sek.azET�pus;
