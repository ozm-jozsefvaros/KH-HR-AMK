SELECT tEllen�rz�Lek�rdez�sek.azEllen�rz�, tEllen�rz�Lek�rdez�sek.Ellen�rz�Lek�rdez�s, tKimenetLapjai.strLapN�v, tKimenetLapjai.strSt�lus, tKimenetLapjai.strLapFajta, tKimenetLapjai.azKimenetLap, tEllen�rz�Lek�rdez�sek.Kimenet, tKimenetLapjai.azKimenet
FROM tEllen�rz�Lek�rdez�sek LEFT JOIN tKimenetLapjai ON tEllen�rz�Lek�rdez�sek.azEllen�rz� = tKimenetLapjai.azKimenetForr�s
WHERE (((tEllen�rz�Lek�rdez�sek.Kimenet)=Yes));
