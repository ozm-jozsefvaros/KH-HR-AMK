SELECT mSyslkMez�nevek.Mez�N�v, lkEllen�rz�Lek�rdez�sek2csakLek�rdez�sek.Ellen�rz�Lek�rdez�s
FROM lkEllen�rz�Lek�rdez�sek2csakLek�rdez�sek LEFT JOIN mSyslkMez�nevek ON lkEllen�rz�Lek�rdez�sek2csakLek�rdez�sek.Ellen�rz�Lek�rdez�s=mSyslkMez�nevek.QueryName
WHERE (((lkEllen�rz�Lek�rdez�sek2csakLek�rdez�sek.Ellen�rz�Lek�rdez�s)=[Forms]![�Lek�rdez�sMez�T�pusok]![Lekr�dez�sNeve]))
ORDER BY lkEllen�rz�Lek�rdez�sek2csakLek�rdez�sek.Ellen�rz�Lek�rdez�s, mSyslkMez�nevek.Mez�N�v;
